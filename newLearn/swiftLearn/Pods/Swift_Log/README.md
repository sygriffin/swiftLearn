# SwiftLog
Swift 日志分级打印工具，支持分不同等级打印log，添加专门用于打印网络请求报文的类型unicode转码，方便查看日志输出。支持打印日志到文件，提供文件路径方便上传日志文件，支持文件LRU淘汰，默认七天淘汰一次。用法详见Demo。
## 安装
```
支持ios9以上版本，swift4以上版本都支持
pod ‘Swift_Log’
```
## 使用 

```
/// log等级
public enum LogDegree : Int{
    case verbose = 0//最低级log
    case debug = 1//debug级别
    case netWork = 2//用于打印网络报文，可单独关闭
    case info = 3//重要信息级别
    case warning = 4//警告级别
    case error = 5//错误级别
}
```

```
// 设置默认打印Log的等级。低于此等级不做输出
    SLog.defaultLogDegree = .debug
// 用于网络日志的开关
    SLog.showNetLog = false
//缓存日志保存最长时间///如果需要自定义时间一定要在addFileLog之前  默认七天
    SLog.maxLogAge = 60 * 60 * 24 * 7
// 打印日志到文件中
    SLog.addFileLog = true
//获取文件地址URL
    SLog.getLogFileURL
```
输出日志
```
        SLogVerbose("打印最低级信息可忽视不理会")
        
        SLogDebug("打印Debug级信息")
        
        SLogNet("可单独关闭----\\u6253\\u5370\\u6d88\\u606f print message，可以用于打印类似网络请求报文")
        
        //支持打印时unicode转中文
        SLogInfo("打印Info级信息")
        
        SLogWarn("打印警告级信息")
        
        SLogError("打印Error信息")
```
也可以使用这种方法打印
```
       SLog.verbose("ignore")
        
       SLog.debug("debug")
        
       SLog.net("netWork")
       
       SLog.info("info")
        
       SLog.warn("warning")
        
       SLog.error("error")
```

详细用法参见Demo **ViewController**
