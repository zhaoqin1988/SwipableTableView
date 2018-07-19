//
//  HorizonalTableViewController.h
//  SwipableTableView
//
//  Created by 浙科信息 on 2018/7/18.
//

#import <UIKit/UIKit.h>

@interface HorizonalTableViewController : UITableViewController
@property(nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) NSMutableArray *controllers;

@property (nonatomic, copy) void (^changeIndex)(NSUInteger index);
@property (nonatomic, copy) void (^scrollView)(CGFloat offsetRatio, NSUInteger focusIndex, NSUInteger animationIndex);
@property (nonatomic, copy) void (^viewDidAppear)(NSInteger index);

@property (nonatomic, copy) void (^viewDidScroll)(void);//这个为了在搜索滑动过程中,关闭键盘用的

- (instancetype)initWithViewControllers:(NSArray *)controllers;

- (void)scrollToViewAtIndex:(NSUInteger)index;

@end
