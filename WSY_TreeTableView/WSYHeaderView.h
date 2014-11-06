//
//  WSYHeaderView.h
//  TestAutoLayoutTableView
//
//  Created by 袁仕崇 on 14/11/6.
//  Copyright (c) 2014年 wilson. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WSYHeaderViewDelegate;
@interface WSYHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *conentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;
@property (weak, nonatomic) IBOutlet UIView *cornView;

@property (assign, nonatomic) NSInteger section;

@property (assign, nonatomic) id<WSYHeaderViewDelegate>delegate;
@end

@protocol WSYHeaderViewDelegate <NSObject>

- (void)WSYHeaderView: (WSYHeaderView *)headerView didPressed: (NSInteger)section;

@end