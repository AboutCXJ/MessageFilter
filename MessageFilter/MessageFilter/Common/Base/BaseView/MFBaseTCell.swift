//
//  MFBaseTCell.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/3.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

class MFBaseTCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil) {
            self.addSubview(self.separatorLine)
            self.selectionStyle = .none
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.separatorLine.snp.makeConstraints { (maker) in
            maker.height.equalTo(getHeightScaleWith6s()*0.5)
            maker.bottom.right.equalTo(self)
            maker.left.equalTo(getWidthScaleWith6s()*20)
        }
    }
    
    //MARK: - lazy
    lazy var separatorLine: UIView = {
        let separatorLine = UIView()
        separatorLine.backgroundColor = MFColor.getseparatorColor()
        return separatorLine
    }()
    
}
