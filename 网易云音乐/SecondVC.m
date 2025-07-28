//
//  SecondVC.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/15.
//

#import "SecondVC.h"

@interface SecondVC ()


@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DarkModeChanged:) name:@"DarkModeSwitchNotification" object:nil];
    self.isDarkMode = [[NSUserDefaults standardUserDefaults] boolForKey:@"DarkModeEnabled"];
    [self updateThemeWithDarkMode:self.isDarkMode];
    // Do any additional setup after loading the view.
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
    self.view.backgroundColor = isDark ? [UIColor blackColor] : [UIColor whiteColor];
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
