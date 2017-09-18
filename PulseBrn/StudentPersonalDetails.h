//
//  StudentPersonalDetails.h
//  PulseBrn
//
//  Created by Student on 22/07/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentPersonalDetails : UIViewController 
@property (strong, nonatomic) IBOutlet UIBarButtonItem *slideButton;

@property (weak, nonatomic) IBOutlet UITableView *attendenceSummary;

@property NSMutableArray * summaryList;

@property NSMutableURLRequest * attendenceURLReq;
@property NSURLSession * attendenceURLSession;
@property NSURLSessionDataTask * attendenceURLDataTask;

@property NSMutableArray * attendenceResult;




@end
