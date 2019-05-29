//
//  Macro.h
//  iOS OC Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#pragma mark ------ 尺寸判断 ------
//类iPhone5机型
#define KIs320x568_5s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//类iPhone6机型
#define KIs375x667_6s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
//类iPhone6+机型
#define KIs414x736_6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
//类iPhoneX机型
#define KIs375x812_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//类iPhoneXR机型
#define KIs414x896_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
//类iPhoneX Max机型
#define KIs414x896_XMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark ------ 类iPhoneX异性屏适配 ------

#define SafeAreaBottomHeight (KIs375x812_X || KIs414x896_XR || KIs414x896_XMax ? 34 : 22)
#define SafeAreaTopHeight (KIs375x812_X || KIs414x896_XR || KIs414x896_XMax ? 44 : 22)
#define KNavHeight (KIs375x812_X || KIs414x896_XR || KIs414x896_XMax ? 88 : 64)
#define KTabbarHeight (KIs375x812_X || KIs414x896_XR || KIs414x896_XMax ? 83 : 49)

#endif /* Macro_h */
