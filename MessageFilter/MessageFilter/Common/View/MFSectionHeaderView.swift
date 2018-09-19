//
//  MFSectionHeaderView.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/16.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

class MFSectionHeaderView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame);
        if !self.isEqual(nil) {
            self.addSubview(self.titleLB)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLB.snp.makeConstraints { (maker) in
            maker.left.equalTo(getWidthScaleWith6s()*12);
            maker.centerY.equalTo(self)
        }
    }
    
    //MARK: - handle
    class func getSectionHeaderViewHeight() -> CGFloat {
        return getHeightScaleWith6s()*30
    }
    
    
    //MARK: - lazy
    lazy var titleLB: UILabel = {
        let titleLB = UILabel()
        titleLB.font = MFFont.getFontW6_H14()
        titleLB.textColor = MFColor.getTitleColor()
        return titleLB
    }()

}
