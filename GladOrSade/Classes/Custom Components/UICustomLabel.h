//
//  UICustomLabel.h
//  iPhoneCore
//
//  Created by Emil DUSA on 6/23/10.
//  Copyright 2011. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UICustomLabel : UILabel {
	// Actions
	id			_tappTarget;
	SEL			_tappAction;
}

- (void)setTarget:(id)target forTappAction:(SEL)action;

@end
