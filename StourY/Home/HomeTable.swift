//
//  HomeTable.swift
//  StourY
//
//  Created by 김기현 on 03/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
//        print(self.nowTableList.count)
        return self.nowTableList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    //edit tableView height size
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.screenFrameWidth * 0.53 // 170 + 20/360 0.47
    }
//
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let v = UIView()
////        v.layer.borderColor = UIColor.black.cgColor
////        v.layer.borderWidth = 0.1
////        v.layer.zPosition = -100
//        v.backgroundColor = .clear
//        return v
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
//        cell.layer.zPosition = 100
        //cell.delegate = self
//        cell.contentView.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.89)//320/360
//            make.height.equalTo(cell)
//            make.center.equalTo(cell)
//        }
        
        //shadowView
        viewSetShadow(view: cell.shadowView)
        cell.shadowView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.89)//320/360
            make.height.equalTo(self.screenFrameWidth * 0.47)
            make.centerX.equalTo(cell)
            make.top.equalTo(cell)
//            make.left.equalTo(cell)
//            make.center.equalTo(cell.contentView.center)
        }
        
//        //spacing
//        cell.snp.makeConstraints { (make) in
//            make.width.equalTo(self.screenFrameWidth * 0.89)
//            make.height.equalTo(self.screenFrameWidth * 0.06)//20
//            make.top.equalTo(cell.shadowView.snp.bottom)
//            make.left.equalTo(cell.shadowView)
//
//        }
        
        //cellMasterView
        cell.cellMasterView.layer.borderWidth = 0.1
        cell.cellMasterView.layer.borderColor = UIColor.black.cgColor
        cell.cellMasterView.layer.cornerRadius = 10.0
        cell.cellMasterView.layer.masksToBounds = true
        cell.shadowView.addSubview(cell.cellMasterView)
        cell.cellMasterView.snp.makeConstraints { (make) in
            make.width.height.equalTo(cell.shadowView)
            make.center.equalTo(cell.shadowView)
        }
        
        //image
//        if let thumnailImage = NSURL(string: self.nowTableList[indexPath.section].thumnailAddr!){
//            //print("thumnailImage: ", thumnailImage)
//
//            if let data = NSData(contentsOf: thumnailImage as URL){ // 빠르게 내리면 nil 에러떠서
//
//                cell.imgView.image = UIImage(data: data as Data)
//
//            }
//            cell.imgView.contentMode = .scaleToFill
//        }
        switch self.viewSegmentCtrl.selectedSegmentIndex {
        case 0:
            cell.imgView.image = self.arrayTableImageList[indexPath.section]
        case 1:
            cell.imgView.image = self.arrayTableTourImageList[indexPath.section]
        case 2:
            cell.imgView.image = self.arrayTableRestaurantImageList[indexPath.section]
        default:
            break
        }
