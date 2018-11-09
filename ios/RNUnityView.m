//
//  RNUnityView.m
//  RNUnityView
//
//  Created by xzper on 2018/2/23.
//  Copyright © 2018年 xzper. All rights reserved.
//

#import "RNUnityView.h"

@implementation RNUnityView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self){
    self.uView = (UIView*)GetAppController().unityView;
    
    [UnityUtils addUnityEventListener:self];
    self.backgroundColor = [UIColor purpleColor];
  }
  return self;
}

- (void)dealloc {
  [UnityUtils removeUnityEventListener:self];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  [self loadUnityViewIn];
}

- (void)loadUnityViewIn {
  if (!self.uView) {
    [self.uView removeFromSuperview];
    self.uView = (UIView*)GetAppController().unityView;
  }
  if (self.uView.superview != self) {
    [self.uView removeFromSuperview];
    [self insertSubview:self.uView atIndex:0];
  }
  self.uView.frame = self.bounds;
  [self.uView setNeedsLayout];
}

- (void)onMessage:(NSString *)message {
  if (_onMessage) {
    _onMessage(@{
                 @"message": message,
                 });
    [self loadUnityViewIn];
  }
}

@end
