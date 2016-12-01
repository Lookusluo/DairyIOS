//
//  DairyManager.h
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DairyManager : NSObject<NSCoding>
@property(nonatomic,strong)NSMutableArray*filesOnDisk;
@property (nonatomic, strong) NSFileManager *fileManager;
@property(nonatomic,strong)NSString*filename;
@property(nonatomic,strong)NSString*fileContent;
+(instancetype)sharedInstance;
//-(instancetype)init;
-(void)getAllFilesFromDisk;
@end
