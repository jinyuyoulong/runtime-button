//
//  UIControl+FF.m
//  RuntimeButton
//
//  Created by fans on 16/5/28.
//  Copyright © 2016年 ielpm. All rights reserved.
//

#import "UIControl+FF.h"
#import <objc/runtime.h>

@implementation UIControl (FF)
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";//绑定事件的标识
static const char *UIControl_ignoreEvent = "UIControl_ignoreEvent";//绑定事件的标识

//设置新加属性的set get方法
- (NSTimeInterval)fjl_acceptEventInterval{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}
- (void)setFjl_acceptEventInterval:(NSTimeInterval)fjl_acceptEventInterval{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(fjl_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)fjl_ignoreEvent{
    return [objc_getAssociatedObject(self, UIControl_ignoreEvent) boolValue];
}

- (void)setFjl_ignoreEvent:(BOOL)fjl_ignoreEvent{
    objc_setAssociatedObject(self, UIControl_ignoreEvent, @(fjl_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(_fjl_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);//替换方法
}
//解决按钮连续点击问题
- (void)_fjl_sendAction:(SEL)selector to:(id)target forEvent:(UIEvent*)event{
    if (self.fjl_ignoreEvent) return;
    
    if (self.fjl_acceptEventInterval > 0) {
        self.fjl_ignoreEvent = YES;
        NSLog(@"%f",self.fjl_acceptEventInterval);
        //延时调用
        [self performSelector:@selector(setFjl_ignoreEvent:)
                   withObject:@(NO)
                   afterDelay:self.fjl_acceptEventInterval];
    }
    
    [self _fjl_sendAction:selector to:target forEvent:event];
}

@end
