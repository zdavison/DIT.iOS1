//
//  MyTableViewCell.h
//  PrototypeCells
//
//  Created by Zachary Davison on 11/10/14.
//  Copyright (c) 2014 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *bodyLabel;

@end
