//
//  MyfinallDrawerCell.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/18.
//

#import "MyfinallDrawerCell.h"

@implementation MyfinallDrawerCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _moon = [[UIImageView alloc] initWithFrame: CGRectMake(10, 10, 30, 30)];
        _moon.contentMode = UIViewContentModeScaleAspectFit;
        _moon.layer.cornerRadius = 5;
        _moon.clipsToBounds = YES;
        [self.contentView addSubview:_moon];
        
        _moonLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, 30)];
        _moonLabel.textAlignment = NSTextAlignmentLeft;
        _moonLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_moonLabel];
        
        _moonSwitch = [[UISwitch alloc] initWithFrame: CGRectMake(240, 10, 50, 30)];
        BOOL savedDarkMode = [[NSUserDefaults standardUserDefaults] boolForKey:@"DarkModeEnabled"];
        _moonSwitch.on = savedDarkMode;
        [_moonSwitch addTarget: self action: @selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview: _moonSwitch];
    }
    return self;
}

- (void)switchChanged:(UISwitch *)sender {
    BOOL isOn = sender.isOn;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DarkModeSwitchNotification"
                        object:nil userInfo:@{@"isDark": @(isOn)}];
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:@"DarkModeEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
