// RUN: %clang_cc1 -triple x86_64-linux -fsyntax-only -frounding-math -verify %s

template <class b> b::a() {}
// expected-warning@-1 {{missing 'typename' prior to dependent type name 'b::a' is a C++20 extension}}
// expected-error@-2 {{expected unqualified-id}}
