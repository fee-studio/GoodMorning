//
//  EEBaseTableViewController.m
//  Dobby
//
//  Created by efeng on 14-5-30.
//  Copyright (c) 2014年 buerguo. All rights reserved.
//

#import "EEBaseTableViewController.h"

@interface EEBaseTableViewController ()

@end

@implementation EEBaseTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.baseTableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                      style:_tableViewStyle];
    
    _baseTableView.delegate = self;
    _baseTableView.dataSource = self;
    
    [_baseTableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    [self.view addSubview:_baseTableView];
    [_baseTableView reloadData];
    
    self.baseTableView.separatorInset = UIEdgeInsetsZero;
    if ([self.baseTableView respondsToSelector:@selector(layoutMargins)]) {
        self.baseTableView.layoutMargins = UIEdgeInsetsZero;
    }
}

// 2.集成刷新控件
- (void)setRefreshType:(TableViewRefreshType)refreshType {
    
    _refreshType = refreshType;
    [self.baseTableView removeHeader];
    [self.baseTableView removeFooter];
    
    switch (refreshType) {
        case TableViewRefreshTypeAll:
            // 添加传统的下拉刷新
            // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
            [self.baseTableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
            // 马上进入刷新状态
            [self.baseTableView.header beginRefreshing];
            [self.baseTableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
            self.baseTableView.footer.automaticallyRefresh = NO;
            break;
        case TableViewRefreshTypeHeader:
            [self.baseTableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
            [self.baseTableView.header beginRefreshing];
            break;
        case TableViewRefreshTypeFooter:
            // 添加传统的上拉刷新
            // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
            [self.baseTableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
            self.baseTableView.footer.automaticallyRefresh = NO;
            break;
        case TableViewRefreshTypeHeaderNoAutoRefresh:
            [self.baseTableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
            break;
        case TableViewRefreshTypeHeaderNoAnimation:
            break;
        default:
            break;
    }
}

- (void)endRefreshing:(RefreshPosition)position; {
    
    if (position == RefreshPositionHeader) {
        [self.baseTableView.header endRefreshing];
    } else if (position == RefreshPositionFooter){
        [self.baseTableView.footer endRefreshing];
    } else {
        [self.baseTableView.header endRefreshing];
    }
}

#pragma mark - Header & Footer

- (void)refreshData {
    [self.baseTableView.footer resetNoMoreData];
}

- (void)loadMoreData {

}

#pragma mark - table view delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = @"敬请期待~";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section; {
    return 12.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section; {
    return 0.01f;
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    _baseTableView.delegate = nil;
    _baseTableView.dataSource = nil;
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

@end
