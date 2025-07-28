//
//  ForthVC.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/15.
//

#import "ForthVC.h"
#import "PhotoWallVC.h"
#import "MymusicCell.h"
#import "CloudViewController.h"
#import "DrawerView.h"

@interface ForthVC ()<UITableViewDelegate, UITableViewDataSource, PhotoWallDelegate>


@end

@implementation ForthVC

// 主视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // 主动读取主题设置并应用
    self.isDarkMode = [[NSUserDefaults standardUserDefaults] boolForKey:@"DarkModeEnabled"];
    [self updateThemeWithDarkMode:self.isDarkMode];
    // Do any additional setup after loading the view.
    self.mainscrollView = [[UIScrollView alloc] initWithFrame: self.view.bounds];
    //完全手动控制滚动视图内边距
    if (@available(iOS 11.0, *)) {
        self.mainscrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.mainscrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    self.mainscrollView.showsVerticalScrollIndicator = NO;
    UIImageView *mainImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"底.jpg"]];
    
    mainImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2- 50);
    mainImageView.contentMode = UIViewContentModeScaleToFill;
    mainImageView.clipsToBounds = YES;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.mainscrollView addSubview: mainImageView];
    [self.view addSubview: self.mainscrollView];
    
    self.leftBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.leftBtn setImage:[[UIImage imageNamed:@"菜单白.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.leftBtn.frame = CGRectMake(13, 60, 30, 30);
    [self.leftBtn addTarget:self action:@selector(leftBtnTapped) forControlEvents:UIControlEventTouchUpInside];

    self.rightBtn1 = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.rightBtn1 setImage:[[UIImage imageNamed:@"云盘.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.rightBtn1.frame = CGRectMake(323, 60, 30, 30);
    [self.rightBtn1 addTarget:self action:@selector(thirdBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightBtn2 = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.rightBtn2 setImage:[[UIImage imageNamed:@"三点白.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.rightBtn2.frame = CGRectMake(363, 60, 30, 30);
    [self.rightBtn2 addTarget:self action:@selector(leftBtnTapped)
             forControlEvents:UIControlEventTouchUpInside];
    
    self.bottombtn1 = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.bottombtn1 setImage: [[UIImage imageNamed: @"按键01.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState: UIControlStateNormal];
    self.bottombtn1.frame = CGRectMake(8, 340, 67, 40);
    self.bottombtn1.layer.cornerRadius = 6.0;
    self.bottombtn1.layer.masksToBounds = YES;
    [self.bottombtn1 addTarget: self action: @selector(leftBtnTapped) forControlEvents: UIControlEventTouchUpInside];
    
    self.bottombtn2 = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.bottombtn2 setImage: [[UIImage imageNamed: @"按键02.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState: UIControlStateNormal];
    self.bottombtn2.frame = CGRectMake(98, 340, 70, 40);
    self.bottombtn2.layer.cornerRadius = 6.0;
    self.bottombtn2.layer.masksToBounds = YES;
    [self.bottombtn2 addTarget: self action: @selector(leftBtnTapped) forControlEvents: UIControlEventTouchUpInside];
    
    self.bottombtn3 = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.bottombtn3 setImage: [[UIImage imageNamed: @"按键03.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState: UIControlStateNormal];
    self.bottombtn3.frame = CGRectMake(178, 340, 67, 40);
    self.bottombtn3.layer.cornerRadius = 6.0;
    self.bottombtn3.layer.masksToBounds = YES;
    [self.bottombtn3 addTarget: self action: @selector(thirdBtnTapped) forControlEvents: UIControlEventTouchUpInside];
    
    self.bottombtn4 = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.bottombtn4 setImage: [[UIImage imageNamed: @"按键04.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState: UIControlStateNormal];
    self.bottombtn4.frame = CGRectMake(268, 340, 67, 40);
    self.bottombtn4.layer.cornerRadius = 6.0;
    self.bottombtn4.layer.masksToBounds = YES;
    [self.bottombtn4 addTarget: self action: @selector(leftBtnTapped) forControlEvents: UIControlEventTouchUpInside];
    
    self.bottombtn5 = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.bottombtn5 setImage: [[UIImage imageNamed: @"按键05.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  forState: UIControlStateNormal];
    self.bottombtn5.frame = CGRectMake(348, 340, 40, 40);
    self.bottombtn5.layer.cornerRadius = 6.0;
    self.bottombtn5.layer.masksToBounds = YES;
    [self.bottombtn5 addTarget: self action: @selector(leftBtnTapped) forControlEvents: UIControlEventTouchUpInside];
    self.bottombtn1.alpha = 0.85;
    self.bottombtn2.alpha = 0.85;
    self.bottombtn3.alpha = 0.85;
    self.bottombtn4.alpha = 0.85;
    self.bottombtn5.alpha = 0.85;
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(163, 65, 80, 30)];
    self.label1.text = @"+ 添加状态";
    self.label1.textColor = [UIColor grayColor];
    self.label1.font = [UIFont systemFontOfSize: 14];
    self.label1.textAlignment = NSTextAlignmentCenter;
    
    self.nameLabel = [[UILabel alloc] initWithFrame: CGRectMake(150, 223, 104, 20)];
    self.nameLabel.text = @"白玉cfc";
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.font = [UIFont boldSystemFontOfSize: 20];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    
    self.label2 = [[UILabel alloc] initWithFrame: CGRectMake(104, 256, 200, 15)];
    self.label2.text = @"♂︎·日常摸鱼中·社交恐惧症";
    self.label2.textColor = [UIColor grayColor];
    self.label2.font = [UIFont systemFontOfSize: 14];
    self.label2.textAlignment = NSTextAlignmentCenter;
    
    self.label3 = [[UILabel alloc] initWithFrame: CGRectMake(69, 296, 280, 15)];
    self.label3.text = @"7 关注  48 粉丝  Lv.9  1024 小时";
    self.label3.textColor = [UIColor whiteColor];
    self.label3.font = [UIFont systemFontOfSize: 17];
    self.label3.textAlignment = NSTextAlignmentCenter;
    
    
    self.avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.avatarButton.frame = CGRectMake(153, 115, 104, 104);
    [self.avatarButton setImage:[UIImage imageNamed:@"头像1.jpg"] forState:UIControlStateNormal];
    self.avatarButton.layer.cornerRadius = 52;
    self.avatarButton.layer.masksToBounds = YES;
    [self.avatarButton addTarget:self action:@selector(avatarTapped)
                forControlEvents:UIControlEventTouchUpInside];
    mainImageView.userInteractionEnabled = YES;
    // 白色边框
    self.avatarButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.avatarButton.layer.borderWidth = 3.0;
    
    [mainImageView addSubview: self.label3];
    [mainImageView addSubview: self.label2];
    [mainImageView addSubview: self.nameLabel];
    [mainImageView addSubview:self.avatarButton];
    [mainImageView addSubview:self.label1];
    [mainImageView addSubview: self.rightBtn1];
    [mainImageView addSubview: self.rightBtn2];
    [mainImageView addSubview: self.leftBtn];
    [mainImageView addSubview: self.bottombtn1];
    [mainImageView addSubview: self.bottombtn2];
    [mainImageView addSubview: self.bottombtn3];
    [mainImageView addSubview: self.bottombtn4];
    [mainImageView addSubview: self.bottombtn5];
    
#pragma mark - 下半屏
    // 创建 UISegmentedControl
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"音乐", @"播客", @"笔记"]];
    self.segmentedControl.layer.borderWidth = 0;
    self.segmentedControl.layer.borderColor = [UIColor clearColor].CGColor;
    self.segmentedControl.tintColor = [UIColor clearColor];
    self.segmentedControl.frame = CGRectMake(0, self.view.frame.size.height - 489, self.view.frame.size.width, 50);
    self.segmentedControl.selectedSegmentIndex = 0;

    NSDictionary *normalAttributes = @{
        NSForegroundColorAttributeName: [UIColor grayColor],
        NSFontAttributeName: [UIFont systemFontOfSize:16]
    };
    [self.segmentedControl setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    NSDictionary *selectedAttributes = @{
        NSForegroundColorAttributeName: [UIColor blackColor],
        NSFontAttributeName: [UIFont boldSystemFontOfSize:16]
    };
    [self.segmentedControl setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    [self.segmentedControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    [self.mainscrollView addSubview:self.segmentedControl];
    
    CGFloat segmentWidth = self.view.frame.size.width / self.segmentedControl.numberOfSegments;
    CGFloat indicatorWidth = segmentWidth / 5 - 10;
    CGFloat indicatorX = (segmentWidth - indicatorWidth) / 2;
    self.indicatorLine = [[UIView alloc] initWithFrame:CGRectMake(indicatorX,
        CGRectGetMaxY(self.segmentedControl.frame) - 2,
        indicatorWidth, 2)];
    self.indicatorLine.backgroundColor = [UIColor redColor];
    [self.mainscrollView addSubview:self.indicatorLine];
    
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.segmentedControl.frame), self.view.frame.size.width, 400)];
    self.contentView.backgroundColor = [UIColor clearColor];
    [self.mainscrollView addSubview:self.contentView];

    self.view1 = [[UIView alloc] initWithFrame:self.contentView.bounds];
    self.view1.backgroundColor = [UIColor clearColor];
    self.view2 = [[UIView alloc] initWithFrame:self.contentView.bounds];
    self.view2.backgroundColor = [UIColor clearColor];
    self.view3 = [[UIView alloc] initWithFrame:self.contentView.bounds];
    self.view3.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.view1];
    
    self.labelSong1 = [[UILabel alloc] initWithFrame:CGRectMake(3, 10, self.view1.frame.size.width - 330, 20)];
    self.labelSong1.text = @"近期";
    self.labelSong1.textColor = [UIColor blackColor];
    self.labelSong1.font = [UIFont boldSystemFontOfSize: 15];
    self.labelSong1.textAlignment = NSTextAlignmentCenter;
    [self.view1 addSubview: self.labelSong1];
    UILabel *labelSong2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.view1.frame.size.width - 200, 20)];
    labelSong2.text = @"创建5  收藏8";
    labelSong2.textColor = [UIColor grayColor];
    labelSong2.font = [UIFont boldSystemFontOfSize: 14];
    labelSong2.textAlignment = NSTextAlignmentCenter;
    [self.view1 addSubview:labelSong2];
    
    self.dataArray = @[
        @{@"image": @"歌单1.png", @"title": @"我喜欢的音乐", @"subtitle": @"130首·78次播放"},
        @{@"image": @"歌单2.png", @"title": @"华语", @"subtitle": @"歌单·32首·白玉cfc"},
        @{@"image": @"third5.png", @"title": @"夜", @"subtitle": @"歌单·90首·白玉cfc"},
        @{@"image": @"third9.png", @"title": @"游戏专用", @"subtitle": @"歌单·12首·白玉cfc"},
        @{@"image": @"歌单5.jpg", @"title": @"火影忍者台词", @"subtitle": @"歌单·319首·十年樱花遇见你"}
    ];
    self.tableView1 = [[UITableView alloc] initWithFrame: CGRectMake(0, 40, self.view1.frame.size.width, self.view1.frame.size.height) style: UITableViewStylePlain];
    self.tableView1.dataSource = self;
    self.tableView1.delegate = self;
    self.tableView1.rowHeight = 80;
    [self.tableView1 registerClass: [MymusicCell class] forCellReuseIdentifier: @"MymusicCell"];
    [self.view1 addSubview: self.tableView1];
    
    
    UILabel *spreadLabel = [[UILabel alloc] initWithFrame: CGRectMake(105, 100, 180, 30)];
    spreadLabel.text = @"+ 添加你的播客";
    spreadLabel.textColor = [UIColor grayColor];
    spreadLabel.font = [UIFont boldSystemFontOfSize: 16];
    spreadLabel.textAlignment = NSTextAlignmentCenter;
    [self.view2 addSubview: spreadLabel];
    
    UILabel *dictionLabel = [[UILabel alloc] initWithFrame: CGRectMake(105, 100, 180, 30)];
    dictionLabel.text = @"🎵分享你喜欢的音乐吧";
    dictionLabel.textColor = [UIColor grayColor];
    dictionLabel.font = [UIFont systemFontOfSize: 16];
    dictionLabel.textAlignment = NSTextAlignmentCenter;
    [self.view3 addSubview: dictionLabel];
    
    
    CGFloat bottomY = CGRectGetMaxY(self.contentView.frame) + 150;
    self.mainscrollView.contentSize = CGSizeMake(self.view.frame.size.width, bottomY);
    
     UIImage *clearImage = [self imageWithColor:[UIColor whiteColor] size:CGSizeMake(1, 1)];
     [self.segmentedControl setDividerImage:clearImage
                         forLeftSegmentState:UIControlStateNormal
                           rightSegmentState:UIControlStateNormal
                                  barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setBackgroundImage:[UIImage new] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setBackgroundImage:[UIImage new] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setBackgroundImage:[UIImage new] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    // 清除边框和阴影
    self.segmentedControl.layer.borderWidth = 0;
    self.segmentedControl.layer.borderColor = [UIColor clearColor].CGColor;
    self.segmentedControl.layer.shadowOpacity = 0;
    self.segmentedControl.layer.shadowRadius = 0;
    self.segmentedControl.layer.shadowOffset = CGSizeZero;
    self.segmentedControl.layer.shadowColor = [UIColor clearColor].CGColor;
    self.segmentedControl.layer.masksToBounds = YES;
    // 设置背景色透明或白色
    self.segmentedControl.backgroundColor = [UIColor clearColor];
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(DarkModeChanged:) name: @"DarkModeSwitchNotification" object: nil];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)DarkModeChanged:(NSNotification *)notification {
    BOOL isDark = [notification.userInfo[@"isDark"] boolValue];
    self.isDarkMode = isDark;
    [[NSUserDefaults standardUserDefaults] setBool:isDark forKey:@"DarkModeEnabled"];
    [self updateThemeWithDarkMode:isDark];
}

- (void)updateThemeWithDarkMode:(BOOL)isDark {
    UIColor *bgColor = isDark ? [UIColor blackColor] : [UIColor clearColor];
    self.view1.backgroundColor = bgColor;
    self.view2.backgroundColor = bgColor;
    self.view3.backgroundColor = bgColor;
    self.contentView.backgroundColor = bgColor;
    self.tableView1.backgroundColor = bgColor;
    self.segmentedControl.backgroundColor = isDark ? [UIColor blackColor] : [UIColor clearColor];
    self.labelSong1.textColor = isDark ? [UIColor whiteColor] : [UIColor blackColor];
    [self.segmentedControl setTitleTextAttributes:@{
        NSForegroundColorAttributeName: isDark ? [UIColor lightGrayColor] : [UIColor grayColor],
        NSFontAttributeName: [UIFont systemFontOfSize:16]
    } forState:UIControlStateNormal];

    self.view.backgroundColor = isDark ? [UIColor blackColor] : [UIColor whiteColor];
    [self.segmentedControl setTitleTextAttributes:@{
        NSForegroundColorAttributeName: isDark ? [UIColor whiteColor] : [UIColor blackColor],
        NSFontAttributeName: [UIFont boldSystemFontOfSize:16]
    } forState:UIControlStateSelected];

    UIColor *dividerColor = isDark ? [UIColor blackColor] : [UIColor whiteColor];
    UIImage *dividerImage = [self imageWithColor:dividerColor size:CGSizeMake(1, 1)];
    [self.segmentedControl setDividerImage:dividerImage
                        forLeftSegmentState:UIControlStateNormal
                          rightSegmentState:UIControlStateNormal
                                 barMetrics:UIBarMetricsDefault];

    [self.tableView1 reloadData];
}
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)segmentChanged:(UISegmentedControl *)sender {
    for (UIView *subview in self.contentView.subviews) {
        [subview removeFromSuperview];
    }
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.contentView addSubview:self.view1];
            break;
        case 1:
            [self.contentView addSubview:self.view2];
            break;
        case 2:
            [self.contentView addSubview:self.view3];
            break;
        default:
            break;
    }
    CGFloat segmentWidth = self.view.frame.size.width / sender.numberOfSegments;
    CGFloat indicatorWidth = self.indicatorLine.frame.size.width;
    CGFloat indicatorX = segmentWidth * sender.selectedSegmentIndex + (segmentWidth - indicatorWidth) / 2;
    [UIView animateWithDuration:0.25 animations:^{
        self.indicatorLine.frame = CGRectMake(indicatorX,
                                              CGRectGetMaxY(self.segmentedControl.frame) - 2,
                                              indicatorWidth,
                                              2);
    }];
}
// 左侧抽屉视图弹出，右侧视图变灰
- (void)leftBtnTapped {
    DrawerView *drawer = [[DrawerView alloc] init];
    [drawer showInView:self.view.window ?: self.view];
}

// 视图即将出现时刷新主题设置
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.isDarkMode = [[NSUserDefaults standardUserDefaults] boolForKey:@"DarkModeEnabled"];
    [self updateThemeWithDarkMode:self.isDarkMode];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)thirdBtnTapped {
    CloudViewController *vc = [[CloudViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)avatarTapped {
    PhotoWallVC *photoVC = [[PhotoWallVC alloc] init];
    photoVC.delegate = self;
    [self presentViewController: photoVC animated: YES completion: nil];
}

- (void)didSelectImage:(UIImage *)image {
    [self.avatarButton setImage: image forState: UIControlStateNormal];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MymusicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MymusicCell" forIndexPath:indexPath];
    
    NSDictionary *data = self.dataArray[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:data[@"image"]];
    cell.titleLabel1.text = data[@"title"];
    cell.titleLabel2.text = data[@"subtitle"];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;

    if (self.isDarkMode) {
        cell.backgroundColor = [UIColor blackColor];
        cell.titleLabel1.textColor = [UIColor whiteColor];
        cell.titleLabel2.textColor = [UIColor lightGrayColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
        cell.titleLabel1.textColor = [UIColor blackColor];
        cell.titleLabel2.textColor = [UIColor grayColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
