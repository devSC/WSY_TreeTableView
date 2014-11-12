//
//  AutoSizeCell.m
//  TestAutoLayoutTableView
//
//  Created by 袁仕崇 on 14/11/6.
//  Copyright (c) 2014年 wilson. All rights reserved.
//

#import "WSYAutoSizeCell.h"
#import "ALView+PureLayout.h"
@interface WSYAutoSizeCell()

@property (nonatomic, assign) BOOL didSetupConstraints;
#define kLabelHorizontalInsets      12.0f
#define kLabelVerticalInsets        5.0f


@end
@implementation WSYAutoSizeCell
//
//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        self.titleLabel = [UILabel newAutoLayoutView];
//        [self.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
//        [self.titleLabel setNumberOfLines:1];
//        [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
//        [self.titleLabel setTextColor:[UIColor blackColor]];
//        self.titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1];
//        
//        self.bodyLabel = [UILabel newAutoLayoutView];
//        [self.bodyLabel setLineBreakMode:NSLineBreakByTruncatingTail];
//        [self.bodyLabel setNumberOfLines:0];
//        [self.bodyLabel setTextAlignment:NSTextAlignmentLeft];
//        [self.bodyLabel setTextColor:[UIColor darkGrayColor]];
//        self.bodyLabel.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.1];
//        
//        self.contentView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
//        [self.contentView addSubview:self.bodyLabel];
//        
//        [self updateFonts];
//    }
//    
//    return self;
//}
//
//
//- (void)awakeFromNib {
//    // Initialization code
////    self.bodyLabel = [UILabel newAutoLayoutView];
////    [self.bodyLabel setLineBreakMode:NSLineBreakByTruncatingTail];
////    [self.bodyLabel setNumberOfLines:0];
////    [self.bodyLabel setTextAlignment:NSTextAlignmentLeft];
////    [self.bodyLabel setTextColor:[UIColor darkGrayColor]];
////    self.bodyLabel.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.1];
////    
////    self.contentView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
////    
////    [self.contentView addSubview:self.bodyLabel];
////    [self updateFonts];
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
//    // need to use to set the preferredMaxLayoutWidth below.
//    [self.contentView setNeedsLayout];
//    [self.contentView layoutIfNeeded];
//    
//    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
//    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
//    self.bodyLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.bodyLabel.frame);
//}
//- (void)updateConstraints
//{
//    if (!self.didSetupConstraints) {
//        // Note: if the constraints you add below require a larger cell size than the current size (which is likely to be the default size {320, 44}), you'll get an exception.
//        // As a fix, you can temporarily increase the size of the cell's contentView so that this does not occur using code similar to the line below.
//        //      See here for further discussion: https://github.com/Alex311/TableCellWithAutoLayout/commit/bde387b27e33605eeac3465475d2f2ff9775f163#commitcomment-4633188
//        // self.contentView.bounds = CGRectMake(0.0f, 0.0f, 99999.0f, 99999.0f);
//        
//        [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
//            [self.bodyLabel autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
//        }];
//        [self.bodyLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLabelVerticalInsets];
//        [self.bodyLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets];
//        [self.bodyLabel autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
//        
//        // This is the constraint that connects the title and body labels. It is a "greater than or equal" inequality so that if the row height is
//        // slightly larger than what is actually required to fit the cell's subviews, the extra space will go here. (This is the case on iOS 7
//        // where the cell separator is only 0.5 points tall, but in the tableView:heightForRowAtIndexPath: method of the view controller, we add
//        // a full 1.0 point in extra height to account for it, which results in 0.5 points extra space in the cell.)
//        // See https://github.com/smileyborg/TableViewCellWithAutoLayout/issues/3 for more info.
////        [self.bodyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:kLabelVerticalInsets relation:NSLayoutRelationGreaterThanOrEqual];
////        
////        [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
////            [self.bodyLabel autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
////        }];
////        [self.bodyLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets];
////        [self.bodyLabel autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
////        [self.bodyLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kLabelVerticalInsets];
//        
//        self.didSetupConstraints = YES;
//    }
//    
//    [super updateConstraints];
//}
//
//- (void)updateFonts
//{
////    self.Label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
//    self.bodyLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
//}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.titleLabel = [UILabel newAutoLayoutView];
//        [self.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
//        [self.titleLabel setNumberOfLines:1];
//        [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
//        [self.titleLabel setTextColor:[UIColor blackColor]];
//        self.titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.1];
        self.contentView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.2];
        self.whiteView = [UIView newAutoLayoutView];
        self.whiteView.layer.cornerRadius = 5.0;
        [self.whiteView setBackgroundColor:[UIColor whiteColor]];
        
        
        self.bodyLabel = [UILabel newAutoLayoutView];
        [self.bodyLabel setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.bodyLabel setNumberOfLines:0];
        [self.bodyLabel setTextAlignment:NSTextAlignmentLeft];
        [self.bodyLabel setTextColor:[UIColor darkGrayColor]];
        
//        self.bodyLabel.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.1];
        
        
//        self.contentView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
        
//        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:_whiteView];
        [self.contentView addSubview:self.bodyLabel];
        [self updateFonts];
    }
    
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        // Note: if the constraints you add below require a larger cell size than the current size (which is likely to be the default size {320, 44}), you'll get an exception.
        // As a fix, you can temporarily increase the size of the cell's contentView so that this does not occur using code similar to the line below.
        //      See here for further discussion: https://github.com/Alex311/TableCellWithAutoLayout/commit/bde387b27e33605eeac3465475d2f2ff9775f163#commitcomment-4633188
        // self.contentView.bounds = CGRectMake(0.0f, 0.0f, 99999.0f, 99999.0f);
        
//        [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
//            [self.titleLabel autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
//        }];
//        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLabelVerticalInsets];
//        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets];
//        [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        
        // This is the constraint that connects the title and body labels. It is a "greater than or equal" inequality so that if the row height is
        // slightly larger than what is actually required to fit the cell's subviews, the extra space will go here. (This is the case on iOS 7
        // where the cell separator is only 0.5 points tall, but in the tableView:heightForRowAtIndexPath: method of the view controller, we add
        // a full 1.0 point in extra height to account for it, which results in 0.5 points extra space in the cell.)
        // See https://github.com/smileyborg/TableViewCellWithAutoLayout/issues/3 for more info.
        
//        [self.bodyLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:kLabelVerticalInsets relation:NSLayoutRelationGreaterThanOrEqual];
        [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.whiteView autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
//        [self.whiteView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(2, 2, 2, 2) excludingEdge:ALEdgeTop];
        [self.whiteView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLabelVerticalInsets-2];
        [self.whiteView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets-2];
        [self.whiteView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets-2];
        [self.whiteView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kLabelVerticalInsets-2];

        
        
        [UIView autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.bodyLabel autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.bodyLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:kLabelVerticalInsets];
        [self.bodyLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets];
        [self.bodyLabel autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        [self.bodyLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:kLabelVerticalInsets];
        
        self.didSetupConstraints = YES;
    }
    
    [super updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Make sure the contentView does a layout pass here so that its subviews have their frames set, which we
    // need to use to set the preferredMaxLayoutWidth below.
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    // Set the preferredMaxLayoutWidth of the mutli-line bodyLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
    self.bodyLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.bodyLabel.frame);
}

- (void)updateFonts
{
//    self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.bodyLabel.font = [UIFont fontWithName:@"Avenir Light" size:16];
}


@end
