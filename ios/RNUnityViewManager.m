//
//  RNUnityViewManager.m
//  RNUnityView
//
//  Created by xzper on 2018/2/23.
//  Copyright © 2018年 xzper. All rights reserved.
//

#import "RNUnityViewManager.h"
#import "RNUnityView.h"
#import "RNUnityControlManager.h"

@interface RNUnityViewManager() <UnityInitDelegate>

@end

@implementation RNUnityViewManager

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE(UnityView)
RCT_EXPORT_VIEW_PROPERTY(onMessage, RCTDirectEventBlock)

- (UIView *)view
{
  return [[RNUnityView alloc] init];
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

+ (void)listenAppState
{
  for (NSString *name in @[UIApplicationDidBecomeActiveNotification,
                           UIApplicationDidEnterBackgroundNotification,
                           UIApplicationWillTerminateNotification,
                           UIApplicationWillResignActiveNotification,
                           UIApplicationWillEnterForegroundNotification]) {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleAppStateDidChange:)
                                                 name:name
                                               object:nil];
  }
}

+ (void)handleAppStateDidChange:(NSNotification *)notification
{
  UnityAppController* unityAppController = GetAppController();
  
  UIApplication* application = [UIApplication sharedApplication];
  
  if ([notification.name isEqualToString:UIApplicationWillResignActiveNotification]) {
    [unityAppController applicationWillResignActive:application];
  } else if ([notification.name isEqualToString:UIApplicationDidEnterBackgroundNotification]) {
    [unityAppController applicationDidEnterBackground:application];
  } else if ([notification.name isEqualToString:UIApplicationWillEnterForegroundNotification]) {
    [unityAppController applicationWillEnterForeground:application];
  } else if ([notification.name isEqualToString:UIApplicationDidBecomeActiveNotification]) {
    [unityAppController applicationDidBecomeActive:application];
  } else if ([notification.name isEqualToString:UIApplicationWillTerminateNotification]) {
    [unityAppController applicationWillTerminate:application];
  }
}

- (void)setBridge:(RCTBridge *)bridge {
  _bridge = bridge;
  [RNUnityControlManager sharedInstance].unityDelegate = self;
  if (!UnityIsInited()) {
    InitUnity();
  }
}

RCT_EXPORT_METHOD(postMessage:(nonnull NSNumber *)reactTag gameObject:(NSString *)gameObject methodName:(NSString *)methodName message:(NSString *)message)
{
  UnityPostMessage(gameObject, methodName, message);
}

RCT_EXPORT_METHOD(pause:(nonnull NSNumber *)reactTag)
{
  UnityPauseCommand();
}

RCT_EXPORT_METHOD(resume:(nonnull NSNumber *)reactTag)
{
  UnityResumeCommand();
}

#pragma mark - UnityInitDelegate

- (void)destroyUnity {}

- (void)createUnity {
  UIApplication* application = [UIApplication sharedApplication];
  UnityAppController *controller = GetAppController();
  UIWindow* mainWindow = application.keyWindow;
  [controller application:application didFinishLaunchingWithOptions:_bridge.launchOptions];
  [controller startUnity:application];
  [mainWindow makeKeyAndVisible];
  [RNUnityViewManager listenAppState];
}

@end
