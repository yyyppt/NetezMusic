//
//  PhotoWallVC.m
//  网易云音乐
//
//  Created by yyyyy on 2025/7/16.
//

#import "PhotoWallVC.h"

@interface PhotoWallVC ()

@end

@implementation PhotoWallVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.images = @[@"头像1.jpg", @"头像2.jpg", @"头像3.jpg", @"头像4.jpg", @"头像5.jpg", @"头像6.jpg", @"头像7.jpg", @"头像8.jpg", @"头像9.jpg"];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 20;
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame: self.view.bounds collectionViewLayout: layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass: [UICollectionViewCell class] forCellWithReuseIdentifier: @"cell"];
    [self.view addSubview: self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.images.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }

    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.images[indexPath.item]]];
    imgView.frame = cell.contentView.bounds;
    imgView.layer.cornerRadius = 50;
    imgView.layer.masksToBounds = YES;
    [cell.contentView addSubview:imgView];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *selectedImage = [UIImage imageNamed:self.images[indexPath.item]];
    if ([self.delegate respondsToSelector:@selector(didSelectImage:)]) {
        [self.delegate didSelectImage:selectedImage];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
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
