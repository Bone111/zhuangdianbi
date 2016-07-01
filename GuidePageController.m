//
//  GuidePageController.m
//  zhuangdianbi
//
//  Created by bonelee on 16/3/7.
//  Copyright © 2016年 zhuangbi. All rights reserved.
//

#import "GuidePageController.h"


#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;


static NSString *const tableIdentifier = @"tableIdentifier";

@interface GuidePageController ()
{
    NSArray *_titles;
    UIScrollView *_guidPageScroll;
    UIPageControl *_guidPageControl;
}
@end

@implementation GuidePageController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}
- (void)showGuidView
{
    self.view.backgroundColor = [UIColor yellowColor];
    [UIView animateWithDuration:2.0 animations:^{
        self.view.backgroundColor = [UIColor orangeColor];
    } completion:^(BOOL finished) {
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
// self.automaticallyAdjustsScrollViewInsets = NO;

    
    [self showGuidView];
    
    
//    WS(weakSelf);
//   
//    _guidPageScroll = UIScrollView.new ;
//    [self.view addSubview:_guidPageScroll];
//    [_guidPageScroll mas_makeConstraints:^(MASConstraintMaker *make) {
// 
//        make.width.equalTo(weakSelf.view);
//        make.height.equalTo(weakSelf.view);
//        
//    }];
// 
//    _guidPageScroll.pagingEnabled = YES;
//    _guidPageScroll.bounces = NO;
//    _guidPageScroll.delegate = self;
//    _guidPageScroll.showsHorizontalScrollIndicator = NO;
//    _guidPageScroll.showsVerticalScrollIndicator = NO;
//    _guidPageScroll.contentSize = CGSizeMake(self.view.width * 3, self.view.height);
//
// 
//    _guidPageScroll.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * 0, 0);
//    
//    
//    _guidPageControl = UIPageControl.new;
//    [self.view addSubview:_guidPageControl];
//
//    
//    _guidPageControl.numberOfPages = 3;
//    _guidPageControl.currentPage = 0;
//    _guidPageControl.backgroundColor = [UIColor clearColor];
//    _guidPageControl.currentPageIndicatorTintColor = [UIColor blackColor];
//    _guidPageControl.pageIndicatorTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"kongxinyuandian"]];
//    [_guidPageControl mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@(self.view.height-66));
//        make.centerX.equalTo(self.view);
//        
//    }];
//    
//    
//    [self guidPageView:3];

}


- (void)guidPageView:(NSInteger)pageIndex {
    WS(weakSelf);
    
     NSArray *cocolors = @[[UIColor redColor],[UIColor blueColor],[UIColor yellowColor]];
    NSArray *titles = @[@"122",@"233333",@"3333"];
    
    for (int i = 0; i<pageIndex; i++) {

        UIView *pageView = UIView.new;
        
        [_guidPageScroll addSubview:pageView];
        
        pageView.backgroundColor = cocolors[i];
        
        
        UILabel *text = UILabel.new;
        text.text = titles[i];
        text.font = [UIFont systemFontOfSize:88];
        text.textColor = [UIColor orangeColor];
        [pageView addSubview:text];
        text.textAlignment = NSTextAlignmentCenter;
        
        [pageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(weakSelf.view.width*i));
         
            make.width.mas_equalTo(weakSelf.view);
            make.height.mas_equalTo(weakSelf.view);
 
  
        }];
        
        [text mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(pageView);
        }];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint point=scrollView.contentOffset;
    _guidPageControl.currentPage = point.x/([UIScreen mainScreen].bounds.size.width);
    
}

@end
