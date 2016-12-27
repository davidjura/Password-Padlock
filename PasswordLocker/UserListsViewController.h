//
//  UserListsViewController.h
//  PasswordLocker
//
//  Created by David Jura on 12/11/16.
//  Copyright © 2016 David Jura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SqlLoader.h"
#import "UserData.h"

@interface UserListsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSString *passwordFromSegue;
    SqlLoader *loader;
    IBOutlet UITableView *userList;
    
}
@property(nonatomic) SqlLoader *loader;
@property(nonatomic) NSString *passwordFromSegue;
@property(nonatomic) IBOutlet UITableView *userList;

- (IBAction)btnAdd:(id)sender;
@end
