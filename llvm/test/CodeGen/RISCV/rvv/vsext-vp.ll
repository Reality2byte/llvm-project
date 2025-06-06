; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+v < %s | FileCheck %s
; RUN: llc -mtriple=riscv64 -mattr=+v < %s | FileCheck %s

declare <vscale x 2 x i16> @llvm.vp.sext.nxv2i16.nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i1>, i32)

define <vscale x 2 x i16> @vsext_nxv2i8_nxv2i16(<vscale x 2 x i8> %a, <vscale x 2 x i1> %m, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i8_nxv2i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, ma
; CHECK-NEXT:    vsext.vf2 v9, v8, v0.t
; CHECK-NEXT:    vmv1r.v v8, v9
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i16> @llvm.vp.sext.nxv2i16.nxv2i8(<vscale x 2 x i8> %a, <vscale x 2 x i1> %m, i32 %vl)
  ret <vscale x 2 x i16> %v
}

define <vscale x 2 x i16> @vsext_nxv2i8_nxv2i16_unmasked(<vscale x 2 x i8> %a, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i8_nxv2i16_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e16, mf2, ta, ma
; CHECK-NEXT:    vsext.vf2 v9, v8
; CHECK-NEXT:    vmv1r.v v8, v9
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i16> @llvm.vp.sext.nxv2i16.nxv2i8(<vscale x 2 x i8> %a, <vscale x 2 x i1> splat (i1 true), i32 %vl)
  ret <vscale x 2 x i16> %v
}

declare <vscale x 2 x i32> @llvm.vp.sext.nxv2i32.nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i1>, i32)

define <vscale x 2 x i32> @vsext_nxv2i8_nxv2i32(<vscale x 2 x i8> %a, <vscale x 2 x i1> %m, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i8_nxv2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, ma
; CHECK-NEXT:    vsext.vf4 v9, v8, v0.t
; CHECK-NEXT:    vmv.v.v v8, v9
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i32> @llvm.vp.sext.nxv2i32.nxv2i8(<vscale x 2 x i8> %a, <vscale x 2 x i1> %m, i32 %vl)
  ret <vscale x 2 x i32> %v
}

define <vscale x 2 x i32> @vsext_nxv2i8_nxv2i32_unmasked(<vscale x 2 x i8> %a, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i8_nxv2i32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, ma
; CHECK-NEXT:    vsext.vf4 v9, v8
; CHECK-NEXT:    vmv.v.v v8, v9
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i32> @llvm.vp.sext.nxv2i32.nxv2i8(<vscale x 2 x i8> %a, <vscale x 2 x i1> splat (i1 true), i32 %vl)
  ret <vscale x 2 x i32> %v
}

declare <vscale x 2 x i64> @llvm.vp.sext.nxv2i64.nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i1>, i32)

define <vscale x 2 x i64> @vsext_nxv2i8_nxv2i64(<vscale x 2 x i8> %a, <vscale x 2 x i1> %m, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i8_nxv2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v10, v8
; CHECK-NEXT:    vsext.vf8 v8, v10, v0.t
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i64> @llvm.vp.sext.nxv2i64.nxv2i8(<vscale x 2 x i8> %a, <vscale x 2 x i1> %m, i32 %vl)
  ret <vscale x 2 x i64> %v
}

define <vscale x 2 x i64> @vsext_nxv2i8_nxv2i64_unmasked(<vscale x 2 x i8> %a, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i8_nxv2i64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v10, v8
; CHECK-NEXT:    vsext.vf8 v8, v10
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i64> @llvm.vp.sext.nxv2i64.nxv2i8(<vscale x 2 x i8> %a, <vscale x 2 x i1> splat (i1 true), i32 %vl)
  ret <vscale x 2 x i64> %v
}

declare <vscale x 2 x i32> @llvm.vp.sext.nxv2i32.nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i1>, i32)

define <vscale x 2 x i32> @vsext_nxv2i16_nxv2i32(<vscale x 2 x i16> %a, <vscale x 2 x i1> %m, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i16_nxv2i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, ma
; CHECK-NEXT:    vsext.vf2 v9, v8, v0.t
; CHECK-NEXT:    vmv.v.v v8, v9
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i32> @llvm.vp.sext.nxv2i32.nxv2i16(<vscale x 2 x i16> %a, <vscale x 2 x i1> %m, i32 %vl)
  ret <vscale x 2 x i32> %v
}

define <vscale x 2 x i32> @vsext_nxv2i16_nxv2i32_unmasked(<vscale x 2 x i16> %a, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i16_nxv2i32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e32, m1, ta, ma
; CHECK-NEXT:    vsext.vf2 v9, v8
; CHECK-NEXT:    vmv.v.v v8, v9
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i32> @llvm.vp.sext.nxv2i32.nxv2i16(<vscale x 2 x i16> %a, <vscale x 2 x i1> splat (i1 true), i32 %vl)
  ret <vscale x 2 x i32> %v
}

declare <vscale x 2 x i64> @llvm.vp.sext.nxv2i64.nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i1>, i32)

