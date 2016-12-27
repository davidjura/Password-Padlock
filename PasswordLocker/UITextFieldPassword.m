//
//  UITextFieldPassword.m
//  PasswordLocker
//
//  Created by David Jura on 12/7/16.
//  Copyright © 2016 David Jura. All rights reserved.
//

#import "UITextFieldPassword.h"

@implementation UITextFieldPassword

#define MAX_LENGTH 4
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    if (self) {
        self.delegate = self;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(range.location >= MAX_LENGTH)
        return NO;
    else
        return YES;
}

@end
