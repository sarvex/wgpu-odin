package example

import "core:fmt"
import "core:os"

import SDL "vendor:sdl2"
import WGPU "../wgpu_native"

when ODIN_OS == "darwin" {
    WGPU_BACKEND_TYPE :: WGPU.BackendType.Metal
}

when ODIN_OS == "windows" {
    WGPU_BACKEND_TYPE :: WGPU.BackendType.D3D12
}

when ODIN_OS == "linux" {
    WGPU_BACKEND_TYPE :: WGPU.BackendType.Vulkan
}

when ODIN_OS == "freebsd" {
    WGPU_BACKEND_TYPE :: WGPU.BackendType.OpenGL
}

request_adapter_callback :: proc (
    status: WGPU.RequestAdapterStatus,
    adapter: WGPU.Adapter,
    message: cstring,
    userdata: rawptr,
) {
    adapter_props : WGPU.AdapterProperties
    WGPU.AdapterGetProperties(adapter, &adapter_props)

    if status == WGPU.RequestAdapterStatus.Success &&
        adapter_props.backendType == WGPU_BACKEND_TYPE {
        user_adapter := cast(^WGPU.Adapter)userdata
        user_adapter^ = adapter
   } 
}

request_device_callback :: proc (
    status: WGPU.RequestDeviceStatus,
    device : WGPU.Device,
    message : cstring,
    userdata : rawptr,
) {
    if status == WGPU.RequestDeviceStatus.Success {
        user_device := cast(^WGPU.Device)userdata
        user_device^ = device
    }
}

Vertex :: struct {
    pos: [2]f32,
    color: [4]f32,
}

VERTICES :: [6]Vertex {
    { pos = {-1.0, -1.0}, color = { 1.0, 0.0, 0.0, 1.0 } },
    { pos = {-1.0,  1.0}, color = { 0.0, 1.0, 0.0, 1.0 } },
    { pos = { 1.0,  1.0}, color = { 0.0, 0.0, 1.0, 1.0 } },

    { pos = {-1.0, -1.0}, color = { 1.0, 0.0, 0.0, 1.0 } },
    { pos = { 1.0, -1.0}, color = { 0.0, 1.0, 0.0, 1.0 } },
    { pos = { 1.0,  1.0}, color = { 0.0, 0.0, 1.0, 1.0 } },
}

