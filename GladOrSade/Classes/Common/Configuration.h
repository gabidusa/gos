//
//  Configuration.h
//  iPhoneCore
//
//  Created by Florin Moisa on 9/22/09.
//  Copyright 2011 @. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Configuration : NSObject {
}

+(void)loadConfigs;
+(NSString*)getString:(NSString*) theKey;
+(NSUInteger)getInt:(NSString*) theKey;
+(BOOL)getBoolean:(NSString*) theKey;
+(NSDate*)getDate:(NSString*) theKey;

@end
