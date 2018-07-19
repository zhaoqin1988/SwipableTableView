//
//  ZKTabBarController.m
//  SwipableTableView
//
//  Created by 浙科信息 on 2018/7/18.
//

#import "ZKTabBarController.h"
#import "NewsTableViewController.h"
#import "QuestionTableViewController.h"
#import "BgViewController.h"
#import "SettingViewController.h"
#import "SwipableViewController.h"
#import <RESideMenu.h>

@interface ZKTabBarController (){
    NewsTableViewController *news;
    QuestionTableViewController *question;
    BgViewController *bg;//办公
    SettingViewController *setting;
}

@end

@implementation ZKTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    news = [NewsTableViewController new];
    question = [QuestionTableViewController new];
    SwipableViewController *newSv = [[SwipableViewController alloc]initWithTitle:@"首页" andSubTitles:@[@"新闻",@"问答"] andControllers:@[news,question] underTabbar:YES];
    bg  = [BgViewController new];
    bg.title = @"办公";
    
    setting = [SettingViewController new];
    setting.title = @"设置";
    
    self.tabBar.translucent = NO;
    self.viewControllers = @[[self addNavigationItemForViewController:newSv showleftBarItem:YES showrightBarItem:YES],[self addNavigationItemForViewController:bg showleftBarItem:NO showrightBarItem:YES],[self addNavigationItemForViewController:setting showleftBarItem:NO showrightBarItem:YES]];
    
    NSArray *titles = @[@"首页",@"办公",@"设置"];
    NSArray *images = @[@"公告",@"大厅",@"我"];
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        [item setTitle:titles[idx]];
        [item setImage:[UIImage imageNamed:[images[idx] stringByAppendingString:@"h"]]];
        [item setSelectedImage:[UIImage imageNamed:[images[idx] stringByAppendingString:@"l"]]];
    }];
    
    
}

-(UINavigationController *)addNavigationItemForViewController:(UIViewController *)controller showleftBarItem:(BOOL)left showrightBarItem:(BOOL)right{
    UINavigationController *navigaionController = [[UINavigationController alloc]initWithRootViewController:controller];
    
    if (right) {
        controller.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                                     target:self
                                                                                                     action:@selector(pushSearchViewController)];
    }
    if (left) {
        controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                                     target:self
                                                                                                     action:@selector(onClickMenuButton)];
    }
  
    return navigaionController;
}


#pragma mark - 处理左右navigationItem点击事件

- (void)pushSearchViewController
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"点击了搜索" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (void)onClickMenuButton
{
    [self.sideMenuViewController presentLeftMenuViewController];
}



@end
