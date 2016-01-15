//
//  SHJRequest.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/14.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let BaseRequestURL:String = "http://web.ibumobile.com/"

class SHJRequest: NSObject {
    func requestLoginwith(withUN username:String,andPS password:String,withDelegate delegate:protocol<SHJRequestDelegate>!, With tag:Int)->String{
        Alamofire.request(.POST, "http://web.ibumobile.com/client/head-ClientLogin-getLogin.do", parameters: ["data": "{\"userid\":\"\",\"channelid\":\"\",\"devicetype\":\"4\"}","authcode":"","password":"a0128fbd4a1556f2d155911ef50f683f","username":"d7ff6bb9e93c25b0ff0044411d284dbf","signiture":"cd0932a3920960e86f19a6140ac1f716a13298c3"],headers:["imei":"80bfc6e10a24a6827f974acc3f282d4e1a2c25e4","seed":"23716011","version":"V2R20A20P1"])
        .responseJSON { response in
            let json = JSON(response.result.value!)
            delegate.requestFinished(json,with:tag)
        }
        return "";
    }
    func requestLogin(delegate:protocol<SHJRequestDelegate>!, With tag:Int)->String{
        Alamofire.request(.POST, "http://web.ibumobile.com/client/head-ClientLogin-getLogin.do", parameters: ["data": "{\"userid\":\"\",\"channelid\":\"\",\"devicetype\":\"4\"}","authcode":"","password":"a0128fbd4a1556f2d155911ef50f683f","username":"d7ff6bb9e93c25b0ff0044411d284dbf","signiture":"cd0932a3920960e86f19a6140ac1f716a13298c3"],headers:["imei":"80bfc6e10a24a6827f974acc3f282d4e1a2c25e4","seed":"23716011","version":"V2R20A20P1"])
            .responseJSON { response in
                let json = JSON(response.result.value!)
                delegate.requestFinished(json,with:tag)
        }
        return "";
    }
}
