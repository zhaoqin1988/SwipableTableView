//
//  TitleBarView.h
//  SwipableTableView
//
//  Created by 浙科信息 on 2018/7/18.
//

#import <UIKit/UIKit.h>

@interface TitleBarView : UIScrollView
@property (nonatomic,strong) NSMutableArray *titleButtons;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic,copy) void (^titleButtonClicked)(NSUInteger index);

//初始化按钮
-(instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles;

//设置按钮颜色
-(void)setTitleButtonsColor;

@end
