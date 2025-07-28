//
//  DrawerView.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/17.
//


#import "DrawerView.h"
#import "MyDrawerCell.h"
#import "MyfinallDrawerCell.h"
@interface DrawerView ()

@end


@implementation DrawerView

- (void)showInView:(UIView *)parentView {
    
    self.overlayView = [[UIView alloc] initWithFrame:parentView.bounds];
    self.overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    self.overlayView.tag = 999;
    if (!self.superview) {
        [parentView addSubview:self.overlayView];
        [parentView addSubview:self];
    }
    self.frame = CGRectMake(-parentView.frame.size.width * 0.7, 0, parentView.frame.size.width * 0.8, parentView.frame.size.height);
    self.backgroundColor = [UIColor whiteColor];
    self.tag = 998;
    
    BOOL savedDarkMode = [[NSUserDefaults standardUserDefaults] boolForKey:@"DarkModeEnabled"];
    self.isDarkMode = savedDarkMode;

    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(DarkModeChanged:) name: @"DarkModeSwitchNotification" object: nil];
    
    self.image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"头像1.jpg"]];
    self.image1.frame = CGRectMake(10, 80, 70, 70);
    self.image1.layer.cornerRadius = 35;
    self.image1.clipsToBounds = YES;
    [self addSubview: self.image1];
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(90, 100, 100, 30)];
    self.name.text = @"白玉cfc";
    self.name.textAlignment = NSTextAlignmentCenter;
    self.name.font = [UIFont boldSystemFontOfSize:20];
    [self addSubview:self.name];
    
    self.image2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"vip.jpg"]];
    self.image2.frame = CGRectMake(10, 168, 300, 125);
    self.image2.layer.cornerRadius = 10;
    self.image2.clipsToBounds = YES;
    [self addSubview: self.image2];
    
    
    self.sections = @[
        @[
            @{@"image": @"信件.png", @"title": @"我的消息"},
            @{@"image": @"云贝管理.png", @"title": @"我的云贝"},
            @{@"image": @"衣服.png", @"title": @"装扮中心"},
            @{@"image": @"提示.png", @"title": @"创作者中心"}
        ],
        @[
            @{@"image": @"时钟.png", @"title": @"最近播放"},
            @{@"image": @"定时器.png", @"title": @"定时关闭"}
        ],
    ];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.image2.frame) + 10,
        self.frame.size.width,
        self.frame.size.height - CGRectGetMaxY(self.image2.frame) - 100)
        style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyDrawerCell class] forCellReuseIdentifier:@"DrawerCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView];

    self.tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 90) style:UITableViewStyleGrouped];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    [self.tableView2 registerClass:[MyfinallDrawerCell class] forCellReuseIdentifier:@"FinalCell"];
    self.tableView2.scrollEnabled = NO;
    self.tableView2.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView2.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.tableView.tableFooterView = self.tableView2;
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [self.overlayView addGestureRecognizer:tap];
    [self applyTheme];
}

- (void)DarkModeChanged:(NSNotification *)notification {
    BOOL isDark = [notification.userInfo[@"isDark"] boolValue];
    self.isDarkMode = isDark;
    [[NSUserDefaults standardUserDefaults] setBool:isDark forKey:@"DarkModeEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self applyTheme];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (tableView == self.tableView2) {
        return 1;
    }
    return self.sections.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableView2) {
        return 1;
    }
    NSArray *rows = self.sections[section];
    return rows.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.tableView2) {
        MyfinallDrawerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FinalCell" forIndexPath:indexPath];
        cell.moon.image = [UIImage imageNamed:@"黑夜.png"];
        cell.moonLabel.text = @"深色模式";
        //cell.moonSwitch.on = self.isDarkMode;
        if (self.isDarkMode) {
            cell.moonLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
        } else {
            cell.moonLabel.textColor = [UIColor blackColor];
            cell.backgroundColor = [UIColor whiteColor];
        }
        cell.moonLabel.tintColor = [UIColor whiteColor];
        return cell;
    }
    MyDrawerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DrawerCell" forIndexPath:indexPath];
    
    NSDictionary *item = self.sections[indexPath.section][indexPath.row];
    cell.DrawimageView.image = [UIImage imageNamed:item[@"image"]];
    cell.title.text = item[@"title"];
    
    if (self.isDarkMode) {
        cell.title.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
    } else {
        cell.title.textColor = [UIColor blackColor];
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(-self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self.overlayView removeFromSuperview];
    }];
}

- (void)applyTheme {
    BOOL savedDarkMode = [[NSUserDefaults standardUserDefaults] boolForKey:@"DarkModeEnabled"];
    self.isDarkMode = savedDarkMode;
    
    if (self.isDarkMode) {
        self.backgroundColor = [UIColor blackColor];
        self.name.textColor = [UIColor whiteColor];
        self.tableView.backgroundColor = [UIColor blackColor];
        self.tableView2.backgroundColor = [UIColor blackColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
        self.name.textColor = [UIColor blackColor];
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView2.backgroundColor = [UIColor whiteColor];
    }
    [self.tableView reloadData];
    [self.tableView2 reloadData];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end






