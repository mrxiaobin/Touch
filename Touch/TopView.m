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
    
    if ([self pointInside:point withEvent:event]) {
        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertPoint = [subview convertPoint:point fromView:self];
            UIView *hitTestView = [subview hitTest:convertPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        
        return self;
    }

    return nil;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"TopView pointInside");
    NSLog(@"point:%@", [NSValue valueWithCGPoint:point]);
    
    return [super pointInside:point withEvent:event];
}

@end
