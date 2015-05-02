//
//  BarChartView.m
//  BarChart
//
//  Created by Nishinobu.Takahiro on 2015/04/09.
//  Copyright (c) 2015年 Nishinobu.Takahiro. All rights reserved.
//

#import "HACAutolayoutAnimationBarChart.h"

@interface HACAutolayoutAnimationBarChart ()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIView *barBackGroundView;
@property (weak, nonatomic) IBOutlet UIView *percentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *percentBarConstraintTop;

@end

@implementation HACAutolayoutAnimationBarChart

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"HACAutolayoutAnimationBarChart" owner:self options:nil];
        self.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        [self addSubview:self.view];
    }
    
    return self;
}

- (void)layoutSubviews {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                         cornerRadii:CGSizeMake(8.0, 8.0)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)renderChartWithBackgroundBarColor:(UIColor *)bColor percentageBarColor:(UIColor *)pColor actualValue:(NSNumber *)value {
    int heighestValue = CGRectGetHeight(self.barBackGroundView.frame);
    self.percentView.backgroundColor = pColor ? pColor : self.percentView.backgroundColor;
    
    const CGFloat *components = CGColorGetComponents(self.percentView.backgroundColor.CGColor);
    self.barBackGroundView.backgroundColor = bColor ? bColor : [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:0.4];
    
    double barScore = [value doubleValue];
    self.percentBarConstraintTop.constant = heighestValue;
    [self.barBackGroundView layoutIfNeeded];
    [UIView animateWithDuration:2.0 animations:^{
        self.percentBarConstraintTop.constant = (1 - barScore / heighestValue) * heighestValue;
        [self.barBackGroundView layoutIfNeeded];
    }];
    
}

@end
