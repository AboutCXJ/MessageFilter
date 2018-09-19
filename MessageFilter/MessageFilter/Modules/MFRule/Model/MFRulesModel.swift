//
//  MFRulesModel.swift
//  MessageFilter
//
//  Created by sfzx on 2018/3/12.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit
import IdentityLookup


let MFAppGroupName = "group.messageFilterExt"
let MFRuleKey = "MFRuleKey"

let MFRulesSaveNotification = "rulesSaveNotification"


struct MFRuleModel: JSON {
    var type: MFTargetType  //规则的类型,  号码/内容
    var content: String = ""
}




class MFRulesModel: NSObject, JSON {
    var blackList = [MFRuleModel]()//黑名单
    var whiteList = [MFRuleModel]()//白名单
    
    
    //保存
    func save() {
        let userDefaults = UserDefaults.init(suiteName: MFAppGroupName)
        
        let ruleString = self.toJSONString()
        userDefaults?.setValue(ruleString, forKey: MFRuleKey)
        
        
        //发送通知
        NotificationCenter.default.post(name: NSNotification.Name.init(MFRulesSaveNotification), object: nil)
        
    }
    
    
    
    //获取
    class func rules() -> MFRulesModel {
        
        let userDefault = UserDefaults.init(suiteName: MFAppGroupName)
        
        let ruleString = userDefault?.object(forKey: MFRuleKey)
        
        if ruleString != nil {
            let string  = ruleString as! String
            
            let jsonData = string.data(using: .utf8)!
            
            return try! JSONDecoder().decode(MFRulesModel.self, from: jsonData)
            
        }
        return MFRulesModel()
    }
    
    
    
    //是否过滤短信
    class func isFilterMessageRequest(_ queryRequest: ILMessageFilterQueryRequest) -> Bool {
        
        let userDefault = UserDefaults.init(suiteName: MFAppGroupName)
        
        let ruleString = userDefault?.object(forKey: MFRuleKey)
        
        if ruleString == nil {
            return false
        }
        
        
        let string  = ruleString as! String
        
        let jsonData = string.data(using: .utf8)!
        
        let rules = try! JSONDecoder().decode(MFRulesModel.self, from: jsonData)
        
        
        
        //白名单
        for rule in rules.whiteList {
            if rule.type == .phoneNo {
                if queryRequest.sender == rule.content {
                    return false
                }
            }else if rule.type == .content {
                if queryRequest.messageBody?.range(of: rule.content) != nil {
                    return false
                }
            }
        }
        
        
        
        //黑名单
        for rule in rules.blackList {
            if rule.type == .phoneNo {
                if queryRequest.sender == rule.content {
                    return true
                }
            }else if rule.type == .content {
                if queryRequest.messageBody?.range(of: rule.content) != nil {
                    return true
                }
            }
        }
        
        
        
        return false
    }
    
}






