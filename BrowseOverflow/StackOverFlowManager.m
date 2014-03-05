//
//  StackOverFlowManager.m
//  BrowseOverflow
//
//  Created by Vishal Patel on 1/03/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import "StackOverFlowManager.h"
#import "StackOverFlowCommunicator.h"
#import "Topic.h"

@implementation StackOverFlowManager

@synthesize delegate;

-(id)init
{
    self = [super init];
    if (self)
    {
        //_communicator = [[StackOverFlowCommunicator alloc]init];
    }
    return self;
}

-(void)setDelegate:(id<StackOverFlowManagerDelegate>)newDelegate
{
    if ([delegate conformsToProtocol:@protocol(StackOverFlowManagerDelegate)] )
    {
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Wrong argument" userInfo:nil]raise];
        
    }
    delegate = newDelegate;
}

-(void)fetchQuestionsOnTopic:(Topic *)topic
                   withBlock:(void (^)(NSArray *questins))successBlock
              withErrorBlock:(void (^)(NSError *error))errorBlock
{
    [_communicator searchForQuestionsWithTag:[topic tag]
                                   withBlock:^(NSArray *questions) {
                                       successBlock(questions);
    } withErrorBlock:^(NSError *error) {
        errorBlock(error);
    }];
}

@end
