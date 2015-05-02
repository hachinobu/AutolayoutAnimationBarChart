//
//  BarChartView.h
//  BarChart
//
//  Created by Nishinobu.Takahiro on 2015/04/09.
//  Copyright (c) 2015年 Nishinobu.Takahiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HACAutolayoutAnimationBarChart : UIView

- (void)renderChartWithBackgroundBarColor:(UIColor *)bColor percentageBarColor:(UIColor *)pColor actualValue:(NSNumber *)value;

@end
