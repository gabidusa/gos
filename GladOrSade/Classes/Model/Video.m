//
//  Video.m
//  GladOrSade
//
//  Created by Emil DUSA on 4/12/11.
//  Copyright 2011 ALU. All rights reserved.
//

#import "Video.h"


@implementation Video

@synthesize Id = _Id;
@synthesize title = _title;
@synthesize url = _url;
@synthesize thumbnailUrl = _thumbnailUrl;

- (id)initWithId:(NSString*)Id
       withTitle:(NSString*)title
         withUrl:(NSString*)url
      andLogoUrl:(NSString*)logoUrl;
{
    if (self = [super init]) {
        _Id = [Id retain];
        _title = [title retain];
        _url = [url retain];
        _thumbnailUrl = [logoUrl retain];
    }
    
    return self;
}

- (void)dealloc
{
    [_title release];
    [_url release];
    [_thumbnailUrl release];
    
    [super dealloc];
}

@end
