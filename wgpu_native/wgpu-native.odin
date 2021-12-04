package wgpu_native

 // -lwgpu_native
foreign import lib "system:wgpu_native"

import _c "core:c"

WEBGPU_H_ :: 1
_EXPORT :: 1
_WHOLE_SIZE :: -1
_COPY_STRIDE_UNDEFINED :: 4294967295
_LIMIT_U32_UNDEFINED :: 4294967295
_LIMIT_U64_UNDEFINED :: -1
_ARRAY_LAYER_COUNT_UNDEFINED :: 4294967295
_MIP_LEVEL_COUNT_UNDEFINED :: 4294967295

Flags :: u32
Adapter :: ^AdapterImpl
BindGroup :: ^BindGroupImpl
BindGroupLayout :: ^BindGroupLayoutImpl
Buffer :: ^BufferImpl
CommandBuffer :: ^CommandBufferImpl
CommandEncoder :: ^CommandEncoderImpl
ComputePassEncoder :: ^ComputePassEncoderImpl
ComputePipeline :: ^ComputePipelineImpl
Device :: ^DeviceImpl
Instance :: ^InstanceImpl
PipelineLayout :: ^PipelineLayoutImpl
QuerySet :: ^QuerySetImpl
Queue :: ^QueueImpl
RenderBundle :: ^RenderBundleImpl
RenderBundleEncoder :: ^RenderBundleEncoderImpl
RenderPassEncoder :: ^RenderPassEncoderImpl
RenderPipeline :: ^RenderPipelineImpl
Sampler :: ^SamplerImpl
ShaderModule :: ^ShaderModuleImpl
Surface :: ^SurfaceImpl
SwapChain :: ^SwapChainImpl
Texture :: ^TextureImpl
TextureView :: ^TextureViewImpl
BufferUsageFlags :: Flags
ColorWriteMaskFlags :: Flags
MapModeFlags :: Flags
ShaderStageFlags :: Flags
TextureUsageFlags :: Flags

BufferMapCallback :: #type proc(
    status : BufferMapAsyncStatus,
    userdata : rawptr,
)

CreateComputePipelineAsyncCallback :: #type proc(
    status : CreatePipelineAsyncStatus,
    pipeline : ComputePipeline,
    message : cstring,
    userdata : rawptr,
)

CreateRenderPipelineAsyncCallback :: #type proc(
    status : CreatePipelineAsyncStatus,
    pipeline : RenderPipeline,
    message : cstring,
    userdata : rawptr,
)

DeviceLostCallback :: #type proc(
    reason : DeviceLostReason,
    message : cstring,
    userdata : rawptr,
)

ErrorCallback :: #type proc(
    type : ErrorType,
    message : cstring,
    userdata : rawptr,
)

QueueWorkDoneCallback :: #type proc(
    status : QueueWorkDoneStatus,
    userdata : rawptr,
)

RequestAdapterCallback :: #type proc(
    status : RequestAdapterStatus,
    adapter : Adapter,
    message : cstring,
    userdata : rawptr,
)

RequestDeviceCallback :: #type proc(
    status : RequestDeviceStatus,
    device : Device,
    message : cstring,
    userdata : rawptr,
)

Proc :: #type proc()

ProcCreateInstance :: #type proc(descriptor : ^InstanceDescriptor) -> Instance

ProcGetProcAddress :: #type proc(
    device : Device,
    procName : cstring,
) -> Proc

ProcAdapterGetLimits :: #type proc(
    adapter : Adapter,
    limits : ^SupportedLimits,
) -> bool

ProcAdapterGetProperties :: #type proc(
    adapter : Adapter,
    properties : ^AdapterProperties,
)

ProcAdapterHasFeature :: #type proc(
    adapter : Adapter,
    feature : FeatureName,
) -> bool

ProcAdapterRequestDevice :: #type proc(
    adapter : Adapter,
    descriptor : ^DeviceDescriptor,
    callback : RequestDeviceCallback,
    userdata : rawptr,
)

ProcBufferDestroy :: #type proc(buffer : Buffer)

ProcBufferGetConstMappedRange :: #type proc(
    buffer : Buffer,
    offset : _c.size_t,
    size : _c.size_t,
) -> rawptr

ProcBufferGetMappedRange :: #type proc(
    buffer : Buffer,
    offset : _c.size_t,
    size : _c.size_t,
) -> rawptr

ProcBufferMapAsync :: #type proc(
    buffer : Buffer,
    mode : MapModeFlags,
    offset : _c.size_t,
    size : _c.size_t,
    callback : BufferMapCallback,
    userdata : rawptr,
)

ProcBufferUnmap :: #type proc(buffer : Buffer)

ProcCommandEncoderBeginComputePass :: #type proc(
    commandEncoder : CommandEncoder,
    descriptor : ^ComputePassDescriptor,
) -> ComputePassEncoder

ProcCommandEncoderBeginRenderPass :: #type proc(
    commandEncoder : CommandEncoder,
    descriptor : ^RenderPassDescriptor,
) -> RenderPassEncoder

ProcCommandEncoderCopyBufferToBuffer :: #type proc(
    commandEncoder : CommandEncoder,
    source : Buffer,
    sourceOffset : u64,
    destination : Buffer,
    destinationOffset : u64,
    size : u64,
)

ProcCommandEncoderCopyBufferToTexture :: #type proc(
    commandEncoder : CommandEncoder,
    source : ^ImageCopyBuffer,
    destination : ^ImageCopyTexture,
    copySize : ^Extent3D,
)

ProcCommandEncoderCopyTextureToBuffer :: #type proc(
    commandEncoder : CommandEncoder,
    source : ^ImageCopyTexture,
    destination : ^ImageCopyBuffer,
    copySize : ^Extent3D,
)

ProcCommandEncoderCopyTextureToTexture :: #type proc(
    commandEncoder : CommandEncoder,
    source : ^ImageCopyTexture,
    destination : ^ImageCopyTexture,
    copySize : ^Extent3D,
)

ProcCommandEncoderFinish :: #type proc(
    commandEncoder : CommandEncoder,
    descriptor : ^CommandBufferDescriptor,
) -> CommandBuffer

ProcCommandEncoderInsertDebugMarker :: #type proc(
    commandEncoder : CommandEncoder,
    markerLabel : cstring,
)

ProcCommandEncoderPopDebugGroup :: #type proc(commandEncoder : CommandEncoder)

ProcCommandEncoderPushDebugGroup :: #type proc(
    commandEncoder : CommandEncoder,
    groupLabel : cstring,
)

ProcCommandEncoderResolveQuerySet :: #type proc(
    commandEncoder : CommandEncoder,
    querySet : QuerySet,
    firstQuery : u32,
    queryCount : u32,
    destination : Buffer,
    destinationOffset : u64,
)

ProcCommandEncoderWriteTimestamp :: #type proc(
    commandEncoder : CommandEncoder,
    querySet : QuerySet,
    queryIndex : u32,
)

ProcComputePassEncoderBeginPipelineStatisticsQuery :: #type proc(
    computePassEncoder : ComputePassEncoder,
    querySet : QuerySet,
    queryIndex : u32,
)

ProcComputePassEncoderDispatch :: #type proc(
    computePassEncoder : ComputePassEncoder,
    x : u32,
    y : u32,
    z : u32,
)

