//
//  UIMenuItem+CXAImageSupport.h
//  UIMenuItem+CXAImageSupport
//
//  Copyright (c) 2013 CHEN Xian'an <xianan.chen@gmail.com>. All rights reserved.
//  UIMenuItem+CXAImageSupport is released under the MIT license. In short, it's royalty-free but you must you keep the copyright notice in your code or software distribution.
//

#import <UIKit/UIKit.h>

@class CXAMenuItemSettings;

@interface UIMenuItem (CXAImageSupport)

- (id)cxa_initWithTitle:(NSString *)title action:(SEL)action image:(UIImage *)image;
- (id)cxa_initWithTitle:(NSString *)title action:(SEL)action settings:(CXAMenuItemSettings *)settings;
- (void)cxa_setImage:(UIImage *)image;
- (void)cxa_setSettings:(CXAMenuItemSettings *)settings;

@end

// Uses a settings class instead of NSDictionary to avoid misspelled keys
@interface CXAMenuItemSettings : NSObject

+ (instancetype)settingsWithDictionary:(NSDictionary *)dict;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic) BOOL shadowDisabled;
@property (nonatomic) CGFloat shrinkWidth; // For adjustment item width only, will not be preciouse because menu item will keep its minimun width, it's useful for showing some large amount of menu items without expanding.

@end
