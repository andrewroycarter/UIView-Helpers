//
//  UIView+Helpers.h
//
//  Created by Andrew Carter on 11/9/11.

#import <UIKit/UIKit.h>

@interface UIView (Helpers)

// Init
- (id)initWithSize:(CGSize)size;

//Alignment
- (void)centerAlignHorizontalForView:(UIView *)view;
- (void)centerAlignVerticalForView:(UIView *)view;
- (void)centerAlignForView:(UIView *)view;

- (void)leftAlignForView:(UIView *)view;
- (void)rightAlignForView:(UIView *)view;
- (void)topAlignForView:(UIView *)view;
- (void)bottomAlignForView:(UIView *)view;

- (void)leftAlignForView:(UIView *)view offset:(CGFloat)offset;
- (void)rightAlignForView:(UIView *)view offset:(CGFloat)offset;
- (void)topAlignForView:(UIView *)view offset:(CGFloat)offset;
- (void)bottomAlignForView:(UIView *)view offset:(CGFloat)offset;

- (void)centerAlignForSuperview;
- (void)centerAlignHorizontalForSuperView;
- (void)centerAlignVerticalForSuperView;

- (void)topAlignForSuperView;
- (void)bottomAlignForSuperView;
- (void)leftAlignForSuperView;
- (void)rightAlignForSuperView;

- (void)topAlignForSuperViewOffset:(CGFloat)offset;
- (void)bottomAlignForSuperViewOffset:(CGFloat)offset;
- (void)leftAlignForSuperViewOffset:(CGFloat)offset;
- (void)rightAlignForSuperViewOffset:(CGFloat)offset;

//Convenience Getters
- (CGFloat)frameOriginX;
- (CGFloat)frameOriginY;
- (CGFloat)frameSizeWidth;
- (CGFloat)frameSizeHeight;
- (CGSize)frameSize;
- (CGPoint)frameOrigin;

//Frame Adjustments
- (void)setFrameSize:(CGSize)size;
- (void)setFrameOrigin:(CGPoint)origin;
- (void)setFrameOriginY:(CGFloat)y;
- (void)setFrameOriginX:(CGFloat)x;
- (void)setFrameSizeWidth:(CGFloat)width;
- (void)setFrameSizeHeight:(CGFloat)height;

//Positioning Relative to View
- (void)setFrameOriginYBelowView:(UIView *)view;
- (void)setFrameOriginYAboveView:(UIView *)view;
- (void)setFrameOriginXRightOfView:(UIView *)view;
- (void)setFrameOriginXLeftOfView:(UIView *)view;

- (void)setFrameOriginYBelowView:(UIView *)view offset:(CGFloat)offset;
- (void)setFrameOriginYAboveView:(UIView *)view offset:(CGFloat)offset;
- (void)setFrameOriginXRightOfView:(UIView *)view offset:(CGFloat)offset;
- (void)setFrameOriginXLeftOfView:(UIView *)view offset:(CGFloat)offset;

//Resizing
- (void)setFrameSizeToImageSize;

//Making rounded corners
- (void)roundCornersTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight;
static inline UIImage* createRoundedCornerMask(CGRect rect, CGFloat radius_tl, CGFloat radius_tr, CGFloat radius_bl, CGFloat radius_br);

@end
