//
//  Topic.m
//  BrowseOverflow
//
//  Created by Vishal Patel on 27/02/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import "Topic.h"
#import "Question.h"

@interface Topic ()

@property (nonatomic, strong) NSMutableArray *questions;

@end

@implementation Topic

-(id)initWithName:(NSString *)name andTag:(NSString *)tag
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.tag = tag;
        self.questions = [[NSMutableArray alloc]init];
    }
    return self;
}

-(NSMutableArray *)recentQuestions
{
    [_questions sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Question *q1 = (Question *)obj1;
        Question *q2 = (Question *)obj2;
        return [q2.date compare:q1.date];
    }];
    
    return _questions;
}

-(void)addQuestion:(Question *)question
{
    if ( [[self recentQuestions] count] >= 20 )
        return;
        [_questions addObject:question];
}

@end
