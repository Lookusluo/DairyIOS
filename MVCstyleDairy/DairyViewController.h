//
//  DairyViewController.h
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiaryItem.h"
#import "DairyManager.h"
@interface DairyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property(strong,nonatomic) UIBarButtonItem*saveBtnItem;

@property(nonatomic)BOOL createNew;
@end
