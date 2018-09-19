//
//  MFAddRuleSectionItem.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/17.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

class MFAddRuleSectionItem: NSObject {
    var name: String?
    var items: Array<MFAddRuleCellItem>?
}


class MFAddRuleCellItem: NSObject {
    var name: String?
    var isSelect: Bool?
}
