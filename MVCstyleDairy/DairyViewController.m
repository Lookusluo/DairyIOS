//
//  DairyViewController.m
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import "DairyViewController.h"

@interface DairyViewController ()

@end

@implementation DairyViewController
-(void)saveBtnClicked:(UIBarButtonItem*)sender{
    if ([self validInput]) {
        DiaryItem *ditem = [[DiaryItem alloc]init];
        ditem.title = self.titleTextField.text;
        ditem.content = self.contentTextView.text;
        
        DairyManager *manageSave = [DairyManager sharedInstance];
        [manageSave saveDiaryItemToDisk:ditem];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        assert(NO);
# warning hole
    }
}

-(bool)validInput{
    if(self.titleTextField.text.length > 3 && self.contentTextView.text.length > 5){
        return YES;
    }
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.contentTextView.layer.borderColor = [[UIColor grayColor]CGColor];//Convert UIColor to CGColor
    self.contentTextView.layer.borderWidth = 1.0;
    self.contentTextView.layer.cornerRadius = 3.0;
    
    self.saveBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveBtnClicked:)];
    self.navigationItem.rightBarButtonItem = self.saveBtnItem;
    
    if(!self.createNew){//check weather we need creat new Dairy Item
        self.titleTextField.text = self.dairyItem.title;
        self.contentTextView.text = self.dairyItem.content;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
