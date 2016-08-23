//
//  HYXMLParser.m
//  test_XML
//
//  Created by wuhaiyang on 16/8/23.
//  Copyright © 2016年 wuhaiyang. All rights reserved.
//  XML解析工具

#import "HYXMLParser.h"

@implementation HYXMLParser
{
    NSXMLParser *_parser;
    NSString *_rootElement;
    NSString *_currentElementName;
    NSString *_currentElementContent;
    NSMutableDictionary *_dictionary;
}

/**
 *  单例
 */
+ (instancetype)sharedParser{
    static HYXMLParser *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HYXMLParser alloc] init];
    });
    return instance;
}


/**
 *  给定XML文件路径，把解析出来的内容转化为字典
 *
 *  @param xmlPathURL XML文件路径
 *  例子：  NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"xml"];
 *
 *  @return 字典
 */
- (NSMutableDictionary *)getDictWithXMLPath:(NSString *)xmlPath{

    //实例化
    if (_dictionary == nil) {
        _dictionary = [NSMutableDictionary dictionary];
    }
    
    //解析
    NSURL *fileURL = [NSURL fileURLWithPath:xmlPath];
    _parser = [[NSXMLParser alloc] initWithContentsOfURL:fileURL];
    _parser.delegate = self;
    [_parser parse];

    //解析完成后返回解析出来的字典
    NSMutableDictionary *dataDict = [NSMutableDictionary dictionary];
    dataDict[_rootElement] = _dictionary;
    return dataDict;
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    
    NSLog(@"文件开始----");
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{

    NSLog(@"文件结束----");
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"元素开始----%@--%@", elementName, attributeDict);

    if (_rootElement == nil) {  //扫描到的第一个元素为根元素
        
        _rootElement = elementName;
        
        if (attributeDict != nil) { // 以元素属性为基础，构建字典
            
            _dictionary = [NSMutableDictionary dictionaryWithDictionary:attributeDict];
        }
        
    }else {  //其他元素为根元素的子元素，当前正在解析的元素
        
        _currentElementName = elementName;
    }

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"元素内容----%@", string);
    
    //xml把空格，换行都会解析，所以需要进行判断!开始的时候一个换行加四个空格，结束的时候只有一个换行!
    if ([string isEqualToString:@"\n    "] || [string isEqualToString:@"\n"] || string == nil) {
        
        return;
    }
    
    _currentElementContent = string;
    
    if (_currentElementName == nil) { //第一次为根元素，currentElementName一定为nil
        
        return;
    }
    
    //把解析出来的内容转化为字典
    _dictionary[_currentElementName] = _currentElementContent;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"元素结束----%@", elementName);

    
}

@end
