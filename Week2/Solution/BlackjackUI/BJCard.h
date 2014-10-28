//
//  BJCard.h
//  BlackjackUI
//
//  Created by Zachary Davison on 10/21/14.
//  Copyright (c) 2014 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJCard : NSObject

@property (nonatomic, strong) NSString *suit;
@property (nonatomic, strong) NSString *face;

@property (nonatomic, readonly) NSInteger value;

- (id)initWithSuit:(NSString*)suit face:(NSString*)face;

@end
