//
//  LBPhoneField.h
//  LBPhoneFieldDemo
//
//  Created by Anastatica on 2017/9/4.
//  Copyright © 2017年 L0WB. All rights reserved.
//


#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, PhoneFieldIntervalMode) {
    IntervalModeLineSegment = 0,  // 短线间隔,默认模式
    IntervalModeSpace,            // 空格间隔
    IntervalModeNone,             // 无间隔符
    IntervalModeCustomer          // 自定义间隔符,如果设置为此选项 且并没有设置 intervalCharacter, 等同于IntervalModeNone
};


@interface LBPhoneField : UITextField

@property (nonatomic, assign) PhoneFieldIntervalMode intervalMode;

/**
 *  分割字符，仅在IntervalModeCustomer 时有效
 */
@property (nonatomic, assign) char intervalCharacter;

/**
 *  返回 trim后的文本
 */
@property (nonatomic, copy, readonly) NSString *currentText;

@end
