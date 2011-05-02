/*
 *  ColorList.h
 *  iPhoneCore
 *
 *  Created by Emil DUSA on 26/06/09.
 *  Copyright 2011 @. All rights reserved.
 *
 */

/**
 * All the color identifiers are listed here.
 * Note: The string "COLOR_" will be prepended to all color symbols.
 * For instance COLOR_ID(TRANSITION_TO_PLAYER) will lead to the following
 * declaration:
 *		enum {
 *			...
 *			COLOR_TRANSITION_TO_PLAYER;
 *		}
 */
START_COLOR_LIST

/**
 * Here are defined all the colors used in the application.
 * A color is defined by its red, green and blue components and by an opacity ratio,
 * the four of these numbers lie between 0 and 1.
 *
 * These color definitions should not be used directly.
 * Instead each screen should define aliases referring to these definitions (see below).
 * COLOR_CLEAR is the only id that can be used directly.
 */
COLOR_ID(BLACK, 0, 0, 0, 1)
COLOR_ID(GRAY, 0.5, 0.5, 0.5, 1)
COLOR_ID(GRAY_MINI_PRG_DETAILS, 0.8, 0.8, 0.8, 1)
COLOR_ID(GRAY_TRANSPARENT_1, 0.5, 0.5, 0.5, 0.4)
COLOR_ID(PURPLE, 0.5, 0, 0.5, 1)
COLOR_ID(WHITE, 1, 1, 1, 1.)
COLOR_ID(WHITE_TRANSPARENT_1, 1, 1, 1, .2)
COLOR_ID(GRAY_TRANSPARENT_2, 0.1, 0.1, 0.1, 0.8)
COLOR_ID(CLEAR, 0, 0, 0, 0)
COLOR_ID(BLUE, 0, 0, 1, 0)
COLOR_ID(ONNOW_BACKGROUND, 0.5, 0.5, 0.5, 0.6)
COLOR_ID(RED, 1, 0, 0, 1)
COLOR_ID(GREEN, 0, 1, 0, 1)
COLOR_ID(DARKRED, 0.5, 0.25, 0.25, 1)

COLOR_ID(ORANGE, 1, 0.8, 0, 1)
COLOR_ID(ORANGE_DOWN,  0.99, 0.49, 0, 1)
COLOR_ID(GRAY_UP, 0.75, 0.75, 0.75, 1.0)
COLOR_ID(GRAY_LINE, 0.5, 0.5, 0.5, 1.0)
COLOR_ID(ORANGE_TEXT, 1, 0.8, 0, 1)

/**
 * Here are defined color aliases used by the application screens.
 * An alias is defined by a name followed by the corresponding color definition.
 * WARNING: No COLOR_ID(...) definition after the first COLOR_ID_EQUAL(...) alias definition.
 */
COLOR_ID_EQUAL(MAIN_WINDOW_BACKGROUND, GRAY)
COLOR_ID_EQUAL(ROUNDED_VIEW_BORDER_DEFAULT, WHITE)
COLOR_ID_EQUAL(ROUNDED_VIEW_INSIDE_DEFAULT, WHITE_TRANSPARENT_1)
COLOR_ID_EQUAL(NAVIGATION_BAR, BLACK)
COLOR_ID_EQUAL(NAVIGATION_BAR_TEXT, WHITE)
COLOR_ID_EQUAL(NAVIGATION_BAR_TEXT_SHADOW, GRAY)


/* "Login" screen */
COLOR_ID_EQUAL(LINK_HIGHLIGHTED, GRAY_TRANSPARENT_1)
COLOR_ID_EQUAL(LINK_NORMAL, BLACK)

END_COLOR_LIST
