//
//  ZKSideLeftViewController.m
//  SwipableTableView
//
//  Created by 浙科信息 on 2018/7/18.
//

#import "ZKSideLeftViewController.h"
#import <RESideMenu.h>

@interface ZKSideLeftViewController ()
{
    NSArray *titles ;
    
}

@end

@implementation ZKSideLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.bounces = NO;
    titles = @[@"技术", @"软件", @"博客", @"设置", @"注销"];
    //self.tableView.backgroundColor = [UIColor colorWithHex:0xf6f6f6];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    
    cell.backgroundColor = [UIColor clearColor];
    
    UIView *selectedBackground = [UIView new];
    //selectedBackground.backgroundColor = [UIColor colorWithHex:0xCFCFCF];
    [cell setSelectedBackgroundView:selectedBackground];
    
    cell.imageView.image = [UIImage imageNamed:@[@"sidemenu_QA", @"sidemenu-software", @"sidemenu_blog", @"sidemenu_setting", @"sidemenu-night"][indexPath.row]];
    cell.textLabel.text = titles[indexPath.row];
    
//    if (((AppDelegate *)[UIApplication sharedApplication].delegate).inNightMode){
//        cell.textLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
//        if (indexPath.row == 4) {
//            cell.textLabel.text = @"日间模式";
//            cell.imageView.image = [UIImage imageNamed:@"sidemenu-day"];
//        }
//    } else {
//        cell.textLabel.textColor = [UIColor colorWithHex:0x555555];
//        if (indexPath.row == 4) {
//            cell.textLabel.text = @"夜间模式";
//            cell.imageView.image = [UIImage imageNamed:@"sidemenu-night"];
//        }
//    }
    cell.textLabel.font = [UIFont systemFontOfSize:19];
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    //cell.selectedBackgroundView.backgroundColor = [UIColor selectCellSColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *title = titles[indexPath.row];
    UIViewController *controller = [UIViewController new];
    controller.title = title;
    [self setContentViewController:controller];
}


- (void)setContentViewController:(UIViewController *)viewController
{
    viewController.hidesBottomBarWhenPushed = YES;
    UINavigationController *nav = (UINavigationController *)((UITabBarController *)self.sideMenuViewController.contentViewController).selectedViewController;
    //UIViewController *vc = nav.viewControllers[0];
    //vc.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [nav pushViewController:viewController animated:NO];
    
    [self.sideMenuViewController hideMenuViewController];
}
@end
