//
//  PersonsTest.m
//  BrowseOverflow
//
//  Created by Vishal Patel on 28/02/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonsTest : XCTestCase
{
    Person *person;
}

@end

@implementation PersonsTest

- (void)setUp
{
    person = [[Person alloc] initWithName: @"Graham Lee" andAvatarLocation: @"http://example.com/avatar.png"];
}
- (void)tearDown {
    person = nil;
}
- (void)testThatPersonHasTheRightName
{
    XCTAssertEqualObjects(person.name, @"Graham Lee", @"expecting a person to provide its name");
}
- (void)testThatPersonHasAnAvatarURL
{
    NSURL *url = person.avatarLoation ;
    XCTAssertEqualObjects([url absoluteString],
                                                        @"http://example.com/avatar.png",
                                                        @"The Person’s avatar should be represented by a URL");
}

@end
