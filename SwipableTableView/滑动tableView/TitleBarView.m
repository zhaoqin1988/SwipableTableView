//
//  TitleBarView.m
//  SwipableTableView
//
//  Created by 浙科信息 on 2018/7/18.
//

#import "TitleBarView.h"
#import "UIColor+Util.h"

@implementation TitleBarView

-(instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        _currentIndex = 0;
        _titleButtons = [NSMutableArray new];
        CGFloat buttonWidth = frame.size.width /titles.count;//每个按钮宽度
        CGFloat buttonHeight = frame.size.height;//按钮高度
        [titles enumerateObjectsUsingBlock:^(id  _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor titleBarColor];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            [button setTitleColor:[UIColor colorWithHex:0x909090] forState:UIControlStateNormal];
            [button setTitle:title forState:UIControlStateNormal];
            button.frame = CGRectMake(buttonWidth * idx, 0, buttonWidth, buttonHeight);
            button.tag = idx;
            [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
            [self->_titleButtons addObject:button];
            [self addSubview:button];
            //将view调整到父视图的最上面,不然会被后添加的View覆盖
            [self sendSubviewToBack:button];
        }];
        
        self.contentSize = CGSizeMake(frame.size.width, 25);
        self.showsHorizontalScrollIndicator = NO;
        UIButton *firstTitle = _titleButtons[0];
        [firstTitle setTitleColor:[UIColor colorWithHex:0x009000] forState:UIControlStateNormal];
        firstTitle.transform = CGAffineTransformMakeScale(1.15, 1.15);
        
    }
    
    return self;
}

- (void)onClick:(UIButton *)button
{
    if (_currentIndex != button.tag) {
        UIButton *preTitle = _titleButtons[_currentIndex];
        
        [preTitle setTitleColor:[UIColor colorWithHex:0x909090] forState:UIControlStateNormal];
        preTitle.transform = CGAffineTransformIdentity;
        
        [button setTitleColor:[UIColor colorWithHex:0x009000] forState:UIControlStateNormal];
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
        //记录的当前点击的按钮
        _currentIndex = button.tag;
        //回调
        _titleButtonClicked(button.tag);
    }
}

-(void)setTitleButtonsColor
{
    for (UIButton *button in self.subviews) {
        button.backgroundColor = [UIColor titleBarColor];
    }
    
}


@end