//        cell.imgView.image = self.arrayTableImageList[indexPath.section]//getImagesFromURL(strURL: self.nowTableList[indexPath.section].thumnailAddr!)
        cell.imgView.contentMode = .scaleToFill
        cell.imgView.snp.makeConstraints { (make) in
            make.width.equalTo(cell.cellMasterView)
            make.height.equalTo(self.screenFrameWidth * 0.34) //122/360
            make.centerX.equalTo(cell.cellMasterView)
            make.top.equalTo(cell.cellMasterView)
        }
        
        //filter
        cell.filterView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        cell.imgView.addSubview(cell.filterView)
        cell.filterView.snp.makeConstraints { (make) in
            make.width.height.equalTo(cell.imgView)
            make.center.equalTo(cell.imgView)
        }
        
        //name
        if let name = self.nowTableList[indexPath.section].name{
            cell.name.text = name
            cell.name.textAlignment = .center
            cell.name.textColor = .white
        }
        cell.filterView.addSubview(cell.name)
        cell.name.snp.makeConstraints { (make) in
            make.center.equalTo(cell.filterView)
        }
        
        cell.btnLike.tag = indexPath.section
        switch self.nowSelectedTable {
        case 0:
            cell.btnLike.userData = 0
        case 1:
            cell.btnLike.userData = 1
//            cell.btnLike.tag += 10
        case 2:
            cell.btnLike.userData = 2
//            cell.btnLike.tag += 20
        default:
            break
        }
        if let liked = self.nowTableList[indexPath.section].liked{
            if liked{ // 하트가 눌러진 상태라면
                cell.btnLike.setImage(#imageLiteral(resourceName: "btn_heart_on"), for: .normal)
            }else{
                cell.btnLike.setImage(#imageLiteral(resourceName: "btn_heart_off"), for: .normal)
            }
        }
        cell.btnLike.setTitle("", for: .normal)
        cell.btnLike.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.07)//15.8 = 0.04
            make.height.equalTo(self.screenFrameWidth * 0.06)//13.9 = 0.04
            make.top.equalTo(cell.filterView).offset(self.screenFrameWidth * 0.04)//15/360
            make.right.equalTo(cell.filterView).offset(self.screenFrameWidth * -0.05)
        }
        cell.btnLike.addTarget(self, action: #selector(self.tappedLike), for: .touchUpInside)
        
        //tagView
        cell.viewTags.removeAllTags()
        cell.viewTags.tagBackgroundColor = .white
        cell.viewTags.cornerRadius = 10
        cell.viewTags.borderWidth = 1
        cell.viewTags.textColor = .black
        cell.viewTags.borderColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        if let arrayTags = self.nowTableList[indexPath.section].tagSet{
            cell.viewTags.addTags(arrayTags)
        }
        cell.viewTags.alignment = .left
        cell.viewTags.textFont = .systemFont(ofSize: 12)
        cell.viewTags.paddingX = 7
        cell.viewTags.paddingY = 4
        cell.viewTags.marginX = 3
        cell.viewTags.marginY = 3
//        cell.viewTags.lineBreakMode = .byTruncatingMiddle
//        cell.viewTags.paddingLeftRight = 3
//        cell.viewTags.paddingTopBottom = 1
//        cell.viewTags.marginLeftRight = 3
//        cell.viewTags.marginTopBottom = 1
//        cell.viewTags.tagLayerRadius = 10
//        cell.viewTags.tagFont = .systemFont(ofSize: 12)
//        if let arrayTags = self.nowTableList[indexPath.section].tagSet{
//            cell.viewTags.append(contentsOf: arrayTags)
////            print(arrayTags)
//        }
        cell.viewTags.snp.makeConstraints { (make) in
            make.top.equalTo(cell.filterView.snp.bottom).offset(self.screenFrameWidth * 0.015)//12/360
            make.left.equalTo(cell.cellMasterView).offset(self.screenFrameWidth * 0.04)//13
            make.right.equalTo(cell.cellMasterView).offset(self.screenFrameWidth * -0.04)//13
            make.bottom.equalTo(cell.cellMasterView)
        }
        
//        //tag
//        for each in cell.tags{
//            each.removeFromSuperview()
//        }
//        cell.tags.removeAll()
//        if let tagSet = self.nowTableList[indexPath.section].tagSet{
//            for i in 0 ..< tagSet.count{
//
//
//                let dummyLabel = InsetLabel()
//                dummyLabel.insets = UIEdgeInsetsMake(0,5,0,5)
//                dummyLabel.text = "# "+tagSet[i]
//                cell.tags.append(dummyLabel)
//                cell.tags[i].textAlignment = .center
//                cell.tags[i].layer.borderWidth = 2.0
//                cell.tags[i].layer.borderColor = UIColor.black.cgColor
////                cell.tagGuards[i].addSubview(cell.tags[i])
//                cell.tagView.addSubview(cell.tags[i])
//                cell.tags[i].numberOfLines = 0
//                //uilabel은 언어에 따라, tag내용에 따라 항상 유동적으로 바뀌기 때문에 snp으로 width와 height을 따로 주지 않는다.
//                //sizetoFit()으로 가로를 만들고 fontSize로 세로를 맞춘다.
//                cell.tags[i].sizeToFit()
//                cell.tags[i].font = UIFont(name: cell.tags[i].font.fontName, size: 14)
//                cell.tags[i].snp.makeConstraints { (make) in
//                    if i == 0{
//                        make.left.equalTo(cell.tagView).offset(self.screenFrameWidth * 0.04) // 14.3/360
//                        make.centerY.equalTo(cell.tagView)
//                    }else{
//                        //만약 만들어진 tag가 화면밖으로 넘어간다면?
//                        make.left.equalTo(cell.tags[i-1].snp.right).offset(self.screenFrameWidth * 0.01) //4.7/360
//                        make.centerY.equalTo(cell.tagView)
//                    }
//                }
//                cell.tags[i].layer.cornerRadius = cell.tags[i].frame.size.height/2
//            }
//        }'
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = self.nowTableList.count - 1
//        print(lastItem)
        //nextTableCnt가 0보다 크다면
        if indexPath.section == lastItem && self.arrayNextTablePageCnt[self.viewSegmentCtrl.selectedSegmentIndex] > 0{
            //request more information
            self.loadMoreTableCell()
        }
    }
    
    func loadMoreTableCell(){
        print("loadMore")
        self.getAtrr()
        //self.tableView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //segmentView의 좌표계로 변환
        let frame = self.view.convert(self.viewSegmentCtrl.frame, from: self.segmentView)
        
        //만약 viewSegment가 위에 까지 도달 했다면
        if frame.origin.y < (self.viewSegmentCtrl.frame.height) && self.visibleNaviBar{
            self.navBar.isHidden = false
            //UIApplication.shared.statusBarView?.backgroundColor = .white // status bar 컬러 변경
            self.naviBarSegmentctrl.backgroundColor = .white
            self.naviBarSegmentctrl.borderColor = .black
            self.naviBarSegmentctrl.textColor = .black
            self.naviBarSegmentctrl.selectorColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1)
            self.naviBarSegmentctrl.selectorTextColor = UIColor(red: 0.73, green: 0.42, blue: 0.46, alpha: 1)
            
            self.visibleNaviBar = false
        }
        else if frame.origin.y >= (self.viewSegmentCtrl.frame.height) && !self.visibleNaviBar{
            self.navBar.isHidden = true
            UIApplication.shared.statusBarView?.backgroundColor = .clear // status bar 컬러 변경
            self.naviBarSegmentctrl.backgroundColor = .clear
            self.naviBarSegmentctrl.borderColor = .clear
            self.naviBarSegmentctrl.textColor = .clear
            self.naviBarSegmentctrl.selectorColor = .clear
            self.naviBarSegmentctrl.selectorTextColor = .clear
            
            self.visibleNaviBar = true
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected tableView cell: ",indexPath.section)
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.attrIdx = self.nowTableList[indexPath.section].idx!
        detailVC.type = self.nowTableList[indexPath.section].type!
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
