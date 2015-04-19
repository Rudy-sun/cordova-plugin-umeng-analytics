//
//  AppDelegate+UmengAnalytics.m
//
//  Created by Landys on 4/16/15.
//
//

#import "AppDelegate+UmengAnalytics.h"
#import "MobClick.h"
#import <objc/runtime.h>

@implementation AppDelegate (UmengAnalytics)

// its dangerous to override a method from within a category.
// Instead we will use method swizzling. we set this up in the load call.
+ (void)load {
    Method original, swizzled;
    
    original = class_getInstanceMethod(self, @selector(init));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_init));
    method_exchangeImplementations(original, swizzled);
}

- (AppDelegate *)swizzled_init {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initQQApp:) name:@"UIApplicationDidFinishLaunchingNotification" object:nil];
    
    // This actually calls the original init method over in AppDelegate. Equivilent to calling super
    // on an overrided method, this is not recursive, although it appears that way. neat huh?
    return [self swizzled_init];
}

// This code will be called immediately after application:didFinishLaunchingWithOptions:. We need
// to process notifications in cold-start situations
- (void)initQQApp:(NSNotification *)notification {
    NSString* appId = [self.viewController.settings objectForKey:@"umengiosappid"];
    if (appId) {
        [MobClick startWithAppkey:appId reportPolicy:BATCH channelId:@"iOS"];
    }
}

@end
