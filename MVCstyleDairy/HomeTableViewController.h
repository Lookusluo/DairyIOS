//
//  HomeTableViewController.h
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DairyManager.h"
#import "DairyViewController.h"

@interface HomeTableViewController : UITableViewController<DiaryManagerDelegate>
@property(nonatomic,strong)DairyManager*diaryManger;
@end
