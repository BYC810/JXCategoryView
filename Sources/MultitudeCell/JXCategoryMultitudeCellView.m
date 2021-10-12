//
//  JXCategoryView.m
//  UI系列测试
//
//  Created by jiaxin on 2018/3/15.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXCategoryMultitudeCellView.h"

@implementation JXCategoryMultitudeCellView
@dynamic delegate;
- (void)setDelegate:(id<JXCategoryMultitudeCellViewDelegate>)delegate {
    _delegate = delegate;
    if ([self.delegate respondsToSelector:@selector(cellClassArrayWithCategoryView:)]) {
        NSArray *arr = [self.delegate cellClassArrayWithCategoryView:self];
        for (Class cellClass in arr) {
            [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
        }
    }else {
        [self.collectionView registerClass:[self preferredCellClass] forCellWithReuseIdentifier:NSStringFromClass([self preferredCellClass])];
    }
}

- (id<JXCategoryMultitudeCellViewDelegate>)delegate {
    return _delegate;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(cellClassWithCategoryView:indexPath:)]) {
        Class cellClass = [self.delegate cellClassWithCategoryView:self indexPath:indexPath];
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
        if ([self.delegate respondsToSelector:@selector(categoryView:dealwithCell:)]) {
            [self.delegate categoryView:self dealwithCell:cell];
        }
        return cell;
    }
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self preferredCellClass]) forIndexPath:indexPath];
}
@end
