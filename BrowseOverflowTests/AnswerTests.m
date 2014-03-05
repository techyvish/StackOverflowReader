//
//  AnswerTests.m
//  BrowseOverflow
//
//  Created by Vishal Patel on 1/03/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Answer.h"
#import "Person.h"

@interface AnswerTests : XCTestCase
{
    Answer *answer;
    Answer *otherAnswer;
}

@end

@implementation AnswerTests

- (void)setUp
{
    [super setUp];
    answer = [[Answer alloc]init];
    otherAnswer = [[Answer alloc]init];

    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void)testForAnswerHasTextAndPerson
{
    Answer *ans = [[Answer alloc]init];
    ans.text = @"Test Text";
    XCTAssertEqualObjects(ans.text, @"Test Text", @"Answer Text Should be the same.");
    
    ans.person = [[Person alloc]initWithName:@"Test" andAvatarLocation:@"http://gravatar.com/tewqr"];
    XCTAssertTrue([ans.person isKindOfClass:[Person class]], @"Answer should be provided by a person");
    
}

-(void)testForDefaultAnswerIsNotAccepted
{
    Answer *ans = [[Answer alloc]init];
    XCTAssertFalse( ans.accepted , @"Default answer should not be accepted");
    
}

-(void)testForAnswerCanBeAccepted
{
    Answer *ans = [[Answer alloc]init];
    ans.accepted = TRUE;
    XCTAssertTrue(ans.accepted , @"answer can be accepted");
}

-(void)testForAnswerHasScore
{
    Answer *ans = [[Answer alloc]init];
    ans.score = 42;
    XCTAssertEqual(ans.score, (NSInteger)42, @"Answer should have a score");
}

-(void)testForAcceptedAnswerComesFirst
{
    answer.accepted = YES;
    otherAnswer.score = otherAnswer.score + 10;
    
    XCTAssertEqual([answer compare:otherAnswer], NSOrderedAscending, @"Accepted answer comes first");
}

-(void)testForAnswerScoreEqualComparesEqually
{
    answer.score = answer.score + 10;
    otherAnswer.score = otherAnswer.score + 10;

    XCTAssertEqual([answer compare:otherAnswer], NSOrderedSame, @"Both answers of equal rank");
    XCTAssertEqual([otherAnswer compare:answer], NSOrderedSame, @"Both answers of equal rank");
}

-(void)testForAnswerHighestScoreComesFirst
{
    answer.score = answer.score + 10;
    otherAnswer.score = otherAnswer.score + 15;
    
    XCTAssertEqual([answer compare:otherAnswer], NSOrderedDescending, @"Higher score comes first");
    XCTAssertEqual([otherAnswer compare:answer], NSOrderedAscending, @"Lower score comes last");

}

@end
