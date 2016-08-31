# iOS 事件响应链学习笔记

iOS Event Handling学习笔记，从实例中学习,
参考苹果[官方文档](https://developer.apple.com/library/ios/documentation/EventHandling/Conceptual/EventHandlingiPhoneOS/event_delivery_responder_chain/event_delivery_responder_chain.html)

## 事件的传递

几个自定义View层级关系如下：

![TouchViewLayout.png](http://7xt805.com1.z0.glb.clouddn.com/TouchViewLayout.png)

其中TopView的四个SubView也是按照数字顺序添加的，SubView1到SubView4，

每个自定义View中都再实现下如下两个方法:

```ObjectiveC
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
```

先只返回super的方法，看看事件传递的顺序

点击SubView3，可以看到下边的打印日志：

```shell
2016-08-31 13:39:53.593 Touch[2888:1075234] TopView hitTest
2016-08-31 13:39:53.594 Touch[2888:1075234] point:NSPoint: {220, 193}
2016-08-31 13:39:53.594 Touch[2888:1075234] TopView pointInside
2016-08-31 13:39:53.595 Touch[2888:1075234] point:NSPoint: {220, 193}
2016-08-31 13:39:53.595 Touch[2888:1075234] SubView4 hitTest
2016-08-31 13:39:53.595 Touch[2888:1075234] point:NSPoint: {212, -185}
2016-08-31 13:39:53.595 Touch[2888:1075234] SubView4 pointInside
2016-08-31 13:39:53.595 Touch[2888:1075234] point:NSPoint: {212, -185}
2016-08-31 13:39:53.596 Touch[2888:1075234] SubView3 hitTest
2016-08-31 13:39:53.596 Touch[2888:1075234] point:NSPoint: {65, 96}
2016-08-31 13:39:53.597 Touch[2888:1075234] SubView3 pointInside
2016-08-31 13:39:53.597 Touch[2888:1075234] point:NSPoint: {65, 96}
2016-08-31 13:39:53.597 Touch[2888:1075234] TopView hitTest
2016-08-31 13:39:53.597 Touch[2888:1075234] point:NSPoint: {220, 193}
2016-08-31 13:39:53.597 Touch[2888:1075234] TopView pointInside
2016-08-31 13:39:53.598 Touch[2888:1075234] point:NSPoint: {220, 193}
2016-08-31 13:39:53.598 Touch[2888:1075234] SubView4 hitTest
2016-08-31 13:39:53.598 Touch[2888:1075234] point:NSPoint: {212, -185}
2016-08-31 13:39:53.598 Touch[2888:1075234] SubView4 pointInside
2016-08-31 13:39:53.598 Touch[2888:1075234] point:NSPoint: {212, -185}
2016-08-31 13:39:53.599 Touch[2888:1075234] SubView3 hitTest
2016-08-31 13:39:53.599 Touch[2888:1075234] point:NSPoint: {65, 96}
2016-08-31 13:39:53.600 Touch[2888:1075234] SubView3 pointInside
2016-08-31 13:39:53.600 Touch[2888:1075234] point:NSPoint: {65, 96}
```

再点击SubView1Sub1的子视图SubView1Sub1Sub1，打印如下log：

```shell
2016-08-31 13:39:02.995 Touch[2888:1075234] TopView hitTest
2016-08-31 13:39:02.997 Touch[2888:1075234] point:NSPoint: {84, 71.5}
2016-08-31 13:39:02.997 Touch[2888:1075234] TopView pointInside
2016-08-31 13:39:02.998 Touch[2888:1075234] point:NSPoint: {84, 71.5}
2016-08-31 13:39:02.998 Touch[2888:1075234] SubView4 hitTest
2016-08-31 13:39:02.998 Touch[2888:1075234] point:NSPoint: {76, -306.5}
2016-08-31 13:39:02.998 Touch[2888:1075234] SubView4 pointInside
2016-08-31 13:39:02.998 Touch[2888:1075234] point:NSPoint: {76, -306.5}
2016-08-31 13:39:02.999 Touch[2888:1075234] SubView3 hitTest
2016-08-31 13:39:02.999 Touch[2888:1075234] point:NSPoint: {-71, -25.5}
2016-08-31 13:39:02.999 Touch[2888:1075234] SubView3 pointInside
2016-08-31 13:39:02.999 Touch[2888:1075234] point:NSPoint: {-71, -25.5}
2016-08-31 13:39:02.999 Touch[2888:1075234] SubView2 hitTest
2016-08-31 13:39:02.999 Touch[2888:1075234] point:NSPoint: {76, -149.5}
2016-08-31 13:39:03.000 Touch[2888:1075234] SubView2 pointInside
2016-08-31 13:39:03.000 Touch[2888:1075234] point:NSPoint: {76, -149.5}
2016-08-31 13:39:03.000 Touch[2888:1075234] SubView1 hitTest
2016-08-31 13:39:03.000 Touch[2888:1075234] point:NSPoint: {76, 54.5}
2016-08-31 13:39:03.000 Touch[2888:1075234] SubView1 pointInside
2016-08-31 13:39:03.000 Touch[2888:1075234] point:NSPoint: {76, 54.5}
2016-08-31 13:39:03.001 Touch[2888:1075234] SubView1Sub1 hitTest
2016-08-31 13:39:03.001 Touch[2888:1075234] point:NSPoint: {59, 39.5}
2016-08-31 13:39:03.001 Touch[2888:1075234] SubView1Sub1 pointInside
2016-08-31 13:39:03.001 Touch[2888:1075234] point:NSPoint: {59, 39.5}
2016-08-31 13:39:03.003 Touch[2888:1075234] SubView1Sub1Sub1 hitTest
2016-08-31 13:39:03.004 Touch[2888:1075234] point:NSPoint: {51, 31.5}
2016-08-31 13:39:03.004 Touch[2888:1075234] SubView1Sub1Sub1 pointInside
2016-08-31 13:39:03.004 Touch[2888:1075234] point:NSPoint: {51, 31.5}
2016-08-31 13:39:03.005 Touch[2888:1075234] TopView hitTest
2016-08-31 13:39:03.005 Touch[2888:1075234] point:NSPoint: {84, 71.5}
2016-08-31 13:39:03.006 Touch[2888:1075234] TopView pointInside
2016-08-31 13:39:03.006 Touch[2888:1075234] point:NSPoint: {84, 71.5}
2016-08-31 13:39:03.006 Touch[2888:1075234] SubView4 hitTest
2016-08-31 13:39:03.006 Touch[2888:1075234] point:NSPoint: {76, -306.5}
2016-08-31 13:39:03.006 Touch[2888:1075234] SubView4 pointInside
2016-08-31 13:39:03.007 Touch[2888:1075234] point:NSPoint: {76, -306.5}
2016-08-31 13:39:03.007 Touch[2888:1075234] SubView3 hitTest
2016-08-31 13:39:03.007 Touch[2888:1075234] point:NSPoint: {-71, -25.5}
2016-08-31 13:39:03.007 Touch[2888:1075234] SubView3 pointInside
2016-08-31 13:39:03.007 Touch[2888:1075234] point:NSPoint: {-71, -25.5}
2016-08-31 13:39:03.008 Touch[2888:1075234] SubView2 hitTest
2016-08-31 13:39:03.010 Touch[2888:1075234] point:NSPoint: {76, -149.5}
2016-08-31 13:39:03.011 Touch[2888:1075234] SubView2 pointInside
2016-08-31 13:39:03.011 Touch[2888:1075234] point:NSPoint: {76, -149.5}
2016-08-31 13:39:03.011 Touch[2888:1075234] SubView1 hitTest
2016-08-31 13:39:03.011 Touch[2888:1075234] point:NSPoint: {76, 54.5}
2016-08-31 13:39:03.011 Touch[2888:1075234] SubView1 pointInside
2016-08-31 13:39:03.011 Touch[2888:1075234] point:NSPoint: {76, 54.5}
2016-08-31 13:39:03.012 Touch[2888:1075234] SubView1Sub1 hitTest
2016-08-31 13:39:03.012 Touch[2888:1075234] point:NSPoint: {59, 39.5}
2016-08-31 13:39:03.012 Touch[2888:1075234] SubView1Sub1 pointInside
2016-08-31 13:39:03.012 Touch[2888:1075234] point:NSPoint: {59, 39.5}
2016-08-31 13:39:03.013 Touch[2888:1075234] SubView1Sub1Sub1 hitTest
2016-08-31 13:39:03.015 Touch[2888:1075234] point:NSPoint: {51, 31.5}
2016-08-31 13:39:03.015 Touch[2888:1075234] SubView1Sub1Sub1 pointInside
2016-08-31 13:39:03.016 Touch[2888:1075234] point:NSPoint: {51, 31.5}
```

从上边大概可以看出hitTest的调用顺序，这里只考虑从TopView开始，之前的window的响应和传递先不管，两次点击过程的事件传递

- TopView->SubView4->SubView3
- TopView->SubView4->SubView3->SubView2->SubView1->SubView1Sub1->SubView1Sub1Sub1

由此基本可以得出结论，从TopView开始，先调用hitTest方法，hitTest方法中会再调用pointInside方法，该方法判断点击是否在该View中，如果是，则会遍历子视图，重复这些操作，最终返回的是一个响应该事件的View，否则返回nil。

## hitTest

刚是在自定义View中，hitTest方法仅仅只打印了log并调用了super的处理方法，现在，按照刚给说的思路，不调用super的方法，自行按照系统的处理方式来处理进行验证

```ObjectiveC
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
```

将TopView中的hitTest方法改写成上边这样以后，再次点击各个View，打印出来的日志和原来一样，验证了前边所说的事件传递过程。