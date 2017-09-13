//
//  SZKDatePicker.h
//  95306
//
//  Created by sunzhaokai on 2017/9/13.
//  Copyright © 2017年 孙赵凯. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GetCurDateBlock)(NSString *curDateStr);

@interface SZKDatePicker : UIView

//控件展示
+(instancetype)datePickerShow:(GetCurDateBlock)getCurDateBlock;

@end
