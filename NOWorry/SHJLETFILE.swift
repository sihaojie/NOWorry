//
//  SHJLETFILE.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/15.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import Foundation
import UIKit

let IS_IOS7 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0
let IS_IOS8 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0
let IS_IOS9 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 9.0
let IS_IOS7_down = (UIDevice.currentDevice().systemVersion as NSString).doubleValue < 7.0
let Window_width = UIScreen.mainScreen().bounds.size.width as CGFloat
let Window_height = UIScreen.mainScreen().bounds.size.height as CGFloat

let VERSION = "V2R20A20P1"
/////返回的是个optional的可选值
public func Shj_mainPath(imageName:String,withtype shjType:String)->String{
    return NSBundle.mainBundle().pathForResource(imageName,ofType:shjType)!
}

// mark --请求Tag值


