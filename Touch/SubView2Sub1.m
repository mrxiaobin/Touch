//
//  SubView2Sub1.m
//  Touch
//
//  Created by zhuxiaobin on 16/8/31.
//  Copyright © 2016年 zhuxiaobin. All rights reserved.
//

#import "SubView2Sub1.h"

@implementation SubView2Sub1

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"SubView2Sub1 hitTest");
    NSLog(@"point:%@", [NSValue valueWithCGPoint:point]);
    
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"SubView2Sub1 pointInside");
    NSLog(@"point:%@", [NSValue valueWithCGPoint:point]);
    
    return [super pointInside:point withEvent:event];
}

@end
