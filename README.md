
ResideMenu一些属性

//屏幕晃动效果
self.parallaxEnabled = NO;
self.parallaxMenuMinimumRelativeValue = -15;
self.parallaxMenuMaximumRelativeValue = 15;
self.parallaxContentMinimumRelativeValue = -15;
self.parallaxContentMaximumRelativeValue = 15;

//控制缩放的效果
self.contentViewScaleValue = 0.95;
//内容控制器的缩放及偏移(屏幕中点为原点)
self.contentViewInLandscapeOffsetCenterX = 0;
//控制肖像视图(前景视图)的偏移量(0为偏移半个UIScreen)
self.contentViewInPortraitOffsetCenterX  = [UIScreen mainScreen].bounds.size.width/5;

//菜单的缩放
self.scaleMenuView = NO;

//设置为no,主页面平滑,不缩放
self.scaleContentView = NO;
//背景图片的缩放
self.scaleBackgroundImageView = NO;


//菜单的淡出
self.fadeMenuView = YES;

//阴影效果
self.contentViewShadowEnabled = NO;
//    self.contentViewShadowColor = [UIColor blackColor];
//    self.contentViewShadowOffset = CGSizeZero;
//    self.contentViewShadowOpacity = 0.4f;
//    self.contentViewShadowRadius = 8.0f;

//    self.menuViewControllerTransformation = CGAffineTransformMakeScale(1.7f, 1.07f);
//    self.menuViewControllerTransformation =  CGAffineTransformMakeTranslation(-([UIScreen mainScreen].bounds.size.width / 2.f), 0);
self.contentViewShadowRadius = 4.5;

//设置是否可以手势滑动打开侧边栏
self.panGestureEnabled = YES;
self.panFromEdge= NO;

//设置中心
self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];

//设置左边
self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
//设置右边视图
//self.rightMenuViewController
