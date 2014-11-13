//
//  AutoSizeCell.h
//  TestAutoLayoutTableView
//
//  Created by 袁仕崇 on 14/11/6.
//  Copyright (c) 2014年 wilson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSYAutoSizeCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *bodyLabel;

@property (strong, nonatomic) UIImageView *iconView;
@property (strong, nonatomic) UIView *whiteView;

//@property (weak, nonatomic) IBOutlet UILabel *Label;
//@property (weak, nonatomic) IBOutlet UIView *cornerView;
- (void)updateFonts;


@end
