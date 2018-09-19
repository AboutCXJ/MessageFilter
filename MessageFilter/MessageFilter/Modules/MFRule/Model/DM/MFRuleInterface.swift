//
//  MFRuleInterface.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/5.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

class MFRuleInterface: BaseInterface {
    
    //跳转到添加规则页面
    class func interfaceRuleAddVC() -> MFAddRuleVC {
        let vc = MFAddRuleVC()
        return vc
    }
}
