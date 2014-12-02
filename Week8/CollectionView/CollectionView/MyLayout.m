//
//  MyLayout.m
//  CollectionView
//
//  Created by Zachary Davison on 12/2/14.
//  Copyright (c) 2014 ZD. All rights reserved.
//

#import "MyLayout.h"
#import "MyLayoutAttributes.h"

@interface MyLayout()

@property (nonatomic, strong) NSMutableArray *layoutAttributes;

@end

@implementation MyLayout

+ (Class)layoutAttributesClass{
  return [MyLayoutAttributes class];
}

- (void)prepareLayout{
  
  _layoutAttributes = [NSMutableArray array];
  
  NSInteger numberOfItems = [self.collectionView.dataSource
                             collectionView:self.collectionView numberOfItemsInSection:0];
  
  
  CGFloat x = 0;
  CGFloat y = 50;
  
  for(int i = 0; i < numberOfItems; i++){
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
    MyLayoutAttributes *attributes = [MyLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = CGRectMake(x, y, 100, 100);
    attributes.tintColor = [UIColor greenColor];
    [_layoutAttributes addObject:attributes];
    x+= 100 + 10;
  }
  
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
  return YES;
}

- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
  return _layoutAttributes[indexPath.row];
}

- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{
  
  NSMutableArray *results = [NSMutableArray array];
  for(UICollectionViewLayoutAttributes *attributes in _layoutAttributes){
    if(CGRectContainsRect(rect, attributes.frame)){
      [results addObject:attributes];
    }
  }
  
  return results;
}

- (CGSize)collectionViewContentSize{

  UICollectionViewLayoutAttributes *first = _layoutAttributes.firstObject;
  UICollectionViewLayoutAttributes *last  = _layoutAttributes.lastObject;
  
  CGRect u = CGRectUnion(first.frame, last.frame);
  
  return u.size;
}

- (UICollectionViewLayoutAttributes*)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
  UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:itemIndexPath];
  
  attributes.alpha = 0;
  attributes.frame = CGRectMake(400, 400, 100, 100);
  return attributes;
}

- (UICollectionViewLayoutAttributes*)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
  
  UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:itemIndexPath];
  
  attributes.alpha = 0;
  attributes.frame = CGRectMake(400, 400, 100, 100);
  return attributes;
  
}

@end
