//
//  StackOverFlowCommunicator.h
//  BrowseOverflow
//
//  Created by Vishal Patel on 2/03/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StackOverFlowCommunicator : NSObject

-(void)searchForQuestionsWithTag:(NSString *)tag
                       withBlock:(void (^)(NSArray *questions))successBlock
                  withErrorBlock:(void (^)(NSError *error))errorBlock;
@end
