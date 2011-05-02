/*
 *  Font.h
 *  iPhoneCore
 *
 *  Created by Emil DUSA on 30/06/09.
 *  Copyright 2011 @. All rights reserved.
 *
 */
#if !defined(__FONT_H__)
#define __FONT_H__

/**
 * This file makes use of the list defined in FontList.h. Please modify FontList.h
 * to add a new font identifier.
 */
#define START_FONT_LIST typedef enum {
#define FONT_ID(fontId, name, size) FONT_##fontId,
#define FONT_ID_EQUAL(lValue, rValue) FONT_##lValue = FONT_##rValue,
#define END_FONT_LIST FONT_FONT_COUNT } TFontId;

#include "FontList.h"

#undef START_FONT_LIST
#undef FONT_ID
#undef FONT_ID_EQUAL
#undef END_FONT_LIST

#endif // __FONT_H__

