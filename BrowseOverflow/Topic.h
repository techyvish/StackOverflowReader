//
//  Topic.h
//  BrowseOverflow
//
//  Created by Vishal Patel on 27/02/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Question;

@interface Topic : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tag;

-(id)initWithName:(NSString *)name andTag:(NSString *)tag;

-(void)addQuestion:(Question *)question;
-(NSMutableArray *)recentQuestions;

@end
