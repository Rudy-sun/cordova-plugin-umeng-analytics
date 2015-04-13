# Umeng Analytics Cordova Plugin

### About plugin

**Add plugin**

    cordova plugin add https://github.com/baomingba/cordova-plugin-umeng-analytics.git

**Remove plugin**

    cordova plugin remove https://github.com/baomingba/cordova-plugin-umeng-analytics.git

### iOS

**Basic usage in iOS, add following codes to your \*AppDelegate.m**

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {
        [MobClick startWithAppkey:@"xxxxxxxxxxxxxxx" reportPolicy:BATCH channelId:@"iOS"];
    }

Refer to [Umeng iOS Doc](http://dev.umeng.com/analytics/ios-doc).

### Android

Refer to [Umeng Android Doc](http://dev.umeng.com/analytics/android-doc).

### Version

0.0.1