//
//  Answer.h
//  BrowseOverflow
//
//  Created by Vishal Patel on 1/03/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Answer : NSObject

@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong) Person *person;
@property (nonatomic,readwrite) NSInteger score;
@property (getter = isAccepted) BOOL  accepted;

-(NSComparisonResult) compare:(Answer *)otherAnswer;

@end
