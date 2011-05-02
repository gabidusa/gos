/*
 *  ImageList.h
 *  iPhoneCore
 *
 *  Created by Emil DUSA on 08/09/09.
 *  Copyright 2011 @. All rights reserved.
 *
 */

/**
 * All the local images identifiers are listed here.
 * Note: The string "IMAGE_" will be prepended to all image symbols.
 * For instance IMAGE_ID(APPLICATION_BACKGROUND) will lead to the following
 * declaration:
 *		enum {
 *			...
 *			IMAGE_APPLICATION_BACKGROUND)
 *		}
 */
START_IMAGE_LIST

/**
 * Here are defined all the local images used in the application.
 *
 * In order to have several identifiers referring to the same image, aliases to a unique identifier
 * shall be used. That means one IMAGE_ID() definition plus as many as required IMAGE_ID_EQUAL()
 * aliases definitions.
 */
IMAGE_ID(LOGO_BANNER, @"LogoBanner.jpg")

/**
 * Here are defined image aliases used by the application screens.
 * An alias is defined by a name followed by the corresponding image definition.
 * WARNING: No IMAGE_ID(...) definition after the first IMAGE_ID_EQUAL(...) alias definition.
 */
// IMAGE_ID_EQUAL()

END_IMAGE_LIST
