//
//  HorizonalTableViewController.m
//  SwipableTableView
//
//  Created by 浙科信息 on 2018/7/18.
//

#import "HorizonalTableViewController.h"
#import "UIColor+Util.h"

@interface HorizonalTableViewController ()

@end
static NSString *kHorizonalCellID = @"HorizonalCell";
@implementation HorizonalTableViewController


- (instancetype)initWithViewControllers:(NSArray *)controllers{
    self = [super init];
    if (self) {
        _controllers = [NSMutableArray arrayWithArray:controllers];
        for (UIViewController *controller in controllers) {
            [self addChildViewController:controller];
        }
    }
    return  self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [UITableView new];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollsToTop = NO;
    self.tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);//先将tableview逆时针旋转90度
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.pagingEnabled = YES;
    self.tableView.backgroundColor = [UIColor themeColor];
    self.tableView.bounces = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kHorizonalCellID];
    
  
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _controllers.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.frame.size.width;//设置成屏幕宽度
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kHorizonalCellID forIndexPath:indexPath];
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI_2);//再将UITableViewCell顺时针旋转90度：
    cell.contentView.backgroundColor = [UIColor themeColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIViewController *controller = _controllers[indexPath.row];
    controller.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:controller.view];
    
    return cell;
}

#pragma mark - <UIScrollViewDelegate>
//减速停止
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollStop:YES];
}

//已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self scrollStop:NO];
    if (_viewDidScroll) {
        _viewDidScroll();
    }
}


#pragma mark -

- (void)scrollToViewAtIndex:(NSUInteger)index
{
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]
                          atScrollPosition:UITableViewScrollPositionNone
                                  animated:NO];
    
    _currentIndex = index;
    if (_viewDidAppear) {_viewDidAppear(index);}
}

- (void)scrollStop:(BOOL)didScrollStop
{
    //NSLog(@"didScrollStop:%@",didScrollStop ? @"yes":@"NO");
    CGFloat horizonalOffset = self.tableView.contentOffset.y;
    //NSLog(@"horizonalOffset:%f",horizonalOffset);
    CGFloat screenWidth = self.tableView.frame.size.width;
    //NSLog(@"screenWidth:%f",screenWidth);
    CGFloat offsetRatio = (NSUInteger)horizonalOffset % (NSUInteger)screenWidth / screenWidth;
    //NSLog(@"offsetRatio:%f",offsetRatio);
    NSUInteger focusIndex = (horizonalOffset + screenWidth / 2) / screenWidth;
    //NSLog(@"focusIndex:%lu",(unsigned long)focusIndex);
    
    if (horizonalOffset != focusIndex * screenWidth) {
        NSUInteger animationIndex = horizonalOffset > focusIndex * screenWidth ? focusIndex + 1: focusIndex - 1;
        if (focusIndex > animationIndex) {offsetRatio = 1 - offsetRatio;}
        if (_scrollView) {
            _scrollView(offsetRatio, focusIndex, animationIndex);
        }
    }
    
    if (didScrollStop) {
        /*
         [_controllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL *stop) {
         if ([vc isKindOfClass:[UITableViewController class]]) {
         ((UITableViewController *)vc).tableView.scrollsToTop = (idx == focusIndex);
         }
         }];
         */
        _currentIndex = focusIndex;
        
        if (_changeIndex) {_changeIndex(focusIndex);}
    }
}

@end
