//
//  StudentPersonalDetails.m
//  PulseBrn
//
//  Created by Student on 22/07/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "StudentPersonalDetails.h"
#import "SWRevealViewController.h"
#import "AppDelegate.h"
#import "CustomCell.h"

@interface StudentPersonalDetails ()
{
    AppDelegate * studentPD;
    NSDictionary * resultDict;
    NSArray * keys;
    NSArray * values;
}

@end

@implementation StudentPersonalDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.attendenceSummary reloadData];
    
    studentPD = [[UIApplication sharedApplication]delegate];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.slideButton setTarget: self.revealViewController];
        [self.slideButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
   //self.summaryList = [[NSMutableArray alloc]initWithObjects:@"Total Days",@"Working Days", @"Leaves", @"Absents", @"Days Attended", @"Updates Sent", @"Working Hours", @"Worked Hours", @"Shortage Hours", @"Worked Per Days(Avg.Hrs)", @"Shortage Per day(Avg.Hrs)", @"Late to Office", @"Minimum Hrs Missed", @"Hello", nil];
    
    
    
    NSString * attendenceURL = @"http://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php";
    
    self.attendenceURLReq = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:attendenceURL]];
    
    [self.attendenceURLReq setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [self.attendenceURLReq setHTTPMethod:@"POST"];
    
    NSString *post = @"funcName=getUserAttendance";
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    
    [self.attendenceURLReq setValue:postLength forHTTPHeaderField:@"Content-Length"];
    
    [self.attendenceURLReq setHTTPBody:postData];
    
    NSURLSessionConfiguration * urlSessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    self.attendenceURLSession = [NSURLSession sessionWithConfiguration:urlSessionConfig];
    
    self.attendenceURLDataTask = [self.attendenceURLSession dataTaskWithRequest:self.attendenceURLReq completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        self.attendenceResult = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        resultDict = [self.attendenceResult objectAtIndex:0];
        //NSLog(@"Dictonary Data %@" , resultDict);
        dispatch_async(dispatch_get_main_queue(), ^{ // use dispatch to get data directly
            [self.attendenceSummary reloadData];
        });
    }];
    
    [self.attendenceURLDataTask resume];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    keys = [resultDict allKeys];
    values = [resultDict allValues];
    //NSString * converValues = [NSString stringWithFormat:@"%@", [resultDict allValues]];
    //NSLog(@"String Values are %@" , converValues);
    
    //NSCharacterSet * charset = [NSCharacterSet characterSetWithCharactersInString:@"()"];
    //arrayOfString = [[[converValues componentsSeparatedByCharactersInSet:charset]componentsJoinedByString:@""]componentsSeparatedByString:@","];
    
//    arrayOfString = [converValues componentsSeparatedByString:@","];
//    arrayOfString = [converValues componentsSeparatedByString:@"\n"];
//    arrayOfString = [converValues componentsSeparatedByString:@"("];
    
    //NSLog(@"%@" , arrayOfString);
    return resultDict.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell * studentAttendance = [tableView dequeueReusableCellWithIdentifier:@"summaryID"];
    NSArray * custom = [[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil];
    studentAttendance = [custom objectAtIndex:0];
    
    studentAttendance.resultTitle.text = [keys objectAtIndex:indexPath.row];
    NSMutableArray * stringArray = [[resultDict allValues]mutableCopy];
    NSString * arrayOfString = [stringArray objectAtIndex:indexPath.row];
    studentAttendance.resultForKey.text = [NSString stringWithFormat:@"%@" , arrayOfString];
    
    
    return studentAttendance;
}



@end
