//
//  MFRulesListCell.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/3.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

//class MFRulesListCellModel: NSObject {
//    var type: String = ""
//    var content: String = ""
//
//}


class MFRulesListCell: MFBaseTCell {
    
   
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil) {
            self.contentView.addSubview(self.typeView)
            self.contentView.addSubview(self.contentLB)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.typeView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: getWidthScaleWith6s()*25, height: getWidthScaleWith6s()*25))
            maker.centerY.equalTo(self.contentView)
            maker.left.equalTo(getWidthScaleWith6s()*20)
        }
        
        self.contentLB.snp.makeConstraints { (maker) in
            maker.left.equalTo(self.typeView.snp.right).offset(getWidthScaleWith6s()*10)
            maker.centerY.equalTo(self.contentView)
        }
    }
    
    
    //MARK: - handle
    //获取cell高度
    class func getRulesListCellHeight() -> CGFloat {
        return getHeightScaleWith6s() * 50
    }
    
    var cellModel: MFRuleModel! {
        didSet{
            self.contentLB.text = cellModel.content
            if cellModel.type == .phoneNo {
                self.typeView.image = UIImage.init(named: "ruleList_people")
            }else if cellModel.type == .content {
                self.typeView.image = UIImage.init(named: "ruleList_content")
            }
            
        }
    }
    
    
    
    //MARK: - lazy
    lazy var typeView: UIImageView = {
        let typeView = UIImageView()

        return typeView
    }()
    
    lazy var contentLB: UILabel = {
        let contentLB = UILabel()
        contentLB.font = MFFont.getFontW6_H15()
        contentLB.textColor = MFColor.getTitleColor()
        return contentLB
    }()
}
