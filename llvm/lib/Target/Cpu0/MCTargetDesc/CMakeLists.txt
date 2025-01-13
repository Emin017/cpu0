add_llvm_component_library(LLVMCpu0Desc
  Cpu0MCTargetDesc.cpp
  Cpu0MCAsmInfo.cpp
  Cpu0ABIInfo.cpp

  LINK_COMPONENTS
  MC
  Cpu0Info
  Support
  Cpu0AsmPrinter

  ADD_TO_COMPONENT
  Cpu0
  )