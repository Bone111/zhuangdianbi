//
//  ZBTabBarController.h
//  zhuangdianbi
//
//  Created by bonelee on 16/3/16.
//  Copyright © 2016年 zhuangbi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBTabBarView.h"
@class UITabBarController;

@protocol ZBTabBarControllerDelegate;


@interface ZBTabBarController : UIViewController<ZBTabBarDelegate>



@property(nonatomic, copy) NSMutableArray *viewControllers;

@property(nonatomic, readonly) UIViewController *selectedViewController;
@property(nonatomic) NSUInteger selectedIndex;



// Apple is readonly
@property (nonatomic, readonly) ZBTabBarView *tabBar;
@property(nonatomic,assign) id<ZBTabBarControllerDelegate> delegate;


// Default is NO, if set to YES, content will under tabbar
@property (nonatomic) BOOL tabBarTransparent;
@property (nonatomic) BOOL tabBarHidden;

- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr andTitleArray:(NSArray *)titleArr;

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;

// Remove the viewcontroller at index of viewControllers.
- (void)removeViewControllerAtIndex:(NSUInteger)index;

// Insert an viewcontroller at index of viewControllers.
- (void)insertViewController:(UIViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;
 

@end


@protocol ZBTabBarControllerDelegate <NSObject>
@optional
- (BOOL)tabBarController:(ZBTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
- (void)tabBarController:(ZBTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end

