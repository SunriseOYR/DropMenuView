//
//  THFView.h
//  testTableViewMenu
//
//  Created by sunrise on 16/10/6.
//  Copyright © 2016年 OYR. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ORHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic, copy) void(^block)(ORHeaderFooterView *sender);
@property (nonatomic, strong) UIColor *backTintColor;
@property (nonatomic, strong) UILabel *contentLabel;


@end
