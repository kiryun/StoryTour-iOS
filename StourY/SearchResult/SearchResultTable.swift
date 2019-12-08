//
//  SearchBarTable.swift
//  StourY
//
//  Created by 김기현 on 15/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension SearchResultVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arraySearchResult.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.screenFrameWidth * 0.26//85+10/360
    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let v = UIView()
//        v.backgroundColor = backgroundColor()
//        return v
//    }
    
//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as! SearchResultCell
        
        cell.masterView.snp.makeConstraints { (make) in
            make.width.height.equalTo(cell)
            make.center.equalTo(cell)
        }
        
        cell.viewSpacing.backgroundColor = backgroundColor()
        cell.viewSpacing.snp.makeConstraints { (make) in
            make.width.equalTo(cell.masterView)
            make.height.equalTo(self.screenFrameWidth * 0.02)
            make.top.left.equalTo(cell.masterView)
        }
        
        if let url = NSURL(string: self.arraySearchResult[indexPath.section].thumnailAddr!){
            if let data = NSData(contentsOf: url as URL){
                cell.imgView.image = UIImage(data: data as Data)
            }
        }
        cell.contentMode = .scaleAspectFill
        cell.imgView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.24)//85/360
            make.height.equalTo(self.screenFrameWidth * 0.24)//85/360
            make.top.equalTo(cell.viewSpacing.snp.bottom)
            make.left.equalTo(cell.masterView)
        }
        
        if let name = self.arraySearchResult[indexPath.section].name{
            cell.labelName.text = name
        }
        cell.labelName.font = UIFont(name: cell.labelName.font.fontName, size: 19)
        cell.labelName.numberOfLines = 0
        cell.labelName.sizeToFit()
        cell.labelName.snp.makeConstraints { (make) in
            make.top.equalTo(cell.masterView).offset(self.screenFrameWidth * 0.05)//19/360
            make.left.equalTo(cell.imgView.snp.right).offset(self.screenFrameWidth * 0.04)//14/360
        }
        
        
        cell.buttonLike.tag = indexPath.section
        if let liked = self.arraySearchResult[indexPath.section].liked{
            if liked{
                cell.buttonLike.setImage(UIImage(named: "btn_heart_on"), for: .normal)
            }
            else{
                cell.buttonLike.setImage(UIImage(named: "btn_heart_off_line"), for: .normal)
            }
        }
        cell.buttonLike.setTitle("", for: .normal)
        cell.buttonLike.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.06)//15.8/360 = 0.04
            make.height.equalTo(self.screenFrameWidth * 0.06)//13.9/360 = 0.4
            make.top.equalTo(cell.masterView).offset(self.screenFrameWidth * 0.04)//15/360
            make.right.equalTo(cell.masterView).offset(self.screenFrameWidth * -0.04)//13.2/360
        }
        cell.buttonLike.addTarget(self, action: #selector(self.tappedLike(btn:)), for: .touchUpInside)
        
//        cell.viewTags.translatesAutoresizingMaskIntoConstraints = false
        cell.viewTags.removeAllTags()
        cell.viewTags.tagBackgroundColor = .white
        cell.viewTags.cornerRadius = 10
        cell.viewTags.borderWidth = 1
        cell.viewTags.textColor = .black
        cell.viewTags.borderColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        if let arrayTags = self.arraySearchResult[indexPath.section].tagSet{
            cell.viewTags.addTags(arrayTags)
        }
        cell.viewTags.alignment = .left
        cell.viewTags.textFont = .systemFont(ofSize: 12)
        cell.viewTags.paddingX = 7
        cell.viewTags.marginX = 3
        cell.viewTags.marginY = 3
        switch User.sharedUser.language {
        case 0:
            cell.viewTags.paddingY = 4
        case 1:
            cell.viewTags.paddingY = 3
        default:
            cell.viewTags.paddingY = 4
        }
//        cell.viewTags.removeAll()
//        cell.viewTags.paddingLeftRight = 3
//        cell.viewTags.paddingTopBottom = 1
//        cell.viewTags.marginLeftRight = 3
//        cell.viewTags.marginTopBottom = 1
//        cell.viewTags.tagFont = .systemFont(ofSize: 12)
//        if let tagSet = self.arraySearchResult[indexPath.section].tagSet{
//            cell.viewTags.append(contentsOf: tagSet)
////            print(tagSet)
//        }
        cell.viewTags.snp.makeConstraints { (make) in
            make.top.equalTo(cell.labelName.snp.bottom).offset(self.screenFrameWidth * 0.045)//12/360
            make.right.equalTo(cell.masterView).offset(self.screenFrameWidth * -0.08)//27.8
            make.left.equalTo(cell.imgView.snp.right).offset(self.screenFrameWidth * 0.04)//13.3/360
            make.bottom.equalTo(cell.masterView)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SearchResultVC.tableView didSelectRowAt")
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.attrIdx = self.arraySearchResult[indexPath.section].idx!
        detailVC.type = self.arraySearchResult[indexPath.section].type!
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = self.arraySearchResult.count - 1
        
        if indexPath.section == lastItem && self.intNextPageSearchResultCnt > 0{
            self.loadMoreTableCell()
        }
    }
    func loadMoreTableCell(){
        print("SearchResultVC.loadMoreTableCell")
        self.getListAgain()
    }
    
}
