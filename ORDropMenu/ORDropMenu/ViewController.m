//
//  ViewController.m
//  ORDropMenu
//
//  Created by sunrise on 16/10/7.
//  Copyright © 2016年 OYR. All rights reserved.
//

#import "ViewController.h"
#import "ORHeaderFooterView.h"
#import "ORDropMenuView.h"

@interface ViewController ()<ORDropMenuViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = @[@[@"CCTV-1",@"CCTV-2",@"CCTV-3",@"CCTV-4",@"CCTV-5"],@[@"AATV-1",@"AATV-2",@"AATV-3",@"AATV-4"],@[@"BBTV-1",@"BBTV-2",@"DDTV-3"],@[@"DDTV-1",@"DDTV-2",@"DDTV-3",@"DDTV-4",@"DDTV-5",@"DDTV-6"]];
    
    //    [self.view addSubview:self.tableView];
    
    ORDropMenuView * menu = [[ORDropMenuView alloc] initWithFrame:self.view.bounds options:array];
    
    menu.headerHeight = 45;
    menu.rowHeight = 50;
    menu.delegate = self;
    [self.view addSubview:menu];

}


- (void)dropMenuView:(ORDropMenuView *)menuView didsectedWithIndexPath:(NSIndexPath *)indexpath {
    NSLog(@"%ld", indexpath.section);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
