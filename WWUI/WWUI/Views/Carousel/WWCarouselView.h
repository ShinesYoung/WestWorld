//
//  WWCarourselView.h
//  WWUI
//
//  Created by Shines Young on 2018/9/11.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WWCarouselProtocol.h"


typedef NS_OPTIONS(NSUInteger, WWCarouselScrollPosition) {
    WWCarouselScrollPositionLeft    = 0,
    WWCarouselScrollPositionRight   = 1 << 0,
};





#pragma mark - Class Definition - WWCarouselView
@interface WWCarouselView : UIView

@property (nonatomic, weak) id<WWCarouselDataSource> carouselDataSource;
@property (nonatomic, weak) id<WWCarouselDelegate> carouselDelegate;

@property (nonatomic, strong) UICollectionView *theCollView;
@property (nonatomic, strong) UIPageControl    *thePageCtrl;

@end



#pragma mark - Category Definition - Customized_View_Reload
@interface WWCarouselView (Customized_View_Reload)

- (void)reloadData;

@end



#pragma mark - Category Definition - Customized_View_Reload
@interface WWCarouselView (Customized_View_AutoScroll)

- (void)scrollToNextBanner:(WWCarouselScrollPosition)direction;

- (void)startAutoScroll;
- (void)stopAutoScroll;

@end



#pragma mark - Category Definition - System_UICollectionView_DataSource
@interface WWCarouselView (System_UICollectionView_DataSource)
<UICollectionViewDataSource>
@end



#pragma mark - Category Definition - System_UICollectionView_DelegateFlowLayout
@interface WWCarouselView (System_UICollectionView_DelegateFlowLayout)
<UICollectionViewDelegateFlowLayout>
@end



#pragma mark - Category Definition - System_UICollectionView_Delegate
@interface WWCarouselView (System_UICollectionView_Delegate)
<UICollectionViewDelegate>
@end



#pragma mark - Category Definition - System_UIScrollView_Delegate
@interface WWCarouselView (System_UIScrollView_Delegate)
<UIScrollViewDelegate>
@end


