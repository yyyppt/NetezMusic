//
//  MyDrawerCell.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/17.
//

#import "MyDrawerCell.h"

@implementation MyDrawerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _DrawimageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
        _DrawimageView.contentMode = UIViewContentModeScaleAspectFit;
        _DrawimageView.layer.cornerRadius = 5;
        _DrawimageView.clipsToBounds = YES;
        [self.contentView addSubview:_DrawimageView];
        
        _title = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, 30)];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_title];

    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
