//
//  EEBaseTableViewController.h
//  Dobby
//
//  Created by efeng on 14-5-30.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import "EEBaseViewController.h"

typedef NS_ENUM(NSUInteger, TableViewRefreshType) {
    TableViewRefreshTypeAll = 1, // 头部 尾部刷新都支持
    TableViewRefreshTypeHeader = 2, // 仅支持头部
    TableViewRefreshTypeFooter = 3, // 仅支持尾部
    TableViewRefreshTypeHeaderNoAutoRefresh = 4, // 仅支持头部,但不会自动刷新
    TableViewRefreshTypeHeaderNoAnimation = 5, // 头部,自动刷新,不显示动画
};

typedef NS_ENUM(NSUInteger, RefreshPosition) {
    RefreshPositionHeader = 1, // 头部
    RefreshPositionFooter = 2, // 尾部
};


@interface EEBaseTableViewController : EEBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *baseTableView;
@property(nonatomic, assign) TableViewRefreshType refreshType;
@property(nonatomic, assign) UITableViewStyle tableViewStyle;



/**
*  ************************************
*  子类需实现.
*  ************************************
*/
- (void)refreshData;

- (void)loadMoreData;

/**
*  结束刷新 加载 View
*
*  @param isHeader 是否是头部
*/
- (void)endRefreshing:(RefreshPosition)position;

@end
