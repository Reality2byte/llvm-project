// RUN: mlir-opt %s \
// RUN: -one-shot-bufferize="bufferize-function-boundaries" \
// RUN: -buffer-deallocation-pipeline -convert-bufferization-to-memref \
// RUN: -convert-linalg-to-loops -convert-scf-to-cf -expand-strided-metadata \
// RUN: -lower-affine -convert-arith-to-llvm --finalize-memref-to-llvm \
// RUN: -convert-func-to-llvm -reconcile-unrealized-casts | \
// RUN: mlir-runner -e main -entry-point-result=void \
// RUN:   -shared-libs=%mlir_runner_utils \
// RUN: | FileCheck %s

func.func @main() {
  %const = arith.constant dense<10.0> : tensor<2xf32>
  %insert_val = arith.constant dense<20.0> : tensor<1xf32>
  %inserted = tensor.insert_slice %insert_val into %const[0][1][1] : tensor<1xf32> into tensor<2xf32>

  %unranked = tensor.cast %inserted : tensor<2xf32> to tensor<*xf32>
  call @printMemrefF32(%unranked) : (tensor<*xf32>) -> ()

  //      CHECK: Unranked Memref base@ = {{0x[-9a-f]*}}
  // CHECK-SAME: rank = 1 offset = 0 sizes = [2] strides = [1] data =
  // CHECK-NEXT: [20, 10]

  return
}

func.func private @printMemrefF32(%ptr : tensor<*xf32>)
