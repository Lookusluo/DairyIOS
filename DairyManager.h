//
//  DairyManager.h
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiaryItem.h"
@protocol DiaryManagerDelegate<NSObject>
-(void)informationUpdated;
@end

@interface DairyManager : NSObject
@property(nonatomic,strong)NSMutableArray*filesOnDisk;
@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) NSString*diaryEntriesPath;
@property(nonatomic,weak)id<DiaryManagerDelegate>delegate;


+(instancetype)sharedInstance;

-(instancetype)init;
-(void)getAllFilesFromDisk;
-(void)saveDiaryItemToDisk:(DiaryItem*)dItem;
@end
