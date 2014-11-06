//
//  WSYHeaderView.m
//  TestAutoLayoutTableView
//
//  Created by 袁仕崇 on 14/11/6.
//  Copyright (c) 2014年 wilson. All rights reserved.
//

#import "WSYHeaderView.h"

@implementation WSYHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)wsyHeaderViewDidPressed:(id)sender {
    [_delegate WSYHeaderView:self didPressed:_section];
}

@end
