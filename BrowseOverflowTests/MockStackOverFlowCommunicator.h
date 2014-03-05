//
//  MockStackOverFlowCommunicator.h
//  BrowseOverflow
//
//  Created by Vishal Patel on 2/03/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import "StackOverFlowCommunicator.h"

@interface MockStackOverFlowCommunicator : StackOverFlowCommunicator

-(void)searchForQuestionWithTag:(NSString *)tag;
-(BOOL)wasAskedToFetchQuestions;

@end
