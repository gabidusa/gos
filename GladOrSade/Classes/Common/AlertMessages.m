/*
 
File: ViewAlert.h
Abstract: Utility functions for the alerting end user.
Copyright (C) 2011 @. All Rights Reserved.
 
*/

#import "AlertMessages.h"

/*
------------------------------------------------------------------------
This method alerts the user with a mssage.
@param message: the alert message 
@param btnName: the name of the button 
@param delegate: the object that will be notified after the user clicks 
				the button 
------------------------------------------------------------------------
*/
void AlertWithOneBtn(NSString *title, NSString *message, NSString *btnName, id delegate)
{
	/* open an alert with an button */
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title 
												message:message
												delegate:delegate 
												cancelButtonTitle:btnName 
												otherButtonTitles: nil];
	[alert show];
	[alert release];
}

/*
------------------------------------------------------------------------
This method alerts the user with a mssage.
@param message: the alert message 
@param leftBtnName: the name of the button 
@param rightBtnName: the name of the button 
@param delegate: the object that will be notified after the user clicks 
			the button 
------------------------------------------------------------------------
*/
void AlertWithTwoBtns(NSString *title, NSString *message, NSString *leftBtnName, NSString *rightBtnName,id delegate)
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
												message:message
												delegate:delegate 
												cancelButtonTitle:leftBtnName 
												otherButtonTitles: rightBtnName, nil];
	[alert show];
	[alert release];
}
/*
//------------------------------------------------------------------------
//This method shows a error.
//@param message: the alert message 
//@param leftBtnName: the name of the button  
//@param delegate: the object that will be notified after the user clicks 
//the button 
//------------------------------------------------------------------------
void Error(NSString *serverMessage, id delegate)
{
	ViewMessage *alert = [[ViewMessage alloc] initWithType:[[iPhoneCore sharedInstance] string:STRING_MESSAGE_TITLE_ERROR] 
												   message:serverMessage
													footer:@""
												  delegate:delegate 
										 cancelButtonTitle:[[iPhoneCore sharedInstance] string:STRING_BUTTON_OK] 
										 otherButtonTitles:nil 
													  type:Error];
	[alert show];
	[alert release];
}
//------------------------------------------------------------------------
//This method shows a fatal error.
//@param serverMessage: the alert server message
//------------------------------------------------------------------------
void InternalError()
{
	ViewMessage *alert = [[ViewMessage alloc]
						  initWithType:[[iPhoneCore sharedInstance] string:STRING_MESSAGE_TITLE_INTERNAL_ERROR] 
						  message:[[iPhoneCore sharedInstance] string:STRING_MESSAGE_INTERNAL_ERROR]
						  footer:@""
						  delegate:nil 
						  cancelButtonTitle:[[iPhoneCore sharedInstance] string:STRING_BUTTON_OK]  
						  otherButtonTitles:nil
						  type:FatalError];
	[alert show];
	[alert release];
	
}
//------------------------------------------------------------------------
//This method shows a connection error.
//@param message: the alert title message
//@param message: the alert message 
//------------------------------------------------------------------------
void ConnectionError(NSString *serverMessage, id delegate)
{
	ViewMessage *alert = [[ViewMessage alloc] initWithType:@"" 
												   message:serverMessage
													footer:@""
												  delegate:delegate 
										 cancelButtonTitle:[[iPhoneCore sharedInstance] string:STRING_BUTTON_OK]  
										 otherButtonTitles:nil 
													  type:ConnectionError];
	[alert show];
	[alert release];
}
*/