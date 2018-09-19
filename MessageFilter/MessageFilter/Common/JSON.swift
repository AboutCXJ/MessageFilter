//
//  JSON.swift
//  MessageFilter
//
//  Created by sfzx on 2018/3/12.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit



//自定义一个JSON协议
protocol JSON: Codable {
    func toJSONString() -> String?
}

//扩展协议方法
extension JSON {

    func toJSONString() -> String? {
        //encoded对象
        if let encodedData = try? JSONEncoder().encode(self) {
            //从encoded对象获取String
            return String(data: encodedData, encoding: .utf8)
        }
        return nil
    }
}


