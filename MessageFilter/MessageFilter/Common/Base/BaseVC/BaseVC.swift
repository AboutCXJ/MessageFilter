//
//  BaseVC.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/3.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = MFColor.getBackGroundColor()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //取消编辑，退 出键盘
        self.view.endEditing(true)
        super.viewWillDisappear(animated)
    }
    
    
    
    func addLeftItem(title: String, action: Selector) -> UIBarButtonItem {
        let leftItem = UIBarButtonItem.init(title: title, style: .plain, target: self, action: action)
        self.navigationItem.leftBarButtonItem = leftItem
        return leftItem
    }
    
    
    func addRightItem(title: String, action: Selector) -> UIBarButtonItem {
        let rightItem = UIBarButtonItem.init(title: title, style: .plain, target: self, action: action)
        self.navigationItem.rightBarButtonItem = rightItem
        return rightItem
    }
    
    
    func addBackItem() -> UIBarButtonItem {
        let backItem = UIBarButtonItem.init(title: "返回", style: .plain, target: self, action: #selector(backItemClick))
        self.navigationItem.leftBarButtonItem = backItem
        return backItem
    }
    
    
    @objc func backItemClick() {
        let count = self.navigationController?.childViewControllers.count
        if count! > 1 {
            self.navigationController?.popViewController(animated: true)
        }else {
            self.dismiss(animated: true, completion: nil)
        }
    }

}


//MARK: - 键盘
extension BaseVC {
    
    //添加监听
    func addKeyBoardChangeFrameObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardChangeFrame), name: .UIKeyboardWillChangeFrame, object: nil)
    }
    
    //移除监听
    func removeKeyBoardChangeFrameObserver() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillChangeFrame, object: nil)
    }
    
    
    //监听回调
    @objc func keyBoardChangeFrame(notification: Notification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let endRect = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        
        var frame = self.view.frame
        
        frame.origin.y = -endRect.size.height
        UIView.animate(withDuration: TimeInterval(duration)) {
            self.view.frame = frame
        }
    }
}
