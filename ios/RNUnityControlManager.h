//
//  RNUnityControlManager.h
//  Bunch
//
//  Created by Jason Liang on 11/9/18.
//  Copyright © 2018 Z1 LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UnityInitDelegate <NSObject>

- (void)createUnity;
- (void)destroyUnity;

@end


@interface RNUnityControlManager : NSObject

+ (RNUnityControlManager *)sharedInstance;

@property (nonatomic, strong) id<UnityInitDelegate> unityDelegate;

@end

NS_ASSUME_NONNULL_END