ProcComputePassEncoderDispatchIndirect :: #type proc(
    computePassEncoder : ComputePassEncoder,
    indirectBuffer : Buffer,
    indirectOffset : u64,
)

ProcComputePassEncoderEndPass :: #type proc(computePassEncoder : ComputePassEncoder)

ProcComputePassEncoderEndPipelineStatisticsQuery :: #type proc(computePassEncoder : ComputePassEncoder)

ProcComputePassEncoderInsertDebugMarker :: #type proc(
    computePassEncoder : ComputePassEncoder,
    markerLabel : cstring,
)
ProcComputePassEncoderPopDebugGroup :: #type proc(computePassEncoder : ComputePassEncoder)
ProcComputePassEncoderPushDebugGroup :: #type proc(
    computePassEncoder : ComputePassEncoder,
    groupLabel : cstring,
)
ProcComputePassEncoderSetBindGroup :: #type proc(
    computePassEncoder : ComputePassEncoder,
    groupIndex : u32,
    group : BindGroup,
    dynamicOffsetCount : u32,
    dynamicOffsets : [^]u32,
)
ProcComputePassEncoderSetPipeline :: #type proc(
    computePassEncoder : ComputePassEncoder,
    pipeline : ComputePipeline,
)
ProcComputePassEncoderWriteTimestamp :: #type proc(
    computePassEncoder : ComputePassEncoder,
    querySet : QuerySet,
    queryIndex : u32,
)
ProcComputePipelineGetBindGroupLayout :: #type proc(
    computePipeline : ComputePipeline,
    groupIndex : u32,
) -> BindGroupLayout
ProcComputePipelineSetLabel :: #type proc(
    computePipeline : ComputePipeline,
    label : cstring,
)
ProcDeviceCreateBindGroup :: #type proc(
    device : Device,
    descriptor : ^BindGroupDescriptor,
) -> BindGroup
ProcDeviceCreateBindGroupLayout :: #type proc(
    device : Device,
    descriptor : ^BindGroupLayoutDescriptor,
) -> BindGroupLayout
ProcDeviceCreateBuffer :: #type proc(
    device : Device,
    descriptor : ^BufferDescriptor,
) -> Buffer
ProcDeviceCreateCommandEncoder :: #type proc(
    device : Device,
    descriptor : ^CommandEncoderDescriptor,
) -> CommandEncoder
ProcDeviceCreateComputePipeline :: #type proc(
    device : Device,
    descriptor : ^ComputePipelineDescriptor,
) -> ComputePipeline
ProcDeviceCreateComputePipelineAsync :: #type proc(
    device : Device,
    descriptor : ^ComputePipelineDescriptor,
    callback : CreateComputePipelineAsyncCallback,
    userdata : rawptr,
)
ProcDeviceCreatePipelineLayout :: #type proc(
    device : Device,
    descriptor : ^PipelineLayoutDescriptor,
) -> PipelineLayout
ProcDeviceCreateQuerySet :: #type proc(
    device : Device,
    descriptor : ^QuerySetDescriptor,
) -> QuerySet
ProcDeviceCreateRenderBundleEncoder :: #type proc(
    device : Device,
    descriptor : ^RenderBundleEncoderDescriptor,
) -> RenderBundleEncoder
ProcDeviceCreateRenderPipeline :: #type proc(
    device : Device,
    descriptor : ^RenderPipelineDescriptor,
) -> RenderPipeline
ProcDeviceCreateRenderPipelineAsync :: #type proc(
    device : Device,
    descriptor : ^RenderPipelineDescriptor,
    callback : CreateRenderPipelineAsyncCallback,
    userdata : rawptr,
)
ProcDeviceCreateSampler :: #type proc(
    device : Device,
    descriptor : ^SamplerDescriptor,
) -> Sampler
ProcDeviceCreateShaderModule :: #type proc(
    device : Device,
    descriptor : ^ShaderModuleDescriptor,
) -> ShaderModule
ProcDeviceCreateSwapChain :: #type proc(
    device : Device,
    surface : Surface,
    descriptor : ^SwapChainDescriptor,
) -> SwapChain
ProcDeviceCreateTexture :: #type proc(
    device : Device,
    descriptor : ^TextureDescriptor,
) -> Texture
ProcDeviceDestroy :: #type proc(device : Device)
ProcDeviceGetLimits :: #type proc(
    device : Device,
    limits : ^SupportedLimits,
) -> bool
ProcDeviceGetQueue :: #type proc(device : Device) -> Queue
ProcDevicePopErrorScope :: #type proc(
    device : Device,
    callback : ErrorCallback,
    userdata : rawptr,
) -> bool
ProcDevicePushErrorScope :: #type proc(
    device : Device,
    filter : ErrorFilter,
)
ProcDeviceSetDeviceLostCallback :: #type proc(
    device : Device,
    callback : DeviceLostCallback,
    userdata : rawptr,
)
ProcDeviceSetUncapturedErrorCallback :: #type proc(
    device : Device,
    callback : ErrorCallback,
    userdata : rawptr,
)
ProcInstanceCreateSurface :: #type proc(
    instance : Instance,
    descriptor : ^SurfaceDescriptor,
) -> Surface
ProcInstanceProcessEvents :: #type proc(instance : Instance)
ProcInstanceRequestAdapter :: #type proc(
    instance : Instance,
    options : ^RequestAdapterOptions,
    callback : RequestAdapterCallback,
    userdata : rawptr,
)
ProcQuerySetDestroy :: #type proc(querySet : QuerySet)
ProcQueueOnSubmittedWorkDone :: #type proc(
    queue : Queue,
    signalValue : u64,
    callback : QueueWorkDoneCallback,
    userdata : rawptr,
)
ProcQueueSubmit :: #type proc(
    queue : Queue,
    commandCount : u32,
    commands : [^]CommandBuffer,
)
ProcQueueWriteBuffer :: #type proc(
    queue : Queue,
    buffer : Buffer,
    bufferOffset : u64,
    data : rawptr,
    size : _c.size_t,
)
ProcQueueWriteTexture :: #type proc(
    queue : Queue,
    destination : ^ImageCopyTexture,
    data : rawptr,
    dataSize : _c.size_t,
    dataLayout : ^TextureDataLayout,
    writeSize : ^Extent3D,
)
ProcRenderBundleEncoderDraw :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    vertexCount : u32,
    instanceCount : u32,
    firstVertex : u32,
    firstInstance : u32,
)
ProcRenderBundleEncoderDrawIndexed :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    indexCount : u32,
    instanceCount : u32,
    firstIndex : u32,
    baseVertex : i32,
    firstInstance : u32,
)
ProcRenderBundleEncoderDrawIndexedIndirect :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    indirectBuffer : Buffer,
    indirectOffset : u64,
)
ProcRenderBundleEncoderDrawIndirect :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    indirectBuffer : Buffer,
    indirectOffset : u64,
)
ProcRenderBundleEncoderFinish :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    descriptor : ^RenderBundleDescriptor,
) -> RenderBundle
ProcRenderBundleEncoderInsertDebugMarker :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    markerLabel : cstring,
)
ProcRenderBundleEncoderPopDebugGroup :: #type proc(renderBundleEncoder : RenderBundleEncoder)
ProcRenderBundleEncoderPushDebugGroup :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    groupLabel : cstring,
)
ProcRenderBundleEncoderSetBindGroup :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    groupIndex : u32,
    group : BindGroup,
    dynamicOffsetCount : u32,
    dynamicOffsets : [^]u32,
)
ProcRenderBundleEncoderSetIndexBuffer :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    buffer : Buffer,
    format : IndexFormat,
    offset : u64,
    size : u64,
)
ProcRenderBundleEncoderSetPipeline :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    pipeline : RenderPipeline,
)
ProcRenderBundleEncoderSetVertexBuffer :: #type proc(
    renderBundleEncoder : RenderBundleEncoder,
    slot : u32,
    buffer : Buffer,
    offset : u64,
    size : u64,
)
ProcRenderPassEncoderBeginOcclusionQuery :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    queryIndex : u32,
)
ProcRenderPassEncoderBeginPipelineStatisticsQuery :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    querySet : QuerySet,
    queryIndex : u32,
)
ProcRenderPassEncoderDraw :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    vertexCount : u32,
    instanceCount : u32,
    firstVertex : u32,
    firstInstance : u32,
)
ProcRenderPassEncoderDrawIndexed :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    indexCount : u32,
    instanceCount : u32,
    firstIndex : u32,
    baseVertex : i32,
    firstInstance : u32,
)
ProcRenderPassEncoderDrawIndexedIndirect :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    indirectBuffer : Buffer,
    indirectOffset : u64,
)
ProcRenderPassEncoderDrawIndirect :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    indirectBuffer : Buffer,
    indirectOffset : u64,
)
ProcRenderPassEncoderEndOcclusionQuery :: #type proc(renderPassEncoder : RenderPassEncoder)
ProcRenderPassEncoderEndPass :: #type proc(renderPassEncoder : RenderPassEncoder)
ProcRenderPassEncoderEndPipelineStatisticsQuery :: #type proc(renderPassEncoder : RenderPassEncoder)
ProcRenderPassEncoderExecuteBundles :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    bundlesCount : u32,
    bundles : [^]RenderBundle,
)
ProcRenderPassEncoderInsertDebugMarker :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    markerLabel : cstring,
)
ProcRenderPassEncoderPopDebugGroup :: #type proc(renderPassEncoder : RenderPassEncoder)
ProcRenderPassEncoderPushDebugGroup :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    groupLabel : cstring,
)
ProcRenderPassEncoderSetBindGroup :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    groupIndex : u32,
    group : BindGroup,
    dynamicOffsetCount : u32,
    dynamicOffsets : ^u32,
)
ProcRenderPassEncoderSetBlendConstant :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    color : ^Color,
)
ProcRenderPassEncoderSetIndexBuffer :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    buffer : Buffer,
    format : IndexFormat,
    offset : u64,
    size : u64,
)
ProcRenderPassEncoderSetPipeline :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    pipeline : RenderPipeline,
)
ProcRenderPassEncoderSetScissorRect :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    x : u32,
    y : u32,
    width : u32,
    height : u32,
)
ProcRenderPassEncoderSetStencilReference :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    reference : u32,
)
ProcRenderPassEncoderSetVertexBuffer :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    slot : u32,
    buffer : Buffer,
    offset : u64,
    size : u64,
)
ProcRenderPassEncoderSetViewport :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    x : _c.float,
    y : _c.float,
    width : _c.float,
    height : _c.float,
    minDepth : _c.float,
    maxDepth : _c.float,
)
ProcRenderPassEncoderWriteTimestamp :: #type proc(
    renderPassEncoder : RenderPassEncoder,
    querySet : QuerySet,
    queryIndex : u32,
)
ProcRenderPipelineGetBindGroupLayout :: #type proc(
    renderPipeline : RenderPipeline,
    groupIndex : u32,
) -> BindGroupLayout
ProcRenderPipelineSetLabel :: #type proc(
    renderPipeline : RenderPipeline,
    label : cstring,
)
ProcShaderModuleSetLabel :: #type proc(
    shaderModule : ShaderModule,
    label : cstring,
)
ProcSurfaceGetPreferredFormat :: #type proc(
    surface : Surface,
    adapter : Adapter,
) -> TextureFormat

