//
//  ViewController.m
//  GeneralClass
//
//  Created by msc on 2017/6/6.
//  Copyright © 2017年 MSC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    lab.center = self.view.center;
    lab.backgroundColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:20];
    lab.textColor = [UIColor blueColor];
    lab.text = @"常用类库";
    lab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lab];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
