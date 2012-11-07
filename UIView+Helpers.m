//
//  UIView+Helpers.m
//
//  Created by Andrew Carter on 11/9/11.

#import "UIView+Helpers.h"

#import <QuartzCore/QuartzCore.h>

#define CGRectRound( rect ) CGRectMake((int)rect.origin.x, (int)rect.origin.y, (int)rect.size.width, (int)rect.size.height)

@implementation UIView (Helpers)

#pragma mark -
#pragma mark Init

- (id)initWithSize:(CGSize)size
{
    if ((self = [self init]))
    {
        [self setFrameSize:size];
    }
    
    return self;
}

+ (CGRect) alignRect:(CGRect)startingRect toRect:(CGRect)referenceRect withAlignment:(UIViewAlignment)alignment insets:(UIEdgeInsets)insets andReferenceIsSuperView:(BOOL)isReferenceSuperView
{
    CGRect newRect = startingRect;
    
    // X alignments
    if (alignment & UIViewAlignmentLeft)
    {
        newRect.origin.x += CGRectGetMinX(referenceRect) - (CGRectGetWidth(startingRect) + insets.right);
    }
    else if (alignment & UIViewAlignmentRight)
    {
        newRect.origin.x = CGRectGetMaxX(referenceRect) + insets.left;
    }
    else if (alignment & UIViewAlignmentLeftEdge)
    {
        if (isReferenceSuperView)
        {
            newRect.origin.x = insets.left;
        }
        else
        {
            newRect.origin.x = referenceRect.origin.x + insets.left;
        }
    }
    else if (alignment & UIViewAlignmentRightEdge)
    {
        if (isReferenceSuperView)
        {
            newRect.origin.x = CGRectGetWidth(referenceRect) - (CGRectGetWidth(startingRect) + insets.right);
        }
        else
        {
            newRect.origin.x = CGRectGetMaxX(referenceRect) - (CGRectGetWidth(startingRect) + insets.right);
        }
    }
    else if (alignment & UIViewAlignmentHorizontalCenter)
    {
        if (isReferenceSuperView)
        {
            newRect.origin.x = (((CGRectGetWidth(referenceRect) - CGRectGetWidth(startingRect))) / 2.0f);
        }
        else
        {
            newRect.origin.x = CGRectGetMinX(referenceRect) +
            (((CGRectGetWidth(referenceRect) - CGRectGetWidth(startingRect))) / 2.0f);
        }
    }
    
    // Y alignments
    if (alignment & UIViewAlignmentTop)
    {
        newRect.origin.y = CGRectGetMinY(referenceRect) - (CGRectGetHeight(startingRect) + insets.bottom);
    }
    else if (alignment & UIViewAlignmentBottom)
    {
        newRect.origin.y = CGRectGetMaxY(referenceRect) + insets.top;
    }
    else if (alignment & UIViewAlignmentBottomEdge)
    {
        if (isReferenceSuperView)
        {
            newRect.origin.y = CGRectGetHeight(referenceRect) - (CGRectGetHeight(startingRect) + insets.bottom);
        }
        else
        {
            newRect.origin.y = CGRectGetMaxY(referenceRect) - (CGRectGetHeight(startingRect) + insets.bottom);
        }
    }
    else if (alignment & UIViewAlignmentTopEdge)
    {
        if (isReferenceSuperView)
        {
            newRect.origin.y = insets.top;
        }
        else
        {
            newRect.origin.y = CGRectGetMinY(referenceRect) + insets.top;
        }
    }
    else if (alignment & UIViewAlignmentVerticalCenter)
    {
        if (isReferenceSuperView)
        {
            newRect.origin.y = ((CGRectGetHeight(referenceRect) - CGRectGetHeight(startingRect)) / 2.0f) + insets.top - insets.bottom;
        }
        else
        {

            newRect.origin.y = CGRectGetMinY(referenceRect) +
            ((CGRectGetHeight(referenceRect) - CGRectGetHeight(startingRect)) / 2.0f) + insets.top - insets.bottom;
        }
    }
    
    return CGRectIntegral(newRect);

}

- (void)alignRelativeToView:(UIView*)alignView withAlignment:(UIViewAlignment)alignment andInsets:(UIEdgeInsets)insets
{
    self.frame = [UIView alignRect:self.frame toRect:alignView.frame withAlignment:alignment insets:insets andReferenceIsSuperView:NO];
}

- (void)alignRelativeToSuperView:(UIView*)alignView withAlignment:(UIViewAlignment)alignment andInsets:(UIEdgeInsets)insets
{
    self.frame = [UIView alignRect:self.frame toRect:alignView.frame withAlignment:alignment insets:insets andReferenceIsSuperView:YES];
}


#pragma mark -
#pragma mark Alignment

- (void)centerAlignHorizontalForView:(UIView *)view
{
    [self centerAlignHorizontalForView:view offset:0];
}

