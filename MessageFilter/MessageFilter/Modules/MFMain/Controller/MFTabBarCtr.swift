//
//  MFTabBarCtr.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/2.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

class MFTabBarCtr: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewController(childController: MFRulesListVC(), title: "规则", imageName: "tabbar_rule")
        
        
        self.addChildViewController(childController: MFHelpVC(), title: "帮助", imageName: "tabbar_help")
    }
    
    //添加子控制器
    func addChildViewController(childController: UIViewController, title: String, imageName: String){
    
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)

        self.addChildViewController(BaseNC(rootViewController: childController))
        
    }


}
