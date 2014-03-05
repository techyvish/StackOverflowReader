//
//  Question.m
//  BrowseOverflow
//
//  Created by Vishal Patel on 27/02/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import "Question.h"
@interface Question ()

@property (nonatomic,strong) NSMutableArray *answers;

@end

@implementation Question

-(id)init
{
    self = [super init];
    if (self)
    {
        answerSet = [[NSMutableSet alloc]init];
    }
    return self;
}

-(NSDate *)date
{
    return _date;
}

-(NSString *)title
{
    return _title;
}

-(int)score
{
    return _score;
}

- (void)addAnswer: (Answer *)answer;
{
    [answerSet addObject:answer];
}

-(NSArray *)answers
{
    return [[answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}

@end
