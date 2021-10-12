//
//  JXCategoryRightViewCell.h
//  JXCategoryView
//
//  Created by BYC on 2021/10/12.
//

#import "JXCategoryTitleCell.h"
@class JXCategoryRightViewCell;
@protocol JXCategoryRightViewCellDelegate <NSObject>
- (UIView *)rightViewWithCategoryRightViewCell:(JXCategoryRightViewCell *)cell;
- (UIView *)rightViewCopyWithCategoryRightViewCell:(JXCategoryRightViewCell *)cell;
- (UIView *)bottomViewWithCategoryRightViewCell:(JXCategoryRightViewCell *)cell;
- (NSInteger)selectedIndexWithCategoryRightViewCell:(JXCategoryRightViewCell *)cell;
@end

@interface JXCategoryRightViewCell : JXCategoryTitleCell
@property (nonatomic, weak) id<JXCategoryRightViewCellDelegate> delegate;
@end
