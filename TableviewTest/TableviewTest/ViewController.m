//
//  ViewController.m
//  TableviewTest
//
//  Created by 崔兵兵 on 16/9/22.
//  Copyright © 2016年 医联通. All rights reserved.
//

#import "ViewController.h"
#import "CBTableViewCell.h"
#import <NSMutableArray+SWUtilityButtons.h>
#import "CtrlCodeScan.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, SWTableViewCellDelegate, CtrlCodeScanDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) UIImageView *myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initFootView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CBCellIndex"];
//    cell.rightUtilityButtons = [self rightButtons];
    [cell setRightUtilityButtons:[self rightButtons] WithButtonWidth:120];
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBTableViewCell *cbCell = (CBTableViewCell *)cell;
    
    [cbCell setCellItemWithName:[NSString stringWithFormat:@"%02li", (long)indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CtrlCodeScan *scanVC = [[CtrlCodeScan alloc] init];
    scanVC.delegate = self;
    [self.navigationController pushViewController:scanVC animated:YES];
}

- (void)initFootView
{
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainSize.width, 500)];
    footView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake((mainSize.width - 300) / 2.0, 10, 300, 300)];
    myImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.myImageView = myImageView;
    [footView addSubview:self.myImageView];
    self.tableView.tableFooterView = footView;
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index
{
    NSLog(@"点击了%li个按钮", (long)index);
}

- (NSArray *)rightButtons
{
    NSMutableArray *rightButtons = [NSMutableArray array];
    [rightButtons sw_addUtilityButtonWithColor:[UIColor greenColor] title:@"更多"];
    [rightButtons sw_addUtilityButtonWithColor:[UIColor redColor] title:@"删除"];
    
    return rightButtons;
}

#pragma mark - CtrlCodeScanDelegate
- (void)didCodeScanOk:(id)info
{
    
}

- (void)getCurrentImage:(UIImage *)image
{
    self.myImageView.image = image;
}

@end
