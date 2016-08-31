//
//  SubView2.m
//  Touch
//
//  Created by zhuxiaobin on 16/8/31.
//  Copyright © 2016年 zhuxiaobin. All rights reserved.
//

#import "SubView2.h"

@implementation SubView2

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"SubView2 hitTest");
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
    NSLog(@"SubView2 pointInside");
    NSLog(@"point:%@", [NSValue valueWithCGPoint:point]);
    
    //当点击在SubView2上边50点以内时，当做是点击在SubView2上
    if (point.y < 0 && point.y > -50) {
        return YES;
    }
    
    return [super pointInside:point withEvent:event];
}

@end
