//
//  GuideCollection.swift
//  StourY
//
//  Created by 김기현 on 13/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

//https://github.com/hershalle/CollectionViewWithPaging-simplerExample
class GuideCollection: HorizontalPeekingPagesCollectionViewController{
    var screenFrameWidth = UIScreen.main.bounds.width
    var arrayImage = Array<UIImage>()
    var dataSource = Array<GuideForm>(){
        didSet {
            collectionView?.reloadData()
        }
    }
    
    override func calculateSectionInset() -> CGFloat {
        return 40
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GuideCell", for: indexPath) as! GuideCell
        
        //shadowView
        cell.shadowView.snp.makeConstraints { (make) in
            make.width.equalTo(cell.frame.width * 0.9)
            make.height.equalTo(cell)
            make.center.equalTo(cell)
        }
        viewSetShadow(view: cell.shadowView)
        //print(cell.shadowView)
        //masterView
        cell.shadowView.addSubview(cell.masterView)
        cell.masterView.layer.cornerRadius = 10.0
        cell.masterView.layer.masksToBounds = true
        cell.masterView.snp.makeConstraints { (make) in
            make.center.equalTo(cell.shadowView)
            make.height.width.equalTo(cell.shadowView)
        }
        
        
        //image
//        if let thumnailImage = NSURL(string: self.dataSource[indexPath.row].thumnailAddr2!){
////            print("thumnailImage: ", thumnailImage)
//
//            let data = NSData(contentsOf: thumnailImage as URL)
//            cell.image.image = UIImage(data: data! as Data)
//        }
        cell.image.image = self.arrayImage[indexPath.row]
        cell.image.snp.makeConstraints { (make) in
            make.center.equalTo(cell.masterView)
            make.height.width.equalTo(cell.masterView)
        }
        cell.image.contentMode = .scaleAspectFill
        
        //filterView
        cell.filterView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        cell.filterView.snp.makeConstraints { (make) in
            make.center.equalTo(cell.image)
            make.height.width.equalTo(cell.image)
        }
        
        let textColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1) // 219/255
        //subtitle
        switch User.sharedUser.language {
        case 0:
            cell.subtitle.text = "World Cultural Heritage"
        case 1:
            cell.subtitle.text = "세계문화유산"
        default:
            break
        }
        cell.subtitle.textColor = textColor
        cell.subtitle.textAlignment = .right
        cell.subtitle.font = UIFont(name: cell.subtitle.font.fontName, size: 13)
        cell.subtitle.snp.makeConstraints { (make) in
            make.top.equalTo(cell.filterView).offset(self.screenFrameWidth * 0.13)// 46/360
            make.right.equalTo(cell.filterView).offset(self.screenFrameWidth * -0.06)// 23/360
        }
        
        //line
        cell.line.backgroundColor = textColor
        cell.line.snp.makeConstraints { (make) in
            make.height.equalTo(1.0)
            make.width.equalTo(cell.subtitle.snp.width).offset(18.5)
            make.top.equalTo(cell.subtitle).offset(0.5)
            make.right.equalTo(cell.subtitle)
        }
        
        //name
//        if let name = self.dataSource[indexPath.row].name{
//            cell.name.text = name
//            self.nameKor.text = name
//            self.nameKor.textColor = .black
//            //self.nameUserLang.text = nameUserLang
//        }
//        else{
//            self.nameKor.textColor = .clear
//            self.nameUserLang.textColor = .clear
//        }
        cell.name.text = ""
        if let name = self.dataSource[indexPath.row].name{
            cell.name.text = name
        }
        cell.name.font = UIFont(name: cell.name.font.fontName, size: 25)
        cell.name.textColor = .white
        cell.name.sizeToFit()
        cell.name.snp.makeConstraints { (make) in
            make.top.equalTo(cell.subtitle).offset(self.screenFrameWidth * 0.05) // 17.5/360
            make.right.equalTo(cell.subtitle)
        }
        
        //summary
        //        if let summary = self.guideList[indexPath.row]
        cell.summary.text = ""
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("GuideVC.collectionView didSelectItemAt: ",indexPath.section)
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.attrIdx = self.dataSource[indexPath.row].idx!
        detailVC.type = self.dataSource[indexPath.row].type!
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
