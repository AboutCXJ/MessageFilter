//
//  MFType.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/17.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

enum MFListType: String, JSON {//名单类型
    case black//黑名单
    case white//白名单
}

enum MFTargetType: String, JSON {
    //过滤目标
    case phoneNo//电话号码
    case content//内容
}
