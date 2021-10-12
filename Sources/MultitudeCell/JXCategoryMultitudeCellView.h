//
//  JXCategoryView.h
//  UI系列测试
//
//  Created by jiaxin on 2018/3/15.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "JXCategoryTitleView.h"
@class JXCategoryMultitudeCellView;
@protocol JXCategoryMultitudeCellViewDelegate <JXCategoryViewDelegate>

@optional
- (NSArray <Class> *)cellClassArrayWithCategoryView:(JXCategoryMultitudeCellView *)categoryView;
- (Class)cellClassWithCategoryView:(JXCategoryMultitudeCellView *)categoryView indexPath:(NSIndexPath *)indexPath;
- (void)categoryView:(JXCategoryMultitudeCellView *)categoryView dealwithCell:(UICollectionViewCell *)cell;
@end

@interface JXCategoryMultitudeCellView : JXCategoryTitleView{
    id<JXCategoryMultitudeCellViewDelegate> _delegate;
}
@property (nonatomic, weak) id<JXCategoryMultitudeCellViewDelegate> delegate;
@end
