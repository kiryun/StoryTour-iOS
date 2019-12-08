//
//  MyPageTable.swift
//  StourY
//
//  Created by 김기현 on 26/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension MyPageVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.nowList.count
    }
    
    //edit tableView height size
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.screenFrameWidth * 0.28 + 20// 100/360
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let v = UIView()
//        v.backgroundColor = UIColor.clear
//        return v
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikeVisitCell", for: indexPath) as! LikeVisitCell
        
        //cell contentView
//        cell.contentView.frame.size.width = self.screenFrameWidth * 0.94
//        cell.contentView.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.94)//340/360
//            make.height.equalTo(cell)
//            make.center.equalTo(cell)
//        }
        
        //cell shadow view
        cell.cellShadowView.backgroundColor = .white
        viewSetShadow(view: cell.cellShadowView)
        cell.cellShadowView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.94)//340/360
            make.height.equalTo(self.screenFrameWidth * 0.28)
//            make.height.equalTo(cell)
            make.centerX.equalTo(cell)
            make.top.equalTo(cell)
        }
        
        //cell master view
        cell.cellMasterView.backgroundColor = .white
        viewSetRadius(view: cell.cellMasterView, radius: 10.0, color: false)
        cell.cellMasterView.snp.makeConstraints { (make) in
            make.width.height.equalTo(cell.cellShadowView)
            make.center.equalTo(cell.cellShadowView)
        }
        
        //imgView
        cell.cellMasterView.addSubview(cell.imgView)
//        if let image = NSURL(string: self.nowList[indexPath.section].thumnailAddr!){
//            if let data = NSData(contentsOf: image as URL){ // 빠르게 내리면 nil 에러떠서
//
//                cell.imgView.image = UIImage(data: data as Data)
//            }
//            cell.imgView.contentMode = .scaleToFill
//        }
        cell.imgView.image = self.arrayImage[indexPath.section]
        cell.imgView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.28)//100/360
            make.height.equalTo(cell)
            make.centerY.equalTo(cell.cellMasterView)
            make.left.equalTo(cell.cellMasterView)
        }
        
        
        //name
        if let name = self.nowList[indexPath.section].name{
            cell.name.text = name
        }
        cell.name.font = UIFont(name: cell.name.font.fontName, size: 19)
        cell.name.numberOfLines = 0
        cell.name.sizeToFit()
        cell.name.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.63) // (76+151)/360
            make.left.equalTo(cell.imgView.snp.right).offset(self.screenFrameWidth * 0.04)//13/360
            make.top.equalTo(cell.cellMasterView).offset(self.screenFrameWidth * 0.04)//16/360
        }
        
        //like
        cell.buttonLike.tag = indexPath.section
//        switch self.segmentctrl.selectedSegmentIndex {
//        case 0:
//            cell.buttonLike.userData = 0
//        case 1:
//            cell.buttonLike.userData = 1
//        //            cell.btnLike.tag += 10
//        default:
//            break
//        }
        if let liked = self.nowList[indexPath.section].liked{
            if liked{
                cell.buttonLike.setImage(UIImage(named: "btn_heart_on"), for: .normal)
            }else{
                cell.buttonLike.setImage(UIImage(named: "btn_heart_off_line"), for: .normal)
            }
        }
        cell.buttonLike.setTitle("", for: .normal)
        cell.buttonLike.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.07)
            make.height.equalTo(self.screenFrameWidth * 0.06)
            make.top.equalTo(cell.cellMasterView).offset(self.screenFrameWidth * 0.05)
            make.right.equalTo(cell.cellMasterView).offset(self.screenFrameWidth * -0.05)
        }
        cell.buttonLike.addTarget(self, action: #selector(self.tappedLike(btn:)), for: .touchUpInside)
        
        //tag
        cell.viewTags.removeAllTags()
        cell.viewTags.tagBackgroundColor = .white
        cell.viewTags.cornerRadius = 10
        cell.viewTags.borderWidth = 1
        cell.viewTags.textColor = .black
        cell.viewTags.borderColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        if let arrayTags = self.nowList[indexPath.section].tagSet{
            cell.viewTags.addTags(arrayTags)
        }
        
        cell.viewTags.alignment = .left
        cell.viewTags.textFont = .systemFont(ofSize: 12)
        cell.viewTags.paddingX = 7
        cell.viewTags.marginX = 3
        cell.viewTags.marginY = 3
        switch User.sharedUser.language {
        case 0:
            cell.viewTags.paddingY = 4.5
        case 1:
            cell.viewTags.paddingY = 3
        default:
            cell.viewTags.paddingY = 4.5
        }
        
        
        cell.viewTags.snp.makeConstraints { (make) in
            make.top.equalTo(cell.name.snp.bottom).offset(self.screenFrameWidth * 5/360)//5
            make.bottom.equalTo(cell.cellMasterView)
            make.left.equalTo(cell.cellMasterView).offset(self.screenFrameWidth * 113/360) //113
            make.right.equalTo(cell.cellMasterView).offset(self.screenFrameWidth * -31/360)//31
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("MyPageVC.tableView didSelectRowAt")
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        print(self.nowList[indexPath.section].idx!)
        detailVC.attrIdx = self.nowList[indexPath.section].idx!
        detailVC.type = self.nowList[indexPath.section].type!
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}
