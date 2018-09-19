//
//  MFAddRuleCell.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/5.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

enum MFAddRuleCellType {
    case show
    case input
}

class MFAddRuleCell: MFBaseTCell {
    
    weak open var textFieldDelegate: UITextFieldDelegate? {
        didSet{
            self.contentTF.delegate = textFieldDelegate
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil) {
            self.contentView.addSubview(self.contentLB)
            self.contentView.addSubview(self.contentTF)
            self.separatorLine.isHidden = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentLB.snp.makeConstraints { (maker) in
            maker.left.equalTo(getWidthScaleWith6s()*20)
            maker.right.equalTo(-getWidthScaleWith6s()*20)
            maker.top.bottom.equalTo(self.contentView)
        }
        
        self.contentTF.snp.makeConstraints { (maker) in
            maker.left.equalTo(getWidthScaleWith6s()*20)
            maker.right.equalTo(-getWidthScaleWith6s()*20)
            maker.top.bottom.equalTo(self.contentView)
        }
    }
    
    
    
    //MARK: - handle
    
    //获取cell高度
    class func getRuleAddCellHeight() -> CGFloat {
        return getHeightScaleWith6s() * 50
    }
    
    var content: String! {
        didSet{
            self.contentLB.text = content
            self.contentTF.placeholder = content
        }
    }
    
    var type: MFAddRuleCellType {
        set {
            if newValue == .show {
                self.contentLB.isHidden = false;
                self.contentTF.isHidden = true;
            }else if newValue == .input {
                self.contentLB.isHidden = true;
                self.contentTF.isHidden = false;
            }
        }
        
        get {
            return self.type
        }
    }
    
    
    //MARK: - lazy
    lazy var contentLB: UILabel = {
        let contentLB = UILabel()
        contentLB.font = MFFont.getFontW6_H15()
        contentLB.textColor = MFColor.getTitleColor()
        return contentLB
    }()
    
    lazy var contentTF: UITextField = {
        let contentTF = UITextField();
//        contentTF.delegate = self.textFieldDelegate
        contentTF.returnKeyType = .done
        contentTF.font = MFFont.getFontW6_H15()
        contentTF.textColor = MFColor.getTitleColor()
        return contentTF
    }()

}
