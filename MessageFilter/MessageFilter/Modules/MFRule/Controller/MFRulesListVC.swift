//
//  MFRulesListVC.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/2.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

//规则列表
class MFRulesListVC: BaseVC {
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(didAddNewRule), name: NSNotification.Name(rawValue: MFRulesSaveNotification), object: nil)
        
    }
    
    override func viewWillLayoutSubviews() {
        self.tableView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
    func setupUI() {
        let rightItem = UIBarButtonItem.init(barButtonSystemItem: .add
            , target: self, action: #selector(rightItemClick))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    
    //MARK: - handle
    @objc func rightItemClick() {
        self.present(BaseNC.init(rootViewController: MFRuleInterface.interfaceRuleAddVC()), animated: true, completion: nil)
    }
    
    @objc func didAddNewRule() {
        self.rules = MFRulesModel.rules()
        
        self.tableView.reloadData()
    }
    
    
    
    //规则
    var rules = MFRulesModel.rules()
    
    
    
    //MARK: - lazy
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = MFRulesListCell.getRulesListCellHeight()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MFRulesListCell.self)
        self.view.addSubview(tableView)
        return tableView
    }()
    
}


//MARK: - @protocol UITableViewDelegate
extension MFRulesListVC: UITableViewDelegate {
    
    //左滑删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return getHeightScaleWith6s()*40
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            if self.rules.blackList.count > 0 {
               return "黑名单"
            }
            return nil
        }else {
            if self.rules.whiteList.count > 0 {
                return "白名单"
            }
            return nil
        }
    }
    
}


//MARK: - @protocol UITableViewDataSource
extension MFRulesListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.rules.blackList.count
        }else {
            return self.rules.whiteList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(with: MFRulesListCell.self, for: indexPath)
            cell.cellModel = self.rules.blackList.count>indexPath.row ? self.rules.blackList[indexPath.row] : nil
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(with: MFRulesListCell.self, for: indexPath)
            cell.cellModel = self.rules.whiteList.count>indexPath.row ? self.rules.whiteList[indexPath.row] : nil
            return cell
        }
    }
}
