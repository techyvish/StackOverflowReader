//
//  BrowseOverflowTests.m
//  BrowseOverflowTests
//
//  Created by Vishal Patel on 27/02/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Topic.h"
#import "Question.h"
#import "Answer.h"

@interface BrowseOverflowTests : XCTestCase
{
    Topic *newTopic;
    Question *question;
    
    Answer *highScore;
    Answer *lowScore;
}

@end

@implementation BrowseOverflowTests

- (void)setUp
{
    [super setUp];
    newTopic = [[Topic alloc]initWithName:@"iPhone" andTag:@"iphone"];
    question = [[Question alloc]init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    newTopic = nil;
}

-(void)testThatTopicExist
{
    XCTAssertNotNil(newTopic, @"Should be able to create topic");
}

-(void)testThatTopicCanbeNamed
{
    
    newTopic.tag = @"iPhone";
    XCTAssertEqualObjects(newTopic.name, @"iPhone", @"The topic should have a name that I gave");
}

-(void)testThatTopicHasNameAndTag
{
    newTopic.tag = @"iphone";
    XCTAssertEqualObjects(newTopic.tag, @"iphone", @"The topic should have a tag that I gave");
}

-(void)testForAListOfQuestions
{
    NSArray *list = [newTopic recentQuestions];
    XCTAssertEqual([list count], (NSUInteger)0, @"Count should be zero");
}

-(void)testAddingQuestionToTheList
{
    id list = [newTopic recentQuestions];
    [newTopic addQuestion:question];
    XCTAssertEqual([list count], (NSUInteger) 1, @"Count should one");
}

-(void)testForInitiallyEmptyQuestionList
{
    id list = [newTopic recentQuestions];
    XCTAssertTrue([list isKindOfClass:[NSArray class]], @"Topic should provide list of questions.");
}

-(void)testForQuestionExist
{
    XCTAssertNotNil(question, @"Should be able to create question.");
}

-(void)testForQuestionHasDate
{
    NSDate *testDate = [NSDate distantPast];
    question.date = testDate;
    XCTAssertEqualObjects(question.date, testDate, @"Question should have date");
}

-(void)testForQuestionTitle
{
    NSString *title = @"this is test question";
    question.title = title;
    XCTAssertEqualObjects(question.title, title, @"Question should have title");
}

-(void)testForQuestionScore
{
    int score = 42;
    question.score = score;
    XCTAssertEqual(question.score, score, @"Question should have score");
}

-(void)testForquestionHasAddedChronologically
{
    Question *q1 = [[Question alloc]init];
    q1.date = [NSDate distantPast];
    
    Question *q2 = [[Question alloc]init];
    q2.date = [NSDate distantFuture];
    
    [newTopic addQuestion:q1];
    [newTopic addQuestion:q2];
    
    NSArray *arr = [newTopic recentQuestions];
    
    Question *qestion1 = arr[0];
    Question *qestion2 = arr[1];
    
    XCTAssertEqualObjects([qestion1.date laterDate:qestion2.date ], qestion1.date , @"The later date should appear first");
    
}

-(void)testLimitOftheQuestions
{
    for (int i = 0 ; i < 25 ; i++) {
        Question *q = [[Question alloc]init];
        [newTopic addQuestion:q];
    }
    
    XCTAssertTrue([[newTopic recentQuestions] count] < 21, @"Only 20 questions should be there");
}

//-(void)testForQuestionCanHaveAnswerAdded
//{
//    Answer *answer = [[Answer alloc]init];
//    XCTAssertThrows([question addAnswer:answer], @"Must be able to add answers");
//}

-(void)testAcceptedAnswerIsFirst
{
    Answer *answer1 = [[Answer alloc]init];
    [question addAnswer:answer1];

    Answer *answer2 = [[Answer alloc]init];
    answer2.accepted = YES;
    [question addAnswer:answer2];
    
    XCTAssertTrue([[question.answers objectAtIndex:0] isAccepted], @"First answer is accepted");
}

-(void)testHighScoreBeforeLow
{
    highScore = [[Answer alloc]init];
    highScore.score = 42;
    
    lowScore = [[Answer alloc]init];
    lowScore.score = 32;
    
    [question addAnswer:lowScore];
    [question addAnswer:highScore];
    
    NSArray *answers = question.answers;
    
    int highIndex = [answers indexOfObject:highScore];
    int lowIndex = [answers indexOfObject:lowScore];
    
    XCTAssertTrue(highIndex < lowIndex , @"High scoring answer comes first.");
}




@end
