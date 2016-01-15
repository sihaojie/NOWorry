//
//  ESRootClass.swift
//  Alamofire
//
//  Created by 司浩杰 on 16/01/15
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

import UIKit
let login_Result:LoginResult = LoginResult()
class LoginResult: NSObject {

    var tip: String?

    var parentmenuList:NSArray?

    var code: String?

    var nickname: String?

    var siUsrFlag: String?

    var sessionId: String?

    var username: String?

    var rolenames: String?
    class func getLoginResult() ->LoginResult {
            return login_Result
    }

}