- (void)centerAlignVerticalForView:(UIView *)view
{
    [self centerAlignVerticalForView:view offset:0];
}

- (void)centerAlignHorizontalForSuperView
{
    [self centerAlignHorizontalForView:self.superview];
}

- (void)centerAlignVerticalForSuperView
{
    [self centerAlignVerticalForView:self.superview];
}

- (void)centerAlignHorizontalForSuperView:(CGFloat)offset
{
    [self centerAlignHorizontalForView:self.superview offset:offset];
}

- (void)centerAlignVerticalForSuperView:(CGFloat)offset
{
    [self centerAlignVerticalForView:self.superview offset:offset];
}

- (void)centerAlignHorizontalForView:(UIView *)view offset:(CGFloat)offset
{
    self.frame = CGRectRound(CGRectMake((CGRectGetWidth(view.frame) / 2.0f) - (CGRectGetWidth(self.frame) / 2.0f) + offset, CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
}

- (void)centerAlignVerticalForView:(UIView *)view offset:(CGFloat)offset
{
    self.frame = CGRectRound(CGRectMake(CGRectGetMinX(self.frame), (CGRectGetHeight(view.frame) / 2.0f) - (CGRectGetHeight(self.frame) / 2.0f) + offset, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
}

- (void)leftAlignForView:(UIView *)view
{
    [self leftAlignForView:view offset:0];
}

- (void)rightAlignForView:(UIView *)view
{
    [self rightAlignForSuperViewOffset:0];
}

- (void)topAlignForView:(UIView *)view
{
    [self topAlignForView:view offset:0];
}

- (void)bottomAlignForView:(UIView *)view
{
    [self bottomAlignForView:view offset:0];
}

- (void)leftAlignForView:(UIView *)view offset:(CGFloat)offset
{
    self.frame = CGRectRound(CGRectMake(CGRectGetMinX(view.frame) + offset, CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
}

- (void)rightAlignForView:(UIView *)view offset:(CGFloat)offset
{
    self.frame = CGRectRound(CGRectMake(CGRectGetMaxX(view.frame) - CGRectGetWidth(self.frame) - offset, CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
}

- (void)topAlignForView:(UIView *)view offset:(CGFloat)offset
{
    self.frame = CGRectRound(CGRectMake(CGRectGetMinX(self.frame), view.frame.origin.y + offset, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
}

- (void)bottomAlignForView:(UIView *)view offset:(CGFloat)offset
{
    self.frame = CGRectRound(CGRectMake(CGRectGetMinX(self.frame), CGRectGetMaxY(view.frame) - CGRectGetHeight(self.frame) - offset, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
}

- (void)topAlignForSuperViewOffset:(CGFloat)offset
{
    self.frameOriginY = offset;
}

- (void)bottomAlignForSuperViewOffset:(CGFloat)offset
{
    self.frameOriginY = self.superview.frameSizeHeight - self.frameSizeHeight - offset;
}

- (void)leftAlignForSuperViewOffset:(CGFloat)offset
{
    self.frameOriginX = offset;
}

- (void)rightAlignForSuperViewOffset:(CGFloat)offset
{
    self.frameOriginX = self.superview.frameSizeWidth - self.frameSizeWidth - offset;
}

- (void)topAlignForSuperView {
    
    [self topAlignForSuperViewOffset:0];
}

- (void)bottomAlignForSuperView {
    
    [self bottomAlignForSuperViewOffset:0];
}

- (void)leftAlignForSuperView {
    
    [self leftAlignForSuperViewOffset:0];
}

- (void)rightAlignForSuperView {
    
    [self rightAlignForSuperViewOffset:0];
}


- (void)centerAlignForView:(UIView *)view {
    
    [self centerAlignHorizontalForView:view];
    [self centerAlignVerticalForView:view];
    
}

- (void)centerAlignForSuperview
{
    [self centerAlignForView:self.superview];
}

#pragma mark -
#pragma mark Convenience Getters

- (CGPoint)frameOrigin
{
    return self.frame.origin;
}

- (CGSize)frameSize
{
    return self.frame.size;
}

- (CGFloat)frameOriginX
{
    return self.frame.origin.x;
}

- (CGFloat)frameOriginY
{
    return self.frame.origin.y;
}

- (CGFloat)frameSizeWidth
{
    return self.frame.size.width;
}

- (CGFloat)frameSizeHeight
{
    return self.frame.size.height;    
}

#pragma mark -
#pragma mark Frame Adjustments

- (void)setFrameOrigin:(CGPoint)origin
{
    [self setFrameOriginY:origin.y];
    [self setFrameOriginX:origin.x];
}

- (void)setFrameSize:(CGSize)size
{
    self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), size.width, size.height);
}

- (void)setFrameOriginY:(CGFloat)y
{
    self.frame = CGRectRound(CGRectMake(CGRectGetMinX(self.frame), y, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)));
}

- (void)setFrameOriginX:(CGFloat)x
{
    self.frame = CGRectRound(CGRectMake((int)x, (int)CGRectGetMinY(self.frame), (int)CGRectGetWidth(self.frame), (int)CGRectGetHeight(self.frame)));
}

- (void)setFrameSizeWidth:(CGFloat)width
{
    self.frame = CGRectRound(CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), width, CGRectGetHeight(self.frame)));
}

- (void)setFrameSizeHeight:(CGFloat)height
{
    self.frame = CGRectRound(CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), height));
}

#pragma mark -
#pragma mark Positioning Relative to View

- (void)setFrameOriginYBelowView:(UIView *)view {
    
    [self setFrameOriginYBelowView:view offset:0];
}

- (void)setFrameOriginYAboveView:(UIView *)view {
    
    [self setFrameOriginYAboveView:view offset:0];
}

- (void)setFrameOriginXRightOfView:(UIView *)view {
    
    [self setFrameOriginXRightOfView:view offset:0];
}

- (void)setFrameOriginXLeftOfView:(UIView *)view {
    
    [self setFrameOriginXLeftOfView:view offset:0];
}

- (void)setFrameOriginYBelowView:(UIView *)view offset:(CGFloat)offset
{
    CGRect frame = self.frame;
    CGRect viewFrame = view.frame;
    
    self.frame = CGRectRound(CGRectMake(CGRectGetMinX(frame), CGRectGetMaxY(viewFrame) + offset, CGRectGetWidth(frame), CGRectGetHeight(frame)));
}

- (void)setFrameOriginYAboveView:(UIView *)view offset:(CGFloat)offset
{
    CGRect frame = self.frame;
    CGRect viewFrame = view.frame;
    
    self.frame = CGRectRound(CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(viewFrame) - CGRectGetHeight(self.frame) - offset, CGRectGetWidth(frame), CGRectGetHeight(frame)));
}

- (void)setFrameOriginXRightOfView:(UIView *)view offset:(CGFloat)offset
{
    CGRect frame = self.frame;
    CGRect viewFrame = view.frame;
    
    self.frame = CGRectRound(CGRectMake(CGRectGetMaxX(viewFrame) + offset, CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame)));
}

- (void)setFrameOriginXLeftOfView:(UIView *)view offset:(CGFloat)offset
{
    CGRect frame = self.frame;
    CGRect viewFrame = view.frame;
    
    self.frame = CGRectRound(CGRectMake(CGRectGetMinX(viewFrame) - CGRectGetWidth(frame) - offset, CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame)));
}

#pragma mark -
#pragma mark Resizing

- (void)setFrameSizeToImageSize
{
    if ([self isKindOfClass:[UIButton class]])
    {
        UIImage *image = [(UIButton *)self imageForState:UIControlStateNormal];
        
        if (!image) {
            
            image = [(UIButton *)self backgroundImageForState:UIControlStateNormal];
            
        }
        
        if (!image) {
            
            return;
            
        }
        
        self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), image.size.width, image.size.height);
        
    }
    else if ([self isKindOfClass:[UIImageView class]])
    {
        
        UIImage *image = [(UIImageView *)self image];
        
        if (!image)
            return;
        
        self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), image.size.width, image.size.height);
    }
    
}

