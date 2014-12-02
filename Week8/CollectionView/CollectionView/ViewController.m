//
//  ViewController.m
//  CollectionView
//
//  Created by Zachary Davison on 12/2/14.
//  Copyright (c) 2014 ZD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad{
  
  
  UIImagePickerController *controller = [[UIImagePickerController alloc] init];
  controller.delegate = self;
  [self presentViewController:controller animated:YES completion:nil];
  
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Identifier" forIndexPath:indexPath];
  cell.backgroundColor = [UIColor redColor];
  return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  return 100;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
  return 1;
}

#pragma mark - UIImagePickerControllerDelegate
@end
