//
//  RNUnityViewEmitter.h
//  RNUnityView
//
//  Created by Brian P on 9/25/18.
//  Copyright © 2018 xzper. All rights reserved.
//

#ifndef RNUnityViewEmitter_h
#define RNUnityViewEmitter_h

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

#import "UnityUtils.h"

@interface RNUnityViewEmitter : RCTEventEmitter<RCTBridgeModule, UnityEventListener>

@property (nonatomic) BOOL enabled;

@end


#endif /* RNUnityViewEmitter_h */
