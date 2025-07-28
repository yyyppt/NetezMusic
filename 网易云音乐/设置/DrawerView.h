//
//  DrawerView.h
//  网易云音乐
//
//  Created by yyyyy on 2025/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawerView : UIView<UITableViewDelegate, UITableViewDataSource>


- (void)showInView: (UIView *)parentView;
- (void)hide;
@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, strong) UIImageView *image1;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIImageView *image2;


@property (nonatomic, strong)  NSArray *sections;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView2;
@property (nonatomic, assign) BOOL isDarkMode;
@end

NS_ASSUME_NONNULL_END
