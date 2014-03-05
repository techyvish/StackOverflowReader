//
//  StackOverFlowManager.h
//  BrowseOverflow
//
//  Created by Vishal Patel on 1/03/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Topic;
@protocol StackOverFlowManagerDelegate <NSObject>
@end

@class StackOverFlowCommunicator;
@interface StackOverFlowManager : NSObject

@property (nonatomic,weak) id<StackOverFlowManagerDelegate> delegate;
@property (nonatomic,strong) StackOverFlowCommunicator *communicator;

-(void)fetchQuestionsOnTopic:(Topic *)topic
                   withBlock:(void (^)(NSArray *questins))successBlock
              withErrorBlock:(void (^)(NSError *error))errorBlock;

@end
