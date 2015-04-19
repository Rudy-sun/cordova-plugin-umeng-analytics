# Umeng Analytics Cordova Plugin

A Cordova plugin for Umeng Analytics (友盟统计) SDK.

## 1. 插件功能

1. 支持友盟统计的基本功能，通过插件机制方便安装。
2. TODO

## 2. 插件使用

**安装插件**

    cordova plugin add https://github.com/baomingba/cordova-plugin-umeng-analytics.git

**移除插件**

    cordova plugin remove com.qiudao.cordova.umeng-analytics

### iOS平台

在`config.xml`中添加`preference` `UmengIOSAppId`即可实现基本统计功能。`UmengIOSAppId`是友盟平台创建的iOS应用的id。

        <preference name="UmengIOSAppId" value="123456789012345678901234" />
        
更多高级统计功能参考[Umeng iOS Doc](http://dev.umeng.com/analytics/ios-doc)，需要在应用代码中调用相关友盟接口。  
      
### Android平台

需要修改生成的Android Project部分代码来实现基本统计功能。

1. 修改`AndroidMainifest.xml`中的`meta-data` `UMENG_APPKEY`，把`YOUR_UMENG_APP_KEY`替换为友盟平台创建的Android应用的id。

        <meta-data android:name="UMENG_APPKEY" android:value="123456789012345678900987" />

2. 需要额外在每个需要统计的Acitivity中加入：

        @Override
        public void onResume() {
            super.onResume();
            MobclickAgent.onResume(this);
        }
        
        @Override
        public void onPause() {
            super.onPause();
            MobclickAgent.onPause(this);
        }

更多高级统计功能参考[Umeng Android Doc](http://dev.umeng.com/analytics/android-doc)，需要在应用代码中调用相关友盟接口。  

