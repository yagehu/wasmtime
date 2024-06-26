;;! target = "x86_64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load8_u offset=0xffff0000))

;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movl    %edx, %r11d
;;       movq    %r11, %rdx
;;       addq    0x2f(%rip), %rdx
;;       jb      0x3a
;;   17: movq    0x68(%rdi), %r9
;;       xorq    %r8, %r8
;;       addq    0x60(%rdi), %r11
;;       movl    $0xffff0000, %r10d
;;       addq    %r11, %r10
;;       cmpq    %r9, %rdx
;;       cmovaq  %r8, %r10
;;       movb    %cl, (%r10)
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;   3a: ud2
;;   3c: addb    %al, (%rax)
;;   3e: addb    %al, (%rax)
;;   40: addl    %eax, (%rax)
;;
;; wasm[0]::function[1]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movl    %edx, %r11d
;;       movq    %r11, %rcx
;;       addq    0x2f(%rip), %rcx
;;       jb      0x8b
;;   67: movq    0x68(%rdi), %r8
;;       xorq    %rdx, %rdx
;;       addq    0x60(%rdi), %r11
;;       movl    $0xffff0000, %r9d
;;       addq    %r11, %r9
;;       cmpq    %r8, %rcx
;;       cmovaq  %rdx, %r9
;;       movzbq  (%r9), %rax
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
;;   8b: ud2
;;   8d: addb    %al, (%rax)
;;   8f: addb    %al, (%rcx)
;;   91: addb    %bh, %bh
;;   93: incl    (%rax)
;;   95: addb    %al, (%rax)
