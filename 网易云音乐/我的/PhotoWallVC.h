//
//  PhotoWallVC.h
//  网易云音乐
//
//  Created by yyyyy on 2025/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PhotoWallDelegate <NSObject>

- (void)didSelectImage: (UIImage *) image;

@end

@interface PhotoWallVC : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) id<PhotoWallDelegate> delegate;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *images;

@end

NS_ASSUME_NONNULL_END
