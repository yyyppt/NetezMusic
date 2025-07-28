//
//  firstTableViewCell.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/15.
//

#import "firstTableViewCell.h"

@implementation firstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self) {
//        self.reuseIdentifier = reuseIdentifier;
        if ([reuseIdentifier isEqualToString: @"thirdsong"]) {
            self.thirdsongScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 430)];
            self.thirdsongScrollView.pagingEnabled = YES;
            self.thirdsongScrollView.showsHorizontalScrollIndicator = NO;
            [self.contentView addSubview: self.self.thirdsongScrollView];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if ([self.reuseIdentifier isEqualToString: @"thirdsong"]) {
        BOOL isDarkMode = self.isDarkMode;
        self.backgroundColor = isDarkMode ? [UIColor blackColor] : [UIColor whiteColor];

        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat cellHeight = 100;
        CGFloat spacing = 10;
        [self.thirdsongScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        for (int page = 0; page < 3; page++) {
            UIScrollView *pageView = [[UIScrollView alloc] initWithFrame: CGRectMake(page * width, 0, width, 430)];
            pageView.showsVerticalScrollIndicator = YES;
            pageView.showsHorizontalScrollIndicator = NO;
            for (int i = 0; i < 3; i++) {
                int index = page * 3 + i;
                if (index >= self.thirdImageArray.count) {
                    break;
                }
                CGFloat y = i * cellHeight + spacing;
                UIView *cell = [[UIView alloc] initWithFrame:CGRectMake(20, y, width - 40, cellHeight)];
                cell.backgroundColor = isDarkMode ? [UIColor colorWithWhite:0.15 alpha:1.0] : [UIColor colorWithWhite:1.0 alpha:1.0];
                cell.layer.cornerRadius = 10;

                UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 70, 70)];
                imageView.image = [UIImage imageNamed:self.thirdImageArray[index]];
                imageView.contentMode = UIViewContentModeScaleAspectFill;
                imageView.clipsToBounds = YES;
                imageView.layer.cornerRadius = 7;
                [cell addSubview:imageView];

                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 28, 200, 25)];
                titleLabel.text = self.thirdTitleArray[index];
                titleLabel.font = [UIFont systemFontOfSize:17];
                titleLabel.textColor = isDarkMode ? [UIColor whiteColor] : [UIColor blackColor];
                [cell addSubview:titleLabel];

                UILabel *subLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 55, 100, 15)];
                subLabel.text = self.thirdsubTitleArray[index];
                subLabel.font = [UIFont systemFontOfSize:13];
                subLabel.textColor = isDarkMode ? [UIColor lightGrayColor] : [UIColor grayColor];
                [cell addSubview:subLabel];

                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(cell.frame.size.width - 48, 35, 23, 23);
                [btn addTarget:self action:@selector(playButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = index;
                UIImage *normalImage = [UIImage imageNamed:@"播放.png"];
                UIImage *highlightedImage = [UIImage imageNamed:@"开始播放.png"];
                [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
                [btn setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
                [cell addSubview:btn];

                [pageView addSubview:cell];
            }
            pageView.contentSize = CGSizeMake(width, 3 * cellHeight + 2 * spacing + 150);
            [self.thirdsongScrollView addSubview:pageView];
        }
        self.thirdsongScrollView.contentSize = CGSizeMake(width * 3, 430);
    }
}
- (void)playButtonTapped:(UIButton *)sender {
    if (self.selectedPlayButton == sender) {
        UIImage *normalImage = [UIImage imageNamed:@"播放.png"];
        if (normalImage) {
            [sender setBackgroundImage:normalImage forState:UIControlStateNormal];
        }
        self.selectedPlayButton = nil;

    } else {
        if (self.selectedPlayButton) {
            [self.selectedPlayButton setBackgroundImage:[UIImage imageNamed:@"播放.png"] forState:UIControlStateNormal];
        }
        
        [sender setBackgroundImage:[UIImage imageNamed:@"开始播放.png"] forState:UIControlStateNormal];
        self.selectedPlayButton = sender;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (void)updateTheme:(BOOL)isDarkMode {
    self.isDarkMode = isDarkMode;
    [self setNeedsLayout];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
