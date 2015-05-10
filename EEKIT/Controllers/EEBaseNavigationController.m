//
//  EEBaseNavigationController.m
//  Dobby
//
//  Created by efeng on 14-5-17.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import "EEBaseNavigationController.h"
#import "UIBarButtonItem+Extension.h"

@interface EEBaseNavigationController ()

@end

@implementation EEBaseNavigationController

#pragma mark 一个类只会调用一次

+ (void)initialize
{
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleDefault;    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    [TSMessage setDefaultViewController:self];

    /*
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
     */
    // 设置导航栏背景
    self.navigationBar.translucent = YES;
    self.navigationBar.alpha = 0.3f;
    self.navigationBar.tintColor = [UIColor whiteColor];
//    self.navigationBar.barTintColor = kAppOrangeColor;
    
    [self customizeInterface];
}

- (void)customizeInterface {
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : [UIFont boldSystemFontOfSize:18],
                                     NSForegroundColorAttributeName : [UIColor whiteColor],
                                     };
    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
