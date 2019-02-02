//
//  BMGhostWindow.m
//  BMGhostWindow
//
//  Created by 朱佳伟 on 2019/2/2.
//

#import "BMGhostWindow.h"
#import "BMGhostButton.h"
#import "BMCornerGarbageView.h"

#define BM_ISIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//浮窗宽度
static const CGFloat ghostWindowWidth = 60.0;
//默认缩放动画时间
static const NSTimeInterval ghostWindowPathAnimtiontDuration = 0.3;
//浮窗左右两边最小间距
static const CGFloat ghostWindowMargin = 20.0;
//红色浮窗隐藏视图宽度
static const CGFloat ghostWindowContentWidth = 160.0;
//默认动画时间
static const NSTimeInterval ghostWindowAnimtionDefaultDuration = 0.25;
//浮窗上下两边最小间距 非 iPhoneX
static const CGFloat ghostWindowTopBottomMargin = 64.0;
//浮窗上下两边最小间距 iPhoneX
static const CGFloat ghostWindowTopBottomMarginIphoneX = 86.0;

// 确保浮窗按钮和右下角view为全局唯一
static BMGhostButton* ghostButton;
static BMCornerGarbageView* garbageView;

@interface BMGhostWindow () {
    // 浮窗的目标VC
    UIViewController* targetViewController;
}

@end

@implementation BMGhostWindow

#pragma mark - Public
+ (void)show {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CGFloat minY =  BM_ISIPhoneX ? ghostWindowTopBottomMarginIphoneX : ghostWindowTopBottomMargin;
        ghostButton = [[BMGhostButton alloc] initWithFrame:CGRectMake(UIScreen.mainScreen.bounds.size.width - ghostWindowWidth - ghostWindowMargin, minY, ghostWindowWidth, ghostWindowWidth)];
        garbageView = [[BMCornerGarbageView alloc] initWithFrame:CGRectMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height, ghostWindowContentWidth, ghostWindowContentWidth)];
    });
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    if (!garbageView.superview) {
        [keyWindow addSubview:garbageView];
        [keyWindow bringSubviewToFront:garbageView];
    }
    if (!ghostButton.superview) {
        [keyWindow addSubview:ghostButton];
        [keyWindow bringSubviewToFront:ghostButton];
    }
}

@end
