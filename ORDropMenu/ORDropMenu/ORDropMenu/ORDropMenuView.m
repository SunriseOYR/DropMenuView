//
//  ORDropMenu.m
//  testTableViewMenu
//
//  Created by sunrise on 16/10/7.
//  Copyright © 2016年 OYR. All rights reserved.
//

#import "ORDropMenuView.h"
#import "ORHeaderFooterView.h"

@interface ORDropMenuView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *options;

@end

@implementation ORDropMenuView

- (instancetype)initWithFrame:(CGRect)frame options:(NSArray<NSArray *> *)options
{
    self = [super initWithFrame:frame];
    if (self) {
        _options = options;
         [self addSubview:self.tableView];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ORDropMenuModel *model = self.dataSource[section];
    return  model.option.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdf" forIndexPath:indexPath];
    ORDropMenuModel *model = self.dataSource[indexPath.section];
    cell.textLabel.text = model.option[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    ORHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerIdf"];
    ORDropMenuModel *model = self.dataSource[section];
    header.contentLabel.text = model.title;
    
    header.block = ^(ORHeaderFooterView *sender) {
        NSLog(@"section:%ld",section);
        [self headViewSelected:sender section:section];
    };
    
    header.backgroundColor = [UIColor redColor];
    return header;
}

- (void)headViewSelected:(ORHeaderFooterView *)sender section:(NSInteger)section {
    
    ORDropMenuModel *model = self.dataSource[section];
    
    NSMutableArray *paths = [NSMutableArray array];
    for (int i = 0; i < [self.options[section] count]; i ++) {
        [paths addObject:[NSIndexPath indexPathForRow:i inSection:section]];
    }
    
    BOOL isExist = model.option;
    
    if (isExist) {
        model.option = nil;
        
        [self.tableView deleteRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    
    model.option = self.options[section];
    
    
    [self.tableView insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationFade];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(dropMenuView:didsectedWithIndexPath:)]) {
        [self.delegate dropMenuView:self didsectedWithIndexPath:indexPath];
    }
    
    ORHeaderFooterView *heder = (ORHeaderFooterView *)[tableView headerViewForSection:indexPath.section];
    heder.contentLabel.text = self.options[indexPath.section][indexPath.row];
    heder.backTintColor = self.headerTintColor ? self.headerTintColor : [UIColor lightGrayColor];
    [self headViewSelected:heder section:indexPath.section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return _headerHeight == 0 ? 50 : _headerHeight;
}

#pragma mark -- getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView= ({
            
            UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
            tableView.rowHeight = 60;
            tableView.dataSource = self;
            tableView.delegate = self;
            [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdf"];
            [tableView registerClass:[ORHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"headerIdf"];
            tableView;
        });
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        for (int i = 0; i < 4; i ++) {
            
            ORDropMenuModel *model = [[ORDropMenuModel alloc] init];
            model.title = _options[i][0];
            [_dataSource addObject:model];
        }
    }
    return _dataSource;
}


#pragma mark -- setter
- (void)setRowHeight:(CGFloat)rowHeight {
    self.tableView.rowHeight = rowHeight;
}

- (void)setHeaderHeight:(CGFloat)headerHeight {
    _headerHeight = headerHeight;
    [self.tableView reloadData];
}

- (void)setHeaderTintColor:(UIColor *)headerTintColor {
    _headerTintColor = headerTintColor;
    [self.tableView reloadData];
}

@end

@implementation ORDropMenuModel

@end
