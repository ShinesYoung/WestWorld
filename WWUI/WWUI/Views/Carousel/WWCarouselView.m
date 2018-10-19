//
//  WWCarouselView.m
//  WWUI
//
//  Created by Shines Young on 2018/9/11.
//  Copyright © 2018年 net.shines. All rights reserved.
//

#import "WWCarouselView.h"


#define WWCarouselViewCellReuseId @"WWCarouselViewCellReuseId"



#pragma mark - Category Implementation - Private
@interface WWCarouselView ()

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, assign) CGFloat   lastScrollOffset;

@property (nonatomic, strong) NSTimer *autoScrollTimer;

@end



#pragma mark - Class Implementation - WWCarouselView

@implementation WWCarouselView

/******************************************************************************/
/**** Default Lifecycle                                                    ****/
/******************************************************************************/
#pragma mark - System - Default Lifecycle

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInitOfCarouselView:CGRectZero];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInitOfCarouselView:frame];
    }
    return self;
}

- (void)commonInitOfCarouselView:(CGRect)frame
{
    // 初始化 collectionView
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGRect collVFrm = CGRectMake(0, 0,
                                 self.frame.size.width,
                                 self.frame.size.height);
    self.theCollView = [[UICollectionView alloc] initWithFrame:collVFrm
                                          collectionViewLayout:layout];
    
    // 分页效果
    self.theCollView.pagingEnabled = NO;
    self.theCollView.showsHorizontalScrollIndicator = NO;
    self.theCollView.showsVerticalScrollIndicator = NO;
    
    // 注册CollectionViewCell类型
    [self.theCollView registerClass:[UICollectionViewCell class]
         forCellWithReuseIdentifier:WWCarouselViewCellReuseId];
    
    // 设置 CollectionView background color
    self.theCollView.backgroundColor = [UIColor whiteColor];
    
    self.theCollView.dataSource = self;
    self.theCollView.delegate = self;
    
    [self addSubview:self.theCollView];
    
    // 初始化 PageControl
    self.thePageCtrl = [[UIPageControl alloc] initWithFrame:(CGRectZero)];
    self.thePageCtrl.hidden = YES;
    [self addSubview:self.thePageCtrl];
    
    [self setupConstraints];
}

