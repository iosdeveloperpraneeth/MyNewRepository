//
//  LeftMenuTableView.m
//  PulseBrn
//
//  Created by Student on 22/07/16.
//  Copyright © 2016 Student. All rights reserved.
//

#import "LeftMenuTableView.h"
#import "SWRevealViewController.h"
#import "StudentPersonalDetails.h"
#import "StudentLeaves.h"
#import "AppDelegate.h"
#import "StudentLoginPage.h"

@interface LeftMenuTableView ()
{
    AppDelegate * menuTable;
}

@end

@implementation LeftMenuTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuTable = [[UIApplication sharedApplication]delegate];
    
    self.tableList = @[@"profileID", @"leavesID", @"absentID", @"lateID", @"hoursMissedID", @"applyLeaveID", @"statusID", @"logOutUserID", @"locationID"];
    
    self.tableView.alwaysBounceVertical = NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tableList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = [self.tableList objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 30)];
    if (section == 0)
    {
        [headerView setBackgroundColor:[UIColor colorWithRed:54/255.0 green:65/255.0 blue:80/255.0 alpha:1]];        
       
        NSString * profileImage = [NSString stringWithFormat:@"%@", [menuTable.dataDict objectForKey:@"profileImagePath"]];
        
        profileImage = [profileImage stringByReplacingOccurrencesOfString:@".." withString:@""];
        
        NSString * imagePath = [NSString stringWithFormat:@"http://www.brninfotech.com/pulse/modules%@",profileImage];
        
        NSURL *url = [NSURL URLWithString:imagePath];
        
        UIImage *imageData=[UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        
        NSString * batch = [NSString stringWithFormat:@"%@", [menuTable.dataDict objectForKey:@"batchID"]];
        //NSLog(@"batch is %@" , batch);
        
        NSString * studentID = [NSString stringWithFormat:@"%@", [menuTable.dataDict objectForKey:@"studentID"]];
        
        NSString * name = [NSString stringWithFormat:@"%@", [menuTable.dataDict objectForKey:@"firstName"]];
        
        NSString * role = [NSString stringWithFormat:@"%@", [menuTable.dataDict objectForKey:@"role"]];
        
        self.studentImage.image = imageData;
        self.studentImage = [[UIImageView alloc] initWithImage:imageData];
        self.studentImage.frame = CGRectMake(10,0,110,150);
        self.studentImage.layer.cornerRadius = self.studentImage.frame.size.width / 2;
        self.studentImage.clipsToBounds = YES;
        self.studentImage.layer.borderWidth = 1.0f;
        self.studentImage.layer.borderColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1].CGColor;

        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(130, 20, 95, 20)];
        label.text = @"IOS Developer";
        label.font = [UIFont fontWithName:@"Arial" size:14];
        label.textColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
        
        UILabel * batchLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 40, 42, 20)];
        batchLabel.text = @"Batch:";
        batchLabel.font = [UIFont fontWithName:@"Arial" size:14.0];
        batchLabel.textColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
        
        self.batchID = [[UILabel alloc]initWithFrame:CGRectMake(180, 40, 42, 20)];
        self.batchID.text = batch;
        self.batchID.font = [UIFont fontWithName:@"Arial" size:14];
        self.batchID.textColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
        
        UILabel * studentIDLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 60, 42, 20)];
        studentIDLabel.text = @"ID:";
        studentIDLabel.font = [UIFont fontWithName:@"Arial" size:14.0];
        studentIDLabel.textColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
        
        self.studentBatchID = [[UILabel alloc]initWithFrame:CGRectMake(180, 60, 50, 20)];
        self.studentBatchID.text = studentID;
        self.studentBatchID.font = [UIFont fontWithName:@"Arial" size:14];
        self.studentBatchID.textColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
        
        UILabel * firstName = [[UILabel alloc]initWithFrame:CGRectMake(130, 80, 42, 20)];
        firstName.text = @"Name:";
        firstName.font = [UIFont fontWithName:@"Arial" size:14.0];
        firstName.textColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
        
        self.studentName = [[UILabel alloc]initWithFrame:CGRectMake(180, 80, 120, 20)];
        self.studentName.text = name;
        self.studentName.font = [UIFont fontWithName:@"Arial" size:14];
        self.studentName.textColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
        
        UILabel * roleLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 100, 42, 20)];
        roleLabel.text = @"Role:";
        roleLabel.font = [UIFont fontWithName:@"Arial" size:14.0];
        roleLabel.textColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
        
        self.studentRole = [[UILabel alloc]initWithFrame:CGRectMake(180, 100, 50, 20)];
        self.studentRole.text = role;
        self.studentRole.font = [UIFont fontWithName:@"Arial" size:14];
        self.studentRole.textColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
        
        [headerView addSubview:self.studentImage];
        [headerView addSubview:label];
        [headerView addSubview:self.batchID];
        [headerView addSubview:batchLabel];
        [headerView addSubview:self.studentBatchID];
        [headerView addSubview:studentIDLabel];
        [headerView addSubview:firstName];
        [headerView addSubview:self.studentName];
        [headerView addSubview:roleLabel];
        [headerView addSubview:self.studentRole];
    }
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"profileSegue"])
    {
        StudentPersonalDetails * personalDetails = segue.destinationViewController;
        NSLog(@"leave page %@" , personalDetails);
    }
    if ([segue.identifier isEqualToString:@"attendanceStatusSegue"])
    {
        StudentLeaves * leaves = segue.destinationViewController;
        NSLog(@"leave page %@" , leaves);
    }
    if ([segue.identifier isEqualToString:@"logOutUserSegue"])
    {
        StudentLoginPage * logOut = segue.destinationViewController;
        logOut.userNameTF.text = @"";
        logOut.passwordTF.text = @"";
    }
    
//    if ([segue.identifier isEqualToString:@"absentSegue"])
//    {
//        StudentLeaves * leaves = segue.destinationViewController;
//        NSLog(@"abesnt page");
//    }
//    if ([segue.identifier isEqualToString:@"lateSegue"])
//    {
//        StudentLeaves * leaves = segue.destinationViewController;
//        NSLog(@"late page");
//    }
//    if ([segue.identifier isEqualToString:@"hoursMissedSegue"])
//    {
//        StudentLeaves * leaves = segue.destinationViewController;
//        NSLog(@"houes missed page");
//    }
//    if ([segue.identifier isEqualToString:@"applyLeaveSegue"])
//    {
//        StudentLeaves * leaves = segue.destinationViewController;
//        NSLog(@"apply leave page");
//    }
//    if ([segue.identifier isEqualToString:@"statusSegue"])
//    {
//        StudentLeaves * leaves = segue.destinationViewController;
//        NSLog(@"status page");
//    }
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
