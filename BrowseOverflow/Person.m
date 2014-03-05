//
//  Person.m
//  BrowseOverflow
//
//  Created by Vishal Patel on 28/02/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)name andAvatarLocation:(NSString *)url
{
    self = [super init];
    if (self)
    {
        self.name = name;
        self.avatarLoation = [NSURL URLWithString:url];
    }
    return self;
}

-(NSString *)name
{
    return _name;
}

-(NSURL *)avatarLoation
{
    return _avatarLoation;
}

@end
