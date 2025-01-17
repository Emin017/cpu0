; RUN: llc -verify-machineinstrs -O0 -mtriple=spirv64-unknown-unknown %s -o - | FileCheck %s
; RUN: %if spirv-tools %{ llc -O0 -mtriple=spirv64-unknown-unknown %s -o - -filetype=obj | spirv-val %}

; CHECK-DAG: %[[#Char:]] = OpTypeInt 8 0
; CHECK-DAG: %[[#PtrChar:]] = OpTypePointer Function %[[#Char]]
; CHECK-DAG: %[[#Int:]] = OpTypeInt 32 0
; CHECK-DAG: %[[#PtrInt:]] = OpTypePointer Function %[[#Int]]
; CHECK: %[[#R1:]] = OpFunctionCall %[[#PtrChar]] %[[#]]
; CHECK: %[[#R2:]] = OpFunctionCall %[[#PtrInt]] %[[#]]
; CHECK: %[[#Casted:]] = OpBitcast %[[#PtrChar]] %[[#R2]]
; CHECK: OpPhi %[[#PtrChar]] %[[#R1]] %[[#]] %[[#Casted]] %[[#]]

define ptr @foo(i1 %arg) {
entry:
  %r1 = tail call ptr @f1()
  %r2 = tail call ptr @f2()
  br i1 %arg, label %l1, label %l2

l1:
  br label %exit

l2:
  br label %exit

exit:
  %ret = phi ptr [ %r1, %l1 ], [ %r2, %l2 ]
  %ret2 = phi ptr [ %r1, %l1 ], [ %r2, %l2 ]
  tail call void @f0(ptr %ret)
  ret ptr %ret2
}

define void @f0(ptr %arg) {
entry:
  ret void
}

define ptr @f1() {
entry:
  %p = alloca i8
  store i8 8, ptr %p
  ret ptr %p
}

define ptr @f2() {
entry:
  %p = alloca i32
  store i32 32, ptr %p
  ret ptr %p
}
