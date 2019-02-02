//
//  BMCornerGarbageView.m
//  BMGhostWindow
//
//  Created by 朱佳伟 on 2019/2/2.
//

#import "BMCornerGarbageView.h"

@interface BMCornerGarbageView ()

@property(nonatomic, copy) NSString *title;
@property(nonatomic, assign) CGFloat radius_0;
@property(nonatomic, assign) CGFloat radius_1;
@property(nonatomic, assign) CGFloat kCoef;

@end

@implementation BMCornerGarbageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8];
        self.title = @"拖动到此 开启浮窗";
        self.radius_0 = 18;
        self.radius_1 = 10;
        self.kCoef = 0.95;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    self.radius_0 = self.highlight ? 20 : 18;
    self.radius_1 = self.highlight ? 12 : 10;
    self.kCoef = self.highlight ? 1 : 0.95;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width, self.bounds.size.width) radius:self.bounds.size.width * self.kCoef startAngle:M_PI endAngle:M_PI * 1.5 clockwise:1];
    [maskPath addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.width)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle alloc] init];
    textStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14], NSForegroundColorAttributeName: [UIColor whiteColor], NSParagraphStyleAttributeName: textStyle};
    [_title drawInRect:CGRectMake(0, self.bounds.size.height * 3 / 4, self.bounds.size.width, 20) withAttributes:attributes];
    
    UIBezierPath *ring0 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:_radius_0 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    ring0.lineWidth = 3;
    [ring0 stroke];
    
    UIBezierPath *ring1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:_radius_1 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    ring1.lineWidth = 3;
    [ring1 stroke];
}

- (void)setHighlight:(BOOL)highlight {
    _highlight = highlight;
    [self setNeedsDisplay];
    if (highlight) {
        if (@available(iOS 10.0, *)) {
            UIImpactFeedbackGenerator *impactLight = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
            [impactLight impactOccurred];
        }
    }
}

- (void)setStyle:(BMCornerGarbageViewStyle)style {
    _style = style;
    if (style == BMCornerGarbageViewdDefault) {
        self.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.8];
        self.title = @"浮窗";
    } else if (style == BMCornerGarbageViewdCancel) {
        self.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.8];
        self.title = @"取消浮窗";
    }
}

@end
