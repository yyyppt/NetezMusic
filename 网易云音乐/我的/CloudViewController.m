//
//  CloudViewController.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/17.
//

#import "CloudViewController.h"

@interface CloudViewController ()

@end

@implementation CloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"云盘";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.view.backgroundColor = [UIColor blackColor];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"云盘全图.jpg"]];
        imageView.frame = self.view.bounds;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    UIButton *backbtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [backbtn setImage: [UIImage imageNamed: @"返回.png"]forState: UIControlStateNormal];
    [backbtn addTarget: self action: @selector(customBackAction) forControlEvents: UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView: backbtn];
    
    self.navigationItem.leftBarButtonItem = backItem;
    [self.view addSubview:imageView];
}
- (void)customBackAction {
    [self.navigationController popViewControllerAnimated: YES];
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
