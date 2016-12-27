//
//  AccountInfoViewController.m
//  PasswordLocker
//
//  Created by David Jura on 12/14/16.
//  Copyright © 2016 David Jura. All rights reserved.
//

#import "AccountInfoViewController.h"
#import "UserListsViewController.h"

@interface AccountInfoViewController ()

@end

@implementation AccountInfoViewController
@synthesize AccountType,username,password,account,uname,pass,pincode;
- (void)viewDidLoad {
    [super viewDidLoad];
    AccountType.text = account;
    username.text = uname;
    password.text = pass;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UserListsViewController *vcSeg = (UserListsViewController *) [segue destinationViewController];
    vcSeg.passwordFromSegue = pincode;
}

@end
