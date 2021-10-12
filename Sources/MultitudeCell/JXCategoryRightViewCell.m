//
//  JXCategoryRightViewCell.m
//  JXCategoryView
//
//  Created by BYC on 2021/10/12.
//

#import "JXCategoryRightViewCell.h"

@interface JXCategoryRightViewCell()
@property (nonatomic, strong) UIStackView *stackView1;
@property (nonatomic, strong) UIStackView *stackView2;
@end

@implementation JXCategoryRightViewCell

- (void)initializeViews {
    
    _stackView1 = [[UIStackView alloc] init];
    _stackView1.axis = UILayoutConstraintAxisHorizontal;
    _stackView1.spacing = 4;
    _stackView1.translatesAutoresizingMaskIntoConstraints = NO;
    _stackView2 = [[UIStackView alloc] init];
    _stackView2.axis = UILayoutConstraintAxisVertical;
    _stackView2.spacing = 4;
    _stackView2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_stackView1];
    
    self.isAccessibilityElement = true;
    self.accessibilityTraits = UIAccessibilityTraitButton;
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.clipsToBounds = YES;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_stackView2 addArrangedSubview:self.titleLabel];

    self.titleLabelCenterX = [_stackView1.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor constant:0];
    self.titleLabelCenterY = [_stackView1.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor constant:0];

    self.titleMaskLayer = [CALayer layer];
    self.titleMaskLayer.backgroundColor = [UIColor redColor].CGColor;

    self.maskTitleLabel = [[UILabel alloc] init];
    self.maskTitleLabel.hidden = YES;
    self.maskTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.maskTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.maskTitleLabel];

    self.maskTitleLabelCenterX = [self.maskTitleLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor];
    self.maskTitleLabelCenterY = [self.maskTitleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor];

    self.maskTitleMaskLayer = [CALayer layer];
    self.maskTitleMaskLayer.backgroundColor = [UIColor orangeColor].CGColor;
    self.maskTitleLabel.layer.mask = self.maskTitleMaskLayer;

    [NSLayoutConstraint activateConstraints:@[self.titleLabelCenterX, self.titleLabelCenterY, self.maskTitleLabelCenterX, self.maskTitleLabelCenterY]];
}

- (void)setDelegate:(id<JXCategoryRightViewCellDelegate>)delegate {
    if (!_delegate) {
        if ([delegate respondsToSelector:@selector(rightViewWithCategoryRightViewCell:)]) {
            UIView *view = [delegate rightViewWithCategoryRightViewCell:self];
            if ([delegate respondsToSelector:@selector(rightViewCopyWithCategoryRightViewCell:)]) {
                UIView *view1 = [delegate rightViewCopyWithCategoryRightViewCell:self];
                view1.alpha = 0;
                [_stackView1 addArrangedSubview:view1];
            }
            [_stackView1 addArrangedSubview:_stackView2];
            [_stackView1 addArrangedSubview:view];
        }
    }
    _delegate = delegate;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(selectedIndexWithCategoryRightViewCell:)]) {
        NSInteger index = [self.delegate selectedIndexWithCategoryRightViewCell:self];
        if (index == 0) {
            if ([self.delegate respondsToSelector:@selector(bottomViewWithCategoryRightViewCell:)]) {
                UIView *view = [self.delegate bottomViewWithCategoryRightViewCell:self];
                if (self.stackView2.subviews.count > 1) {                
                    [self.stackView2.subviews.lastObject removeFromSuperview];
                }
                if (view) {
                    [self.stackView2 addArrangedSubview:view];
                }
            }
            return;
        }
    }
    [super touchesBegan:touches withEvent:event];
}


@end
