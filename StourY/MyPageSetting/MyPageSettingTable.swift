//
//  MyPageSettingTable.swift
//  StourY
//
//  Created by 김기현 on 26/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension MyPageSettingVC: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingCell
        
        
        //label
        switch indexPath.row {
        case 0: // 개인정보취급 방침
            switch User.sharedUser.language{
            case 0:
                cell.cellLabel.text = "Privacy Statement"
            case 1:
                cell.cellLabel.text = "개인정보 취급방침"
            default:
                break
            }
        case 1:
            switch User.sharedUser.language{
            case 0:
                cell.cellLabel.text = "sign out"
            case 1:
                cell.cellLabel.text = "회원 탈퇴"
            default:
                break
            }
        default:
            break
        }
        cell.cellLabel.snp.makeConstraints { (make) in
            make.width.equalTo(cell)
            make.centerY.equalTo(cell)
            make.left.equalTo(cell).offset(self.screenFrameWidth * 0.05)//19/360
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0://개인정보 취급방침
            print("tapped개인정보 취급방침")
        case 1:
            print("tpped회원탈퇴")
            print(User.sharedUser.userIdx)
            print(User.sharedUser.fullName)
            print(User.sharedUser.age)
            print(User.sharedUser.snsIdx)
            print(User.sharedUser.nationIdx)
            print(User.sharedUser.nationIdx)//nation code : KR
//            DELETE
//                {
//                    "idx":25,
//                    "id":yhc94,
//                    "snsIdx":4,
//                    "passwd":"ttttttt"
//            }
            self.tappedSignOut() // 회원 탈퇴
            
        default:
            print("tapped개인정보 취급방침")
        }
    }
}
