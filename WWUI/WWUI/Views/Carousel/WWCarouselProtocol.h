//
//  WWCarouselProtocol.h
//  WWUI
//
//  Created by Shines Young on 2018/9/11.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class WWCarouselView;

#pragma mark - Protocol - WWCarouselView DataSource

@protocol WWCarouselDataSource <NSObject>

@required

- (NSUInteger)numberOfCellInCarouselView:(WWCarouselView *)carouselView;

- (CGFloat)   widthOfCellInCarouselView:(WWCarouselView *)carouselView;
- (CGFloat)  heightOfCellInCarouselView:(WWCarouselView *)carouselView;
- (CGFloat)intervalOfCellInCarouselView:(WWCarouselView *)carouselView;

- (UIView *)carouselView:(WWCarouselView *)carouselView cellAtIndex:(NSInteger)index;

@optional

- (CGFloat)   topPaddingInCarouselView:(WWCarouselView *)carouselView;
- (CGFloat)bottomPaddingInCarouselView:(WWCarouselView *)carouselView;
- (CGFloat)  leftPaddingInCarouselView:(WWCarouselView *)carouselView;
- (CGFloat) rightPaddingInCarouselView:(WWCarouselView *)carouselView;

// 自动滚动时间间隔，默认为0，
// 时间间隔 <=0 不自动滚动
- (NSTimeInterval)intervalOfAutoScroll:(WWCarouselView *)carouselView;

@end



#pragma mark - Protocol - WWCarousel Delegate

@protocol WWCarouselDelegate <NSObject>

@optional
- (void)  carouselView:(WWCarouselView *)carouselView
didSelectedCellAtIndex:(NSInteger)index;

- (void)carouselView:(WWCarouselView *)carouselView
   didCellScrollFrom:(NSUInteger)from to:(NSUInteger)to;

@end




