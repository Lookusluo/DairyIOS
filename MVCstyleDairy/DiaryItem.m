//
//  DiaryItem.m
//  MVCstyleDairy
//
//  Created by Yazhong Luo on 11/30/16.
//  Copyright © 2016 Yazhong Luo. All rights reserved.
//

#import "DiaryItem.h"

@implementation DiaryItem
-(instancetype)initWithCoder:(NSCoder*)aDecoder{

    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.content = [aDecoder decodeObjectForKey:@"content"];
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.content forKey:@"content"];
}
@end
