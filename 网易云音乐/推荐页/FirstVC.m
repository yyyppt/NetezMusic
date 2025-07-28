//
//  FirstVC.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/15.
//

#import "FirstVC.h"
#import "firstTableViewCell.h"
#import "DrawerView.h"

@interface FirstVC () <UISearchBarDelegate>


@end

@implementation FirstVC

- (void)updateTheme:(BOOL)isDarkMode {
    self.isDarkMode = isDarkMode;
    [self applyCurrentTheme];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //appearance.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(DarkModeChanged:)
                        name:@"DarkModeSwitchNotification" object:nil];
    self.isDarkMode = [[NSUserDefaults standardUserDefaults] boolForKey:@"DarkModeEnabled"];
    [self applyCurrentTheme];
    
    self.leftBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"菜单黑.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnTapped)];
    self.leftBtn.width = 30;
    self.navigationItem.leftBarButtonItem = self.leftBtn;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGesture];
    self.rightBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"听歌识曲.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:nil];
    self.rightBtn.width = 30;
    self.navigationItem.rightBarButtonItem =  self.rightBtn;
    
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.frame = CGRectMake(30, 0, 250, 30);
    self.textField = [[UITextField alloc] initWithFrame: CGRectMake(30, 0, 250, 30)];
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchBar.placeholder = @"孙燕姿";
    self.searchBar.keyboardType = UIKeyboardTypeDefault;
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    
    self.navigationController.navigationBar.standardAppearance = self.navigationController.navigationBar.standardAppearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = self.navigationController.navigationBar.scrollEdgeAppearance;
    
    UIScrollView *mainScrollView = [[UIScrollView alloc] initWithFrame: self.view.bounds];
    mainScrollView.showsVerticalScrollIndicator = YES;
    [self.view addSubview: mainScrollView];
    self.firsongScrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 30, self.view.frame.size.width, 210)];
    self.firsongScrollView.pagingEnabled = NO;
    self.firsongScrollView.showsHorizontalScrollIndicator = NO;
    NSArray *imagenames = @[@"firimage1.jpg", @"firimage2.jpg", @"firimage3.jpg", @"firimage4.jpg", @"firimage5.jpg"];
   
    CGFloat imageWidth = self.view.frame.size.width / 2 - 45;
    CGFloat imageSpacing = 10;
    CGFloat imageHeight = 200;
    for (int i = 0; i < imagenames.count; i++) {
        CGFloat x = i * (imageWidth + imageSpacing);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x + 5, 0, imageWidth, imageHeight)];
        imageView.image = [UIImage imageNamed:imagenames[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        
        imageView.layer.cornerRadius = 10;
        imageView.layer.masksToBounds = YES;
        imageView.layer.borderWidth = 1;
        imageView.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:1.0].CGColor;
        [self.firsongScrollView addSubview:imageView];
    }
    self.firsongScrollView.contentSize = CGSizeMake(imagenames.count * (imageWidth + imageSpacing), imageHeight);
    [mainScrollView addSubview: self.firsongScrollView];
    
    UIView *recommendContainer = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.firsongScrollView.frame) + 20, self.view.frame.size.width, 180)];
    recommendContainer.backgroundColor = [UIColor whiteColor];

    self.secLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    self.secLabel.text = @"  推荐歌单 >";
    self.secLabel.font = [UIFont systemFontOfSize:17];
    [recommendContainer addSubview: self.secLabel];
    
    
    UIScrollView *secsongScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, 180)];
    secsongScrollView.showsHorizontalScrollIndicator = NO;
    secsongScrollView.pagingEnabled = NO;
    
    NSArray *imageNames = @[@"secimage1.jpg", @"secimage2.jpg", @"secimage3.jpg", @"secimage4.jpg", @"secimage5.jpg", @"secimage6.jpg"];
    self.titles = @[@"那个男人喜欢的音樂「coke」", @"🎵高潮节奏感超强的踩点音乐", @"经典老歌「神仙打架时代」", @"你说把爱渐渐放下会走更远💔", @"超赞的英语歌曲合集！！🥰",@"心中有山海⛰️｜华语民谣"];

    for (int i = 0; i < imageNames.count; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10 + i * 130, 10, 110, 110)];
        imgView.image = [UIImage imageNamed:imageNames[i]];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.clipsToBounds = YES;
        imgView.layer.cornerRadius = 7;
        imgView.layer.masksToBounds = YES;
        imgView.tag = 1000 + i;
        [secsongScrollView addSubview:imgView];

        UILabel *desc = [[UILabel alloc] initWithFrame:CGRectMake(10 + i * 130, 125, 120, 30)];
        desc.text = self.titles[i];
        desc.font = [UIFont systemFontOfSize:12];
        desc.numberOfLines = 2;
        desc.tag = 2000 + i;
        [secsongScrollView addSubview:desc];
    }

    secsongScrollView.contentSize = CGSizeMake(130 * imageNames.count, 140);
    [recommendContainer addSubview:secsongScrollView];
    [mainScrollView addSubview:recommendContainer];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 500, 200, 20)];
    label.text = @"近期云村热播";
    [mainScrollView addSubview:label];
    
    firstTableViewCell *thirdCell = [[firstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"thirdsong"];
    CGFloat thirdCellY = CGRectGetMaxY(label.frame);
    
    thirdCell.frame = CGRectMake(0, thirdCellY, self.view.frame.size.width + 180, 300);
    thirdCell.thirdImageArray = @[@"third0.png", @"third1.png", @"third2.png", @"third3.png", @"third4.png", @"third5.png", @"third6.png", @"third7.png", @"third8.png"];
    thirdCell.thirdTitleArray = @[@"PASSO BEM SOLTO", @"至少还有你", @"昨夜风今宵夜", @"Sunflower Feelings", @"我们俩", @"四点的海棠花未眠", @"底牌", @"一人行", @"我还想她"];
    thirdCell.thirdsubTitleArray = @[@"Atlxs", @"林忆莲", @"庄淇玟(29#)", @"kuzu", @"郭顶", @"渡", @"Max李玄/邹沛沛", @"曾舜唏", @"林俊杰"];
    
    [mainScrollView addSubview:thirdCell];
    
    mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(thirdCell.frame) + 40);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self applyCurrentTheme];
    });
}
- (void)dismissKeyboard {
    [self.searchBar resignFirstResponder];
    [self.view endEditing:YES];
}
- (void)leftBtnTapped {
    DrawerView *drawer = [[DrawerView alloc] init];
    [drawer showInView:self.view.window ?: self.view];
}
- (void)DarkModeChanged:(NSNotification *)notification {
    BOOL isDark = [notification.userInfo[@"isDark"] boolValue];
    self.isDarkMode = isDark;
    [[NSUserDefaults standardUserDefaults] setBool:isDark forKey:@"DarkModeEnabled"];
    [self applyCurrentTheme];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self applyCurrentTheme];
    });
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)applyCurrentTheme {
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    [appearance configureWithOpaqueBackground];
    appearance.backgroundColor = self.isDarkMode ? [UIColor blackColor] : [UIColor whiteColor];
    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: self.isDarkMode ? [UIColor whiteColor] : [UIColor blackColor]};

    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.standardAppearance = appearance;
    navBar.scrollEdgeAppearance = appearance;
    navBar.compactAppearance = appearance;
    if (@available(iOS 15.0, *)) {
        navBar.compactScrollEdgeAppearance = appearance;
    }

    UIImage *leftImage = self.isDarkMode ?
        [[UIImage imageNamed:@"菜单白.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] :
        [[UIImage imageNamed:@"菜单黑.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.leftBtn.image = leftImage;

    UIImage *rightImage = self.isDarkMode ?
        [[UIImage imageNamed:@"听歌识曲白.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] :
        [[UIImage imageNamed:@"听歌识曲.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.rightBtn.image = rightImage;

    self.view.backgroundColor = self.isDarkMode ? [UIColor blackColor] : [UIColor whiteColor];

    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[UIScrollView class]]) {
            subview.backgroundColor = self.isDarkMode ? [UIColor blackColor] : [UIColor whiteColor];
        }
    }

    self.searchBar.barStyle = self.isDarkMode ? UIBarStyleBlack : UIBarStyleDefault;

    UIView *recommendContainer = nil;
    for (UIView *subview in self.view.subviews) {
        for (UIView *inner in subview.subviews) {
            if ([inner isKindOfClass:[UIView class]] && inner.frame.size.height == 180) {
                recommendContainer = inner;
                break;
            }
        }
        if (recommendContainer) break;
    }
    if (recommendContainer) {
        recommendContainer.backgroundColor = self.isDarkMode ? [UIColor blackColor] : [UIColor whiteColor];

        for (UILabel *label in recommendContainer.subviews) {
            if ([label isKindOfClass:[UILabel class]]) {
                label.textColor = self.isDarkMode ? [UIColor whiteColor] : [UIColor blackColor];
            }
        }
        for (UIView *subview in recommendContainer.subviews) {
            if ([subview isKindOfClass:[UIScrollView class]]) {
                for (UIView *subsub in subview.subviews) {
                    if ([subsub isKindOfClass:[UILabel class]]) {
                        ((UILabel *)subsub).textColor = self.isDarkMode ? [UIColor whiteColor] : [UIColor blackColor];
                    }
                }
            }
        }
    }

    for (UIView *subview in self.view.subviews.firstObject.subviews) {
        if ([subview isKindOfClass:[UILabel class]] && [((UILabel *)subview).text isEqualToString:@"近期云村热播"]) {
            ((UILabel *)subview).textColor = self.isDarkMode ? [UIColor whiteColor] : [UIColor blackColor];
        }
    }
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[UIScrollView class]]) {
            for (UIView *innerView in subview.subviews) {
                if ([innerView isKindOfClass:[firstTableViewCell class]]) {
                    [(firstTableViewCell *)innerView updateTheme:self.isDarkMode];
                }
            }
        }
    }
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
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

