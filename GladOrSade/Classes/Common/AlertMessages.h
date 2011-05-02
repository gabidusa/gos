/*

File: AlertMessages.h
Abstract: Utility functions for the alerting end user.
Copyright (C) 2011. All Rights Reserved.

*/

#import <UIKit/UIKit.h>

typedef enum AlertMessageType {
	ConnectionError,
	Warning,
	Error,
	FatalError,
}AlertMessageType;

void AlertWithOneBtn(NSString *title, NSString *message, NSString *btnName, id delegate);
void AlertWithTwoBtns(NSString *title, NSString *message, NSString *leftBtnName, NSString *rightBtnName, id delegate);
/*
void ConnectionError(NSString *serverMessage, id delegate);
void Error(NSString *serverMessage, id delegate);
void InternalError();
*/