ProcSwapChainGetCurrentTextureView :: #type proc(swapChain : SwapChain) -> TextureView

ProcSwapChainPresent :: #type proc(swapChain : SwapChain)

ProcTextureCreateView :: #type proc(
    texture : Texture,
    descriptor : ^TextureViewDescriptor,
) -> TextureView

ProcTextureDestroy :: #type proc(texture : Texture)

AdapterType :: enum i32 {
    DiscreteGPU = 0,
    IntegratedGPU = 1,
    CPU = 2,
    Unknown = 3,
}

AddressMode :: enum i32 {
    Repeat = 0,
    MirrorRepeat = 1,
    ClampToEdge = 2,
}

BackendType :: enum i32 {
    Null = 0,
    WebGPU = 1,
    D3D11 = 2,
    D3D12 = 3,
    Metal = 4,
    Vulkan = 5,
    OpenGL = 6,
    OpenGLES = 7,
}

BlendFactor :: enum i32 {
    Zero = 0,
    One = 1,
    Src = 2,
    OneMinusSrc = 3,
    SrcAlpha = 4,
    OneMinusSrcAlpha = 5,
    Dst = 6,
    OneMinusDst = 7,
    DstAlpha = 8,
    OneMinusDstAlpha = 9,
    SrcAlphaSaturated = 10,
    Constant = 11,
    OneMinusConstant = 12,
}

BlendOperation :: enum i32 {
    Add = 0,
    Subtract = 1,
    ReverseSubtract = 2,
    Min = 3,
    Max = 4,
}

BufferBindingType :: enum i32 {
    Undefined = 0,
    Uniform = 1,
    Storage = 2,
    ReadOnlyStorage = 3,
}

BufferMapAsyncStatus :: enum i32 {
    Success = 0,
    Error = 1,
    Unknown = 2,
    DeviceLost = 3,
    DestroyedBeforeCallback = 4,
    UnmappedBeforeCallback = 5,
}

CompareFunction :: enum i32 {
    Undefined = 0,
    Never = 1,
    Less = 2,
    LessEqual = 3,
    Greater = 4,
    GreaterEqual = 5,
    Equal = 6,
    NotEqual = 7,
    Always = 8,
}

CompilationMessageType :: enum i32 {
    Error = 0,
    Warning = 1,
    Info = 2,
}

CreatePipelineAsyncStatus :: enum i32 {
    Success = 0,
    Error = 1,
    DeviceLost = 2,
    DeviceDestroyed = 3,
    Unknown = 4,
}

CullMode :: enum i32 {
    None = 0,
    Front = 1,
    Back = 2,
}

DeviceLostReason :: enum i32 {
    Undefined = 0,
    Destroyed = 1,
}

ErrorFilter :: enum i32 {
    None = 0,
    Validation = 1,
    OutOfMemory = 2,
}

ErrorType :: enum i32 {
    NoError = 0,
    Validation = 1,
    OutOfMemory = 2,
    Unknown = 3,
    DeviceLost = 4,
}

FeatureName :: enum i32 {
    Undefined = 0,
    DepthClamping = 1,
    Depth24UnormStencil8 = 2,
    Depth32FloatStencil8 = 3,
    TimestampQuery = 4,
    PipelineStatisticsQuery = 5,
    TextureCompressionBC = 6,
}

FilterMode :: enum i32 {
    Nearest = 0,
    Linear = 1,
}

FrontFace :: enum i32 {
    CCW = 0,
    CW = 1,
}

