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
//    NSString *diaryEntriesPath = [NSHomeDirectory() stringByAppendingString:@"/Document/DiaryEntries"];
    NSLog(@"%@", NSHomeDirectory());
    BOOL isDirectory;
    [self.fileManager fileExistsAtPath:self.diaryEntriesPath isDirectory:&isDirectory];//return a BOOL value to isDirectory to decide wheather it is a Directory or file
    
    NSError *error;
        if (!isDirectory){
        [self.fileManager createDirectoryAtPath:self.diaryEntriesPath withIntermediateDirectories:NO attributes:nil error:&error];
        if (!error){
            NSLog(@"Directory created");
        }
    }
    self.filesOnDisk = [[self.fileManager contentsOfDirectoryAtPath:self.diaryEntriesPath error:&error]mutableCopy];//Copy and return objects
}

-(void)saveDiaryItemToDisk:(DiaryItem *)dItem{
    BOOL isDirectory;
    [self.fileManager fileExistsAtPath:self.diaryEntriesPath isDirectory:&isDirectory];
    
        if (isDirectory) {
            NSString *dItemPath = [self.diaryEntriesPath stringByAppendingPathComponent:[dItem.title stringByAppendingString:@".txt"]];
            
            if ([self.fileManager fileExistsAtPath:dItemPath isDirectory:nil]) {
                assert(NO);
#warning hole
            }
            else{
                [dItem.content writeToFile:dItemPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
                
                [self.filesOnDisk addObject:dItem.title];
                [self.delegate informationUpdated];
            }
        }
        else{
#warning hole
            assert(NO);
        }
}

-(DiaryItem*)getDiaryItemForFileName:(NSString*)fileName{
    BOOL isDirectory;
    [self.fileManager fileExistsAtPath:self.diaryEntriesPath isDirectory:&isDirectory];

    if (isDirectory) {
        DiaryItem *dItem = [[DiaryItem alloc]init];
        dItem.title = fileName;
        NSString *dItemPath = [self.diaryEntriesPath stringByAppendingPathComponent:fileName];
        dItem.content = [NSString stringWithContentsOfFile:dItemPath encoding:NSUTF8StringEncoding error:nil];
        
        return dItem;
    }
    else{
        assert(NO);
    }
}



@end
