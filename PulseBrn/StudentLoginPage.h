//
//  StudentLoginPage.h
//  PulseBrn
//
//  Created by Student on 21/07/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentLoginPage : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userNameTF;
@property (strong, nonatomic) IBOutlet UITextField *passwordTF;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *forgotPasswordButton;
@property (strong, nonatomic) IBOutlet UIButton *createAccountButton;


@property NSMutableURLRequest * urlReq;
@property NSURLSession * pulseURLSession;
@property NSURLSessionDataTask * dataTask;
@property NSString * loginServiceURL;
//@property NSMutableDictionary * responseDataDict;


- (IBAction)loginButtonTapped:(id)sender;
- (IBAction)forgotPasswordButtonTapped:(id)sender;



@end
