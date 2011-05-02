//
//  UICustomLabel.m
//  iPhoneCore
//
//  Created by Emil DUSA on 6/23/10.
//  Copyright 2011. All rights reserved.
//

#import "UICustomLabel.h"
#import "Customization.h"

@implementation UICustomLabel

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.textColor = [Customization color:COLOR_BLUE];
        self.highlighted = NO;
        self.highlightedTextColor = [Customization color:COLOR_GRAY];
    }
    
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.textColor = [Customization color:COLOR_LINK_NORMAL];
        self.highlightedTextColor = [Customization color:COLOR_LINK_HIGHLIGHTED];
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.highlighted = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	
    if ([touch tapCount] == 1)
	{
		// Process a single-tap gesture
        // notify the registered target
		if ([_tappTarget respondsToSelector:_tappAction])
		{
			[_tappTarget performSelector:_tappAction withObject:self];
		}
    }
    
	self.highlighted = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	//UITouch *touch = [touches anyObject];
	
	self.highlighted = NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	//UITouch *touch = [touches anyObject];
	
	self.highlighted = NO;
}
#pragma mark -
#pragma Public
//-----------------------------------------------------------------
// Sets the target and its method that will be called when this 
// object is tapped. 
//-----------------------------------------------------------------
- (void)setTarget:(id)target forTappAction:(SEL)action {
	_tappTarget = target;
	_tappAction = action;
}

@end