IndexFormat :: enum i32 {
    Undefined = 0,
    Uint16 = 1,
    Uint32 = 2,
}

LoadOp :: enum i32 {
    Clear = 0,
    Load = 1,
}

PipelineStatisticName :: enum i32 {
    VertexShaderInvocations = 0,
    ClipperInvocations = 1,
    ClipperPrimitivesOut = 2,
    FragmentShaderInvocations = 3,
    ComputeShaderInvocations = 4,
}

PowerPreference :: enum i32 {
    LowPower = 0,
    HighPerformance = 1,
}

PresentMode :: enum i32 {
    Immediate = 0,
    Mailbox = 1,
    Fifo = 2,
}

PrimitiveTopology :: enum i32 {
    PointList = 0,
    LineList = 1,
    LineStrip = 2,
    TriangleList = 3,
    TriangleStrip = 4,
}

QueryType :: enum i32 {
    Occlusion = 0,
    PipelineStatistics = 1,
    Timestamp = 2,
}

QueueWorkDoneStatus :: enum i32 {
    Success = 0,
    Error = 1,
    Unknown = 2,
    DeviceLost = 3,
}

RequestAdapterStatus :: enum i32 {
    Success = 0,
    Unavailable = 1,
    Error = 2,
    Unknown = 3,
}

RequestDeviceStatus :: enum i32 {
    Success = 0,
    Error = 1,
    Unknown = 2,
}

SType :: enum i32 {
    Invalid = 0,
    SurfaceDescriptorFromMetalLayer = 1,
    SurfaceDescriptorFromWindowsHWND = 2,
    SurfaceDescriptorFromXlib = 3,
    SurfaceDescriptorFromCanvasHTMLSelector = 4,
    ShaderModuleSPIRVDescriptor = 5,
    ShaderModuleWGSLDescriptor = 6,
    PrimitiveDepthClampingState = 7,
}

SamplerBindingType :: enum i32 {
    Undefined = 0,
    Filtering = 1,
    NonFiltering = 2,
    Comparison = 3,
}

StencilOperation :: enum i32 {
    Keep = 0,
    Zero = 1,
    Replace = 2,
    Invert = 3,
    IncrementClamp = 4,
    DecrementClamp = 5,
    IncrementWrap = 6,
    DecrementWrap = 7,
}

StorageTextureAccess :: enum i32 {
    Undefined = 0,
    WriteOnly = 1,
}

StoreOp :: enum i32 {
    Store = 0,
    Discard = 1,
}

TextureAspect :: enum i32 {
    All = 0,
    StencilOnly = 1,
    DepthOnly = 2,
}

TextureComponentType :: enum i32 {
    Float = 0,
    Sint = 1,
    Uint = 2,
    DepthComparison = 3,
}

TextureDimension :: enum i32 {
    OneDimensional = 0,
    TwoDimensional = 1,
    ThreeDimensional = 2,
}

TextureFormat :: enum i32 {
    Undefined = 0,
    R8Unorm = 1,
    R8Snorm = 2,
    R8Uint = 3,
    R8Sint = 4,
    R16Uint = 5,
    R16Sint = 6,
    R16Float = 7,
    RG8Unorm = 8,
    RG8Snorm = 9,
    RG8Uint = 10,
    RG8Sint = 11,
    R32Float = 12,
    R32Uint = 13,
    R32Sint = 14,
    RG16Uint = 15,
    RG16Sint = 16,
    RG16Float = 17,
    RGBA8Unorm = 18,
    RGBA8UnormSrgb = 19,
    RGBA8Snorm = 20,
    RGBA8Uint = 21,
    RGBA8Sint = 22,
    BGRA8Unorm = 23,
    BGRA8UnormSrgb = 24,
    RGB10A2Unorm = 25,
    RG11B10Ufloat = 26,
    RGB9E5Ufloat = 27,
    RG32Float = 28,
    RG32Uint = 29,
    RG32Sint = 30,
    RGBA16Uint = 31,
    RGBA16Sint = 32,
    RGBA16Float = 33,
    RGBA32Float = 34,
    RGBA32Uint = 35,
    RGBA32Sint = 36,
    Stencil8 = 37,
    Depth16Unorm = 38,
    Depth24Plus = 39,
    Depth24PlusStencil8 = 40,
    Depth32Float = 41,
    BC1RGBAUnorm = 42,
    BC1RGBAUnormSrgb = 43,
    BC2RGBAUnorm = 44,
    BC2RGBAUnormSrgb = 45,
    BC3RGBAUnorm = 46,
    BC3RGBAUnormSrgb = 47,
    BC4RUnorm = 48,
    BC4RSnorm = 49,
    BC5RGUnorm = 50,
    BC5RGSnorm = 51,
    BC6HRGBUfloat = 52,
    BC6HRGBFloat = 53,
    BC7RGBAUnorm = 54,
    BC7RGBAUnormSrgb = 55,
}

TextureSampleType :: enum i32 {
    Undefined = 0,
    Float = 1,
    UnfilterableFloat = 2,
    Depth = 3,
    Sint = 4,
    Uint = 5,
}

TextureViewDimension :: enum i32 {
    Undefined = 0,
    OneDimensional = 1,
    TwoDimensional = 2,
    TwoDimensionalArray = 3,
    Cube = 4,
    CubeArray = 5,
    ThreeDimensional = 6,
}

VertexFormat :: enum i32 {
    Undefined = 0,
    Uint8x2 = 1,
    Uint8x4 = 2,
    Sint8x2 = 3,
    Sint8x4 = 4,
    Unorm8x2 = 5,
    Unorm8x4 = 6,
    Snorm8x2 = 7,
    Snorm8x4 = 8,
    Uint16x2 = 9,
    Uint16x4 = 10,
    Sint16x2 = 11,
    Sint16x4 = 12,
    Unorm16x2 = 13,
    Unorm16x4 = 14,
    Snorm16x2 = 15,
    Snorm16x4 = 16,
    Float16x2 = 17,
    Float16x4 = 18,
    Float32 = 19,
    Float32x2 = 20,
    Float32x3 = 21,
    Float32x4 = 22,
    Uint32 = 23,
    Uint32x2 = 24,
    Uint32x3 = 25,
    Uint32x4 = 26,
    Sint32 = 27,
    Sint32x2 = 28,
    Sint32x3 = 29,
    Sint32x4 = 30,
}

VertexStepMode :: enum i32 {
    Vertex = 0,
    Instance = 1,
}

BufferUsage :: enum i32 {
    None = 0,
    MapRead = 1,
    MapWrite = 2,
    CopySrc = 4,
    CopyDst = 8,
    Index = 16,
    Vertex = 32,
    Uniform = 64,
    Storage = 128,
    Indirect = 256,
    QueryResolve = 512,
}

ColorWriteMask :: enum i32 {
    None = 0,
    Red = 1,
    Green = 2,
    Blue = 4,
    Alpha = 8,
    All = 15,
}

MapMode :: enum i32 {
    None = 0,
    Read = 1,
    Write = 2,
}

ShaderStage :: enum i32 {
    None = 0,
    Vertex = 1,
    Fragment = 2,
    Compute = 4,
}

TextureUsage :: enum i32 {
    None = 0,
    CopySrc = 1,
    CopyDst = 2,
    TextureBinding = 4,
    StorageBinding = 8,
    RenderAttachment = 16,
}

