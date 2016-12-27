//
//  UserListsViewController.m
//  PasswordLocker
//
//  Created by David Jura on 12/11/16.
//  Copyright © 2016 David Jura. All rights reserved.
//

#import "UserListsViewController.h"
#import "AccountInfoViewController.h"
@interface UserListsViewController ()

@end
NSMutableArray *arr;
@implementation UserListsViewController
@synthesize passwordFromSegue,userList,loader;

- (void)viewDidLoad {
    [super viewDidLoad];
    userList.dataSource = self;
    userList.delegate = self;
    loader = [[SqlLoader alloc]init:passwordFromSegue];
    arr = [loader getAllUsers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnAdd:(id)sender {
    UIAlertController *alert =  [UIAlertController alertControllerWithTitle:@"Add Account" message:@"Enter an Account" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Site";
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Username";
    }];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Password";
        textField.secureTextEntry = YES;
    }];
    
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction *handle){
        [loader addUser:[[alert textFields][1] text] Password:[[alert textFields][2] text] AccountType:[[alert textFields][0] text] Pin:passwordFromSegue];
        [userList reloadData];
        [alert dismissViewControllerAnimated:YES completion:NULL];
    }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:NULL];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"infosegue" sender:[arr objectAtIndex:indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [loader getUserCount:passwordFromSegue];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellRow"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UIAlertActionStyleDefault reuseIdentifier:@"cellRow"];
    }
    UserData *temp = [arr objectAtIndex:indexPath.item];
    
    cell.textLabel.text = [temp getAccountType];
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        UserData *tempUser = [arr objectAtIndex:indexPath.item];
        [loader deleteUser:[tempUser getUID]];
        [arr removeAllObjects];
        [userList reloadData];
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    AccountInfoViewController *vcSeg = (AccountInfoViewController *)[segue destinationViewController];
    vcSeg.pincode = passwordFromSegue;
    
    UserData *temp = (UserData *)sender;
    vcSeg.uname = [AESCrypt decrypt:[temp getUsername] password:passwordFromSegue];;
    vcSeg.pass = [AESCrypt decrypt:[temp getPassword] password:passwordFromSegue];;
    vcSeg.account = [temp getAccountType];
}
@end
