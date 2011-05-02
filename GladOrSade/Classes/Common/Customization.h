//
//  Customization.h
//  iPhoneCore
//
//  Created by Emil DUSA on 25/06/09.
//  Copyright 2011 @. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Color.h"
#import "Font.h"
#import "Image.h"
#import "LocalizedStrings.h"

@interface Customization : NSObject
{
	// Is empty for the time being but will be populated when support for skinning is added.
}

/**
 * Loads the customizations.
 */
+(void)loadCustomizations;

/**
 * Retreives a UIColor object by Id. The Id passed as parameter must be one
 * defined in the Color.h header file.
 */
+ (UIColor *)color:(TColorId)theColorId;

/**
 * Retreives a UIFont object by Id. The Id passed as parameter must be one defined
 * in the Font.h file.
 */
+ (UIFont *)font:(TFontId)theFontId;

/**
 * Retreives a UIImage object by Id. The Id passed as parameter must be one defined
 * in the Image.h file.
 */
+ (UIImage *)image:(TImageId)theImageId;

/**
 * Retreives the value of a localized string. The key passed as parameter must be one defined
 * in the LocalizedStrings.h file.
 * 
 */
+ (NSString *)string:(TLocalizedStringId)theStringKey;


@end
