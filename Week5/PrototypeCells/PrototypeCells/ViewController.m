//
//  ViewController.m
//  PrototypeCells
//
//  Created by Zachary Davison on 11/10/14.
//  Copyright (c) 2014 DB. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCellIdentifier"];
  cell.titleLabel.text = @"Hello";
  cell.bodyLabel.text = @"World";
  
  return cell;
}

@end
