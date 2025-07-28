//
//  FirstVC.h
//  网易云音乐
//
//  Created by yyyyy on 2025/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstVC : UIViewController
@property (nonatomic, strong) UIBarButtonItem *leftBtn;
@property (nonatomic, strong) UIBarButtonItem *rightBtn;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UIScrollView *firsongScrollView;

@property (nonatomic, strong) UIScrollView *secsongScrollView;
@property (nonatomic, strong) UILabel *secLabel;
@property (nonatomic, strong) NSArray *secArray;
@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UILabel *thirdLabel;
@property (nonatomic, assign) BOOL isDarkMode;
- (void)updateTheme:(BOOL)isDarkMode;
@end

NS_ASSUME_NONNULL_END
