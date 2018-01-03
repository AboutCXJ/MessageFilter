//
//  BaseNC.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/3.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

class BaseNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //重写push方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
}
