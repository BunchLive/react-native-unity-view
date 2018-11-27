//
//  RNUnityControlManager.m
//  Bunch
//
//  Created by Jason Liang on 11/9/18.
//  Copyright © 2018 Z1 LLC. All rights reserved.
//

#import "RNUnityControlManager.h"

@implementation RNUnityControlManager

+ (RNUnityControlManager *)sharedInstance {
  static RNUnityControlManager *instance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[RNUnityControlManager alloc] init];
  });
  return instance;
}

- (void)createUnity {
  if (self.unityCreated) {
    return;
  }
  self.unityCreated = YES;
  [self.unityDelegate createUnity];
}

@end
