//
//  UIView+Helpers.m
//  Likes
//
//  Created by Andrew Carter on 11/9/11.

#import "UIView+Helpers.h"

#import <QuartzCore/QuartzCore.h>

@implementation UIView (Helpers)

- (void)centerAlignHorizontalForView:(UIView *)view {
    
    self.frame = CGRectIntegral(CGRectMake((CGRectGetWidth(view.frame) / 2.0f) - (CGRectGetWidth(self.frame) / 2.0f), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
    
}

- (void)centerAlignVerticalForView:(UIView *)view {
    
    self.frame = CGRectIntegral(CGRectMake(CGRectGetMinX(self.frame), (CGRectGetHeight(view.frame) / 2.0f) - (CGRectGetHeight(self.frame) / 2.0f), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
    
}

- (void)centerAlignHorizontalForSuperView {
    
    [self centerAlignHorizontalForView:self.superview];
    
}

- (void)centerAlignVerticalForSuperView {
    
    [self centerAlignVerticalForView:self.superview];
    
}

- (void)leftAlignForView:(UIView *)view {
    
    self.frame = CGRectIntegral(CGRectMake(CGRectGetMinX(view.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
    
}

- (void)rightAlignForView:(UIView *)view {
    
    self.frame = CGRectIntegral(CGRectMake(CGRectGetMaxX(view.frame) - CGRectGetWidth(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
    
}

- (void)setFrameOriginY:(CGFloat)y {
    
    self.frame = CGRectIntegral(CGRectMake(CGRectGetMinX(self.frame), y, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
    
}

- (void)setFrameOriginX:(CGFloat)x {
    
    self.frame = CGRectIntegral(CGRectMake(x, CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
    
}

- (void)setFrameOriginYBelowView:(UIView *)view offset:(CGFloat)offset {
    
    CGRect frame = self.frame;
    CGRect viewFrame = view.frame;
    
    self.frame = CGRectIntegral(CGRectMake(CGRectGetMinX(frame), CGRectGetMaxY(viewFrame) + offset, CGRectGetWidth(frame), CGRectGetHeight(frame)));
    
}

- (void)setFrameOriginYAboveView:(UIView *)view offset:(CGFloat)offset {
    
    CGRect frame = self.frame;
    CGRect viewFrame = view.frame;
    
    self.frame = CGRectIntegral(CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(viewFrame) - CGRectGetHeight(self.frame) - offset, CGRectGetWidth(frame), CGRectGetHeight(frame)));
    
}

- (void)setFrameOriginXRightOfView:(UIView *)view offset:(CGFloat)offset {
    
    CGRect frame = self.frame;
    CGRect viewFrame = view.frame;
    
    self.frame = CGRectIntegral(CGRectMake(CGRectGetMaxX(viewFrame) + offset, CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame)));
    
}

- (void)setFrameOriginXLeftOfView:(UIView *)view offset:(CGFloat)offset {
    
    CGRect frame = self.frame;
    CGRect viewFrame = view.frame;
    
    self.frame = CGRectIntegral(CGRectMake(CGRectGetMinX(viewFrame) - CGRectGetWidth(frame) - offset, CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame)));
    
}

- (void)setFrameSizeToImageSize {
    
    if ([self isKindOfClass:[UIButton class]]) {
        
        UIImage *image = [(UIButton *)self imageForState:UIControlStateNormal];
        
        if (!image) {
         
            image = [(UIButton *)self backgroundImageForState:UIControlStateNormal];
            
        }
        
        if (!image) {
        
            return;
            
        }
        
        self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), image.size.width, image.size.height);
        
    } else if ([self isKindOfClass:[UIImageView class]]) {
        
        UIImage *image = [(UIImageView *)self image];
        
        if (!image) {
        
            return;
            
        }
        
        self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), image.size.width, image.size.height);
        
    }
    
}

- (void)centerAlignForView:(UIView *)view {
    
    [self centerAlignHorizontalForView:view];
    [self centerAlignVerticalForView:view];
    
}

- (void)centerAlignForSuperview {
    
    [self centerAlignForView:self.superview];
    
}

- (void)roundCornersTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight {
    
    UIImage *mask = createRoundedCornerMask(self.bounds, topLeft, topRight, bottomLeft, bottomRight);
    CALayer *layerMask = [CALayer layer];
    layerMask.frame = self.bounds;       
    layerMask.contents = (id)mask.CGImage;       
    self.layer.mask = layerMask;
    
}

static inline UIImage* createRoundedCornerMask(CGRect rect, CGFloat radius_tl, CGFloat radius_tr, CGFloat radius_bl, CGFloat radius_br) {  
    
    CGContextRef context;
    CGColorSpaceRef colorSpace;
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    context = CGBitmapContextCreate( NULL, rect.size.width, rect.size.height, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast );
    
    CGColorSpaceRelease(colorSpace);    
    
    if ( context == NULL ) {
        return NULL;
    }
        
    CGFloat minx = CGRectGetMinX( rect ), midx = CGRectGetMidX( rect ), maxx = CGRectGetMaxX( rect );
    CGFloat miny = CGRectGetMinY( rect ), midy = CGRectGetMidY( rect ), maxy = CGRectGetMaxY( rect );
    
    CGContextBeginPath( context );
    CGContextSetGrayFillColor( context, 1.0, 0.0 );
    CGContextAddRect( context, rect );
    CGContextClosePath( context );
    CGContextDrawPath( context, kCGPathFill );
    
    CGContextSetGrayFillColor( context, 1.0, 1.0 );
    CGContextBeginPath( context );
    CGContextMoveToPoint( context, minx, midy );
    CGContextAddArcToPoint( context, minx, miny, midx, miny, radius_bl );
    CGContextAddArcToPoint( context, maxx, miny, maxx, midy, radius_br );
    CGContextAddArcToPoint( context, maxx, maxy, midx, maxy, radius_tr );
    CGContextAddArcToPoint( context, minx, maxy, minx, midy, radius_tl );
    CGContextClosePath( context );
    CGContextDrawPath( context, kCGPathFill );
    
    CGImageRef bitmapContext = CGBitmapContextCreateImage( context );
    CGContextRelease( context );
    
    UIImage *mask = [UIImage imageWithCGImage:bitmapContext];

    CGImageRelease(bitmapContext);
    
    return mask;
    
}  

@end