main :: proc () {
    err := SDL.Init({.VIDEO})
    assert(err == 0)
    
    window := SDL.CreateWindow(
        " Example Triangle Window",
        SDL.WINDOWPOS_CENTERED,
        SDL.WINDOWPOS_CENTERED,
        800,
        600,
        {.SHOWN, .METAL })
    defer SDL.DestroyWindow(window)
    
    metalView := SDL.Metal_CreateView(window)
    defer SDL.Metal_DestroyView(metalView)
    
    surface := WGPU.InstanceCreateSurface(nil, &WGPU.SurfaceDescriptor{
        nextInChain = cast(^WGPU.ChainedStruct) &WGPU.SurfaceDescriptorFromMetalLayer{
            layer = SDL.Metal_GetLayer(metalView),
            chain = {
                next = nil,
                sType = WGPU.SType.SurfaceDescriptorFromMetalLayer,
            },
        },
    })
    assert(surface != nil)
    
    adapter : WGPU.Adapter = nil
    WGPU.InstanceRequestAdapter(nil,
                            &(WGPU.RequestAdapterOptions{
                                nextInChain = nil,
                                compatibleSurface = surface,
                                powerPreference = WGPU.PowerPreference.LowPower,
                                forceFallbackAdapter = false,
                            }),
                            request_adapter_callback,
                            &adapter)
    assert(adapter != nil)
    
    device : WGPU.Device = nil
    WGPU.AdapterRequestDevice(adapter,
                            &WGPU.DeviceDescriptor {
                                nextInChain = cast(^WGPU.ChainedStruct)&WGPU.DeviceExtras{
                                    chain = WGPU.ChainedStruct{
                                        next = nil,
                                        sType = cast(WGPU.SType)WGPU.NativeSType.DeviceExtras,
                                    },    
                                    label = "Device",
                                    tracePath = nil,
                                },
                                requiredLimits = &WGPU.RequiredLimits{
                                    nextInChain = nil,
                                    limits = (WGPU.Limits) {
                                        maxBindGroups = 1,
                                    },
                                },
                            },
                            request_device_callback,
                            &device)
    assert(device != nil)
    queue := WGPU.DeviceGetQueue(device)
    
    pipeline_layout := WGPU.DeviceCreatePipelineLayout(device, &WGPU.PipelineLayoutDescriptor{
        nextInChain = nil,
        label = "Empty Pipeline Layout",
        bindGroupLayouts = nil,
        bindGroupLayoutCount = 0,
    })
    
    read_content, read_ok := os.read_entire_file_from_filename("examples/example_shader.wgsl"); 
    if !read_ok {
        panic("Could not open or read file.")
    }
    defer delete(read_content)
    
    shader_module :=  WGPU.DeviceCreateShaderModule(device, &WGPU.ShaderModuleDescriptor{
        nextInChain = cast(^WGPU.ChainedStruct)&WGPU.ShaderModuleWGSLDescriptor{
            chain = WGPU.ChainedStruct {
                sType = WGPU.SType.ShaderModuleWGSLDescriptor,
            },
            source = cstring(&read_content[0]),
        },
        label = "Quad Shader Module",
    })

    attributes := []WGPU.VertexAttribute {
                    {
                        format = WGPU.VertexFormat.Float32x2,
                        offset = cast(u64)offset_of(Vertex, pos),
                        shaderLocation = 0,
                    },
                    {
                        format = WGPU.VertexFormat.Float32x4,
                        offset = cast(u64)offset_of(Vertex, color),
                        shaderLocation = 1,
                    },
                }

    render_pipeline := WGPU.DeviceCreateRenderPipeline(device, &WGPU.RenderPipelineDescriptor{
        label = "Quad Render Pipeline",
        layout = pipeline_layout,
        vertex = WGPU.VertexState {
            module = shader_module,
            entryPoint = "vs_main",
            bufferCount = 1,
            buffers = &WGPU.VertexBufferLayout{
                arrayStride = size_of(Vertex),
                stepMode = WGPU.VertexStepMode.Vertex,
                attributeCount = 2,
                attributes = cast(^WGPU.VertexAttribute)&attributes[0],
            },
        },
        fragment = &{
            module = shader_module,
            entryPoint = "fs_main",
            targetCount = 1,
            targets = &{
                    nextInChain = nil,
                    format = WGPU.TextureFormat.BGRA8UnormSrgb,
                    blend = nil,
                    writeMask = u32(WGPU.ColorWriteMask.All),
            },
        },
        primitive = {
            topology = WGPU.PrimitiveTopology.TriangleList,
            cullMode = WGPU.CullMode.None,
        },
        multisample =  {
            count = 1,
            mask = 1,
            alphaToCoverageEnabled = false,
        },
    })
    
    swapchain := WGPU.DeviceCreateSwapChain(device, surface, &(WGPU.SwapChainDescriptor){
        label = "Swapchain",
        usage = WGPU.TextureUsageFlags(WGPU.TextureUsage.RenderAttachment),
        format = WGPU.TextureFormat.BGRA8UnormSrgb,
        width = 800,
        height = 600,
        presentMode = WGPU.PresentMode.Fifo,
    })
    
    vert_buffer := WGPU.DeviceCreateBuffer(device, &(WGPU.BufferDescriptor){
        label = "",
        usage = WGPU.BufferUsageFlags(WGPU.BufferUsage.Vertex) |
             WGPU.BufferUsageFlags(WGPU.BufferUsage.CopyDst),
        size = size_of(Vertex) * 6, 
    })
    
    vertices := VERTICES
    WGPU.QueueWriteBuffer(queue, vert_buffer, 0, &vertices, size_of(vertices))
    WGPU.QueueSubmit(queue, 0, nil)
    
    main_loop: for {
        for e: SDL.Event; SDL.PollEvent(&e) != 0; {
            #partial switch(e.type) {
                case .QUIT:
                    break main_loop;
            }
        }
        
        current_view := WGPU.SwapChainGetCurrentTextureView(swapchain)
        
        cmd_encoder := WGPU.DeviceCreateCommandEncoder(device, &WGPU.CommandEncoderDescriptor{
            label = "Main Command Encoder",
        })
        
        render_pass := WGPU.CommandEncoderBeginRenderPass(cmd_encoder, 
            &WGPU.RenderPassDescriptor{
                label = "Main Render Pass",
                colorAttachmentCount = 1,
                colorAttachments = &WGPU.RenderPassColorAttachment{
                    view = current_view,
                    loadOp = WGPU.LoadOp.Clear,
                    storeOp = WGPU.StoreOp.Store,
                    clearColor = WGPU.Color{ 0.1, 0.1, 0.25, 1.0 },
                },
            })
        WGPU.RenderPassEncoderSetPipeline(render_pass, render_pipeline)
        WGPU.RenderPassEncoderSetVertexBuffer(render_pass, 0, vert_buffer, 0, 0)
        WGPU.RenderPassEncoderDraw(render_pass, 6, 1, 0, 0)
        WGPU.RenderPassEncoderEndPass(render_pass)

        cmd_buffer := WGPU.CommandEncoderFinish(cmd_encoder, &WGPU.CommandBufferDescriptor{
            label = "Main Command Buffer",
        })
        WGPU.QueueSubmit(queue, 1, &cmd_buffer);

        WGPU.SwapChainPresent(swapchain)
    }
}
