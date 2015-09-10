//
//  ViewController.swift
//  Weather
//
//  Created by Cyrilshanway on 2015/9/10.
//  Copyright (c) 2015年 Cyrilshanway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tv:UITextView?
    
    
    @IBAction func btnPressed(sender:AnyObject) {
        println("btn pressed")
        
        LoadWeather()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        LoadWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func LoadWeather() {
        
        var url = NSURL(string: "http://www.weather.com.cn/data/sk/101010100.html")
        // init?(contentsOfURL aURL: NSURL)
        var data = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingUncached, error: nil)
        var str = NSString(data: data!, encoding: NSUTF8StringEncoding)
        
        var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil)
        
        var weatherInfo: AnyObject? = json.objectForKey("weatherinfo")
        
        var city: AnyObject? = weatherInfo?.objectForKey("city")
        
        var temp: AnyObject? = weatherInfo?.objectForKey("temp")
        
        var wind: AnyObject? = weatherInfo?.objectForKey("WD")
        
        var ws: AnyObject? = weatherInfo?.objectForKey("WS")
        
        tv!.text = "城市: \(city)\n溫度: \(temp)\n風:\(wind)\n風級:\(ws)"
    }
}

