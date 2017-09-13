# SZKDatePicker
将UIDatePicker简单封装成SZKDatePicker，实现了一句代码调用控件并获取当前选中的时间。

详细介绍，简书博客：http://www.jianshu.com/p/f515298e278b

一句代码调用：

    //调用SZKDatePicker
    [SZKDatePicker datePickerShow:^(NSString *curDateStr) {
        NSLog(@"选中的日期为:%@",curDateStr);
    }];
    
实现方法：
SZKDatePicker.h

#import <UIKit/UIKit.h>

typedef void(^GetCurDateBlock)(NSString *curDateStr);

@interface SZKDatePicker : UIView

//控件展示
+(instancetype)datePickerShow:(GetCurDateBlock)getCurDateBlock;

@end

详细介绍，简书博客：http://www.jianshu.com/p/f515298e278b

