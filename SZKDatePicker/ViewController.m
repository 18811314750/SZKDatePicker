//
//  ViewController.m
//  SZKDatePicker
//
//  Created by sunzhaokai on 2017/9/13.
//  Copyright © 2017年 孙赵凯. All rights reserved.
//

#import "ViewController.h"
#import "SZKDatePicker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor yellowColor];
}
#pragma mark---点击屏幕调用SZKDatePicker
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //调用SZKDatePicker
    [SZKDatePicker datePickerShow:^(NSString *curDateStr) {
        NSLog(@"选中的日期为:%@",curDateStr);
    }];
}

@end
