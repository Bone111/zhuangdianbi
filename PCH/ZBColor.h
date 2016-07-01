
//
//  ZBColor.h
//  zhuangdianbi
//
//  Created by bonelee on 16/3/16.
//  Copyright © 2016年 zhuangbi. All rights reserved.
//

#ifndef ZBColor_h
#define ZBColor_h



#pragma mark 非加粗
#define   TextSize10    [UIFont  systemFontOfSize:10]
#define   TextSize11    [UIFont  systemFontOfSize:11]
#define   TextSize12    [UIFont  systemFontOfSize:12]
#define   TextSize13    [UIFont  systemFontOfSize:13]
#define   TextSize14    [UIFont  systemFontOfSize:14]
#define   TextSize15    [UIFont  systemFontOfSize:15]
#define   TextSize16    [UIFont  systemFontOfSize:16]
#define   TextSize17    [UIFont  systemFontOfSize:17]
#define   TextSize18    [UIFont  systemFontOfSize:18]
#define   TextSize19    [UIFont  systemFontOfSize:19]
#define   TextSize20    [UIFont  systemFontOfSize:20]
#define   TextSize21    [UIFont  systemFontOfSize:21]
#define   TextSize22    [UIFont  systemFontOfSize:22]
#define   TextSize23    [UIFont  systemFontOfSize:23]
#define   TextSize24    [UIFont  systemFontOfSize:24]
#define   TextSize25    [UIFont  systemFontOfSize:25]
#define   TextSize26    [UIFont  systemFontOfSize:26]
#define   TextSize27    [UIFont  systemFontOfSize:27]
#define   TextSize28    [UIFont  systemFontOfSize:28]
#define   TextSize30    [UIFont  systemFontOfSize:30]
#pragma mark 加粗字体
#define   TextSize10_B    [UIFont  boldSystemFontOfSize:10]
#define   TextSize11_B    [UIFont  boldSystemFontOfSize:11]
#define   TextSize12_B    [UIFont  boldSystemFontOfSize:12]
#define   TextSize13_B    [UIFont  boldSystemFontOfSize:13]
#define   TextSize14_B    [UIFont  boldSystemFontOfSize:14]
#define   TextSize15_B    [UIFont  boldSystemFontOfSize:15]
#define   TextSize16_B    [UIFont  boldSystemFontOfSize:16]
#define   TextSize17_B    [UIFont  boldSystemFontOfSize:17]
#define   TextSize18_B    [UIFont  boldSystemFontOfSize:18]
#define   TextSize19_B    [UIFont  boldSystemFontOfSize:19]
#define   TextSize20_B    [UIFont  boldSystemFontOfSize:20]
#define   TextSize21_B    [UIFont  boldSystemFontOfSize:21]
#define   TextSize22_B    [UIFont  boldSystemFontOfSize:22]
#define   TextSize23_B    [UIFont  boldSystemFontOfSize:23]
#define   TextSize24_B    [UIFont  boldSystemFontOfSize:24]
#define   TextSize25_B    [UIFont  boldSystemFontOfSize:25]
#define   TextSize26_B    [UIFont  boldSystemFontOfSize:26]
#define   TextSize27_B    [UIFont  boldSystemFontOfSize:27]
#define   TextSize28_B    [UIFont  boldSystemFontOfSize:28]



#pragma mark  Icon 图标 背景颜色
/** 纯白_颜色背景上所用图标 */
#define  BackIconWhiteColor                 [UIColor  colorWithHexString:@"#ffffff"]
/** 浅灰_颜色背景上所用图标 */
#define  BackIconGrayColor                  [UIColor  colorWithHexString:@"#828282"]
/** 浅灰_颜色背景上所用图标 */
#define  BackIconLightGrayColor             [UIColor  colorWithHexString:@"#d2d2d2"]
/** 橙色_颜色背景上所用图标 */
#define  BackIconOrangeColor                [UIColor  colorWithHexString:@"#fe8500"]



#pragma mark 系统颜色
/** 1主色调   红色 */
#define  ProJRedColor                [UIColor  colorWithHexString:@"#c63939"]
/** 2辅助色  深红 */
#define  ProJRedDarkColor            [UIColor  colorWithHexString:@"#8f1f24"]
/** 3辅助色  鲜红 */
#define  ProJRedLightColor            [UIColor  colorWithHexString:@"#ec0e0f"]
/** 4辅助色  橙红色 */
#define  ProJOrangeRedColor            [UIColor  colorWithHexString:@"#e94a35"]
/** 4辅助色  绿色 */
#define  ProJGreenColor            [UIColor  colorWithHexString:@"#1dc925"]
/** 4辅助色  搜素按钮背景色 */
#define  ProJSearchBackColor           [UIColor  colorWithHexString:@"#f4f4f4"]
/** 4辅助色 黑色 */
#define  ProJBlackClolor          [UIColor  colorWithHexString:@"#000000"]


/** 5.辅助  蓝色 */
#define  ProJBlueColor            [UIColor  colorWithHexString:@"#d0e5f7"]
/** 6.辅助  深蓝 */
#define  ProJBlueDarkColor            [UIColor  colorWithHexString:@"3c6f9c"]
/** 7.辅助 橙色 */
#define  ProJOrangeColor            [UIColor  colorWithHexString:@"fe8500"]
/** 8.辅助 无色*/
#define  ProJkClearColor            [UIColor  clearColor]//无色



#pragma mark 背景用色
/** 纯白_内页、对方对话框 */
#define  BackViewWhiteColor            [UIColor  colorWithHexString:@"#ffffff"]
/** 浅灰_搜索、对话界面 */
#define  BackViewGrayLightColor            [UIColor  colorWithHexString:@"eeeff3"]
/** 浅蓝_我方对话界面 */
#define  BackViewBlueColor            [UIColor  colorWithHexString:@"d0e5f7"]
/** 橙色 */
#define BackViewOrangeColor         [UIColor colorWithHexString:@"fc7f00"]


/** 列表分割线 */
#define  CellSepColor            [UIColor  colorWithHexString:@"d4d6df"]//列表分割线
/** 顶部，底部栏分割 */
#define  ViewSepColor            [UIColor  colorWithHexString:@"c6c9d4"]//顶部，底部栏分割线

/**进度完成颜色 */
#define  yuanHuanColor            [UIColor  colorWithHexString:@"00dddd"]//顶部，底部栏分割线

/**
 *  所有的列表的section背景颜色
 *
 *  @输入参数 font 二进制色值
 *
 *  @返回值 颜色
 */
#define  TableViewHeadBackcolor            [UIColor  colorWithHexString:@"eeeff3"]

/**
 *   所有的列表的section标题颜色
 *
 *  @输入参数 font 二进制色值
 *
 *  @返回值 颜色
 */
#define  TableViewHeadTitleColor            [UIColor  colorWithHexString:@"#828282"]


/** 所有switch的高度 */
#define allSwitchHeight 40
#define allSwitchFont  TextSize15
#define allSwitchBackColor  [UIColor  colorWithHexString:@"f4f4f4"]
//红条高度
#define allSwitchRedLineHeight 1
//分割线高度
#define allSwitchGapLineHeight 15
//分割线颜色
#define allSwitchGapLineColor  ViewSepColor

//各种字号对应的label高度
#define kLabelHeightWithFont(font) [@"按条件查找" sizeWithFont:font].height;
#define kLabelWidthWithFontText(font,text) [text sizeWithFont:font].width;

#endif /* ZBColor_h */
