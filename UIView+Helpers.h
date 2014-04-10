//
//  UIView+Helpers.h
//
//  Created by Andrew Carter on 11/9/11.

#import <UIKit/UIKit.h>

@interface UIView (Helpers)

typedef NS_ENUM(NSUInteger, UIViewAlignment)
{
    UIViewAlignmentLeft = 1 << 0,
    UIViewAlignmentRight = 1 << 1,
    UIViewAlignmentTop = 1 << 2,
    UIViewAlignmentBottom = 1 << 3,
    
    UIViewAlignmentLeftEdge = 1 << 5,
    UIViewAlignmentRightEdge = 1 << 6,
    UIViewAlignmentTopEdge = 1 << 7,
    UIViewAlignmentBottomEdge = 1 << 8,
    
    UIViewAlignmentHorizontalCenter = 1 << 9,
    UIViewAlignmentVerticalCenter = 1 << 10,
};

typedef NS_ENUM(NSInteger, VerticalLayoutType) {
    VerticalLayoutTypeTop,
    VerticalLayoutTypeCenter,
    VerticalLayoutTypeBottom
};

+ (CGRect)alignRect:(CGRect)startingRect
             toRect:(CGRect)referenceRect
      withAlignment:(UIViewAlignment)alignment
             insets:(UIEdgeInsets)insets
andReferenceIsSuperView:(BOOL)isReferenceSuperView;

// Init
- (id)initWithSize:(CGSize)size;

//Alignment
- (void)alignRelativeToView:(UIView*)alignView 
              withAlignment:(UIViewAlignment)alignment 
                  andInsets:(UIEdgeInsets)insets;

- (void)alignRelativeToSuperView:(UIView*)alignView 
                   withAlignment:(UIViewAlignment)alignment 
                       andInsets:(UIEdgeInsets)insets;

- (void)centerAlignHorizontalForView:(UIView *)view;
- (void)centerAlignVerticalForView:(UIView *)view;

- (void)centerAlignHorizontalForView:(UIView *)view offset:(CGFloat)offset;
- (void)centerAlignVerticalForView:(UIView *)view offset:(CGFloat)offset;
- (void)centerAlignForView:(UIView *)view;

- (void)centerAlignForSuperview;
- (void)centerAlignHorizontalForSuperView;
- (void)centerAlignVerticalForSuperView;

- (void)leftAlignForView:(UIView *)view;
- (void)rightAlignForView:(UIView *)view;
- (void)topAlignForView:(UIView *)view;
- (void)bottomAlignForView:(UIView *)view;

- (void)leftAlignForView:(UIView *)view offset:(CGFloat)offset;
- (void)rightAlignForView:(UIView *)view offset:(CGFloat)offset;
- (void)topAlignForView:(UIView *)view offset:(CGFloat)offset;
- (void)bottomAlignForView:(UIView *)view offset:(CGFloat)offset;

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

//Fade Edges
- (void)setHorizontalFadeMaskWithLeftOffset:(CGFloat)leftOffset rightOffset:(CGFloat)rightOffset;
- (void)setVerticalFadeMaskWithTopOffset:(CGFloat)topOffset bottomOffset:(CGFloat)bottomOffset;

/* Debug
 *
 * The functions below are only performed in DEBUG mode
 * @param "showInRelease" will apply the function in both DEBUG and RELEASE mode
 */
- (void)showDebugFrame;
- (void)hideDebugFrame;
- (void)showDebugFrame:(BOOL)showInRelease;

- (void)logFrameChanges;

// Layout Helpers
+ (CGFloat)alignVertical:(VerticalLayoutType)type
                   views:(NSArray*)views
             withSpacing:(CGFloat)spacing
                  inView:(UIView*)view
      shrinkSpacingToFit:(BOOL)shrinkSpacingToFit;

+ (CGFloat)alignVertical:(VerticalLayoutType)type
                   views:(NSArray*)views
        withSpacingArray:(NSArray*)spacing
                  inView:(UIView*)view
      shrinkSpacingToFit:(BOOL)shrinkSpacingToFit;

// subviews
+ (UIView *)firstResponder;
- (UIView *)firstResponderInSubviews;
- (NSArray *)subviewsOfClass:(Class)aClass recursive:(BOOL)recursive;

@end
