//
//  BMCornerGarbageView.h
//  BMGhostWindow
//
//  Created by 朱佳伟 on 2019/2/2.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    BMCornerGarbageViewdDefault,    // 默认状态，即显示浮窗字样
    BMCornerGarbageViewdCancel,     // 取消状态，即显示取消浮窗字样
} BMCornerGarbageViewStyle;

@interface BMCornerGarbageView : UIView

// 表示浮动按钮是否移动到当前view的范围内, 默认No
@property (nonatomic, assign) BOOL highlight;

@property (nonatomic, assign) BMCornerGarbageViewStyle style;

@end
