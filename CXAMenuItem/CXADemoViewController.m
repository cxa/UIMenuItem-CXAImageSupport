//
//  CXADemoViewController.m
//  CXAMenuItem
//
//  Created by Chen Xian'an on 1/3/13.
//  Copyright (c) 2013 lazyapps. All rights reserved.
//

#import "CXADemoViewController.h"
#import "UIMenuItem+CXAImageMenuItem.h"

@interface CXADemoViewController(){
  UIButton *_button;
  UILabel *_label;
}

- (void)pressme:(id)sender;
- (void)cameraAction:(id)sender;
- (void)broomAction:(id)sender;
- (void)textAction:(id)sender;

@end

@implementation CXADemoViewController

- (id)init
{
  if (self = [super initWithNibName:nil bundle:nil]){
    
  }
  
  return self;
}

- (void)loadView
{
  [super loadView];
  
  self.view.backgroundColor = [UIColor darkGrayColor];
  _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [_button setTitle:NSLocalizedString(@"Press Me", nil) forState:UIControlStateNormal];
  [_button addTarget:self action:@selector(pressme:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:_button];
  _label = [[UILabel alloc] initWithFrame:CGRectZero];
  _label.font = [UIFont fontWithName:@"AvenirNext-Bold" size:15.];
  _label.textAlignment = NSTextAlignmentCenter;
  _label.textColor = [UIColor whiteColor];
  _label.backgroundColor = [UIColor clearColor];
  _label.shadowColor = [[UIColor blackColor] colorWithAlphaComponent:.75];
  _label.shadowOffset = CGSizeMake(0, 1);
  _label.numberOfLines = 0;
  _label.text = NSLocalizedString(@"Under MIT License.\n(c) 2013 CHEN Xian'an\n<xianan.chen@gmail.com>", nil);
  [self.view addSubview:_label];
  UIMenuItem *cameraItem = [[UIMenuItem alloc] cxa_initWithTitle:NSLocalizedString(@"Camera", nil) action:@selector(cameraAction:) image:[UIImage imageNamed:@"camera"]];
  UIMenuItem *broomItem = [[UIMenuItem alloc] cxa_initWithTitle:NSLocalizedString(@"Broom", nil) action:@selector(broomAction:) image:[UIImage imageNamed:@"broom"]];
  UIMenuItem *textItem = [[UIMenuItem alloc] initWithTitle:NSLocalizedString(@"No Image", nil) action:@selector(textAction:)];
  [UIMenuController sharedMenuController].menuItems = @[cameraItem, broomItem, textItem];
}

- (void)viewWillLayoutSubviews
{
  [_button sizeToFit];
  _button.center = self.view.center;
  [_label sizeToFit];
  CGRect r = _label.bounds;
  r.origin.y = CGRectGetHeight(self.view.bounds) - CGRectGetHeight(r) - 10;
  r.size.width = CGRectGetWidth(self.view.bounds);
  _label.frame = r;
}

#pragma mark -
- (BOOL)canBecomeFirstResponder
{
  return YES;
}

- (BOOL)canPerformAction:(SEL)action
              withSender:(id)sender
{
  if (action == @selector(cameraAction:) ||
      action == @selector(broomAction:) ||
      action == @selector(textAction:))
    return YES;
  
  return [super canPerformAction:action withSender:sender];
}

#pragma mark - privates
- (void)pressme:(id)sender
{
  [[UIMenuController sharedMenuController] setTargetRect:[sender frame] inView:self.view];
  [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
}

- (void)cameraAction:(id)sender
{
  [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Camera Item Pressed", nil) message:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"Dismiss", nil) otherButtonTitles:nil] show];
}

- (void)broomAction:(id)sender
{
  [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Broom Item Pressed", nil) message:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"Dismiss", nil) otherButtonTitles:nil] show];
}

- (void)textAction:(id)sender
{
  [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Text Item Pressed", nil) message:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"Dismiss", nil) otherButtonTitles:nil] show];
}

@end
