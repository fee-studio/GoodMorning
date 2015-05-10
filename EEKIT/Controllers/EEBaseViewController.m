//
//  EEBaseViewController.m
//  Dobby
//
//  Created by efeng on 14-5-17.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import "EEBaseViewController.h"
#import "HPGrowingTextView.h"

@interface EEBaseViewController ()

@end

@implementation EEBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.frame = mScreenBounds;
    self.view.backgroundColor = [UIColor whiteColor];

    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {

        // skill 这句很关键.关于在UINavigationController下面布局UIViewController + UITableView
        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.extendedLayoutIncludesOpaqueBars = YES;
//        self.automaticallyAdjustsScrollViewInsets = YES;
    }

    // register for keyboard notifications
    [mNotificationCenter addObserver:self
                            selector:@selector(keyboardWillShow:)
                                name:UIKeyboardWillShowNotification
                              object:self.view.window];
    // register for keyboard notifications
    [mNotificationCenter addObserver:self
                            selector:@selector(keyboardWillHide:)
                                name:UIKeyboardWillHideNotification
                              object:self.view.window];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [TSMessage setDefaultViewController:self.navigationController];
    [MobClick beginLogPageView:[self description]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:[self description]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self hideKeyboard:nil];
}

#pragma mark - keyboard selector
/**
 *  隐藏键盘
 */
- (void)hideKeyboard:(id)sender {
    [self.view endEditing:YES];
}

- (void)keyboardWillShow:(NSNotification *)n {

    _keyboardIsShown = YES;
}

- (void)keyboardWillHide:(NSNotification *)n {
    _keyboardIsShown = NO;
}

#pragma mark - MBProgressHUD 相关方法

- (void)showLoadingView {
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideLoadingView {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)showLoadingViewWithText:(NSString *)text {

    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText = text;
}

- (void)showLoadingViewDefaultText {
    [self showLoadingViewWithText:@"正在加载中..."];
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



#pragma mark -
#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    HUD = nil;
}

+ (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];

    [description appendString:@">"];
    return description;
}

@end
