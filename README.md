# HYXMLParser
# 这个可以做什么？
一个简单的基于系统NSXML的XML解析的工具
# 怎么用？
###  **第一步：传入XML文件的路径**
   NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"xml"];
###  **第二步：调用工具进行解析，返回字典**
    NSMutableDictionary *dict = [[HYXMLParser sharedParser] getDictWithXMLPath:filePath];
# 适用范围？
  目前只有以下格式的XML文件可以正常解析，其他的解析不了。
  只支持一件嵌套，多级嵌套无法解析
	
    <Note id="1">
        <CDate>2016-01-01</CDate>
        <Content>每天早上7点钟起床</Content>
        <UserID>jack</UserID>
        <Transport>地铁</Transport>
        <Time>一个小时</Time>
    </Note>
# 最后
此内容只是用于分享交流之用，有什么问题欢迎提出！
