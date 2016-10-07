//
//  ORDropMenu.h
//  testTableViewMenu
//
//  Created by sunrise on 16/10/7.
//  Copyright © 2016年 OYR. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ORDropMenuView;

@protocol ORDropMenuViewDelegate <NSObject>

@required
- (void)dropMenuView:(ORDropMenuView *)menuView didsectedWithIndexPath:(NSIndexPath *)indexpath;

@end

@interface ORDropMenuView : UIView

@property (nonatomic, assign) CGFloat rowHeight;
@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, strong) UIColor *headerTintColor;

@property (nonatomic, assign) id<ORDropMenuViewDelegate> delegate;


// *** - optioons like @[@[1,2],@[3,4],@[4,5]]
- (instancetype)initWithFrame:(CGRect)frame options:(NSArray<NSArray *> *)options;

@end

@interface ORDropMenuModel : NSObject

@property (nonatomic, strong) NSArray *option;
@property (nonatomic, strong) NSString *title;

@end
