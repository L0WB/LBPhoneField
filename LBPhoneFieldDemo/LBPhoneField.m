//
//  LBPhoneField.m
//  LBPhoneFieldDemo
//
//  Created by Anastatica on 2017/9/4.
//  Copyright © 2017年 L0WB. All rights reserved.
//

#import "LBPhoneField.h"

@interface LBPhoneField() <UITextFieldDelegate>

@end

@implementation LBPhoneField

- (void)awakeFromNib {
    [super awakeFromNib];
    self.delegate = self;
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}
/**
 *  文本框监听，实现输入限制
 */
- (void)textFieldDidChange:(UITextField *)field {
    if (self.intervalMode != IntervalModeNone) {
        if (field.text.length > 13) {
            field.text = [field.text substringToIndex:13];
        }
    } else {
        if (field.text.length > 11) {
            field.text = [field.text substringToIndex:11];
        }
    }
}

// 文字格式修改
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ((range.location == 3 || range.location == 8) && range.length == 0) {     // 第3个数字 和第8个数字后面添加 分割符
        if (self.intervalMode == IntervalModeLineSegment) {
            self.text = [self.text stringByAppendingString:@"-"];
        } else if(self.intervalMode == IntervalModeSpace) {
            self.text = [self.text stringByAppendingString:@" "];
        } else if(self.intervalMode == IntervalModeNone) {
        } else {
            if(self.intervalCharacter == 0) {
                self.intervalMode = IntervalModeNone;
            } else {
                self.text = [self.text stringByAppendingString:[NSString stringWithFormat:@"%c", self.intervalCharacter]];
            }
        }
    }
    return YES;
}

/**
 *  返回去掉间隔后的文本
 */
- (NSString *)currentText {
    if (self.intervalMode == IntervalModeSpace) {
        return [self string:self.text trimWithCharacter:' '];
    } else if (self.intervalMode == IntervalModeLineSegment) {
        return [self string:self.text trimWithCharacter:'-'];
    } else if (self.intervalMode == IntervalModeNone) {
        return self.text;
    } else {
        if (self.intervalCharacter == 0) {
            return self.text;
        } else {
            return [self string:self.text trimWithCharacter:self.intervalCharacter];
        }
    }
}

/**
 *  trim方法
 */
- (NSString *)string:(NSString *)string trimWithCharacter:(char)ch {
    NSMutableString *strM = [NSMutableString string];
    for (int i = 0 ; i < string.length ; i++) {
        char char1 = [string characterAtIndex:i];
        if (char1 != ch) {
            [strM appendString:[NSString stringWithFormat:@"%c", char1]];
        }
    }
    return strM;
}

@end
