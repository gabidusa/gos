/*
 *  LocalizedStringsList.h
 *  iPhoneCore
 *
 *  Created by Emil DUSA on 01/07/09.
 *  Copyright 2011 @. All rights reserved.
 *
 */

/**
 * All the string identifiers are listed here.
 * Note: The string "STRING_" will be prepended to all defined string Ids.
 * For instance STRING_ID(VOD_MAIN_SCREEN_TITLE) will lead to the following
 * declaration:
 *		enum {
 *			...
 *			STRING_VOD_MAIN_SCREEN_TITLE,
 *		}
 */
START_STRING_LIST

/**
 * Here are defined all the string identifiers used in the application.
 * Every string identifier has a corresponding value that depends on the device
 * current locale. The mapping of string identifiers to actual strings are made
 * in the "Localizable.strings" files.
 *
 * In order to have several identifiers referring to the same string, aliases to a single definition
 * shall be used. That means one STRING_ID() definition plus as many as required STRING_ID_EQUAL()
 * aliases definitions.
 */

/* "Login" screen */
STRING_ID(PLACEHOLDER_USERNAME)
STRING_ID(PLACEHOLDER_PASSWORD)
STRING_ID(BUTTON_LOGIN)
STRING_ID(TEXT_REGISTER_FOR_ACCOUNT)
STRING_ID(LOGIN_ERROR_TITLE)
STRING_ID(LOGIN_ERROR_MESSAGE)  
STRING_ID(LOGIN_ERROR_BUTTON_TITLE)

/* "Videos" screen */
STRING_ID(SELECT_VIDEOS)

/* "Record" screen */
STRING_ID(MESSAGE_HEADER_PLAYER_CANNOT_START)
STRING_ID(MESSAGE_PLAYER_CANNOT_START)
STRING_ID(NO_CANERA_SUPPORT)
STRING_ID(DEVICE_IS_NOT_IPHONE4)
STRING_ID(BUTTON_OK)

/**
 * Here are defined string identifiers aliases used by the application screens.
 * An alias is defined by a name followed by the corresponding string identifier.
 * WARNING: No STRING_ID(...) definition after the first STRING_ID_EQUAL(...) alias definition.
 */

/* "Login" screen */
//STRING_ID_EQUAL(MOSAIC_TABBAR_ITEM_TITLE, MOSAIC_NAVBAR_ITEM_TITLE)


END_STRING_LIST
