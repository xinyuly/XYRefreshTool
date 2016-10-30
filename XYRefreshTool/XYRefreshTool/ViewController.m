//
//  ViewController.m
//  XYRefreshTool
//
//  Created by lixinyu on 16/5/21.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+XYRefreshView.h"

@interface ViewController ()<XYPullRefreshViewDelegate,XYPushRefreshViewDelegate>
@property (nonatomic, assign) NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView showPullRefreshViewWithDelegate:self];
    [self.tableView showPushRefreshViewWithDelegate:self];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL"];
    self.count = 20;
    
}

- (void)pullRefreshViewStartLoad:(XYPullRefreshView *)pullControl {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView endPullRefreshed];
        self.count = self.count -2;
        [self.tableView hiddenPullView];
        [self.tableView reloadData];
    });
}

- (void)pushRefreshViewStartLoad:(XYPushRefreshView *)pushControl {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView endPushRefreshed];
        [self.tableView hiddenPushView];
        self.count = self.count +3;
        [self.tableView reloadData];
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    return cell;
}

@end
