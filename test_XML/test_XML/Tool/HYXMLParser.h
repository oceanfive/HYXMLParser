//
//  HYXMLParser.h
//  test_XML
//
//  Created by wuhaiyang on 16/8/23.
//  Copyright © 2016年 wuhaiyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYXMLParser : NSObject<NSXMLParserDelegate>


/**
 *  单例
 */
+ (instancetype)sharedParser;

/**
 *  给定XML文件路径，把解析出来的内容转化为字典
 *
 *  @param xmlPathURL XML文件路径
 *  例子：  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"xml"];
 *
 *  @return 字典
 */
- (NSMutableDictionary *)getDictWithXMLPath:(NSString *)xmlPath;

@end
