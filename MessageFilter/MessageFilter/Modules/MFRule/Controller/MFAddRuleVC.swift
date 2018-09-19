//
//  MFAddRuleVC.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/5.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit


//添加规则页面
class MFAddRuleVC: BaseVC {
    
    var rightItem: UIBarButtonItem?
    
    var isBlack = true
    var isPhone = true
    
    var keyWord: String?
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        //添加键盘监听
        self.addKeyBoardChangeFrameObserver()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tableView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
    }
    
    func setupUI() {
        self.title = "添加规则"
//        let _ = self.addBackItem()
        let _ = self.addLeftItem(title: "取消", action: #selector(backItemClick))
        self.rightItem = self.addRightItem(title: "完成", action: #selector(rightItemClick))
        self.rightItem?.isEnabled = false
    }
    
   
    
    
    //MARK: - handle
    @objc func rightItemClick() {
        
        var targetType: MFTargetType
        
        if isPhone {
            targetType = .phoneNo
        }else {
            targetType = .content
        }
        
        let rule = MFRuleModel.init(type: targetType, content: self.keyWord!)
        
        
        let rulrs = MFRulesModel.rules()
        
        if isBlack {
            rulrs.blackList.append(rule)
        }else {
            rulrs.whiteList.append(rule)
        }
        rulrs.save()
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    

    
    //MARK: -lazy
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
//        tableView.separatorStyle = .none
        tableView.rowHeight = MFAddRuleCell.getRuleAddCellHeight()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MFAddRuleCell.self)
        self.view.addSubview(tableView)
        return tableView
    }()
    
    
    lazy var datas: [MFAddRuleSectionItem] = {
        var datas = [MFAddRuleSectionItem]()
        
        let section1 = MFAddRuleSectionItem()
        section1.name = "名单类型"
        
        let section1Item1 = MFAddRuleCellItem()
        section1Item1.name = "黑名单"
        section1Item1.isSelect = isBlack;
        
        
        let section1Item2 = MFAddRuleCellItem()
        section1Item2.name = "白名单"
        section1Item2.isSelect = !isBlack;
        
        section1.items = [section1Item1, section1Item2]
        
    
        
        let section2 = MFAddRuleSectionItem()
        section2.name = "过滤目标"
        
        let section2Item1 = MFAddRuleCellItem()
        section2Item1.name = "号码"
        section2Item1.isSelect = isPhone;
        
        
        let section2Item2 = MFAddRuleCellItem()
        section2Item2.name = "内容"
        section2Item2.isSelect = !isPhone;
        
        section2.items = [section2Item1, section2Item2]
        
        
        let section3 = MFAddRuleSectionItem()
        section3.name = "关键词"
        
        
        let section3Item1 = MFAddRuleCellItem()
        section3Item1.name = "关键词"
        section3Item1.isSelect = false;
        
        section3.items = [section3Item1]
        
        datas.append(section1)
        datas.append(section2)
        datas.append(section3)
        return datas
    }()
    
    
    deinit {
        //移除键盘监听
        self.removeKeyBoardChangeFrameObserver()
    }
    
}


//MARK: - @protocol UITableViewDelegate
extension MFAddRuleVC: UITableViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.datas[section].name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = self.datas[indexPath.section]
        for item in section.items! {
            item.isSelect = false
        }
        section.items![indexPath.row].isSelect = true
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                isBlack = true
            }else {
                isBlack = false
            }
        case 1:
            if indexPath.row == 0 {
                isPhone = true
            }else {
                isPhone = false
            }
        default:
            print("")
        }
        
        
        tableView.reloadData()
    }
    
}

//MARK: - @protocol UITableViewDataSource
extension MFAddRuleVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.datas[section].items?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: MFAddRuleCell.self, for: indexPath)
        let cellItem = self.datas[indexPath.section].items![indexPath.row]
        cell.textFieldDelegate = self
        
        cell.content = cellItem.name
        if cellItem.isSelect! {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        
        
        if indexPath.section == 2 {
            cell.type = .input
        }else {
            cell.type = .show
        }
        
        return cell
    }
}


extension MFAddRuleVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let count = (textField.text! as NSString).length
        
        if count > 1 {
            self.rightItem?.isEnabled = true
        }else {
            if string.isEmpty {
                self.rightItem?.isEnabled = false
            }else {
                self.rightItem?.isEnabled = true
            }
        }
        
        self.keyWord = textField.text
        return true
    }
}
