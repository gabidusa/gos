//
//  Created by Emil DUSA on 19/06/09.
//  Copyright @ 2011. All rights reserved.
//
#include "Trace.h"

#include <stdlib.h>
#include <stdarg.h>
#include <sys/time.h>

static char const* const LEVEL_STR[] =
{
	"DUMMY", "FATAL", "ERROR", "WARN", "INFO", "DEBUG"
};

#if defined(TRACES_ENABLED)
static NSString* const TRACE_MESSAGE_FORMAT =
    // <HH:MM:SS.mmm>level:thread_name:file:line:function: user_message
    @"<%02u:%02u:%02u.%03u>%s:%@:%s:%u:%s: %@\n";

#endif

static NSString* const LOG_MESSAGE_FORMAT =
	// <level:file:line> user_message
	@"<%s:%s:%u> %@";

#if defined(TRACES_ENABLED)
void do_print_trace(int level, const char* file, const char* function,
					int line, NSString* msg)
{
	// Get current time
	struct timeval tp;
	struct tm tm;
	gettimeofday(&tp, NULL);
	// Break down the localtime into date components
	localtime_r(&tp.tv_sec, &tm);
	
    NSString* trace_msg = [[NSString alloc]
            initWithFormat:TRACE_MESSAGE_FORMAT,
						   tm.tm_hour, tm.tm_min, tm.tm_sec, tp.tv_usec / 1000,
						   LEVEL_STR[level], [[NSThread currentThread] name],
                           file, line, function, msg];
	
    fprintf(stderr, "%s", [trace_msg UTF8String]);
    
    [trace_msg release];
}
#endif

void print_trace_log(int level, int max_trace_level,const char* file,
                     const char* function, int line, NSString* format, ...)
{    
    // Format the user message
    va_list argList;
    va_start(argList, format);
    NSString* user_msg = [[NSString alloc] initWithFormat:format arguments:argList];
    va_end(argList);
    
	// Remove the path part of the filename
	const char* short_file = strrchr(file, '/');
    short_file = (short_file == NULL) ? file : short_file + 1;
	
#if defined(TRACES_ENABLED)
    if (level <= max_trace_level)
    {
        do_print_trace(level, short_file, function, line, user_msg);
    }
#endif

    if (level <= LOG_LEVEL)
    {
        NSLog(LOG_MESSAGE_FORMAT, LEVEL_STR[level], short_file, line, user_msg);
    }
	
    // Clean-up
    [user_msg release];
}
