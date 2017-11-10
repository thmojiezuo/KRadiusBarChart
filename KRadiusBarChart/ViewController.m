//
//  ViewController.m
//  KRadiusBarChart
//
//  Created by tenghu on 2017/11/10.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import "ViewController.h"
#import "KRadiusBarChart.h"

@interface ViewController ()

@property (nonatomic ,strong)KRadiusBarChart *radiusChart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    NSArray *yValues = @[@"10",@"8",@"12",@"11",@"6",@"3",@"0",@"9",@"8",@"6"];
    NSArray *xLabels = @[@"16.10",@"16.11",@"16.12",@"17.01",@"17.02",@"17.03",@"17.04",@"17.05",@"17.06",@"17.07"];
    _radiusChart = [[KRadiusBarChart alloc] initWithFrame:CGRectMake(40, 85, yValues.count*41+10, 190)];
    _radiusChart.xLabels = xLabels;
    _radiusChart.yValues = yValues;
    _radiusChart.yMaxNum = 12;
    _radiusChart.totalNum = 50;
    _radiusChart.storkColor = [UIColor cyanColor];
    _radiusChart.chartMargin = UIEdgeInsetsMake(20, 5, 40, 0);// 上左下右
    [self.view addSubview:_radiusChart];
    [_radiusChart show];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
