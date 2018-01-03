//
//  MFRulesListCell.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/3.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

class MFRulesListCell: MFBaseTCell {
    
    //获取cell高度
    class func getRulesListCellHeight() -> CGFloat {
        return getHeightScaleWith6s() * 40
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil) {
//            self.contentView.addSubview(self.typeView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        self.typeView.snp.makeConstraints { (maker) in
//            maker.size.equalTo(CGSize(width: getWidthScaleWith6s()*25, height: getWidthScaleWith6s()*25))
//            maker.centerY.equalTo(self.contentView)
//            maker.left.equalTo(getWidthScaleWith6s()*10)
//        }
//    }
    
    
    //MARK: - lazy
    lazy var typeView: UIImageView = {
        let typeView = UIImageView()
        typeView.image = UIImage.init(named: "ruleList_people")
        return typeView
    }()
}
