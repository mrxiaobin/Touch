//
//  SubView3.m
//  Touch
//
//  Created by zhuxiaobin on 16/8/31.
//  Copyright © 2016年 zhuxiaobin. All rights reserved.
//

#import "SubView3.h"

@implementation SubView3

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"SubView3 hitTest");
    NSLog(@"point:%@", [NSValue valueWithCGPoint:point]);
    
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"SubView3 pointInside");
    NSLog(@"point:%@", [NSValue valueWithCGPoint:point]);
    
    return [super pointInside:point withEvent:event];
}

@end
