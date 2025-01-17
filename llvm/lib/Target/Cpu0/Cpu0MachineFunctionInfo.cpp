//===-- Cpu0MachineFunctionInfo.cpp - Private data used for Cpu0 --===//
//
//                    The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Cpu0 specific subclass of MachineFunctionInfo.
//
//===----------------------------------------------------------------------===//

#include "Cpu0MachineFunctionInfo.h"

#include "Cpu0InstrInfo.h"
#include "Cpu0Subtarget.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/IR/Function.h"

using namespace llvm;

bool FixGlobalBaseReg;

Cpu0MachineFunctionInfo::~Cpu0MachineFunctionInfo() {}

void Cpu0MachineFunctionInfo::anchor() {}