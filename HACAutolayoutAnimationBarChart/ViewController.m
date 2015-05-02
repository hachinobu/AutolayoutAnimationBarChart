//
//  ViewController.m
//  HACAutolayoutAnimationBarChart
//
//  Created by Nishinobu.Takahiro on 2015/05/02.
//  Copyright (c) 2015年 Nishinobu.Takahiro. All rights reserved.
//

#import "ViewController.h"
#import "HACAutolayoutAnimationBarChart.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HACAutolayoutAnimationBarChart *animationBarChart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.animationBarChart renderChartWithBackgroundBarColor:[UIColor grayColor] percentageBarColor:[UIColor blueColor] actualValue:@160];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
