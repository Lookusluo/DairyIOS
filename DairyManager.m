//
//  DairyManager.m
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import "DairyManager.h"

@implementation DairyManager
-(instancetype)initWithCoder:(NSCoder*)aDecoder{
    if(self = [ super init]){
        self.filesOnDisk = [[NSMutableArray alloc]init];
        self.fileManager = [NSFileManager defaultManager];
    }
    self.filename = [aDecoder decodeObjectForKey:@"name"];
    self.fileContent = [aDecoder decodeObjectForKey:@"content"];
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.filename forKey:@"name"];
    [aCoder encodeObject:self.fileContent forKey:@"content"];
}

+(instancetype)sharedInstance{
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




@end
