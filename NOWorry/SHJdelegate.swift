//
//  SHJdelegate.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/13.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import Foundation
import SwiftyJSON
public protocol ShjDelegate:NSObjectProtocol{
    func  segmentSelectSendBack(index:Int)
}
public protocol SHJRequestDelegate:NSObjectProtocol{
    func  requestFail(error:NSError,with tag:Int)
    func  requestFinished(result:JSON,with tag:Int)
}