//
//  firstTableViewCell.h
//  网易云音乐
//
//  Created by yyyyy on 2025/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface firstTableViewCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *thirdsongScrollView;
@property (nonatomic, strong) NSArray *thirdImageArray;
@property (nonatomic, strong) NSArray *thirdTitleArray;
@property (nonatomic, strong) NSArray *thirdsubTitleArray;
@property (nonatomic, strong, nullable) UIButton *selectedPlayButton;

@property (nonatomic, assign) BOOL isDarkMode;
- (void)updateTheme:(BOOL)isDarkMode;
@end

NS_ASSUME_NONNULL_END
