//
//  SceneDelegate.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/15.
//

#import "SceneDelegate.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "ForthVC.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    //  在 willConnectToSession 方法最开始添加从NSUserDefaults读取DarkModeEnabled的代码
    self.isDarkMode = [[NSUserDefaults standardUserDefaults] boolForKey:@"DarkModeEnabled"];
    FirstVC *vc1 = [[FirstVC alloc] init];
    UIImage *vcFirst = [[UIImage imageNamed:@"推荐.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"推荐" image:vcFirst selectedImage:vcFirst];
    
    SecondVC *vc2 = [[SecondVC alloc] init];
    UIImage *vcSecond = [[UIImage imageNamed: @"无限.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"漫游" image: vcSecond selectedImage: vcSecond];
    
    ThirdVC *vc3 = [[ThirdVC alloc] init];
    UIImage *vcThird = [[UIImage imageNamed: @"笔记.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"笔记" image: vcThird selectedImage: vcThird];
    
    ForthVC *vc4 = [[ForthVC alloc] init];
    UIImage *vcForth = [[UIImage imageNamed: @"我的.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    vc4.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"我的" image: vcForth selectedImage: vcForth];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController: vc1];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController: vc2];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController: vc3];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController: vc4];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[nav1, nav2, nav3, nav4];
    
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(DarkModeChanged:) name: @"DarkModeSwitchNotification" object: nil];
    // 使用UITabBarAppearance设置tabBar外观
    UITabBarAppearance *tabBarAppearance = [[UITabBarAppearance alloc] init];
    [tabBarAppearance configureWithOpaqueBackground];
    if (self.isDarkMode) {
        tabBarAppearance.backgroundColor = [UIColor blackColor];
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = [UIColor whiteColor];
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = [UIColor grayColor];
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor grayColor]};
    } else {
        tabBarAppearance.backgroundColor = [UIColor whiteColor];
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = [UIColor blackColor];
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = [UIColor grayColor];
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor grayColor]};
    }
    tabBarController.tabBar.standardAppearance = tabBarAppearance;
    if (@available(iOS 15.0, *)) {
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance;
    }
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
}

- (void)DarkModeChanged:(NSNotification *)notification {
    BOOL isDark = [notification.userInfo[@"isDark"] boolValue];
    self.isDarkMode = isDark;
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    // 使用UITabBarAppearance设置tabBar外观
    UITabBarAppearance *tabBarAppearance = [[UITabBarAppearance alloc] init];
    [tabBarAppearance configureWithOpaqueBackground];
    if (self.isDarkMode) {
        tabBarAppearance.backgroundColor = [UIColor blackColor];
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = [UIColor whiteColor];
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = [UIColor grayColor];
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor grayColor]};
    } else {
        tabBarAppearance.backgroundColor = [UIColor whiteColor];
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = [UIColor blackColor];
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = [UIColor grayColor];
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor grayColor]};
    }
    tabBarController.tabBar.standardAppearance = tabBarAppearance;
    
    tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance;
    
}
- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
