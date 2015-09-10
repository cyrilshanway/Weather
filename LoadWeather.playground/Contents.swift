//: Playground - noun: a place where people can play
// 必須在os x裡在能import Cocoa
import Cocoa

var url = NSURL(string: "http://www.weather.com.cn/data/sk/101010100.html")
// init?(contentsOfURL aURL: NSURL)
var data = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingUncached, error: nil)
var str = NSString(data: data!, encoding: NSUTF8StringEncoding)

var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil)

var weatherInfo: AnyObject? = json.objectForKey("weatherinfo")

var city: AnyObject? = weatherInfo?.objectForKey("city")

var temp = weatherInfo?.objectForKey("temp")

var wind = weatherInfo?.objectForKey("WD")








