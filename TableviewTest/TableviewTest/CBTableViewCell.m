//
//  CBTableViewCell.m
//  TableviewTest
//
//  Created by 崔兵兵 on 16/9/22.
//  Copyright © 2016年 医联通. All rights reserved.
//

#import "CBTableViewCell.h"

@interface CBTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation CBTableViewCell

- (void)setCellItemWithName:(NSString *)strName
{
    self.nameLabel.text = strName;
}

@end
