//
//  UIControl+Button.m
//  creatButton
//
//  Created by 祁付民 on 16/9/26.
//  Copyright © 2016年 祁付民. All rights reserved.
//

#import "UIControl+Button.h"

@implementation UIControl (Button)

// 静态变量
static char overview = 'a';


/**
 button的点击方法的回调

 @param actionBlock 点击方法的block
 @param controlEvents 点击事件
 */
- (void)addMethodBlock:(ActionBlock)actionBlock WithEvents:(UIControlEvents)controlEvents{
    ///id object, const void *key, id value, objc_AssociationPolicy policy
    objc_setAssociatedObject(self, &overview, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(myAction) forControlEvents:controlEvents];
    
}


/**
 运行时处理block回调
 */
- (void)myAction{
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overview);
    if (block) {
        block(self);
    }
}



/**
 快速创建button

 @param frame button的frame
 @param backgroundColor button的背景颜色
 @param title button的title
 @param font title的字号
 @param actionBlock button点击事件的回调方法
 @return 返回
 */
- (UIButton *)creatButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleFont:(UIFont *)font actionBlock:(ActionBlock)actionBlock
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundColor:backgroundColor];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button addMethodBlock:actionBlock WithEvents:UIControlEventTouchUpInside];
    return button;
}


@end
