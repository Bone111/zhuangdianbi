
//
//  ZBTabBarView.m
//  zhuangdianbi
//
//  Created by bonelee on 16/3/16.
//  Copyright © 2016年 zhuangbi. All rights reserved.
//

#import "ZBTabBarView.h"

@implementation ZBTabBarView
{
    UIImageView *_backgroundView;
    UIImageView *_selectedView;
    
    NSMutableArray *_buttons;
    NSArray *_images;
    
    NSArray *_titles;
}
- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray andButtonTitles:(NSArray *)titleArray
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.backgroundColor = [UIColor clearColor];
        _backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_backgroundView];
        
        CGRect rect = CGRectMake(0, 4, ZBScreenSize.width*1.0/[imageArray count], frame.size.height - 4);
        _selectedView = [[UIImageView alloc]initWithFrame:rect];
        [self addSubview:_selectedView];
        
        UIView *sepView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ZBScreenSize.width, 0.5)];
        sepView.backgroundColor = [UIColor colorWithHexString:@"#d4d6df"];
        [self addSubview:sepView];
        
        
        self.buttons = [NSMutableArray arrayWithCapacity:[imageArray count]];
        
        UIButton *btn;
        CGFloat width = ZBScreenSize.width*1.0 / [imageArray count];
        for (int i = 0; i < [imageArray count]; i++)
        {
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
            //			btn.showsTouchWhenHighlighted = YES;
            btn.adjustsImageWhenHighlighted = NO;
            btn.tag = i;
            btn.frame = CGRectMake(width * i, 0.5, width, frame.size.height-0.5);
            btn.backgroundColor = [UIColor colorWithHexString:@"#f4f4f4"];
            [btn  setExclusiveTouch:YES];
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            btn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
            [btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
            [btn setImage:[[imageArray objectAtIndex:i] objectForKey:@"Seleted"] forState:UIControlStateSelected];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(6, (width-22)/2, 21, (width-22)/2)];
            
            
            
            CGSize titleSize = [titleArray[i] sizeWithFont:TextSize10];
            
            
            [btn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(32, (width-titleSize.width)/2-22, 0, (width-titleSize.width)/2-44)];
//            [btn setTitleColor:TextGrayColor forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithHexString:@"＃ea051a"] forState:UIControlStateSelected];
            btn.titleLabel.font = TextSize10;
            //            [btn.titleLabel setContentMode:UIViewContentModeCenter];
            [btn.titleLabel setBackgroundColor:[UIColor clearColor]];
            [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.buttons addObject:btn];
            [self addSubview:btn];
            
        }
        _images = [[NSArray alloc]initWithArray:imageArray];
        _titles = [[NSArray alloc]initWithArray:titleArray];
        
    }
    return self;
    
}

- (void)setBackgroundImage:(UIImage *)img
{
    [_backgroundView setImage:img];
}

- (void)setSelectedImage:(UIImage *)img
{
    [_selectedView setImage:img];
}

- (void)tabBarButtonClicked:(id)sender
{
    UIButton *btn = sender;
    [self selectTabAtIndex:btn.tag];
}

- (void)selectTabAtIndex:(NSInteger)index
{
    
    [_selectedView setFrame:CGRectMake(index * (ZBScreenSize.width*1.0/5), 4, ZBScreenSize.width*1.0/5, 49 - 4)];
    for (int i = 0; i < [self.buttons count]; i++)
    {
        UIButton *b = [self.buttons objectAtIndex:i];
        if (index == i)
        {
            [b setImage:[[self.images objectAtIndex:i] objectForKey:@"Selected"] forState:UIControlStateNormal];
            [b setTitle:[_titles objectAtIndex:i] forState:UIControlStateNormal];
            
            
            [b setTitleColor:[UIColor colorWithHexString:@"#ea051a"] forState:UIControlStateNormal];
            
            
        } else {
            [b setImage:[[self.images objectAtIndex:i] objectForKey:@"Default"] forState:UIControlStateNormal];
            [b setTitle:[_titles objectAtIndex:i] forState:UIControlStateNormal];
//            [b setTitleColor:TextGrayColor                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          forState:UIControlStateNormal];
            
        }
        b.selected = NO;
    }
    UIButton *btn = [self.buttons objectAtIndex:index];
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)])
    {
        [_delegate tabBar:self didSelectIndex:btn.tag];
    }
    
    //    NSLog(@"Select index: %d",btn.tag);
}

- (void)removeTabAtIndex:(NSInteger)index
{
    // Remove button
    [(UIButton *)[self.buttons objectAtIndex:index] removeFromSuperview];
    [self.buttons removeObjectAtIndex:index];
    
    // Re-index the buttons
    CGFloat width = ZBScreenSize.width*1.0 / [self.buttons count];
    for (UIButton *btn in self.buttons)
    {
        if (btn.tag > index)
        {
            btn.tag --;
        }
        btn.frame = CGRectMake(width * btn.tag, 0, width, self.frame.size.height);
    }
}

- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    // Re-index the buttons
    CGFloat width = ZBScreenSize.width*1.0 / ([self.buttons count]+1 );
    for (UIButton *b in self.buttons)
    {
        if (b.tag >= index)
        {
            b.tag ++;
        }
        b.frame = CGRectMake(width * b.tag, 0, width, self.frame.size.height);
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    btn.showsTouchWhenHighlighted = YES;
    btn.tag = index;
    btn.frame = CGRectMake(width * index, 0, width+2 , self.frame.size.height);
    [btn setImage:[dict objectForKey:@"Default"] forState:UIControlStateNormal];
    //    [btn setImage:[dict objectForKey:@"Highlighted"] forState:UIControlStateHighlighted];
    //    [btn setImage:[dict objectForKey:@"Seleted"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttons insertObject:btn atIndex:index];
    [self addSubview:btn];
}


@end
