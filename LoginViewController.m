//
//  LoginViewController.m
//  zhuangdianbi
//
//  Created by bonelee on 16/3/16.
//  Copyright © 2016年 zhuangbi. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
{
    UITextField *_phoneNum;//手机号
    UITextField *_codeNum;//密码
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *topImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height/2 - 20)];
    topImage.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:topImage];
    
//    UIImageView *icon = [UIImageView alloc]initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    
  
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
