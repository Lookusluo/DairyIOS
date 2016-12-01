//
//  DiaryItem.h
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiaryItem : NSObject<NSCoding>
@property(nonatomic,strong)NSString*title;
@property(nonatomic,strong)NSString*content;
@end
