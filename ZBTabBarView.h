//
//  ZBTabBarView.h
//  zhuangdianbi
//
//  Created by bonelee on 16/3/16.
//  Copyright © 2016年 zhuangbi. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ZBTabBarDelegate;


@interface ZBTabBarView : UIView


@property (nonatomic, retain) UIImageView *selectedView;
@property (nonatomic, retain) UIImageView *backgroundView;
@property (nonatomic, assign) id<ZBTabBarDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *buttons;
@property (nonatomic, retain) NSArray       *images;


- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray andButtonTitles:(NSArray *)titleArray;
- (void)selectTabAtIndex:(NSInteger)index;
- (void)removeTabAtIndex:(NSInteger)index;
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;
- (void)setBackgroundImage:(UIImage *)img;
- (void)setSelectedImage:(UIImage *)img;
@end

@protocol ZBTabBarDelegate<NSObject>

@optional

- (void)tabBar:(ZBTabBarView *)tabBar didSelectIndex:(NSInteger)index;

@end


