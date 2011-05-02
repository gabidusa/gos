/*
 *  Color.h
 *  iPhoneCore
 *
 *  Created by Emil DUSA on 25/06/09.
 *  Copyright 2011 @. All rights reserved.
 *
 */

/**
 * This file makes use of the list defined in ColorList.h. Please modify ColorList.h
 * to add a new color identifier.
 */
#if !defined(__COLOR_H__)
#define __COLOR_H__

/*
 * At the moment, color identifiers are integers (defined in a C enumeration).
 * For full skinning, it is necessary to turn the color identifiers into strings
 *
 * Declaration of the color constants
 */
#define START_COLOR_LIST typedef enum {
#define COLOR_ID(colorId, red, green, blue, alpha) COLOR_##colorId,
#define COLOR_ID_EQUAL(lValue, rValue) COLOR_##lValue = COLOR_##rValue,
#define END_COLOR_LIST COLOR_COLOR_COUNT } TColorId;

#include "ColorList.h"

#undef START_COLOR_LIST
#undef END_COLOR_LIST
#undef COLOR_ID
#undef COLOR_ID_EQUAL

#endif // __COLOR_H__