- (void)setupConstraints
{
    [self.theCollView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *top =
    [NSLayoutConstraint constraintWithItem:self.theCollView
                                 attribute:(NSLayoutAttributeTop)
                                 relatedBy:(NSLayoutRelationEqual)
                                    toItem:self
                                 attribute:(NSLayoutAttributeTop)
                                multiplier:1.0
                                  constant:0];
    
    NSLayoutConstraint *bottom =
    [NSLayoutConstraint constraintWithItem:self.theCollView
                                 attribute:(NSLayoutAttributeBottom)
                                 relatedBy:(NSLayoutRelationEqual)
                                    toItem:self
                                 attribute:(NSLayoutAttributeBottom)
                                multiplier:1.0
                                  constant:0];
    
    NSLayoutConstraint *left =
    [NSLayoutConstraint constraintWithItem:self.theCollView
                                 attribute:(NSLayoutAttributeLeft)
                                 relatedBy:(NSLayoutRelationEqual)
                                    toItem:self
                                 attribute:(NSLayoutAttributeLeft)
                                multiplier:1.0
                                  constant:0];
    
    NSLayoutConstraint *right =
    [NSLayoutConstraint constraintWithItem:self.theCollView
                                 attribute:(NSLayoutAttributeRight)
                                 relatedBy:(NSLayoutRelationEqual)
                                    toItem:self
                                 attribute:(NSLayoutAttributeRight)
                                multiplier:1.0
                                  constant:0];
    
    [self addConstraints:@[top, bottom, left, right]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self reloadData];
}

- (void)dealloc
{
    self.carouselDataSource = nil;
    self.carouselDelegate = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end




#pragma mark - Category Implementation - Customized_View_Reload
@implementation WWCarouselView (Customized_View_Reload)

- (void)reloadData
{
    [self stopAutoScroll];
    
    [self.theCollView reloadData];
    
    [self pageControlReloadData:self.thePageCtrl];
    
    [self startAutoScroll];
}


- (void)pageControlReloadData:(UIPageControl *)pageControl
{
    // 判断cell元素个数，没有元素个数，则隐藏pageControl
    NSInteger numberOfCell = 0;
    SEL countSel = @selector(numberOfCellInCarouselView:);
    if ([self.carouselDataSource respondsToSelector:countSel])
    {
        numberOfCell = [self.carouselDataSource numberOfCellInCarouselView:self];
    }

    if (numberOfCell <= 0 || numberOfCell == 1)
    {
        self.thePageCtrl.numberOfPages = 0;
        self.thePageCtrl.currentPage = 0;
        self.thePageCtrl.hidden = YES;
        return;
    }


    if (self.thePageCtrl.hidden == YES)
    {
        self.thePageCtrl.numberOfPages = 0;
        self.thePageCtrl.currentPage = 0;
        self.thePageCtrl.hidden = YES;
        return;
    }


    //numberOfCell > 2 && isPageControlHidden == NO, 设置pageControl内容
    self.thePageCtrl.numberOfPages = numberOfCell;
    self.thePageCtrl.currentPage = 0;

    CGFloat pageControlWidth = 7.0 + (numberOfCell-1) * 16.0 ;
    CGFloat pageControlHeight = 7.0;
    CGRect pageCtrlFrm = CGRectMake((self.frame.size.width -pageControlWidth)/2.0,
                                    self.frame.size.height -7 -pageControlHeight,
                                    pageControlWidth, pageControlHeight);
    self.thePageCtrl.frame = pageCtrlFrm;
    self.thePageCtrl.hidden = NO;
}


@end



#pragma mark - Category Implementation - Customized_View_AutoScroll
@implementation WWCarouselView (Customized_View_AutoScroll)

- (void)scrollToNextBanner:(WWCarouselScrollPosition)direction
{
    // cell 数量小于等于1个时，不滚动
    NSInteger numberOfCell = 0;
    SEL countSel = @selector(numberOfCellInCarouselView:);
    if ([self.carouselDataSource respondsToSelector:countSel])
    {
        numberOfCell = [self.carouselDataSource numberOfCellInCarouselView:self];
    }
    if (numberOfCell <= 1) {
        return;
    }
    
    // 计算当前的IndexPath
    CGFloat currentOffset = self.theCollView.contentOffset.x;
    
    CGFloat cellWidth = [self.carouselDataSource widthOfCellInCarouselView:self];
    CGFloat cellInterval = [self.carouselDataSource intervalOfCellInCarouselView:self];
    
    CGFloat pageWidth = cellWidth + cellInterval;
    NSUInteger currentIndex = currentOffset / pageWidth;
    
    BOOL needAnimated = YES;
    NSUInteger targetIndex = currentIndex;
    if (direction == WWCarouselScrollPositionLeft && currentIndex == 0)
    {
        needAnimated = NO;
        targetIndex = numberOfCell;
    }
    else if (direction == WWCarouselScrollPositionRight &&
             currentIndex == numberOfCell + 1)
    {
        needAnimated = NO;
        targetIndex = 1;
    }
    else if (direction == WWCarouselScrollPositionLeft)
    {
        needAnimated = YES;
        targetIndex = currentIndex -1;
    }
    else if (direction == WWCarouselScrollPositionRight)
    {
        needAnimated = YES;
        targetIndex = currentIndex + 1;
    }
    
    // 执行滚动
    NSIndexPath *targetIndexPath = [NSIndexPath indexPathForRow:targetIndex
                                                      inSection:0];
    [self.theCollView scrollToItemAtIndexPath:targetIndexPath
                             atScrollPosition:(UICollectionViewScrollPositionCenteredHorizontally)
                                     animated:needAnimated];
    if (needAnimated == NO) {
        return;
    }
    
    // 动画结束后，发送通知
    dispatch_time_t delayInSeconds = dispatch_time(DISPATCH_TIME_NOW,
                                                   (int64_t)(0.5 * NSEC_PER_SEC));
    dispatch_after( delayInSeconds, dispatch_get_main_queue(), ^{
        SEL scrollToSel = @selector(carouselView:didCellScrollFrom:to:);
        if ([self.carouselDelegate respondsToSelector:scrollToSel])
        {
            NSInteger toIndex = self.currentIndex;
            NSInteger fromIndex = self.currentIndex - 1;
            if (fromIndex < 0) {
                fromIndex = numberOfCell - 1;
            }
            [self.carouselDelegate carouselView:self
                          didCellScrollFrom:fromIndex
                                         to:toIndex];
        }
        [self startAutoScroll];
    });
    
}

- (void)scrollToPrevious
{
    [self scrollToNextBanner:(WWCarouselScrollPositionLeft)];
}

- (void)scrollToNext
{
    [self scrollToNextBanner:(WWCarouselScrollPositionRight)];
}

- (void)startAutoScroll
{
    [self.autoScrollTimer invalidate];
    self.autoScrollTimer = nil;
    
    NSInteger numberOfCell = 0;
    SEL countSel = @selector(numberOfCellInCarouselView:);
    if ([self.carouselDataSource respondsToSelector:countSel])
    {
        numberOfCell = [self.carouselDataSource numberOfCellInCarouselView:self];
    }
    if (numberOfCell <= 1) {
        return;
    }
    
    
    NSTimeInterval autoScrollInterval = 0.0f;
    if ([self.carouselDataSource respondsToSelector:@selector(intervalOfAutoScroll:)])
    {
        autoScrollInterval = [self.carouselDataSource intervalOfAutoScroll:self];
    }
    if (autoScrollInterval <= 0) {
        return;
    }
    
    self.autoScrollTimer
    = [NSTimer scheduledTimerWithTimeInterval:autoScrollInterval
                                       target:self
                                     selector:@selector(scrollToNext)
                                     userInfo:nil
                                      repeats:NO];
}

- (void)stopAutoScroll
{
    [self.autoScrollTimer invalidate];
    self.autoScrollTimer = nil;
}

@end




#pragma mark - Category Implementation - System_UICollectionView_DataSource
@implementation WWCarouselView (System_UICollectionView_DataSource)

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    NSInteger numberOfCell = 0;
    if ([self.carouselDataSource
         respondsToSelector:@selector(numberOfCellInCarouselView:)])
    {
        numberOfCell = [self.carouselDataSource numberOfCellInCarouselView:self];
    }
    
    // 如果cell个数大于2个，就要为了循环滚动，前后添加2个cell，所以总数+2
    if (numberOfCell > 1) {
        numberOfCell += 2;
    }
    
    return numberOfCell;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseId = WWCarouselViewCellReuseId;
    
    
    UICollectionViewCell *aCell
    = [collectionView dequeueReusableCellWithReuseIdentifier:reuseId
                                                forIndexPath:indexPath];
    // clear aCell content
    NSArray *subviewsCopy = [aCell.contentView.subviews copy];
    for (UIView *aSubView in subviewsCopy) {
        [aSubView removeFromSuperview];
    }
    subviewsCopy = nil;
    
    // 取逻辑cell个数
    NSInteger numberOfCell = 0;
    if ([self.carouselDataSource
         respondsToSelector:@selector(numberOfCellInCarouselView:)])
    {
        numberOfCell = [self.carouselDataSource numberOfCellInCarouselView:self];
    }
    
    // 当逻辑cell个数小于等于1个的时候
    if (numberOfCell <= 1)
    {
        UIView *aBannerCell
        = [self.carouselDataSource carouselView:self cellAtIndex:indexPath.row];
        aBannerCell.frame = aCell.bounds;
        
        [aCell.contentView addSubview:aBannerCell];
        return aCell;
    }
    
    // 当逻辑cell个数大于1个的时候，需要处理循环
    NSUInteger logicIndex = 0;
    // leftCacheCell 取逻辑上最后一个banner图片
    if (indexPath.row == 0)
    {
        logicIndex = numberOfCell -1;
    }
    // rightCacheCell 取逻辑上第一个banner图片
    else if (indexPath.row == numberOfCell +1)
    {
        logicIndex = 0;
    }
    // 排除第一个和最后一个cacheCell的其他cell
    else
    {
        logicIndex = indexPath.row -1;
    }
    
    UIView *aBannerCell
    = [self.carouselDataSource carouselView:self cellAtIndex:logicIndex];
    aBannerCell.frame = aCell.bounds;
    
    [aCell.contentView addSubview:aBannerCell];
    
    return aCell;
}

@end



#pragma mark - Category Implementation - System_UICollectionView_DelegateFlowLayout
@implementation WWCarouselView (System_UICollectionView_DelegateFlowLayout)

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(nonnull UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat cellWidth  = [self.carouselDataSource widthOfCellInCarouselView:self];
    CGFloat cellHeight = [self.carouselDataSource heightOfCellInCarouselView:self];
    return CGSizeMake(cellWidth, cellHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    CGFloat cellWidth = [self.carouselDataSource widthOfCellInCarouselView:self];
    CGFloat left  = (collectionView.frame.size.width - cellWidth)/2.0;
    CGFloat right = (collectionView.frame.size.width - cellWidth)/2.0;
    
    SEL leftPaddingSel = @selector(leftPaddingInCarouselView:);
    if ([self.carouselDataSource respondsToSelector:leftPaddingSel])
    {
        left = [self.carouselDataSource leftPaddingInCarouselView:self];
    }
    
    SEL rightPaddingSel = @selector(rightPaddingInCarouselView:);
    if ([self.carouselDataSource respondsToSelector:rightPaddingSel])
    {
        right = [self.carouselDataSource rightPaddingInCarouselView:self];
    }
    
    CGFloat top = 0;
    SEL topPaddingSel = @selector(topPaddingInCarouselView:);
    if ([self.carouselDataSource respondsToSelector:topPaddingSel])
    {
        top = [self.carouselDataSource topPaddingInCarouselView:self];
    }

    CGFloat bottom = 0;
    SEL bottomPaddingSel = @selector(bottomPaddingInCarouselView:);
    if ([self.carouselDataSource respondsToSelector:bottomPaddingSel])
    {
        bottom = [self.carouselDataSource bottomPaddingInCarouselView:self];
    }

    UIEdgeInsets inset = UIEdgeInsetsMake(top, left, bottom, right);
    return inset;
}


/**
 * 请注意：由于是横向滚动，所以行间距就变成cell在水平方向的间距了
 * 在这里设置cell间水平间距
 */
- (CGFloat)          collectionView:(UICollectionView *)collectionView
                             layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    CGFloat intervalOfCell = 0;
    if ([self.carouselDataSource
         respondsToSelector:@selector(intervalOfCellInCarouselView:)])
    {
        intervalOfCell = [self.carouselDataSource intervalOfCellInCarouselView:self];
    }
    return intervalOfCell;
}

/**
 * 请注意：由于是横向滚动，所以cell间距就变成cell在垂直方向的间距了
 * 在这里设置cell间垂直间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat intervalOfCell = 0;
    return intervalOfCell;
}


@end




#pragma mark - Category Implementation - System_UICollectionView_Delegate
@implementation WWCarouselView (System_UICollectionView_Delegate)

- (void)  collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSUInteger numberOfCell = 0;
    if ([self.carouselDataSource
         respondsToSelector:@selector(numberOfCellInCarouselView:)])
    {
        numberOfCell = [self.carouselDataSource numberOfCellInCarouselView:self];
    }
    
    if (numberOfCell <= 1)
    {
        if ([self.carouselDelegate
             respondsToSelector:@selector(carouselView:didSelectedCellAtIndex:)])
        {
            [self.carouselDelegate carouselView:self
                     didSelectedCellAtIndex:indexPath.row];
        }
        return;
    }
    
    // 当逻辑cell个数大于1个的时候，需要处理循环
    // leftCacheCell 取逻辑上最后一个banner图片
    NSUInteger logicIndex = 0;
    if (indexPath.row == 0)
    {
        logicIndex = numberOfCell -1;
    }
    // rightCacheCell 取逻辑上第一个banner图片
    else if (indexPath.row == numberOfCell +1)
    {
        logicIndex = 0;
    }
    // 排除第一个和最后一个cacheCell的其他cell
    else
    {
        logicIndex = indexPath.row -1;
    }
    [self.carouselDelegate carouselView:self didSelectedCellAtIndex:logicIndex];
    
}


@end



#pragma mark - Category Implementation - System_UIScrollView_Delegate
@implementation WWCarouselView (System_UIScrollView_Delegate)

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSUInteger numberOfCell = [self.carouselDataSource numberOfCellInCarouselView:self];
    // 没有cell 或者只有一个cell的情况下
    if (numberOfCell <= 1) {
        return;
    }
    
    CGFloat cellWidth  = [self.carouselDataSource widthOfCellInCarouselView:self];
    CGFloat cellInterval = [self.carouselDataSource intervalOfCellInCarouselView:self];
    CGFloat pageWidth = cellWidth + cellInterval;
    
    CGPoint offset = scrollView.contentOffset;
    // 计算当前页面偏移
    NSInteger pageIndex = (NSInteger)offset.x / (NSInteger)pageWidth;
    
    if (pageIndex == 0)
    {
        // cellList[0]为左缓冲cell，偏移改动为cellList[count-2];
        self.currentIndex = numberOfCell - 1;
        if (offset.x <= 0) {
            scrollView.contentOffset = CGPointMake(pageWidth * numberOfCell, 0);
        }
    }
    else if (pageIndex == numberOfCell +1)
    {
        // cellList[count-1]是右缓冲cell，偏移改动为cellList[1]，不能为cellList[0]
        self.currentIndex = 0;
        if (offset.x >= pageWidth * (numberOfCell+1) ) {
            scrollView.contentOffset = CGPointMake(pageWidth, 0);
        }
    }
    else {
        self.currentIndex = pageIndex - 1;
    }
    
    if (self.thePageCtrl) {
        self.thePageCtrl.currentPage = self.currentIndex;
    }
}

//系统动画停止是刷新当前偏移量_offer是我定义的全局变量
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    self.lastScrollOffset = scrollView.contentOffset.x;
//    NSLog(@"end========%f",self.lastScrollOffset);
    
}

//滑动减速是触发的代理，当用户用力滑动或者清扫时触发
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if (fabs(scrollView.contentOffset.x - self.lastScrollOffset) <= 10)
    {
        return;
    }
    
    int i = scrollView.contentOffset.x/(scrollView.bounds.size.width)+1;
    NSIndexPath *indexPath = nil;
    if (scrollView.contentOffset.x > self.lastScrollOffset)
    {
        indexPath = [NSIndexPath indexPathForRow:i inSection:0];
    }
    else
    {
        indexPath = [NSIndexPath indexPathForRow:i-1 inSection:0];
    }
    [self.theCollView scrollToItemAtIndexPath:indexPath
                             atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                     animated:YES];
}


//用户拖拽是调用

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (fabs(scrollView.contentOffset.x - self.lastScrollOffset) < 20)
    {
        return;
    }
    
    int i = scrollView.contentOffset.x/(scrollView.bounds.size.width)+1;
    NSIndexPath *indexPath = nil;
    if (scrollView.contentOffset.x > self.lastScrollOffset)
    {
        indexPath = [NSIndexPath indexPathForRow:i inSection:0];
    }
    else
    {
        indexPath = [NSIndexPath indexPathForRow:i-1 inSection:0];
    }
    [self.theCollView scrollToItemAtIndexPath:indexPath
     atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                                     animated:YES];
}


@end





