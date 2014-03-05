//
//  Answer.m
//  BrowseOverflow
//
//  Created by Vishal Patel on 1/03/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import "Answer.h"

@implementation Answer

-(NSComparisonResult) compare:(Answer *)otherAnswer
{
    if ( _accepted && !otherAnswer.accepted )
        return NSOrderedAscending;
    else if ( !_accepted && otherAnswer.accepted)
        return NSOrderedDescending;
    
    if ( _score > otherAnswer.score)
        return NSOrderedAscending;
    else if ( _score < otherAnswer.score )
        return NSOrderedDescending;
    else
        return NSOrderedSame;
}

@end
