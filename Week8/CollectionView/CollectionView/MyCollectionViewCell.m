//
//  MyCollectionViewCell.m
//  CollectionView
//
//  Created by Zachary Davison on 12/2/14.
//  Copyright (c) 2014 ZD. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "MyLayoutAttributes.h"

@implementation MyCollectionViewCell

- (void)applyLayoutAttributes:(MyLayoutAttributes *)layoutAttributes{
  
  [super applyLayoutAttributes:layoutAttributes];
  self.contentView.backgroundColor = layoutAttributes.tintColor;
  
}

@end
