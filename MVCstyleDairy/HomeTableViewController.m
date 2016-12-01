//
//  HomeTableViewController.m
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import "HomeTableViewController.h"

@interface HomeTableViewController ()
@property (nonatomic,strong)UIBarButtonItem*addBtnItem;
@end

@implementation HomeTableViewController

-(void)addButtonClicked:(UIBarButtonItem*)sender{
    [self performSegueWithIdentifier:@"toaddDairy" sender:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.diaryManger = [DairyManager sharedInstance];
    self.diaryManger.delegate = self;//When load, trigger delegate method informationUpdated.
    [self.diaryManger getAllFilesFromDisk];
    
    
    self.addBtnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonClicked:)];//add action to add Dairy
    
    self.navigationItem.rightBarButtonItem = self.addBtnItem;
}


-(void)informationUpdated{
    [self.tableView reloadData];
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
    
    return self.diaryManger.filesOnDisk.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.diaryManger.filesOnDisk[indexPath.row];
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"cellSegue"]){
        //get data from model
        UITableViewCell* cell = sender;
        NSString *filename = cell.textLabel.text;
        NSLog(@"%@",filename);
        
        DiaryItem *dItem = [self.diaryManger getDiaryItemForFileName:filename];
        //send data forward DairyViewController
        DairyViewController *destinationVC = [segue destinationViewController];
        destinationVC.createNew = NO;
        destinationVC.dairyItem = dItem;
        
    }
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




@end