define <vscale x 2 x i64> @vsext_nxv2i16_nxv2i64(<vscale x 2 x i16> %a, <vscale x 2 x i1> %m, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i16_nxv2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v10, v8
; CHECK-NEXT:    vsext.vf4 v8, v10, v0.t
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i64> @llvm.vp.sext.nxv2i64.nxv2i16(<vscale x 2 x i16> %a, <vscale x 2 x i1> %m, i32 %vl)
  ret <vscale x 2 x i64> %v
}

define <vscale x 2 x i64> @vsext_nxv2i16_nxv2i64_unmasked(<vscale x 2 x i16> %a, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i16_nxv2i64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v10, v8
; CHECK-NEXT:    vsext.vf4 v8, v10
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i64> @llvm.vp.sext.nxv2i64.nxv2i16(<vscale x 2 x i16> %a, <vscale x 2 x i1> splat (i1 true), i32 %vl)
  ret <vscale x 2 x i64> %v
}

declare <vscale x 2 x i64> @llvm.vp.sext.nxv2i64.nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i1>, i32)

define <vscale x 2 x i64> @vsext_nxv2i32_nxv2i64(<vscale x 2 x i32> %a, <vscale x 2 x i1> %m, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i32_nxv2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v10, v8
; CHECK-NEXT:    vsext.vf2 v8, v10, v0.t
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i64> @llvm.vp.sext.nxv2i64.nxv2i32(<vscale x 2 x i32> %a, <vscale x 2 x i1> %m, i32 %vl)
  ret <vscale x 2 x i64> %v
}

define <vscale x 2 x i64> @vsext_nxv2i32_nxv2i64_unmasked(<vscale x 2 x i32> %a, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv2i32_nxv2i64_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli zero, a0, e64, m2, ta, ma
; CHECK-NEXT:    vmv1r.v v10, v8
; CHECK-NEXT:    vsext.vf2 v8, v10
; CHECK-NEXT:    ret
  %v = call <vscale x 2 x i64> @llvm.vp.sext.nxv2i64.nxv2i32(<vscale x 2 x i32> %a, <vscale x 2 x i1> splat (i1 true), i32 %vl)
  ret <vscale x 2 x i64> %v
}

declare <vscale x 32 x i32> @llvm.vp.sext.nxv32i32.nxv32i8(<vscale x 32 x i8>, <vscale x 32 x i1>, i32)

define <vscale x 32 x i32> @vsext_nxv32i8_nxv32i32(<vscale x 32 x i8> %a, <vscale x 32 x i1> %m, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv32i8_nxv32i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a1, zero, e8, mf2, ta, ma
; CHECK-NEXT:    vmv1r.v v12, v0
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    srli a2, a1, 2
; CHECK-NEXT:    slli a1, a1, 1
; CHECK-NEXT:    vslidedown.vx v0, v0, a2
; CHECK-NEXT:    sub a2, a0, a1
; CHECK-NEXT:    sltu a3, a0, a2
; CHECK-NEXT:    addi a3, a3, -1
; CHECK-NEXT:    and a2, a3, a2
; CHECK-NEXT:    vsetvli zero, a2, e32, m8, ta, ma
; CHECK-NEXT:    vsext.vf4 v16, v10, v0.t
; CHECK-NEXT:    bltu a0, a1, .LBB12_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    mv a0, a1
; CHECK-NEXT:  .LBB12_2:
; CHECK-NEXT:    vmv1r.v v0, v12
; CHECK-NEXT:    vsetvli zero, a0, e32, m8, ta, ma
; CHECK-NEXT:    vsext.vf4 v24, v8, v0.t
; CHECK-NEXT:    vmv.v.v v8, v24
; CHECK-NEXT:    ret
  %v = call <vscale x 32 x i32> @llvm.vp.sext.nxv32i32.nxv32i8(<vscale x 32 x i8> %a, <vscale x 32 x i1> %m, i32 %vl)
  ret <vscale x 32 x i32> %v
}

define <vscale x 32 x i32> @vsext_nxv32i8_nxv32i32_unmasked(<vscale x 32 x i8> %a, i32 zeroext %vl) {
; CHECK-LABEL: vsext_nxv32i8_nxv32i32_unmasked:
; CHECK:       # %bb.0:
; CHECK-NEXT:    csrr a1, vlenb
; CHECK-NEXT:    slli a1, a1, 1
; CHECK-NEXT:    sub a2, a0, a1
; CHECK-NEXT:    sltu a3, a0, a2
; CHECK-NEXT:    addi a3, a3, -1
; CHECK-NEXT:    and a2, a3, a2
; CHECK-NEXT:    vsetvli zero, a2, e32, m8, ta, ma
; CHECK-NEXT:    vsext.vf4 v16, v10
; CHECK-NEXT:    bltu a0, a1, .LBB13_2
; CHECK-NEXT:  # %bb.1:
; CHECK-NEXT:    mv a0, a1
; CHECK-NEXT:  .LBB13_2:
; CHECK-NEXT:    vsetvli zero, a0, e32, m8, ta, ma
; CHECK-NEXT:    vsext.vf4 v24, v8
; CHECK-NEXT:    vmv.v.v v8, v24
; CHECK-NEXT:    ret
  %v = call <vscale x 32 x i32> @llvm.vp.sext.nxv32i32.nxv32i8(<vscale x 32 x i8> %a, <vscale x 32 x i1> splat (i1 true), i32 %vl)
  ret <vscale x 32 x i32> %v
}
