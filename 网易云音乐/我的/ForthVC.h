//
//  ForthVC.h
//  网易云音乐
//
//  Created by yyyyy on 2025/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForthVC : UIViewController

@property (nonatomic, strong) UIScrollView *mainscrollView;

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn1;
@property (nonatomic, strong) UIButton *rightBtn2;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UIButton *imageBtn;
@property (nonatomic, strong) UIButton *avatarButton;

@property (nonatomic, strong) UIButton *bottombtn1;
@property (nonatomic, strong) UIButton *bottombtn2;
@property (nonatomic, strong) UIButton *bottombtn3;
@property (nonatomic, strong) UIButton *bottombtn4;
@property (nonatomic, strong) UIButton *bottombtn5;

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIView *indicatorLine;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@property (nonatomic, strong) UIView *view3;
@property (nonatomic, strong) UILabel *labelSong1;

@property (nonatomic, strong) UITableView *tableView1;
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, assign) BOOL isDarkMode;
@end

NS_ASSUME_NONNULL_END
