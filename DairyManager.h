//
//  DairyManager.h
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DairyManager : NSObject
@property(nonatomic,strong)NSMutableArray*filesOnDisk;
@property (nonatomic, strong) NSFileManager *fileManager;


+(instancetype)sharedInstance;

-(instancetype)init;
-(void)getAllFilesFromDisk;
//-(void)saveDiaryItemToDisk:(Diar)
@end
