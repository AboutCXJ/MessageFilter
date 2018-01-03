//
//  UITableView+Extension.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/3.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

extension UITableView {
    
    
    /// 注册cell
    /// 使用类名当identifier
    /// - Parameter cellClass: cellClass
    func register(_ cellClass: UITableViewCell.Type) {
        let identifier = String(describing: cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    
    /// 复用cell
    /// 使用cell类名复用
    /// - Parameters:
    ///   - cellClass: cellClass
    ///   - indexPath: indexPath
    /// - Returns: UITableViewCell
    func dequeueReusableCell<T: UITableViewCell>(with cellClass: T.Type, for indexPath: IndexPath) -> T {
        let identifier = String(describing: cellClass)
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
    }

    
}
