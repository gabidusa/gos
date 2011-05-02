//
//  Created by Emil DUSA on 19/06/09.
//  Copyright @ 2011. All rights reserved.
//

/**
 ***** WARNING:
 * This file must not be included from another header file!
 * This file must only be included from a source file.
 *****
 *
 * A trace level indicates which traces are going to be processed and written.
 * All traces in a source file the level of which are lower or equal to this file trace level
 * will be written to the standard error stream (<stderr>).
 * What follows is a description of how a single file trace level is computed.
 *
 * 1. The application global trace level
 * This si defined by GLOBAL_TRACE_LEVEL. No trace above this level will ever be written.
 *
 * 2. The additional per-source file trace level
 * Just before including Trace.h, a source file can set its own trace level
 * by #defining the FILE_TRACE_LEVEL symbol.
 * For instance, to set a source file trace level to "INFO":
 *		...
 *		#define FILE_TRACE_LEVEL TRACE_LEVEL_INFO
 *		#include "Trace.h"
 *
 * If a source file does not #define FILE_TRACE_LEVEL before including
 * "Trace.h", the trace level for this file is automatically set to
 * the highest trace level (TRACE_LEVEL_DEBUG).
 *
 * 3. The actual file trace level
 * For each source file, the actual file trace level is the minimum of
 * FILE_TRACE_LEVEL and GLOBAL_TRACE_LEVEL.
 * All traces with a level inferior or equal to the file actual trace level
 * will be written to <stderr>.
 *
 * 4. The whole trace output system to <stderr> will actually be removed if the compiler
 * flag TRACES_ENABLED is not set. By default, TRACES_ENABLED is set only for
 * 'Debug' builds.
 *
 * 5. In addition to the trace level system described above that determines what is written
 * to <stderr>, a log level is also managed.
 * All traces with a level inferior or equal to LOG_LEVEL will be written
 * to the system log (using the NSLog function). The LOG_LEVEL operates
 * at application scope and is not customized on a per-file basis.
 * Therefore, when TRACES_ENABLED is set, all traces with a level inferior or equal to
 * LOG_TRACE_LEVEL are written to the system log and also possibly to <stderr>
 * (depending of course on the actual file trace level).
 *
 *
 * Note: TRACES_ENABLED is defined in the target Build settings, section "User-Defined".
 *	setting:GCC_PREPROCESSOR_DEFINITIONS
 *	value: TRACES_ENABLED
 */

#ifndef __TRACE_H__
#define __TRACE_H__

#define	TRACE_LEVEL_NO_TRACE	0
#define TRACE_LEVEL_FATAL		1
#define TRACE_LEVEL_ERROR		2
#define TRACE_LEVEL_WARN		3
#define TRACE_LEVEL_INFO		4
#define TRACE_LEVEL_DEBUG		5

#define GLOBAL_TRACE_LEVEL TRACE_LEVEL_DEBUG
#define LOG_LEVEL TRACE_LEVEL_WARN

/**
 * This function handles the writing of both traces and logs.
 * - Depending on the max_trace_level parameter, traces will be printed or not.
 * - Depending on LOG_TRACE_LEVEL; logs will be printed or not.
 */
void print_trace_log(int level, int max_trace_level,const char* file,
                     const char* function, int line, NSString* format, ...);

#if defined(TRACES_ENABLED)
// MAX_TRACE_LEVEL = min(GLOBAL_TRACE_LEVEL, FILE_TRACE_LEVEL)

#if defined(FILE_TRACE_LEVEL)
    #define TRACE_LEVEL_FOR_THIS_FILE  FILE_TRACE_LEVEL
#else
    #define TRACE_LEVEL_FOR_THIS_FILE  TRACE_LEVEL_DEBUG
#endif

#if (TRACE_LEVEL_FOR_THIS_FILE < GLOBAL_TRACE_LEVEL)
    #define MAX_TRACE_LEVEL TRACE_LEVEL_FOR_THIS_FILE
#else
    #define MAX_TRACE_LEVEL GLOBAL_TRACE_LEVEL
#endif

#else // !TRACES_ENABLED

#define MAX_TRACE_LEVEL TRACE_LEVEL_NO_TRACE

#endif // TRACES_ENABLED

/**
 * Definition of TR_DEBUG
 */
#if (TRACE_LEVEL_DEBUG > MAX_TRACE_LEVEL) && (TRACE_LEVEL_DEBUG > LOG_LEVEL)
// Nothing will be printed so don't make the call to the print function
#define TR_DEBUG(format, ...)

#else
#define TR_DEBUG(format, ...) \
	print_trace_log(TRACE_LEVEL_DEBUG, MAX_TRACE_LEVEL, __FILE__, \
                    __FUNCTION__, __LINE__, format, ## __VA_ARGS__)

#endif

/**
 * Definition of TR_INFO
 */
#if (TRACE_LEVEL_INFO > MAX_TRACE_LEVEL) && (TRACE_LEVEL_INFO > LOG_LEVEL)
// Nothing will be printed so don't make the call to the print function
#define TR_INFO(format, ...)

#else
#define TR_INFO(format, ...) \
	print_trace_log(TRACE_LEVEL_INFO, MAX_TRACE_LEVEL, __FILE__, \
                    __FUNCTION__, __LINE__, format, ## __VA_ARGS__)

#endif

/**
 * Definition of TR_WARN
 */
#if (TRACE_LEVEL_WARN > MAX_TRACE_LEVEL) && (TRACE_LEVEL_WARN > LOG_LEVEL)
// Nothing will be printed so don't make the call to the print function
#define TR_WARN(format, ...)

#else
#define TR_WARN(format, ...) \
	print_trace_log(TRACE_LEVEL_WARN, MAX_TRACE_LEVEL, __FILE__, \
                    __FUNCTION__, __LINE__, format, ## __VA_ARGS__)

#endif

/**
 * Definition of TR_ERROR
 */
#if (TRACE_LEVEL_ERROR > MAX_TRACE_LEVEL) && (TRACE_LEVEL_ERROR > LOG_LEVEL)
// Nothing will be printed so don't make the call to the print function
#define TR_ERROR(format, ...)

#else
#define TR_ERROR(format, ...) \
	print_trace_log(TRACE_LEVEL_ERROR, MAX_TRACE_LEVEL, __FILE__, \
                    __FUNCTION__, __LINE__, format, ## __VA_ARGS__)

#endif

/**
 * Definition of TR_FATAL
 */
#if (TRACE_LEVEL_FATAL > MAX_TRACE_LEVEL) && (TRACE_LEVEL_FATAL > LOG_LEVEL)
// Nothing will be printed so don't make the call to the print function
#define TR_FATAL(format, ...)

#else
#define TR_FATAL(format, ...) \
	print_trace_log(TRACE_LEVEL_FATAL, MAX_TRACE_LEVEL, __FILE__, \
                    __FUNCTION__, __LINE__, format, ## __VA_ARGS__)

#endif

/**
 * Definition of TR_SET_THREAD_NAME.
 * We only need the thread name for the traces, not for the logs.
 */
#if defined(TRACES_ENABLED)
#define TR_SET_THREAD_NAME(thread_name) \
	[[NSThread currentThread] setName:(thread_name)]

#else
#define TR_SET_THREAD_NAME(thread_name)

#endif


#endif // __TRACE_H__
