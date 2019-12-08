//
//  MyPageSettingVC.swift
//  StourY
//
//  Created by 김기현 on 26/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit

class MyPageSettingVC: UIViewController {
    let screenFrameWidth = UIScreen.main.bounds.width
    
    var navBar: UINavigationBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var footerView: UIView!
    var logOutView = UIView()
    let viewPopUpFilter = UIView()
    let viewPopUp = UIView()
    let labelTitle = UILabel()
    let labelSummary = UILabel()
    let buttonLeft = UIButton()
    let buttonRight = UIButton()
    
    var intClickStatus = -1
    //0: 로그아웃
    //1: 회원탈퇴
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNaviBar()
        self.setupView()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    

}
