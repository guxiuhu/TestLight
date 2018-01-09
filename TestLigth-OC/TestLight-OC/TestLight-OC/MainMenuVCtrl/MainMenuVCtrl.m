//
//  MainMenuVCtrl.m
//  TestLight-OC
//
//  Created by 古秀湖 on 2018/1/9.
//  Copyright © 2018年 古秀湖. All rights reserved.
//

#import "MainMenuVCtrl.h"

@interface MainMenuVCtrl ()

@property(nonatomic, strong) NSArray *sourceAry;
@end

@implementation MainMenuVCtrl

- (void)viewDidLoad {
    [super viewDidLoad];

    self.sourceAry = @[@"拖动",@"UIColloectionView拖动排序"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.sourceAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainMenuCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.sourceAry objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:[NSString stringWithFormat:@"show%d",indexPath.row] sender:nil];
}
@end
