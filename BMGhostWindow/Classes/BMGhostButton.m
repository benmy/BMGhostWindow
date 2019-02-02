//
//  BMGhostButton.m
//  BMGhostWindow
//
//  Created by 朱佳伟 on 2019/2/2.
//

#import "BMGhostButton.h"

@interface BMGhostButton () {
    // 开始的触碰位置(相对ffsuperView)
    CGPoint startPoint;
    // 开始的触碰位置(相对self)
    CGPoint pointInSelf;
}

@end

@implementation BMGhostButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.margin = 15.f;
        [self setUpView];
    }
    return self;
}

#pragma mark - Setter
- (void)setContentImage:(UIImage *)contentImage {
    if (contentImage) {
        self.layer.contents = (__bridge id)contentImage.CGImage;
    }
}

#pragma mark - Private
- (void)setUpView {
    self.backgroundColor = [UIColor redColor];
    self.layer.contents = (__bridge id)[UIImage imageNamed:@"WebView_Minimize_Float_IconHL"].CGImage;
}

#pragma mark - Touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 记录首次触碰的位置，用于之后判断是否是移动还是点击
    UITouch *touch = [touches anyObject];
    startPoint = [touch locationInView:self.superview];
    pointInSelf = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.superview];
    
    CGFloat theCenterX = point.x + (self.frame.size.width / 2 - pointInSelf.x);
    CGFloat theCenterY = point.y + (self.frame.size.height / 2 - pointInSelf.y);
    CGFloat x = MIN([UIScreen mainScreen].bounds.size.width - self.frame.size.width / 2, MAX(theCenterX, self.frame.size.width / 2));
    CGFloat y = MIN([UIScreen mainScreen].bounds.size.height - self.frame.size.height / 2, MAX(theCenterY, self.frame.size.height / 2));
    //移动的时候，该图标也跟随移动
    self.center = CGPointMake(x, y);
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(ghostButtonBeginMove:)]) {
        [self.delegate ghostButtonBeginMove:self];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self];
    
    // 判断开始位置和结束位置是否一样来判断是否是点击，不一样则有过移动
    if (CGPointEqualToPoint(startPoint, endPoint)) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(ghostButtonDidClicked:)]) {
            [self.delegate ghostButtonDidClicked:self];
        }
        return;
    }
    
    /// 计算离左右两边的距离，靠近那边则移动至那边边缘
    CGFloat left = endPoint.x;
    CGFloat right = [UIScreen mainScreen].bounds.size.width - endPoint.x;
    if (left <= right) {
        [UIView animateWithDuration:0.2f animations:^{
            self.center = CGPointMake(self.margin + self.frame.size.width / 2, self.center.y);
        }];
    } else {
        [UIView animateWithDuration:0.2f animations:^{
            self.center = CGPointMake([UIScreen mainScreen].bounds.size.width - (self.margin + self.frame.size.width / 2), self.center.y);
        }];
    }
}

@end
