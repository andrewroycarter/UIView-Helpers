//
//  UIView+Helpers.h
//  Likes
//
//  Created by Andrew Carter on 11/9/11.

#import <UIKit/UIKit.h>

@interface UIView (Helpers)

//Alignment
- (void)centerAlignHorizontalForView:(UIView *)view;
- (void)centerAlignVerticalForView:(UIView *)view;
- (void)centerAlignHorizontalForSuperView;
- (void)centerAlignVerticalForSuperView;
- (void)leftAlignForView:(UIView *)view;
- (void)rightAlignForView:(UIView *)view;
- (void)centerAlignForView:(UIView *)view;
- (void)centerAlignForSuperview;

//Frame Adjustments
- (void)setFrameOriginY:(CGFloat)y;
- (void)setFrameOriginX:(CGFloat)x;
- (void)setFrameOriginYBelowView:(UIView *)view offset:(CGFloat)offset;
- (void)setFrameOriginYAboveView:(UIView *)view offset:(CGFloat)offset;
- (void)setFrameOriginXRightOfView:(UIView *)view offset:(CGFloat)offset;
- (void)setFrameOriginXLeftOfView:(UIView *)view offset:(CGFloat)offset;

- (void)setFrameSizeToImageSize;

//Making rounded corners
- (void)roundCornersTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight;
static inline UIImage* createRoundedCornerMask(CGRect rect, CGFloat radius_tl, CGFloat radius_tr, CGFloat radius_bl, CGFloat radius_br);

@end
