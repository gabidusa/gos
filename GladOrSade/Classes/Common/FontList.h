/*
 *  FontList.h
 *  iPhoneCore
 *
 *  Created by Emil DUSA on 30/06/09.
 *  Copyright 2011 @. All rights reserved.
 *
 */

/**
 * All the font identifiers are listed here.
 * Note: The string "FONT_" will be prepended to all font identifiers.
 * For instance FONT_ID(ONOW_PROGRAM_NAME) will lead to the following
 * declaration:
 *		enum {
 *			...
 *			FONT_ONOW_PROGRAM_NAME;
 *		}
 */
START_FONT_LIST

/**
 * Here are defined all the fonts used in the application.
 * A color is defined by a font name and a font size in pixels.
 *
 * These font definitions should not be used directly.
 * Instead each screen should define aliases referring to these definitions (see below).
 */
FONT_ID(SYSTEM_NORMAL_12, @"Helvetica", 12)
FONT_ID(SYSTEM_BOLD_12, @"Helvetica-Bold", 12)
FONT_ID(SYSTEM_NORMAL_13, @"Helvetica", 13)
FONT_ID(SYSTEM_BOLD_13, @"Helvetica-Bold", 13)
FONT_ID(SYSTEM_NORMAL_14, @"Helvetica",14)
FONT_ID(SYSTEM_BOLD_14, @"Helvetica-Bold",14)
FONT_ID(SYSTEM_BOLD_16, @"Helvetica-Bold",16)
FONT_ID(SYSTEM_NORMAL_16, @"Helvetica",16)

/* Other system font names: "Helvetica-Oblique", "Helvetica-BoldOblique" */
FONT_ID(MINI_PRG_DETAILS_ITALIC, @"Helvetica-Oblique",12)
FONT_ID(MINI_PRG_DETAILS_NORMAL, @"Helvetica",12)

/**
 * Here are defined font aliases used by the application screens.
 * An alias is defined by a name followed by the corresponding font definition.
 * WARNING: No FONT_ID(...) definition after the first FONT_ID_EQUAL(...) alias definition.
 */
FONT_ID_EQUAL(SYSTEM_DEFAULT, SYSTEM_NORMAL_12)

/* "On Now" screen */
FONT_ID_EQUAL(ONNOW_CHANNEL_NAME, SYSTEM_DEFAULT)
FONT_ID_EQUAL(ONNOW_PROGRAM_NAME, SYSTEM_BOLD_16)
FONT_ID_EQUAL(ONNOW_PROGRAM_TIMES, SYSTEM_DEFAULT)

/* Mini program details*/
FONT_ID_EQUAL(MINI_PRG_DETAILS_BOLD, SYSTEM_BOLD_12)

/* Program Grid */
FONT_ID_EQUAL(GUIDE_BOLD, SYSTEM_BOLD_16)

END_FONT_LIST

