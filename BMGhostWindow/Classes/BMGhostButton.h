//
//  BMGhostButton.h
//  BMGhostWindow
//
//  Created by 朱佳伟 on 2019/2/2.
//

#import <UIKit/UIKit.h>

@class BMGhostButton;

@protocol BMGhostButtonDelegate <NSObject>

@optional
/**
 点击了浮动按钮

 @param ghostButton ghostButton
 */
- (void)ghostButtonDidClicked:(BMGhostButton *)ghostButton;

/**
 浮动按钮开始拖动

 @param ghostButton ghostButton
 */
- (void)ghostButtonBeginMove:(BMGhostButton *)ghostButton;

/**
 浮动按钮结束拖动
 
 @param ghostButton ghostButton
 */
- (void)ghostButtonEndMove:(BMGhostButton *)ghostButton;

@end

@interface BMGhostButton : UIView

@property(nonatomic, weak) id <BMGhostButtonDelegate> delegate;

// 浮动按钮的图片，没有则使用默认图片
@property (nonatomic, strong) UIImage* contentImage;

// 浮动按钮停留在边缘的空隙大小, 默认15
@property (nonatomic, assign) CGFloat margin;

@end
