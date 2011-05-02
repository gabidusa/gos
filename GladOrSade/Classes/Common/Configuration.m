//
//  Configuration.m
//  iPhoneCore
//
//  Created by Florin Moisa on 9/22/09.
//  Copyright 2011 @. All rights reserved.
//

#import "Configuration.h"

static NSDictionary* configs;

@implementation Configuration

+(void)loadConfigs
{
	NSBundle* bundle = [NSBundle mainBundle];
	NSString* path = [bundle pathForResource:@"GladOrSadeConfig" ofType:@"plist"];
	configs = [[NSDictionary dictionaryWithContentsOfFile:path] retain];
}

+(NSString*)getString:(NSString*) theKey
{
	return [configs valueForKey:theKey];
}

+(NSUInteger)getInt:(NSString*) theKey
{
	return [[configs valueForKey:theKey] unsignedIntValue];
}

+(BOOL)getBoolean:(NSString*) theKey
{
	return [[configs valueForKey:theKey] unsignedIntValue];
}

+(NSDate*)getDate:(NSString*) theKey
{
	return [configs valueForKey:theKey];
}

-(void)dealloc
{
	[configs release];
	[super dealloc];
}

@end
