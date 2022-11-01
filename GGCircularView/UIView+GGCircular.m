//
//  UIView+GGCircular.m
//  GGCircularView
//
//  Created by GRX on 2022/11/1.
//

#import "UIView+GGCircular.h"
#import <objc/runtime.h>

static NSString * const GGCornerPositionKey = @"GGCornerPositionKey";
static NSString * const GGCornerRadiusKey = @"GGCornerRadiusKey";
@implementation UIView (GGCircular)
@dynamic ggcornerPosition;

- (GGCornerPosition)ggcornerPosition
{
    return [objc_getAssociatedObject(self, &GGCornerPositionKey) integerValue];
}

- (void)setGgcornerPosition:(GGCornerPosition)ggcornerPosition
{
    objc_setAssociatedObject(self, &GGCornerPositionKey, @(ggcornerPosition), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@dynamic ggcornerRadius;
- (CGFloat)ggcornerRadius
{
    return [objc_getAssociatedObject(self, &GGCornerRadiusKey) floatValue];
}

- (void)setGgcornerRadius:(CGFloat)ggcornerRadius
{
    objc_setAssociatedObject(self, &GGCornerRadiusKey, @(ggcornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load
{
    SEL ori = @selector(layoutSublayersOfLayer:);
    SEL new = NSSelectorFromString([@"gg_" stringByAppendingString:NSStringFromSelector(ori)]);
    gg_swizzle(self, ori, new);
}

void gg_swizzle(Class c, SEL orig, SEL new)
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    
    method_exchangeImplementations(origMethod, newMethod);
}

- (void)gg_layoutSublayersOfLayer:(CALayer *)layer
{
    [self gg_layoutSublayersOfLayer:layer];
    
    if (self.ggcornerRadius > 0) {
        
        UIBezierPath *maskPath;
        switch (self.ggcornerPosition) {
            case GGCornerPositionTop:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                       cornerRadii:CGSizeMake(self.ggcornerRadius, self.ggcornerRadius)];
                break;
            case GGCornerPositionLeft:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
                                                       cornerRadii:CGSizeMake(self.ggcornerRadius, self.ggcornerRadius)];
                break;
            case GGCornerPositionBottom:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(self.ggcornerRadius, self.ggcornerRadius)];
                break;
            case GGCornerPositionRight:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(self.ggcornerRadius, self.ggcornerRadius)];
                break;
            case GGCornerPositionAll:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:UIRectCornerAllCorners
                                                       cornerRadii:CGSizeMake(self.ggcornerRadius, self.ggcornerRadius)];
                break;
        }
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
}

- (void)ggSetCornerOnTopWithRadius:(CGFloat)radius
{
    self.ggcornerPosition = GGCornerPositionTop;
    self.ggcornerRadius = radius;
}

- (void)ggSetCornerOnLeftWithRadius:(CGFloat)radius
{
    self.ggcornerPosition = GGCornerPositionLeft;
    self.ggcornerRadius = radius;
}

- (void)ggSetCornerOnBottomWithRadius:(CGFloat)radius
{
    self.ggcornerPosition = GGCornerPositionBottom;
    self.ggcornerRadius = radius;
}

- (void)ggSetCornerOnRightWithRadius:(CGFloat)radius
{
    self.ggcornerPosition = GGCornerPositionRight;
    self.ggcornerRadius = radius;
}

- (void)ggSetAllCornerWithCornerRadius:(CGFloat)radius
{
    self.ggcornerPosition = GGCornerPositionAll;
    self.ggcornerRadius = radius;
}

- (void)ggSetNoneCorner
{
    self.layer.mask = nil;
}
@end
