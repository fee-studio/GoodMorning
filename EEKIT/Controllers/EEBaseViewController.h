//
//  EEBaseViewController.h
//  Dobby
//
//  Created by efeng on 14-5-17.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EEBaseViewController : UIViewController <MBProgressHUDDelegate> {
    MBProgressHUD *HUD;
}

@property (nonatomic, assign) BOOL keyboardIsShown;

- (void)setupLeftMenuButton;
- (void)setupRightMenuButton;

- (void)showLoadingView;
- (void)showLoadingViewWithText:(NSString *)text;
- (void)showLoadingViewDefaultText;

- (void)hideLoadingView;

- (void)hideKeyboard:(id)sender;

- (void)keyboardWillShow:(NSNotification *)n;
- (void)keyboardWillHide:(NSNotification *)n;




@end




