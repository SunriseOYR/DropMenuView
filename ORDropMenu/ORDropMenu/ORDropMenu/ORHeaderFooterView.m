//
//  THFView.m
//  testTableViewMenu
//
//  Created by sunrise on 16/10/6.
//  Copyright © 2016年 OYR. All rights reserved.
//

#import "ORHeaderFooterView.h"

@interface ORHeaderFooterView ()

@property (nonatomic, strong) UIView *tintColorView;
@property (nonatomic, strong) UIButton *button;

@end

@implementation ORHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUserInterface];
    }
    return self;
}

- (void)initUserInterface {
    
    [self.contentView addSubview:self.tintColorView];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.button];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tintColorView.frame = self.bounds;
    self.contentLabel.frame = CGRectMake(10, 0, CGRectGetWidth(self.bounds) - 10, CGRectGetHeight(self.bounds));
    self.button.frame = self.bounds;
}


- (void)onButton {
    
    if (self.block) {
        self.block(self);
    }
}

#pragma mark -- getter
- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    return _contentLabel;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(onButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UIView *)tintColorView {
    if (!_tintColorView) {
        _tintColorView = [[UIView alloc] init];
        _tintColorView.backgroundColor = [UIColor lightGrayColor];
    }
    return _tintColorView;
}

- (void)setBackTintColor:(UIColor *)backTintColor {
    self.tintColorView.backgroundColor = backTintColor;
}
@end
