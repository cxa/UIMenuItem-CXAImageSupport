//
//  UIMenuItem+CXAImageMenuItem.h
//  CXAMenuItem
//
//  Created by Chen Xian'an on 1/3/13.
//  Copyright (c) 2013 lazyapps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIMenuItem (CXAImageMenuItem)

- (id)cxa_initWithTitle:(NSString *)title action:(SEL)action image:(UIImage *)image;
- (void)cxa_setImage:(UIImage *)image forTitle:(NSString *)title;

@end
