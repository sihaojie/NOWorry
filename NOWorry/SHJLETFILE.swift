//
//  SHJLETFILE.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/15.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import Foundation

let IS_IOS7 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0
let IS_IOS8 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0
let IS_IOS9 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 9.0
let IS_IOS7_down = (UIDevice.currentDevice().systemVersion as NSString).doubleValue < 7.0
let Window_width = UIScreen.mainScreen().bounds.size.width as CGFloat
let Window_height = UIScreen.mainScreen().bounds.size.height as CGFloat


// mark --请求Tag值

let LOGINTAG = 1

