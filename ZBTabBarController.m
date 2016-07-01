//
//  ZBTabBarController.m
//  zhuangdianbi
//
//  Created by bonelee on 16/3/16.
//  Copyright © 2016年 zhuangbi. All rights reserved.
//

#import "ZBTabBarController.h"
#import "ZBTabBarView.h"

static ZBTabBarController *zbTabBarController;

@interface ZBTabBarController ()

@end

 

@implementation ZBTabBarController
{
    ZBTabBarView *_tabBar;
    UIView      *_containerView;
    UIView		*_transitionView;

    NSMutableArray *_viewControllers;
    NSUInteger _selectedIndex;
    
    BOOL _tabBarTransparent;
    BOOL _tabBarHidden;
}
#pragma mark lifecycle
- (id)initWithViewControllers:(NSArray *)viewControllers imageArray:(NSArray *)images andTitleArray:(NSArray *)titles;
{
    self = [super init];
    if (self != nil)
    {
        
        
        _viewControllers = [NSMutableArray arrayWithArray:viewControllers];
        
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
        _transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - ZBTabBarHeight)];
        _transitionView.backgroundColor =  [UIColor blackColor];
        
        _tabBar = [[ZBTabBarView alloc] initWithFrame:CGRectMake(0, _containerView.height - ZBTabBarHeight, 320.0f, ZBTabBarHeight) buttonImages:images andButtonTitles:titles];
        _tabBar.delegate = self;
        
        zbTabBarController = self;
    }
    return self;
}
- (void)loadView
{
    [super loadView];
    
    [_containerView addSubview:_transitionView];
    [_containerView addSubview:_tabBar];
    self.view = _containerView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.selectedIndex = 0;
}
- (void)setTabBarTransparent:(BOOL)yesOrNo
{
    if (yesOrNo == YES)
    {
        _transitionView.frame = _containerView.bounds;
    }
    else
    {
        _transitionView.frame = CGRectMake(0, 0, 320.0f, _containerView.height - ZBTabBarHeight);
    }
    
}
- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
{
    if (yesOrNO == YES)
    {
        if (_tabBar.frame.origin.y == self.view.frame.size.height)
        {
            return;
        }
    }
    else
    {
        if (_tabBar.frame.origin.y == self.view.frame.size.height - ZBTabBarHeight)
        {
            return;
        }
    }
    
    if (animated == YES)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        if (yesOrNO == YES)
        {
            _tabBar.frame = CGRectMake(_tabBar.frame.origin.x, _tabBar.frame.origin.y + ZBTabBarHeight, _tabBar.frame.size.width, _tabBar.frame.size.height);
        }
        else
        {
            _tabBar.frame = CGRectMake(_tabBar.frame.origin.x, _tabBar.frame.origin.y - ZBTabBarHeight, _tabBar.frame.size.width, _tabBar.frame.size.height);
        }
        [UIView commitAnimations];
    }
    else
    {
        if (yesOrNO == YES)
        {
            _tabBar.frame = CGRectMake(_tabBar.frame.origin.x, _tabBar.frame.origin.y + ZBTabBarHeight, _tabBar.frame.size.width, _tabBar.frame.size.height);
        }
        else
        {
            _tabBar.frame = CGRectMake(_tabBar.frame.origin.x, _tabBar.frame.origin.y - ZBTabBarHeight, _tabBar.frame.size.width, _tabBar.frame.size.height);
        }
    }
}

- (NSUInteger)selectedIndex
{
    return _selectedIndex;
}
- (UIViewController *)selectedViewController
{
    return [_viewControllers objectAtIndex:_selectedIndex];
}

-(void)setSelectedIndex:(NSUInteger)index
{
    [self displayViewAtIndex:index];
    [_tabBar selectTabAtIndex:index];
}

- (void)removeViewControllerAtIndex:(NSUInteger)index
{
    if (index >= [_viewControllers count])
    {
        return;
    }
    // Remove view from superview.
    [[(UIViewController *)[_viewControllers objectAtIndex:index] view] removeFromSuperview];
    // Remove viewcontroller in array.
    [_viewControllers removeObjectAtIndex:index];
    // Remove tab from tabbar.
    [_tabBar removeTabAtIndex:index];
}

- (void)insertViewController:(UIViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    [_viewControllers insertObject:vc atIndex:index];
    [_tabBar insertTabWithImageDic:dict atIndex:index];
}
#pragma mark - Private methods
- (void)displayViewAtIndex:(NSUInteger)index
{
    // Before changing index, ask the delegate should change the index.
    if ([_delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)])
    {
        if (![_delegate tabBarController:self shouldSelectViewController:[self.viewControllers objectAtIndex:index]])
        {
            return;
        }
    }
    
    UIViewController *targetViewController = [self.viewControllers objectAtIndex:index];
    
    // If target index is equal to current index.
    if (_selectedIndex == index && [[_transitionView subviews] count] != 0)
    {
        if ([targetViewController isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController*)targetViewController popToRootViewControllerAnimated:YES];
        }
        return;
    }
    //    NSLog(@"Display View.");
    _selectedIndex = index;
    
    [_transitionView.subviews makeObjectsPerformSelector:@selector(setHidden:) withObject:nil];
    
    targetViewController.view.hidden = NO;
    targetViewController.view.frame = _transitionView.frame;
    if ([targetViewController.view isDescendantOfView:_transitionView])
    {
        [_transitionView bringSubviewToFront:targetViewController.view];
    }
    else
    {
        [_transitionView addSubview:targetViewController.view];
    }
    
    // Notify the delegate, the viewcontroller has been changed.
    if ([_delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)])
    {
        [_delegate tabBarController:self didSelectViewController:targetViewController];
    }
}

#pragma mark tabBar delegates
- (void)tabBar:(ZBTabBarView *)tabBar didSelectIndex:(NSInteger)index
{
    [self displayViewAtIndex:index];
}

@end
