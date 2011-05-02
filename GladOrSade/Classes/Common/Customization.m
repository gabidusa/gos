//
//  Customization.m
//  iPhoneCore
//
//  Created by Emil DUSA on 25/06/09.
//  Copyright 2011 @. All rights reserved.
//

#import "Customization.h"
#import "Trace.h"

#pragma mark -
#pragma mark - Color management
#pragma mark -

typedef struct
{
    float red, green, blue, alpha;
    UIColor* cachedUIColor;
} TColorDefinition;

/*
 * Definition of all the color values.
 */
#define START_COLOR_LIST \
static TColorDefinition COLOR_VALUES[] = {\

#define COLOR_ID(colorId, red, green, blue, alpha) {red, green, blue, alpha, nil},
#define COLOR_ID_EQUAL(lValue, rValue)
#define END_COLOR_LIST };

#include "ColorList.h"

#undef START_COLOR_LIST
#undef COLOR_ID
#undef COLOR_ID_EQUAL
#undef END_COLOR_LIST


#pragma mark -
#pragma mark - Font management
#pragma mark -

typedef struct
{
    NSString* name;
    CGFloat size;
    UIFont* cachedUIFont;
} TFontDefinition;

/*
 * Definition of all the fonts.
 */
#define START_FONT_LIST \
static TFontDefinition FONT_VALUES[] = {\

#define FONT_ID(fontId, name, size) {name, size, nil},
#define FONT_ID_EQUAL(lValue, rValue)
#define END_FONT_LIST };

#include "FontList.h"

#undef START_FONT_LIST
#undef FONT_ID
#undef FONT_ID_EQUAL
#undef END_FONT_LIST


#pragma mark -
#pragma mark - Image management
#pragma mark -

#define START_IMAGE_LIST
#define IMAGE_ID(imageId, imageName) TImageId const IMAGE_##imageId = imageName;
#define IMAGE_ID_EQUAL(lValue, rValue) TImageId const IMAGE_##lValue = IMAGE_##rValue;
#define END_IMAGE_LIST

#include "ImageList.h"

#undef START_IMAGE_LIST
#undef IMAGE_ID
#undef IMAGE_ID_EQUAL
#undef END_IMAGE_LIST


#pragma mark -
#pragma mark - Localized strings management
#pragma mark -

static NSString * const DEFAULT_LOCALIZED_STRING_VALUE = @"<<<< NOT TRANSLATED >>>>";

#define START_STRING_LIST static NSString * const STRING_ID_VALUES[] = {
#define STRING_ID(id) @#id,
#define STRING_ID_EQUAL(lValue, rValue)
#define END_STRING_LIST };

#include "LocalizedStringsList.h"

#undef START_STRING_LIST
#undef STRING_ID
#undef STRING_ID_EQUAL
#undef END_STRING_LIST

static NSBundle		*mainBundle;

@implementation Customization

+ (void)loadCustomizations
{ 
    mainBundle = [[NSBundle mainBundle] retain];;
}

- (void) dealloc
{
	[mainBundle release];
	[super dealloc];
}

+ (UIColor*)color:(TColorId)theColorId
{
    TColorDefinition* colorDef = &COLOR_VALUES[theColorId];
    if (colorDef->cachedUIColor == nil)
    {
        colorDef->cachedUIColor = [[UIColor alloc] initWithRed:colorDef->red green:colorDef->green
                                                          blue:colorDef->blue alpha:colorDef->alpha];
    }
    return colorDef->cachedUIColor;
}

+ (UIFont*)font:(TFontId)theFontId
{
    TFontDefinition* fontDef = &FONT_VALUES[theFontId];
    if (fontDef->cachedUIFont == nil)
    {
        fontDef->cachedUIFont = [UIFont fontWithName:fontDef->name size:fontDef->size];
    }
    return fontDef->cachedUIFont;
}

+ (UIImage*)image:(NSString*)theImageId
{
	//Trac 222 - do not fail if not provisoned but WARN
	UIImage * image = nil;
	@try {
		image = [UIImage imageNamed:theImageId];
	}
	@catch (NSException * ex) {
		TR_WARN(@"Image named %@ is not provisioned ! Returning nil !", theImageId);
	}
	
    return image;
}

+ (NSString *)string:(TLocalizedStringId)theStringKey
{
	return [mainBundle localizedStringForKey:STRING_ID_VALUES[theStringKey]
									   value:DEFAULT_LOCALIZED_STRING_VALUE
									   table:nil];
}

@end