AdapterImpl :: struct {}

BindGroupImpl :: struct {}

BindGroupLayoutImpl :: struct {}

BufferImpl :: struct {}

CommandBufferImpl :: struct {}

CommandEncoderImpl :: struct {}

ComputePassEncoderImpl :: struct {}

ComputePipelineImpl :: struct {}

DeviceImpl :: struct {}

InstanceImpl :: struct {}

PipelineLayoutImpl :: struct {}

QuerySetImpl :: struct {}

QueueImpl :: struct {}

RenderBundleImpl :: struct {}

RenderBundleEncoderImpl :: struct {}

RenderPassEncoderImpl :: struct {}

RenderPipelineImpl :: struct {}

SamplerImpl :: struct {}

ShaderModuleImpl :: struct {}

SurfaceImpl :: struct {}

SwapChainImpl :: struct {}

TextureImpl :: struct {}

TextureViewImpl :: struct {}

ChainedStruct :: struct {
    next : ^ChainedStruct,
    sType : SType,
}

ChainedStructOut :: struct {
    next : ^ChainedStructOut,
    sType : SType,
}

AdapterProperties :: struct {
    nextInChain : ^ChainedStructOut,
    vendorID : u32,
    deviceID : u32,
    name : cstring,
    driverDescription : cstring,
    adapterType : AdapterType,
    backendType : BackendType,
}

BindGroupEntry :: struct {
    nextInChain : ^ChainedStruct,
    binding : u32,
    buffer : Buffer,
    offset : u64,
    size : u64,
    sampler : Sampler,
    textureView : TextureView,
}

BlendComponent :: struct {
    operation : BlendOperation,
    srcFactor : BlendFactor,
    dstFactor : BlendFactor,
}

BufferBindingLayout :: struct {
    nextInChain : ^ChainedStruct,
    type : BufferBindingType,
    hasDynamicOffset : bool,
    minBindingSize : u64,
}

BufferDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    usage : BufferUsageFlags,
    size : u64,
    mappedAtCreation : bool,
}

Color :: struct {
    r : _c.double,
    g : _c.double,
    b : _c.double,
    a : _c.double,
}

CommandBufferDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
}

CommandEncoderDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
}

CompilationMessage :: struct {
    nextInChain : ^ChainedStruct,
    message : cstring,
    type : CompilationMessageType,
    lineNum : u64,
    linePos : u64,
    offset : u64,
    length : u64,
}

ComputePassDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
}

ConstantEntry :: struct {
    nextInChain : ^ChainedStruct,
    key : cstring,
    value : _c.double,
}

Extent3D :: struct {
    width : u32,
    height : u32,
    depthOrArrayLayers : u32,
}

InstanceDescriptor :: struct {
    nextInChain : ^ChainedStruct,
}

Limits :: struct {
    maxTextureDimension1D : u32,
    maxTextureDimension2D : u32,
    maxTextureDimension3D : u32,
    maxTextureArrayLayers : u32,
    maxBindGroups : u32,
    maxDynamicUniformBuffersPerPipelineLayout : u32,
    maxDynamicStorageBuffersPerPipelineLayout : u32,
    maxSampledTexturesPerShaderStage : u32,
    maxSamplersPerShaderStage : u32,
    maxStorageBuffersPerShaderStage : u32,
    maxStorageTexturesPerShaderStage : u32,
    maxUniformBuffersPerShaderStage : u32,
    maxUniformBufferBindingSize : u64,
    maxStorageBufferBindingSize : u64,
    minUniformBufferOffsetAlignment : u32,
    minStorageBufferOffsetAlignment : u32,
    maxVertexBuffers : u32,
    maxVertexAttributes : u32,
    maxVertexBufferArrayStride : u32,
    maxInterStageShaderComponents : u32,
    maxComputeWorkgroupStorageSize : u32,
    maxComputeInvocationsPerWorkgroup : u32,
    maxComputeWorkgroupSizeX : u32,
    maxComputeWorkgroupSizeY : u32,
    maxComputeWorkgroupSizeZ : u32,
    maxComputeWorkgroupsPerDimension : u32,
}

MultisampleState :: struct {
    nextInChain : ^ChainedStruct,
    count : u32,
    mask : u32,
    alphaToCoverageEnabled : bool,
}

Origin3D :: struct {
    x : u32,
    y : u32,
    z : u32,
}

PipelineLayoutDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    bindGroupLayoutCount : u32,
    bindGroupLayouts : [^]BindGroupLayout,
}

PrimitiveDepthClampingState :: struct {
    chain : ChainedStruct,
    clampDepth : bool,
}

PrimitiveState :: struct {
    nextInChain : ^ChainedStruct,
    topology : PrimitiveTopology,
    stripIndexFormat : IndexFormat,
    frontFace : FrontFace,
    cullMode : CullMode,
}

QuerySetDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    type : QueryType,
    count : u32,
    pipelineStatistics : [^]PipelineStatisticName,
    pipelineStatisticsCount : u32,
}

RenderBundleDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
}

RenderBundleEncoderDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    colorFormatsCount : u32,
    colorFormats : [^]TextureFormat,
    depthStencilFormat : TextureFormat,
    sampleCount : u32,
}

RenderPassDepthStencilAttachment :: struct {
    view : TextureView,
    depthLoadOp : LoadOp,
    depthStoreOp : StoreOp,
    clearDepth : _c.float,
    depthReadOnly : bool,
    stencilLoadOp : LoadOp,
    stencilStoreOp : StoreOp,
    clearStencil : u32,
    stencilReadOnly : bool,
}

RequestAdapterOptions :: struct {
    nextInChain : ^ChainedStruct,
    compatibleSurface : Surface,
    powerPreference : PowerPreference,
    forceFallbackAdapter : bool,
}

SamplerBindingLayout :: struct {
    nextInChain : ^ChainedStruct,
    type : SamplerBindingType,
}

SamplerDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    addressModeU : AddressMode,
    addressModeV : AddressMode,
    addressModeW : AddressMode,
    magFilter : FilterMode,
    minFilter : FilterMode,
    mipmapFilter : FilterMode,
    lodMinClamp : _c.float,
    lodMaxClamp : _c.float,
    compare : CompareFunction,
    maxAnisotropy : u16,
}

ShaderModuleDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
}

ShaderModuleSPIRVDescriptor :: struct {
    chain : ChainedStruct,
    codeSize : u32,
    code : ^u32,
}

ShaderModuleWGSLDescriptor :: struct {
    chain : ChainedStruct,
    source : cstring,
}

StencilFaceState :: struct {
    compare : CompareFunction,
    failOp : StencilOperation,
    depthFailOp : StencilOperation,
    passOp : StencilOperation,
}

StorageTextureBindingLayout :: struct {
    nextInChain : ^ChainedStruct,
    access : StorageTextureAccess,
    format : TextureFormat,
    viewDimension : TextureViewDimension,
}

SurfaceDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
}

SurfaceDescriptorFromCanvasHTMLSelector :: struct {
    chain : ChainedStruct,
    selector : cstring,
}

SurfaceDescriptorFromMetalLayer :: struct {
    chain : ChainedStruct,
    layer : rawptr,
}

SurfaceDescriptorFromWindowsHWND :: struct {
    chain : ChainedStruct,
    hinstance : rawptr,
    hwnd : rawptr,
}

SurfaceDescriptorFromXlib :: struct {
    chain : ChainedStruct,
    display : rawptr,
    window : u32,
}

SwapChainDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    usage : TextureUsageFlags,
    format : TextureFormat,
    width : u32,
    height : u32,
    presentMode : PresentMode,
}

TextureBindingLayout :: struct {
    nextInChain : ^ChainedStruct,
    sampleType : TextureSampleType,
    viewDimension : TextureViewDimension,
    multisampled : bool,
}

TextureDataLayout :: struct {
    nextInChain : ^ChainedStruct,
    offset : u64,
    bytesPerRow : u32,
    rowsPerImage : u32,
}

TextureViewDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    format : TextureFormat,
    dimension : TextureViewDimension,
    baseMipLevel : u32,
    mipLevelCount : u32,
    baseArrayLayer : u32,
    arrayLayerCount : u32,
    aspect : TextureAspect,
}

VertexAttribute :: struct {
    format : VertexFormat,
    offset : u64,
    shaderLocation : u32,
}

BindGroupDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    layout : BindGroupLayout,
    entryCount : u32,
    entries : [^]BindGroupEntry,
}

BindGroupLayoutEntry :: struct {
    nextInChain : ^ChainedStruct,
    binding : u32,
    visibility : ShaderStageFlags,
    buffer : BufferBindingLayout,
    sampler : SamplerBindingLayout,
    texture : TextureBindingLayout,
    storageTexture : StorageTextureBindingLayout,
}

BlendState :: struct {
    color : BlendComponent,
    alpha : BlendComponent,
}

CompilationInfo :: struct {
    nextInChain : ^ChainedStruct,
    messageCount : u32,
    messages : [^]CompilationMessage,
}

DepthStencilState :: struct {
    nextInChain : ^ChainedStruct,
    format : TextureFormat,
    depthWriteEnabled : bool,
    depthCompare : CompareFunction,
    stencilFront : StencilFaceState,
    stencilBack : StencilFaceState,
    stencilReadMask : u32,
    stencilWriteMask : u32,
    depthBias : i32,
    depthBiasSlopeScale : _c.float,
    depthBiasClamp : _c.float,
}

ImageCopyBuffer :: struct {
    nextInChain : ^ChainedStruct,
    layout : TextureDataLayout,
    buffer : Buffer,
}

ImageCopyTexture :: struct {
    nextInChain : ^ChainedStruct,
    texture : Texture,
    mipLevel : u32,
    origin : Origin3D,
    aspect : TextureAspect,
}

ProgrammableStageDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    module : ShaderModule,
    entryPoint : cstring,
    constantCount : u32,
    constants : [^]ConstantEntry,
}

RenderPassColorAttachment :: struct {
    view : TextureView,
    resolveTarget : TextureView,
    loadOp : LoadOp,
    storeOp : StoreOp,
    clearColor : Color,
}

RequiredLimits :: struct {
    nextInChain : ^ChainedStruct,
    limits : Limits,
}

SupportedLimits :: struct {
    nextInChain : ^ChainedStructOut,
    limits : Limits,
}

TextureDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    usage : TextureUsageFlags,
    dimension : TextureDimension,
    size : Extent3D,
    format : TextureFormat,
    mipLevelCount : u32,
    sampleCount : u32,
}

VertexBufferLayout :: struct {
    arrayStride : u64,
    stepMode : VertexStepMode,
    attributeCount : u32,
    attributes : [^]VertexAttribute,
}

BindGroupLayoutDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    entryCount : u32,
    entries : [^]BindGroupLayoutEntry,
}

ColorTargetState :: struct {
    nextInChain : ^ChainedStruct,
    format : TextureFormat,
    blend : ^BlendState,
    writeMask : ColorWriteMaskFlags,
}

ComputePipelineDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    layout : PipelineLayout,
    compute : ProgrammableStageDescriptor,
}

DeviceDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    requiredFeaturesCount : u32,
    requiredFeatures : [^]FeatureName,
    requiredLimits : ^RequiredLimits,
}

RenderPassDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    colorAttachmentCount : u32,
    colorAttachments : [^]RenderPassColorAttachment,
    depthStencilAttachment : ^RenderPassDepthStencilAttachment,
    occlusionQuerySet : QuerySet,
}

VertexState :: struct {
    nextInChain : ^ChainedStruct,
    module : ShaderModule,
    entryPoint : cstring,
    constantCount : u32,
    constants : [^]ConstantEntry,
    bufferCount : u32,
    buffers : [^]VertexBufferLayout,
}

FragmentState :: struct {
    nextInChain : ^ChainedStruct,
    module : ShaderModule,
    entryPoint : cstring,
    constantCount : u32,
    constants : ^ConstantEntry,
    targetCount : u32,
    targets : ^ColorTargetState,
}

RenderPipelineDescriptor :: struct {
    nextInChain : ^ChainedStruct,
    label : cstring,
    layout : PipelineLayout,
    vertex : VertexState,
    primitive : PrimitiveState,
    depthStencil : ^DepthStencilState,
    multisample : MultisampleState,
    fragment : ^FragmentState,
}

