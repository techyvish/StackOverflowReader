//
//  MockStackOverFlowCommunicator.m
//  BrowseOverflow
//
//  Created by Vishal Patel on 2/03/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import "MockStackOverFlowCommunicator.h"

@implementation MockStackOverFlowCommunicator
{
    BOOL wasAskedToFetchQuestion;
}

-(void)searchForQuestionsWithTag:(NSString *)tag
{
    wasAskedToFetchQuestion = YES;
}

-(BOOL)wasAskedToFetchQuestions
{
    return wasAskedToFetchQuestion;
}

@end
