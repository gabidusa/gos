/*
 *  Image.h
 *  iPhoneCore
 *
 *  Created by Emil DUSA on 08/09/09.
 *  Copyright 2011 @. All rights reserved.
 *
 */

/**
 * This file makes use of the list defined in ImageList.h. Please modify ImageList.h
 * to add a new image identifier.
 */
#if !defined(__IMAGE_H__)
#define __IMAGE_H__

/*
 * Declaration of the image identifiers
 */
#define START_IMAGE_LIST typedef NSString *TImageId;
#define IMAGE_ID(imageId, imageName) extern TImageId const IMAGE_##imageId;
#define IMAGE_ID_EQUAL(lValue, rValue) extern TImageId const IMAGE_##lValue;
#define END_IMAGE_LIST

#include "ImageList.h"

#undef START_IMAGE_LIST
#undef IMAGE_ID
#undef IMAGE_ID_EQUAL
#undef END_IMAGE_LIST

#endif // __IMAGE_H__