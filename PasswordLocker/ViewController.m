//
//  ViewController.m
//  PasswordLocker
//
//  Created by David Jura on 12/7/16.
//  Copyright © 2016 David Jura. All rights reserved.
//

#import "ViewController.h"
#import "UITextFieldPassword.h"
#import "AESCrypt.h"
#import "SqlLoader.h"
#import "UserListsViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize passField;

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark hide the keyboard when the user touches the screen
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [passField resignFirstResponder];
}

#pragma mark check password field to ensure it contains 4 characters and go to the UserListsViewController
- (IBAction)submitPassword:(id)sender {
    if([[passField text] length] != 4){
        UIAlertController *alert =  [UIAlertController alertControllerWithTitle:@"Error" message:@"Password must be 4 characters long." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *handle){
            [alert dismissViewControllerAnimated:YES completion:NULL];
        }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:NULL];
    }else{
        [self performSegueWithIdentifier:@"homeSegue" sender:sender];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UserListsViewController *vcSeg = (UserListsViewController *)[segue destinationViewController];
    vcSeg.passwordFromSegue = [passField text];
}
         
@end
