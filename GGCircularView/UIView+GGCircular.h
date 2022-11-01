//
//  UIView+GGCircular.h
//  GGCircularView
//
//  Created by GRX on 2022/11/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, GGCornerPosition) {
    GGCornerPositionTop,
    GGCornerPositionLeft,
    GGCornerPositionBottom,
    GGCornerPositionRight,
    GGCornerPositionAll
};
@interface UIView (GGCircular)
@property (nonatomic, assign) GGCornerPosition ggcornerPosition;
@property (nonatomic, assign) CGFloat ggcornerRadius;
- (void)ggSetCornerOnTopWithRadius:(CGFloat)radius;
- (void)ggSetCornerOnLeftWithRadius:(CGFloat)radius;
- (void)ggSetCornerOnBottomWithRadius:(CGFloat)radius;
- (void)ggSetCornerOnRightWithRadius:(CGFloat)radius;
- (void)ggSetAllCornerWithCornerRadius:(CGFloat)radius;
- (void)ggSetNoneCorner;
@end

NS_ASSUME_NONNULL_END
