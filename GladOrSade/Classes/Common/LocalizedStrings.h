/*
 *  LocalizedStrings.h
 *  iPhoneCore
 *
 *  Created by Emil DUSA on 01/07/09.
 *  Copyright 2011 @. All rights reserved.
 *
 */

/**
 * This file makes use of the list defined in LocalizedStringsList.h. Please modify LocalizedStringsList.h
 * to add a new color identifier.
 */
#if !defined(__LOCALIZEDSTRINGS_H__)
#define __LOCALIZEDSTRINGS_H__

/**
 * Declaration of the String key constants
 */
#define START_STRING_LIST typedef enum {
#define STRING_ID(id) STRING_##id,
#define STRING_ID_EQUAL(lValue, rValue) STRING_##lValue = STRING_##rValue,
#define END_STRING_LIST STRING_STRING_COUNT } TLocalizedStringId;

#include "LocalizedStringsList.h"

#undef START_STRING_LIST
#undef END_STRING_LIST
#undef STRING_ID
#undef STRING_ID_EQUAL

#endif // __LOCALIZEDSTRINGS_H__