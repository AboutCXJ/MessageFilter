//
//  MFHelpVC.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/2.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

class MFHelpVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

}