@(default_calling_convention="c", link_prefix="wgpu")
foreign lib {

    CreateInstance :: proc(descriptor : ^InstanceDescriptor) -> Instance ---

    GetProcAddress :: proc(
        device : Device,
        procName : cstring,
    ) -> Proc ---

    AdapterGetLimits :: proc(
        adapter : Adapter,
        limits : ^SupportedLimits,
    ) -> bool ---

    AdapterGetProperties :: proc(
        adapter : Adapter,
        properties : ^AdapterProperties,
    ) ---

    AdapterHasFeature :: proc(
        adapter : Adapter,
        feature : FeatureName,
    ) -> bool ---

    AdapterRequestDevice :: proc(
        adapter : Adapter,
        descriptor : ^DeviceDescriptor,
        callback : RequestDeviceCallback,
        userdata : rawptr,
    ) ---

    BufferDestroy :: proc(buffer : Buffer) ---

    BufferGetConstMappedRange :: proc(
        buffer : Buffer,
        offset : _c.size_t,
        size : _c.size_t,
    ) -> rawptr ---

    BufferGetMappedRange :: proc(
        buffer : Buffer,
        offset : _c.size_t,
        size : _c.size_t,
    ) -> rawptr ---

    BufferMapAsync :: proc(
        buffer : Buffer,
        mode : MapModeFlags,
        offset : _c.size_t,
        size : _c.size_t,
        callback : BufferMapCallback,
        userdata : rawptr,
    ) ---

    BufferUnmap :: proc(buffer : Buffer) ---

    CommandEncoderBeginComputePass :: proc(
        commandEncoder : CommandEncoder,
        descriptor : ^ComputePassDescriptor,
    ) -> ComputePassEncoder ---

    CommandEncoderBeginRenderPass :: proc(
        commandEncoder : CommandEncoder,
        descriptor : ^RenderPassDescriptor,
    ) -> RenderPassEncoder ---

    CommandEncoderCopyBufferToBuffer :: proc(
        commandEncoder : CommandEncoder,
        source : Buffer,
        sourceOffset : u64,
        destination : Buffer,
        destinationOffset : u64,
        size : u64,
    ) ---

    CommandEncoderCopyBufferToTexture :: proc(
        commandEncoder : CommandEncoder,
        source : ^ImageCopyBuffer,
        destination : ^ImageCopyTexture,
        copySize : ^Extent3D,
    ) ---

    CommandEncoderCopyTextureToBuffer :: proc(
        commandEncoder : CommandEncoder,
        source : ^ImageCopyTexture,
        destination : ^ImageCopyBuffer,
        copySize : ^Extent3D,
    ) ---

    CommandEncoderCopyTextureToTexture :: proc(
        commandEncoder : CommandEncoder,
        source : ^ImageCopyTexture,
        destination : ^ImageCopyTexture,
        copySize : ^Extent3D,
    ) ---

    CommandEncoderFinish :: proc(
        commandEncoder : CommandEncoder,
        descriptor : ^CommandBufferDescriptor,
    ) -> CommandBuffer ---

    CommandEncoderInsertDebugMarker :: proc(
        commandEncoder : CommandEncoder,
        markerLabel : cstring,
    ) ---

    CommandEncoderPopDebugGroup :: proc(commandEncoder : CommandEncoder) ---

    CommandEncoderPushDebugGroup :: proc(
        commandEncoder : CommandEncoder,
        groupLabel : cstring,
    ) ---

    CommandEncoderResolveQuerySet :: proc(
        commandEncoder : CommandEncoder,
        querySet : QuerySet,
        firstQuery : u32,
        queryCount : u32,
        destination : Buffer,
        destinationOffset : u64,
    ) ---

    CommandEncoderWriteTimestamp :: proc(
        commandEncoder : CommandEncoder,
        querySet : QuerySet,
        queryIndex : u32,
    ) ---

    ComputePassEncoderBeginPipelineStatisticsQuery :: proc(
        computePassEncoder : ComputePassEncoder,
        querySet : QuerySet,
        queryIndex : u32,
    ) ---

    ComputePassEncoderDispatch :: proc(
        computePassEncoder : ComputePassEncoder,
        x : u32,
        y : u32,
        z : u32,
    ) ---

    ComputePassEncoderDispatchIndirect :: proc(
        computePassEncoder : ComputePassEncoder,
        indirectBuffer : Buffer,
        indirectOffset : u64,
    ) ---

    ComputePassEncoderEndPass :: proc(computePassEncoder : ComputePassEncoder) ---

    ComputePassEncoderEndPipelineStatisticsQuery :: proc(computePassEncoder : ComputePassEncoder) ---

    ComputePassEncoderInsertDebugMarker :: proc(
        computePassEncoder : ComputePassEncoder,
        markerLabel : cstring,
    ) ---

    ComputePassEncoderPopDebugGroup :: proc(computePassEncoder : ComputePassEncoder) ---

    ComputePassEncoderPushDebugGroup :: proc(
        computePassEncoder : ComputePassEncoder,
        groupLabel : cstring,
    ) ---

    ComputePassEncoderSetBindGroup :: proc(
        computePassEncoder : ComputePassEncoder,
        groupIndex : u32,
        group : BindGroup,
        dynamicOffsetCount : u32,
        dynamicOffsets : ^u32,
    ) ---

    ComputePassEncoderSetPipeline :: proc(
        computePassEncoder : ComputePassEncoder,
        pipeline : ComputePipeline,
    ) ---

    ComputePassEncoderWriteTimestamp :: proc(
        computePassEncoder : ComputePassEncoder,
        querySet : QuerySet,
        queryIndex : u32,
    ) ---

    ComputePipelineGetBindGroupLayout :: proc(
        computePipeline : ComputePipeline,
        groupIndex : u32,
    ) -> BindGroupLayout ---

    ComputePipelineSetLabel :: proc(
        computePipeline : ComputePipeline,
        label : cstring,
    ) ---

    DeviceCreateBindGroup :: proc(
        device : Device,
        descriptor : ^BindGroupDescriptor,
    ) -> BindGroup ---

    DeviceCreateBindGroupLayout :: proc(
        device : Device,
        descriptor : ^BindGroupLayoutDescriptor,
    ) -> BindGroupLayout ---

    DeviceCreateBuffer :: proc(
        device : Device,
        descriptor : ^BufferDescriptor,
    ) -> Buffer ---

    DeviceCreateCommandEncoder :: proc(
        device : Device,
        descriptor : ^CommandEncoderDescriptor,
    ) -> CommandEncoder ---

    DeviceCreateComputePipeline :: proc(
        device : Device,
        descriptor : ^ComputePipelineDescriptor,
    ) -> ComputePipeline ---

    DeviceCreateComputePipelineAsync :: proc(
        device : Device,
        descriptor : ^ComputePipelineDescriptor,
        callback : CreateComputePipelineAsyncCallback,
        userdata : rawptr,
    ) ---

    DeviceCreatePipelineLayout :: proc(
        device : Device,
        descriptor : ^PipelineLayoutDescriptor,
    ) -> PipelineLayout ---

    DeviceCreateQuerySet :: proc(
        device : Device,
        descriptor : ^QuerySetDescriptor,
    ) -> QuerySet ---

    DeviceCreateRenderBundleEncoder :: proc(
        device : Device,
        descriptor : ^RenderBundleEncoderDescriptor,
    ) -> RenderBundleEncoder ---

    DeviceCreateRenderPipeline :: proc(
        device : Device,
        descriptor : ^RenderPipelineDescriptor,
    ) -> RenderPipeline ---

    DeviceCreateRenderPipelineAsync :: proc(
        device : Device,
        descriptor : ^RenderPipelineDescriptor,
        callback : CreateRenderPipelineAsyncCallback,
        userdata : rawptr,
    ) ---

    DeviceCreateSampler :: proc(
        device : Device,
        descriptor : ^SamplerDescriptor,
    ) -> Sampler ---

    DeviceCreateShaderModule :: proc(
        device : Device,
        descriptor : ^ShaderModuleDescriptor,
    ) -> ShaderModule ---

    DeviceCreateSwapChain :: proc(
        device : Device,
        surface : Surface,
        descriptor : ^SwapChainDescriptor,
    ) -> SwapChain ---

    DeviceCreateTexture :: proc(
        device : Device,
        descriptor : ^TextureDescriptor,
    ) -> Texture ---

    DeviceDestroy :: proc(device : Device) ---

    DeviceGetLimits :: proc(
        device : Device,
        limits : ^SupportedLimits,
    ) -> bool ---

    DeviceGetQueue :: proc(device : Device) -> Queue ---

    DevicePopErrorScope :: proc(
        device : Device,
        callback : ErrorCallback,
        userdata : rawptr,
    ) -> bool ---

    DevicePushErrorScope :: proc(
        device : Device,
        filter : ErrorFilter,
    ) ---

    DeviceSetDeviceLostCallback :: proc(
        device : Device,
        callback : DeviceLostCallback,
        userdata : rawptr,
    ) ---

    DeviceSetUncapturedErrorCallback :: proc(
        device : Device,
        callback : ErrorCallback,
        userdata : rawptr,
    ) ---

    InstanceCreateSurface :: proc(
        instance : Instance,
        descriptor : ^SurfaceDescriptor,
    ) -> Surface ---

    InstanceProcessEvents :: proc(instance : Instance) ---

    InstanceRequestAdapter :: proc(
        instance : Instance,
        options : ^RequestAdapterOptions,
        callback : RequestAdapterCallback,
        userdata : rawptr,
    ) ---

    QuerySetDestroy :: proc(querySet : QuerySet) ---

    QueueOnSubmittedWorkDone :: proc(
        queue : Queue,
        signalValue : u64,
        callback : QueueWorkDoneCallback,
        userdata : rawptr,
    ) ---

    QueueSubmit :: proc(
        queue : Queue,
        commandCount : u32,
        commands : ^CommandBuffer,
    ) ---

    QueueWriteBuffer :: proc(
        queue : Queue,
        buffer : Buffer,
        bufferOffset : u64,
        data : rawptr,
        size : _c.size_t,
    ) ---

    QueueWriteTexture :: proc(
        queue : Queue,
        destination : ^ImageCopyTexture,
        data : rawptr,
        dataSize : _c.size_t,
        dataLayout : ^TextureDataLayout,
        writeSize : ^Extent3D,
    ) ---

    RenderBundleEncoderDraw :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        vertexCount : u32,
        instanceCount : u32,
        firstVertex : u32,
        firstInstance : u32,
    ) ---

    RenderBundleEncoderDrawIndexed :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        indexCount : u32,
        instanceCount : u32,
        firstIndex : u32,
        baseVertex : i32,
        firstInstance : u32,
    ) ---

    RenderBundleEncoderDrawIndexedIndirect :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        indirectBuffer : Buffer,
        indirectOffset : u64,
    ) ---

    RenderBundleEncoderDrawIndirect :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        indirectBuffer : Buffer,
        indirectOffset : u64,
    ) ---

    RenderBundleEncoderFinish :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        descriptor : ^RenderBundleDescriptor,
    ) -> RenderBundle ---

    RenderBundleEncoderInsertDebugMarker :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        markerLabel : cstring,
    ) ---

    RenderBundleEncoderPopDebugGroup :: proc(renderBundleEncoder : RenderBundleEncoder) ---

    RenderBundleEncoderPushDebugGroup :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        groupLabel : cstring,
    ) ---

    RenderBundleEncoderSetBindGroup :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        groupIndex : u32,
        group : BindGroup,
        dynamicOffsetCount : u32,
        dynamicOffsets : ^u32,
    ) ---

    RenderBundleEncoderSetIndexBuffer :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        buffer : Buffer,
        format : IndexFormat,
        offset : u64,
        size : u64,
    ) ---

    RenderBundleEncoderSetPipeline :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        pipeline : RenderPipeline,
    ) ---

    RenderBundleEncoderSetVertexBuffer :: proc(
        renderBundleEncoder : RenderBundleEncoder,
        slot : u32,
        buffer : Buffer,
        offset : u64,
        size : u64,
    ) ---

    RenderPassEncoderBeginOcclusionQuery :: proc(
        renderPassEncoder : RenderPassEncoder,
        queryIndex : u32,
    ) ---

    RenderPassEncoderBeginPipelineStatisticsQuery :: proc(
        renderPassEncoder : RenderPassEncoder,
        querySet : QuerySet,
        queryIndex : u32,
    ) ---

    RenderPassEncoderDraw :: proc(
        renderPassEncoder : RenderPassEncoder,
        vertexCount : u32,
        instanceCount : u32,
        firstVertex : u32,
        firstInstance : u32,
    ) ---

    RenderPassEncoderDrawIndexed :: proc(
        renderPassEncoder : RenderPassEncoder,
        indexCount : u32,
        instanceCount : u32,
        firstIndex : u32,
        baseVertex : i32,
        firstInstance : u32,
    ) ---

    RenderPassEncoderDrawIndexedIndirect :: proc(
        renderPassEncoder : RenderPassEncoder,
        indirectBuffer : Buffer,
        indirectOffset : u64,
    ) ---

    RenderPassEncoderDrawIndirect :: proc(
        renderPassEncoder : RenderPassEncoder,
        indirectBuffer : Buffer,
        indirectOffset : u64,
    ) ---

    RenderPassEncoderEndOcclusionQuery :: proc(renderPassEncoder : RenderPassEncoder) ---

    RenderPassEncoderEndPass :: proc(renderPassEncoder : RenderPassEncoder) ---

    RenderPassEncoderEndPipelineStatisticsQuery :: proc(renderPassEncoder : RenderPassEncoder) ---

    RenderPassEncoderExecuteBundles :: proc(
        renderPassEncoder : RenderPassEncoder,
        bundlesCount : u32,
        bundles : ^RenderBundle,
    ) ---

    RenderPassEncoderInsertDebugMarker :: proc(
        renderPassEncoder : RenderPassEncoder,
        markerLabel : cstring,
    ) ---

    RenderPassEncoderPopDebugGroup :: proc(renderPassEncoder : RenderPassEncoder) ---

    RenderPassEncoderPushDebugGroup :: proc(
        renderPassEncoder : RenderPassEncoder,
        groupLabel : cstring,
    ) ---

    RenderPassEncoderSetBindGroup :: proc(
        renderPassEncoder : RenderPassEncoder,
        groupIndex : u32,
        group : BindGroup,
        dynamicOffsetCount : u32,
        dynamicOffsets : ^u32,
    ) ---

    RenderPassEncoderSetBlendConstant :: proc(
        renderPassEncoder : RenderPassEncoder,
        color : ^Color,
    ) ---

    RenderPassEncoderSetIndexBuffer :: proc(
        renderPassEncoder : RenderPassEncoder,
        buffer : Buffer,
        format : IndexFormat,
        offset : u64,
        size : u64,
    ) ---

    RenderPassEncoderSetPipeline :: proc(
        renderPassEncoder : RenderPassEncoder,
        pipeline : RenderPipeline,
    ) ---

    RenderPassEncoderSetScissorRect :: proc(
        renderPassEncoder : RenderPassEncoder,
        x : u32,
        y : u32,
        width : u32,
        height : u32,
    ) ---

    RenderPassEncoderSetStencilReference :: proc(
        renderPassEncoder : RenderPassEncoder,
        reference : u32,
    ) ---

    RenderPassEncoderSetVertexBuffer :: proc(
        renderPassEncoder : RenderPassEncoder,
        slot : u32,
        buffer : Buffer,
        offset : u64,
        size : u64,
    ) ---

    RenderPassEncoderSetViewport :: proc(
        renderPassEncoder : RenderPassEncoder,
        x : _c.float,
        y : _c.float,
        width : _c.float,
        height : _c.float,
        minDepth : _c.float,
        maxDepth : _c.float,
    ) ---

    RenderPassEncoderWriteTimestamp :: proc(
        renderPassEncoder : RenderPassEncoder,
        querySet : QuerySet,
        queryIndex : u32,
    ) ---

    RenderPipelineGetBindGroupLayout :: proc(
        renderPipeline : RenderPipeline,
        groupIndex : u32,
    ) -> BindGroupLayout ---

    RenderPipelineSetLabel :: proc(
        renderPipeline : RenderPipeline,
        label : cstring,
    ) ---

    ShaderModuleSetLabel :: proc(
        shaderModule : ShaderModule,
        label : cstring,
    ) ---

    SurfaceGetPreferredFormat :: proc(
        surface : Surface,
        adapter : Adapter,
    ) -> TextureFormat ---

    SwapChainGetCurrentTextureView :: proc(swapChain : SwapChain) -> TextureView ---

    SwapChainPresent :: proc(swapChain : SwapChain) ---

    TextureCreateView :: proc(
        texture : Texture,
        descriptor : ^TextureViewDescriptor,
    ) -> TextureView ---

    TextureDestroy :: proc(texture : Texture) ---

}
