// RUN: %clang_cc1 -triple i386-apple-macosx10.10 -fobjc-arc -fsyntax-only -Wno-objc-root-class %s -verify

@class Dictionary;

@interface Test
@end
@implementation Test
- (void)rdar47403222:(Dictionary *)opts {
  [self undeclaredMethod:undeclaredArg];
  // expected-error@-1{{use of undeclared identifier 'undeclaredArg}}
  opts[(__bridge id)undeclaredKey] = 0;
  // expected-error@-1{{use of undeclared identifier 'undeclaredKey'}}
}
@end
