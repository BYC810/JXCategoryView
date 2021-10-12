//
//  TestViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/8.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "TitleViewController.h"
#import "JXCategoryTitleView.h"
#import "JXCategoryTitleCell.h"
#import "JXCategoryRightViewCell.h"
#import "JXCategoryMultitudeCellView.h"

@interface TitleViewController ()
<JXCategoryTitleViewDataSource,
JXCategoryRightViewCellDelegate>
@property (nonatomic, strong) JXCategoryMultitudeCellView *myCategoryView;
@end

@implementation TitleViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titles = @[@"螃蟹1", @"麻辣小龙虾1", @"苹果1", @"营养胡萝卜1", @"葡萄1", @"美味西瓜1", @"香蕉1", @"香甜菠萝1", @"鸡肉1", @"鱼1", @"海星1"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myCategoryView.titles = self.titles;
    self.myCategoryView.titleDataSource = self;
}

- (JXCategoryMultitudeCellView *)myCategoryView {
    return (JXCategoryMultitudeCellView *)self.categoryView;
}

- (JXCategoryBaseView *)preferredCategoryView {
    return [[JXCategoryMultitudeCellView alloc] init];
}

#pragma mark - JXCategoryMultitudeCellViewDelegate
- (NSArray <Class> *)cellClassArrayWithCategoryView:(JXCategoryBaseView *)categoryView {
    return @[JXCategoryRightViewCell.class,JXCategoryTitleCell.class];
}

- (Class)cellClassWithCategoryView:(JXCategoryBaseView *)categoryView indexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return JXCategoryRightViewCell.class;
    }
    return JXCategoryTitleCell.class;
}

- (void)categoryView:(JXCategoryMultitudeCellView *)categoryView dealwithCell:(UICollectionViewCell *)cell {
    if ([cell respondsToSelector:@selector(setDelegate:)]) {
        [cell performSelector:@selector(setDelegate:) withObject:self];
    }
}

#pragma mark - JXCategoryRightViewCellDelegate
- (UIView *)rightViewWithCategoryRightViewCell:(JXCategoryRightViewCell *)cell {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_down.png"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

- (UIView *)rightViewCopyWithCategoryRightViewCell:(JXCategoryRightViewCell *)cell {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_down.png"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    return imageView;
}

- (UIView *)bottomViewWithCategoryRightViewCell:(JXCategoryRightViewCell *)cell {
    UILabel *label = UILabel.new;
    label.text = @"1234";
    return label;
}

- (NSInteger)selectedIndexWithCategoryRightViewCell:(JXCategoryRightViewCell *)cell {
    return self.myCategoryView.selectedIndex;
}

#pragma mark - JXCategoryTitleViewDataSource
- (CGFloat)categoryTitleView:(JXCategoryTitleView *)titleView widthForTitle:(NSString *)title index:(NSInteger)index {
    if (index == 0) {
       CGFloat width = ceilf([title boundingRectWithSize:CGSizeMake(MAXFLOAT, titleView.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : titleView.titleFont} context:nil].size.width);
        return width + 4 + 100;
    }
    return 0;
}
@end
