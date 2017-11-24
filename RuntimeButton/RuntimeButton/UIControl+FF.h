//
//  UIControl+FF.h
//  RuntimeButton
//
//  Created by fans on 16/5/28.
//

#import <UIKit/UIKit.h>

@interface UIControl (FF)
//category 动态添加属性
@property (nonatomic, assign) NSTimeInterval fjl_acceptEventInterval;
@property (nonatomic, assign) BOOL fjl_ignoreEvent; //是否忽略事件

@end
