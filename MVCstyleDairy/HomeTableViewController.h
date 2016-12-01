//
//  HomeTableViewController.h
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DairyManager.h"
@interface HomeTableViewController : UITableViewController
@property(nonatomic,strong)DairyManager*dairyManger;
@end
