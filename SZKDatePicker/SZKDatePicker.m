//
//  SZKDatePicker.m
//  95306
//
//  Created by sunzhaokai on 2017/9/13.
//  Copyright © 2017年 孙赵凯. All rights reserved.
//

#import "SZKDatePicker.h"

//屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//控件高度
#define DatePickerHeight    200
//工具条高度
#define ToolBarHeight       40
//输出时间格式
#define DateFormatter       @"yyyy-MM-dd"

@interface SZKDatePicker ()

@property(nonatomic,retain)UIView *dateBgView;//时间弹框背景view
@property(nonatomic,retain)UIDatePicker *datePicker;//时间弹框控件
@property(nonatomic,retain)UIToolbar *dateToolBar;//时间弹框工具条
//返回当前时间的block
@property(nonatomic,copy)GetCurDateBlock getCurDateBlock;

@end

@implementation SZKDatePicker

+(instancetype)datePickerShow:(GetCurDateBlock)getCurDateBlock
{
    SZKDatePicker *datePicker=[[SZKDatePicker alloc]initWithFrame:[UIScreen mainScreen].bounds];
    datePicker.getCurDateBlock=getCurDateBlock;
    //展示到最顶层
    [[UIApplication sharedApplication].keyWindow addSubview:datePicker];
    return datePicker;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _dateBgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _dateBgView.backgroundColor=[UIColor blackColor];
        _dateBgView.alpha=0.5;
        [self addSubview:_dateBgView];
        //添加手势
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [_dateBgView addGestureRecognizer:tap];
        //添加日期控件
        _datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-DatePickerHeight, SCREEN_WIDTH, DatePickerHeight)];
        //在此修改控件上时间展示格式
        _datePicker.datePickerMode=UIDatePickerModeDate;
        _datePicker.backgroundColor=[UIColor whiteColor];
        [self addSubview:_datePicker];
        //添加工具栏
        _dateToolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, CGRectGetMinY(_datePicker.frame)-ToolBarHeight, SCREEN_WIDTH, ToolBarHeight)];
        [self addSubview:_dateToolBar];
        //取消按钮
        UIBarButtonItem *cancelBt=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtClick)];
        //中间空隙
        UIBarButtonItem *midBt=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        //确定按钮
        UIBarButtonItem *sureBt=[[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sureBtClick:)];
        //添加到toolBar
        _dateToolBar.items=@[cancelBt,midBt,sureBt];
    }
    return self;
}
#pragma mark---单击手势事件
-(void)tap
{
    [_dateBgView removeFromSuperview];
    [_datePicker removeFromSuperview];
    [_dateToolBar removeFromSuperview];
    _dateBgView=nil;
    _datePicker=nil;
    _dateToolBar=nil;
    //移除当前控件
    [self removeFromSuperview];
    _datePicker=nil;
}
#pragma mark---取消按钮点击
-(void)cancelBtClick
{
    [_dateBgView removeFromSuperview];
    [_datePicker removeFromSuperview];
    [_dateToolBar removeFromSuperview];
    _dateBgView=nil;
    _datePicker=nil;
    _dateToolBar=nil;
    //移除当前控件
    [self removeFromSuperview];
    _datePicker=nil;
}
#pragma mark---确定按钮点击
-(void)sureBtClick:(UIButton *)sender
{
    //将选中的日期返回到页面上面
    self.getCurDateBlock([self curDateStr:_datePicker.date]);
    [_dateBgView removeFromSuperview];
    [_datePicker removeFromSuperview];
    [_dateToolBar removeFromSuperview];
    _dateBgView=nil;
    _datePicker=nil;
    _dateToolBar=nil;
    //移除当前控件
    [self removeFromSuperview];
    _datePicker=nil;
}
#pragma mark---获得当前时间年月日
-(NSString *)curDateStr:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:DateFormatter];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

@end
