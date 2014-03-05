//
//  Person.h
//  BrowseOverflow
//
//  Created by Vishal Patel on 28/02/2014.
//  Copyright (c) 2014 Vishal Patel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSURL *avatarLoation;

-(id)initWithName:(NSString *)name andAvatarLocation:(NSString *)url;

@end
