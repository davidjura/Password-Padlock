//
//  AccountInfoViewController.h
//  PasswordLocker
//
//  Created by David Jura on 12/14/16.
//  Copyright © 2016 David Jura. All rights reserved.
//

#import "ViewController.h"

@interface AccountInfoViewController : ViewController{
    __weak IBOutlet UILabel *AccountLabel;
    __weak IBOutlet UILabel *usernameLabel;
    __weak IBOutlet UILabel *passwordLabel;
    
    NSString *account;
    NSString *uname;
    NSString *pass;
    NSString *pincode;
}
@property (weak, nonatomic) UILabel *AccountType;
@property (weak, nonatomic) UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *password;

@property (nonatomic) NSString *account;
@property (nonatomic) NSString *uname;
@property (nonatomic) NSString *pass;
@property (nonatomic) NSString *pincode;

@end
