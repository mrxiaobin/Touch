//
//  TopView.m
//  Touch
//
//  Created by zhuxiaobin on 16/8/31.
//  Copyright © 2016年 zhuxiaobin. All rights reserved.
//

#import "TopView.h"

@implementation TopView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"TopView hitTest");
    NSLog(@"point:%@", [NSValue valueWithCGPoint:point]);

    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"TopView pointInside");
    NSLog(@"point:%@", [NSValue valueWithCGPoint:point]);
    
    return [super pointInside:point withEvent:event];
}

@end
