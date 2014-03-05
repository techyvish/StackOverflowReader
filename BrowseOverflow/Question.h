//
//  Question.h
//  BrowseOverflow
//
//  Created by Vishal Patel on 27/02/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Answer;
@interface Question : NSObject
{
    NSMutableSet *answerSet;
}

@property(nonatomic,strong) NSDate *date ;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,readwrite) int score;
@property(nonatomic,readonly) NSArray *answers;

- (void)addAnswer: (Answer *)answer;

@end