- (void)roundCornersTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight
{
    UIImage *mask = createRoundedCornerMask(self.bounds, topLeft, topRight, bottomLeft, bottomRight);
    CALayer *layerMask = [CALayer layer];
    layerMask.frame = self.bounds;       
    layerMask.contents = (id)mask.CGImage;       
    self.layer.mask = layerMask;
}

static inline UIImage* createRoundedCornerMask(CGRect rect, CGFloat radius_tl, CGFloat radius_tr, CGFloat radius_bl, CGFloat radius_br)
{
    CGContextRef context;
    CGColorSpaceRef colorSpace;
    
    colorSpace = CGColorSpaceCreateDeviceRGB();
    
    context = CGBitmapContextCreate( NULL, rect.size.width, rect.size.height, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast );
    
    CGColorSpaceRelease(colorSpace);    
    
    if ( context == NULL )
        return NULL;
    
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

- (UIImageView*)createSnapshot
{
    UIGraphicsBeginImageContextWithOptions([self bounds].size, YES, 0);
    
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), -[self bounds].origin.x, -[self bounds].origin.y);
    
    [[self layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *snapshot = [[UIImageView alloc] initWithImage:image];
    [snapshot setFrame:self.frame];
    
    return snapshot;
}

- (void)showDebugFrame
{
    self.layer.borderColor = [[UIColor redColor] CGColor];
    self.layer.borderWidth = 1.0f;
}

@end
