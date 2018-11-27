//
//  RNUnityViewEmitter.m
//  RNUnityView
//
//  Created by Brian P on 9/25/18.
//  Copyright © 2018 xzper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import "RNUnityViewEmitter.h"
#import "UnityUtils.h"
#import "RNUnityControlManager.h"

@implementation RNUnityViewEmitter

RCT_EXPORT_MODULE(UnityViewEmitter)

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"message"];
}

- (void)onMessage:(NSString *)message {
  [self sendEventWithName:@"message" body:message];
}

RCT_EXPORT_METHOD(enableListener) {
  if (self.enabled) return;
  
  self.enabled = true;
  [UnityUtils addUnityEventListener:self];
}

RCT_EXPORT_METHOD(disableListener) {
  if (!self.enabled) return;
  
  self.enabled = false;
  [UnityUtils removeUnityEventListener:self];
}

RCT_EXPORT_METHOD(startUnity) {
  dispatch_async(dispatch_get_main_queue(), ^{
    [[RNUnityControlManager sharedInstance] createUnity];
  });
}

@end
