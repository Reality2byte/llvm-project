if (NOT HAVE_CXX_ATOMICS64_WITHOUT_LIB)
  set (atomic_lib atomic)
endif()

if( CMAKE_HOST_UNIX AND HAVE_LIBRT )
  set(rt_lib rt)
endif()

add_llvm_component_library(LLVMOrcJIT
  AbsoluteSymbols.cpp
  COFF.cpp
  COFFVCRuntimeSupport.cpp
  COFFPlatform.cpp
  CompileOnDemandLayer.cpp
  CompileUtils.cpp
  Core.cpp
  DebugObjectManagerPlugin.cpp
  DebugUtils.cpp
  EHFrameRegistrationPlugin.cpp
  EPCDynamicLibrarySearchGenerator.cpp
  EPCDebugObjectRegistrar.cpp
  EPCGenericDylibManager.cpp
  EPCGenericJITLinkMemoryManager.cpp
  EPCGenericRTDyldMemoryManager.cpp
  EPCIndirectionUtils.cpp
  ExecutionUtils.cpp
  ObjectFileInterface.cpp
  GetDylibInterface.cpp
  IndirectionUtils.cpp
  InProcessMemoryAccess.cpp
  IRCompileLayer.cpp
  IRTransformLayer.cpp
  IRPartitionLayer.cpp
  JITTargetMachineBuilder.cpp
  JITLinkReentryTrampolines.cpp
  LazyObjectLinkingLayer.cpp
  LazyReexports.cpp
  Layer.cpp
  LinkGraphLayer.cpp
  LinkGraphLinkingLayer.cpp
  LoadLinkableFile.cpp
  LookupAndRecordAddrs.cpp
  LLJIT.cpp
  MachO.cpp
  MachOPlatform.cpp
  MapperJITLinkMemoryManager.cpp
  MemoryMapper.cpp
  ELFNixPlatform.cpp
  Mangling.cpp
  ObjectLinkingLayer.cpp
  ObjectTransformLayer.cpp
  OrcABISupport.cpp
  OrcV2CBindings.cpp
  RTDyldObjectLinkingLayer.cpp
  SectCreate.cpp
  SelfExecutorProcessControl.cpp
  SimpleRemoteEPC.cpp
  Speculation.cpp
  SpeculateAnalyses.cpp
  ExecutorProcessControl.cpp
  TaskDispatch.cpp
  ThreadSafeModule.cpp
  UnwindInfoRegistrationPlugin.cpp
  RedirectionManager.cpp
  JITLinkRedirectableSymbolManager.cpp
  ReOptimizeLayer.cpp
  ADDITIONAL_HEADER_DIRS
  ${LLVM_MAIN_INCLUDE_DIR}/llvm/ExecutionEngine/Orc

  DEPENDS
  intrinsics_gen

  LINK_LIBS
  ${LLVM_PTHREAD_LIB}
  ${rt_lib}
  ${atomic_lib}

  LINK_COMPONENTS
  BinaryFormat
  Core
  ExecutionEngine
  JITLink
  Object
  OrcShared
  OrcTargetProcess
  WindowsDriver
  MC
  Passes
  RuntimeDyld
  Support
  Target
  TargetParser
  TextAPI
  TransformUtils
  )

add_subdirectory(Debugging)
add_subdirectory(Shared)
add_subdirectory(TargetProcess)

target_link_libraries(LLVMOrcJIT
  PRIVATE
  LLVMAnalysis
  LLVMBitReader
  LLVMBitWriter
  LLVMPasses
  )
