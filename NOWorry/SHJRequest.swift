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
import CryptoSwift
/// 请求地址前缀
let BaseRequestURL:String = "http://web.ibumobile.com/"
/// 请求地址后缀区
let reportdailyList:String = "client/daily-Daily-getDailyReportList.do"

let s_request:SHJRequest = SHJRequest()


class SHJRequest: NSObject {
    var imei = ""
    var username = ""
    var pass = ""
    var channelid = ""
    let devicetype = "4"
    var sessionid = ""
    var nickname = ""
    var parentmenuList:Array<JSON>!
    var rolenames = ""
    var siUsrFlag = ""
    
    class func getSHJ_request() ->SHJRequest {
        return s_request;
    }
    /**
     登录请求
     
     - parameter user_name: 登录账号
     - parameter pass_word: 登录密码
     - parameter data:      绑定信息
     - parameter delegate:  请求代理
     - parameter tag:       请求标签
     */
    func requestLoginwith(withUN user_name:String,andPS pass_word:String,anddata data:String,withDelegate delegate:protocol<SHJRequestDelegate>!, With tag:Int){
        let seed = getSeed()
        let key = getSHA1Key(seed)
        let u_n = getAES128(user_name, with: key)
        let p_d = getAES128(pass_word, with: key)
        let sign = "data=\(data)&authcode=&password=\(p_d)&username=\(u_n)&key=\(key)"
        let signiture = (sign as NSString).sha1ith64Base()
        if self.imei == ""{
            self.imei = OpenUDID.value()
        }
        Alamofire.request(.POST, "http://web.ibumobile.com/client/head-ClientLogin-getLogin.do", parameters: ["data": data,"authcode":"","password":p_d,"username":u_n,"signiture":signiture],headers:["imei":self.imei,"seed":seed,"version":VERSION])
            .responseJSON { response in
                let json = JSON(response.result.value!)
                if json["code"].intValue == 100{
                    self.sessionid = json["sessionId"].stringValue;
                    self.username = json["username"].stringValue
                    self.parentmenuList = json["parentmenuList"].arrayValue
                    self.rolenames = json["rolenames"].stringValue
                    self.siUsrFlag = json["siUsrFlag"].stringValue
                    self.nickname = json["nickname"].stringValue
                }
                delegate.requestFinished(json,with:tag)
        }
    }
    func request(withURL suffixurl:String,withParams param:NSDictionary,withKeyArr keyArray:Array<String>,withDelegate delegate:protocol<SHJRequestDelegate>!, With tag:Int){
        if self.username == ""{
            delegate.requestFinishedNOresult(with:"尚未登录成功，请稍后重试",and:tag )
            return
        }else{
            if self.imei == ""{
                self.imei = OpenUDID.value()
            }
            let requesturl = BaseRequestURL+suffixurl
            let requestDIC:NSMutableDictionary = NSMutableDictionary.init(object: self.username, forKey: "username")
            var sign = ""
            if keyArray.count>0{
                for p in 0...keyArray.count-1{
                    if keyArray[p] == "username"{
                        sign = sign + "username="+self.username+"&"
                    }else{
                        sign = sign + keyArray[p] + "=" + (param[keyArray[p]] as! String)+"&"
                        requestDIC.setValue(param[keyArray[p]], forKey: keyArray[p])
                    }
                }
            }else{
                sign = sign + "username="+self.username+"&"
                for  key in param.allKeys{
                    sign = sign + (key as! String)+"="+(param[key as! String] as! String)+"&"
                    requestDIC.setValue(param[key as! String], forKey: key as! String)
                }
            }
            let seed = getSeed()
            let key = getSHA1Key(seed)
            sign = sign+"key="+key
            let signiture = (sign as NSString).sha1ith64Base()
            requestDIC.setValue(signiture as String, forKeyPath: "signiture")
            Alamofire.request(.POST, requesturl, parameters:requestDIC as! [String:AnyObject],encoding:.URLEncodedInURL,headers:["sessionid":self.sessionid,"seed":seed,"imei":self.imei,"version":VERSION,"Charset":"UTF-8","Content-Type":"application/json; encoding=utf-8","Accept":"application/json"])
                .responseJSON { response in
                    let json = JSON(response.result.value!)
                    print(json)
                    delegate.requestFinished(json,with:tag)
            }
        }
    }
    func getSeed()->String{
        let date: NSDate = NSDate()
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "yyyyMMddHHMMSS"
        var str = formatter.stringFromDate(date)
        let random: NSString = NSString.init(format: "%u", arc4random()%100)
        str = (str as NSString).stringByReplacingCharactersInRange(NSMakeRange(1, 1), withString: random as String)
        return (str as NSString).substringToIndex(8)
    }
    func getSHA1Key(seed:String)->String{
        return (seed.sha1() as NSString).substringToIndex(16)
    }
    func getAES128(old:NSString,with keyStr:String)->String
    {
        return  old.AES128EncryptWithKey(keyStr);
    }
    
}
