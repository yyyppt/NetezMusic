//
//  MymusicCell.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/17.
//

#import "MymusicCell.h"

@implementation MymusicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 60, 60)];
        self.iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.iconImageView.clipsToBounds = YES;
        self.iconImageView.layer.cornerRadius = 6;
        [self.contentView addSubview:self.iconImageView];

        self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(90, 15, 220, 20)];
        self.titleLabel1.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:self.titleLabel1];

        self.titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(90, 45, 220, 15)];
        self.titleLabel2.font = [UIFont systemFontOfSize:13];
        self.titleLabel2.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.titleLabel2];

        UIView *selectedBg = [[UIView alloc] init];
        selectedBg.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        self.selectedBackgroundView = selectedBg;
    }
    return self;
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
