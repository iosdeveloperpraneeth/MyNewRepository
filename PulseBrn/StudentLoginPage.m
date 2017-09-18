//
//  StudentLoginPage.m
//  PulseBrn
//
//  Created by Student on 21/07/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "StudentLoginPage.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
#import "Reachability.h"

@interface StudentLoginPage ()
{
    AppDelegate * studentData;
}

@end

@implementation StudentLoginPage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    studentData = [[UIApplication sharedApplication]delegate];
    
    self.loginServiceURL = @"http://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php";
    
    self.userNameTF.delegate = self;
    self.passwordTF.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)loginButtonTapped:(id)sender
{
    self.urlReq = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.loginServiceURL]];
    
    [self.urlReq setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [self.urlReq setHTTPMethod:@"POST"];
    
    NSString *post = [[NSString alloc] initWithFormat:@"registeredEmail=%@&registeredPassword=%@&funcName=%@",self.userNameTF.text,self.passwordTF.text,@"verifyLogin"];
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    
    [self.urlReq setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    [self.urlReq setHTTPBody:postData];
    
    NSURLSessionConfiguration * urlSessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    self.pulseURLSession = [NSURLSession sessionWithConfiguration:urlSessionConfig];
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable)
    {
        UIAlertController * intertnetAlert = [UIAlertController alertControllerWithTitle:@"Please check your internet connection" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [intertnetAlert addAction:okAction];
        [self presentViewController:intertnetAlert animated:YES completion:nil];
        
    }
    else  if (networkStatus == ReachableViaWiFi || networkStatus == ReachableViaWWAN)
    {
        self.dataTask = [self.pulseURLSession dataTaskWithRequest:self.urlReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            studentData.dataDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSLog(@"got response from server %@",studentData.dataDict);
            
            NSString * validation = [NSString stringWithFormat:@"%@", [studentData.dataDict objectForKey:@"loggedIn"]];
            NSString * responseFromServer=[NSString stringWithFormat:@"%@",[studentData.dataDict objectForKey:@"msg"]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([validation isEqualToString:@"yes"])
                {
                    SWRevealViewController * slideout = [self.storyboard instantiateViewControllerWithIdentifier:@"mediaterVC"];
                    
                    [self presentViewController:slideout animated:YES completion:nil];
                }
                else
                {
                    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Please check email and password" message:responseFromServer preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                        [self dismissViewControllerAnimated:YES completion:nil];
                    }];
                    
                    [alert addAction:okAction];
                    [self presentViewController:alert animated:YES completion:nil];
                }
            });
        }];
        
        [self.dataTask resume];
    }
      
}

- (IBAction)forgotPasswordButtonTapped:(id)sender {
}
@end
