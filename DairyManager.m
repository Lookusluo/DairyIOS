//
//  DairyManager.m
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import "DairyManager.h"

@implementation DairyManager
-(instancetype)init{
    if(self = [ super init]){
        self.filesOnDisk = [[NSMutableArray alloc]init];
        self.fileManager = [NSFileManager defaultManager];
        self.diaryEntriesPath = [NSHomeDirectory() stringByAppendingString:@"/Documents/DiaryEntries"];
    }
    return self;
}



+(instancetype)sharedInstance{//Singleton model only use in Model
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}

-(void)getAllFilesFromDisk{
    NSString *diaryEntriesPath = [NSHomeDirectory() stringByAppendingString:@"/Document/DiaryEntries"];
    
    BOOL isDirectory;
    [self.fileManager fileExistsAtPath:diaryEntriesPath isDirectory:&isDirectory];
    
    NSError *error;
        if (!isDirectory){
        [self.fileManager createDirectoryAtPath:diaryEntriesPath withIntermediateDirectories:NO attributes:nil error:&error];
        if (!error){
            NSLog(@"Directory created");
        }
    }
    self.filesOnDisk = [[self.fileManager contentsOfDirectoryAtPath:diaryEntriesPath error:&error]mutableCopy];
}

-(void)saveDiaryItemToDisk:(DiaryItem *)dItem{
    BOOL isDirectory;
    if ([self.fileManager fileExistsAtPath:self.diaryEntriesPath isDirectory:&isDirectory]) {
        if (isDirectory) {
            NSString *dItemPath = [self.diaryEntriesPath stringByAppendingPathComponent:[dItem.title stringByAppendingString:@"txt"]];
            
            if ([self.fileManager fileExistsAtPath:dItemPath isDirectory:nil]) {
                assert(NO);
#warning hole
            }
            else{
                [dItem.content writeToFile:dItemPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
                
                [self.filesOnDisk addObject:dItem.title];
            }
        }
        else{
#warning hole
            assert(NO);
        }
    }
}


@end
