//
//  UIMenuItem+CXAImageMenuItem.m
//  CXAMenuItem
//
//  Created by Chen Xian'an on 1/3/13.
//  Copyright (c) 2013 lazyapps. All rights reserved.
//

#import "UIMenuItem+CXAImageMenuItem.h"
#import <objc/runtime.h>

#define INVISIBLE_IDENTIFER @"\uFEFF\u200B"

static NSMutableDictionary *titleImagePairs;

@interface NSString (CXAImageMenuItem)

- (NSString *)cxa_stringByWrappingInvisibleIdentifiers;
- (BOOL)cxa_doesWrapInvisibleIdentifiers;

@end

#pragma mark -
@implementation UIMenuItem (CXAImageMenuItem)

+ (void)load
{
  static dispatch_once_t once;
  dispatch_once(&once, ^{
    titleImagePairs = [@{} mutableCopy];
  });
}

- (id)cxa_initWithTitle:(NSString *)title
                 action:(SEL)action
                  image:(UIImage *)image
{
  if (title)
    title = [title cxa_stringByWrappingInvisibleIdentifiers];
  
  if ([self initWithTitle:title action:action] &&
      title){
    titleImagePairs[title] = image;
  }
  
  return self;
}

- (void)cxa_setImage:(UIImage *)image
            forTitle:(NSString *)title
{
  if (!title)
    @throw [NSException exceptionWithName:@"CXAImageMenuItem" reason:@"title can't be nil" userInfo:nil];
    
  title = [title cxa_stringByWrappingInvisibleIdentifiers];
  self.title = title;
  titleImagePairs[title] = image;
}

@end

#pragma mark -
@implementation NSString (CXAImageMenuItem)

- (NSString *)cxa_stringByWrappingInvisibleIdentifiers
{
  return [NSString stringWithFormat:@"%@%@%@", INVISIBLE_IDENTIFER, self, INVISIBLE_IDENTIFER];
}

- (BOOL)cxa_doesWrapInvisibleIdentifiers
{
  BOOL doesStartMatch = [self rangeOfString:INVISIBLE_IDENTIFER options:NSAnchoredSearch].location != NSNotFound;
  if (!doesStartMatch)
    return NO;
  
  BOOL doesEndMatch = [self rangeOfString:INVISIBLE_IDENTIFER options:NSBackwardsSearch].location != NSNotFound;
  return doesEndMatch;
}

@end

#pragma mark -

static void (*origDrawTextInRect)(id, SEL, CGRect);
static void drawImageInRect(id, SEL, CGRect);

@interface UILabel (CXAImageMenuItem) @end

@implementation UILabel (CXAImageMenuItem)

+ (void)load
{
  Method origMethod = class_getInstanceMethod(self, @selector(drawTextInRect:));
  origDrawTextInRect = (void *)method_getImplementation(origMethod);
  if (!class_addMethod(self, @selector(drawTextInRect:), (IMP)drawImageInRect, method_getTypeEncoding(origMethod)))
    method_setImplementation(origMethod, (IMP)drawImageInRect);
}

@end

static void drawImageInRect(UILabel *self, SEL _cmd, CGRect rect)
{
  if (![self.text cxa_doesWrapInvisibleIdentifiers]){
    origDrawTextInRect(self, @selector(drawTextInRect:), rect);
    return;
  }
  
  UIImage *img = titleImagePairs[self.text];
  CGSize size = img.size;
  CGPoint point = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
  point.x -= size.width/2;
  point.y -= size.height/2;
  point.x = ceilf(point.x);
  point.y = ceilf(point.y);
  [img drawAtPoint:point];
}

