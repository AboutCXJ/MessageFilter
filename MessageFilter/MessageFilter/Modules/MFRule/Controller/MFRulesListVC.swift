//
//  MFRulesListVC.swift
//  MessageFilter
//
//  Created by sfzx on 2018/1/2.
//  Copyright © 2018年 陈鑫杰. All rights reserved.
//

import UIKit

fileprivate let MFRulesListVCCellID = "MFRulesListVCCellID"

//规则列表
class MFRulesListVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        self.tableView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    //MARK: - lazy
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MFRulesListCell.self, forCellReuseIdentifier: MFRulesListVCCellID)
        self.view.addSubview(tableView)
        return tableView
    }()
}


//MARK: - @protocol UITableViewDelegate
extension MFRulesListVC: UITableViewDelegate {
    
    //左滑删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
}


//MARK: - @protocol UITableViewDataSource
extension MFRulesListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MFRulesListVCCellID, for: indexPath) as! MFRulesListCell
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
}
