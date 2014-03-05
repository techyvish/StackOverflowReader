//
//  QuestionCreationTests.m
//  BrowseOverflow
//
//  Created by Vishal Patel on 1/03/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StackOverFlowManager.h"
#import "MockStackOverFlowCommunicator.h"
#import "Topic.h"
#import <OHHTTPStubs/OHHTTPStubs.h>

@interface QuestionCreationTests : XCTestCase

@end

@implementation QuestionCreationTests
{
    @private
    StackOverFlowManager *mgr;
}

- (void)setUp
{
    [super setUp];
    mgr = [[StackOverFlowManager alloc]init];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
    mgr = nil;
}

-(void)testAskingForQuestionMeansRequestingData
{
    MockStackOverFlowCommunicator *communicator =[[MockStackOverFlowCommunicator alloc]init];
    mgr.communicator = communicator;
    Topic *topic = [[Topic alloc]initWithName:@"iPhone" andTag:@"iphone"];
    //[mgr fetchQuestionsOnTopic:topic];
    XCTAssertTrue([communicator wasAskedToFetchQuestions], @"The communicator should need to fetch the data.");
}

-(void)testAskingQuestionFailedWithError
{
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return YES;
    } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
        NSData* stubData = [@"Hello World!" dataUsingEncoding:NSUTF8StringEncoding];
        return [OHHTTPStubsResponse responseWithData:stubData statusCode:200 headers:nil];
    }];
    
    Topic *topic = [[Topic alloc]initWithName:@"iPhone" andTag:@"iphone"];
    
    [mgr fetchQuestionsOnTopic:topic withBlock:^(NSArray *questins) {
        
    } withErrorBlock:^(NSError *error) {
        
    }];
}

@end
