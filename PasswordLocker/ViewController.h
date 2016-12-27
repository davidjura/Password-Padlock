//
//  ViewController.h
//  PasswordLocker
//
//  Created by David Jura on 12/7/16.
//  Copyright © 2016 David Jura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextFieldPassword.h"
#define PASSWORD_LENGTH 4

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextFieldPassword *passField;
-(IBAction) submitPassword:(id)sender;
@end

