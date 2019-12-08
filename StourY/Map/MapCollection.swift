//
//  MapCollection.swift
//  StourY
//
//  Created by 김기현 on 14/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

class MapCollection: HorizontalPeekingPagesCollectionViewController{
    var screenFrameWidth = UIScreen.main.bounds.width
    
    var arrayImage = Array<UIImage>()
    var dataSource = Array<AroundForm>() {
        didSet {
            self.collectionView?.backgroundColor = .clear
            collectionView?.reloadData()
        }
    }
    var indexPathCurrent: IndexPath!
//    var intMoveIndex = 0{
//        didSet{
//            collectionView?.reloadData()
//        }
//    }
    
    override func calculateSectionInset() -> CGFloat {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapCell", for: indexPath) as! MapCell
        
//        cell.masterView.alpha = 1
        viewSetRadius(view: cell.masterView, radius: 10.0, color: false)
        cell.masterView.snp.makeConstraints { (make) in
            make.width.equalTo(cell.frame.width * 0.9)
            make.height.equalTo(cell)
            make.center.equalTo(cell)
        }
        //name
        if let name = self.dataSource[indexPath.row].name{
            cell.labelName.text = name
        }
        cell.labelName.font = UIFont(name: cell.labelName.font.fontName, size: 19)
        cell.labelName.numberOfLines = 0
        cell.labelName.sizeToFit()
        cell.labelName.snp.makeConstraints { (make) in
            make.top.equalTo(cell.masterView).offset(self.screenFrameWidth * 0.04)//16/360
            make.left.equalTo(cell.masterView).offset(self.screenFrameWidth * 0.04)//15/360
        }
        
//        if let url = NSURL(string: self.dataSource[indexPath.row].thumnailAddr!){
//            print("MapCollection.url: ", url)
//            let data = NSData(contentsOf: url as URL)
//            cell.imgView.image = UIImage(data: data! as Data)
//        }
        cell.imgView.image = self.arrayImage[indexPath.row]
        cell.imgView.contentMode = .scaleAspectFill
        cell.imgView.snp.makeConstraints { (make) in
            make.width.equalTo(self.screenFrameWidth * 0.28)//100/360
            make.height.equalTo(cell)
            make.top.equalTo(cell)
            make.right.equalTo(cell)
        }
        
        //tags
        cell.viewTags.removeAllTags()
        cell.viewTags.tagBackgroundColor = .white
        cell.viewTags.cornerRadius = 10
        cell.viewTags.borderWidth = 1
        cell.viewTags.textColor = .black
        cell.viewTags.borderColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        if let arrayTags = self.dataSource[indexPath.row].tagSet{
            cell.viewTags.addTags(arrayTags)
        }
        cell.viewTags.alignment = .left
        cell.viewTags.textFont = .systemFont(ofSize: 10)
        cell.viewTags.paddingX = 7
        cell.viewTags.paddingY = 4
        cell.viewTags.marginX = 3
        cell.viewTags.marginY = 3
        
//        cell.viewTags.removeAll()
//        cell.viewTags.paddingLeftRight = 3
//        cell.viewTags.paddingTopBottom = 1
//        cell.viewTags.marginLeftRight = 3
//        cell.viewTags.marginTopBottom = 2
//        cell.viewTags.tagLayerRadius = 10
//        cell.viewTags.tagFont = .systemFont(ofSize: 10)
//        if let tagSet = self.dataSource[indexPath.row].tagSet{
//            cell.viewTags.append(contentsOf: tagSet)
//            print(tagSet)
//        }
//        cell.viewTags.frame.size = CGSize(width: self.screenFrameWidth * 0.4, height: self.screenFrameWidth * 0.1)
        cell.viewTags.snp.makeConstraints { (make) in
            make.top.equalTo(cell.labelName.snp.bottom).offset(self.screenFrameWidth * 0.04)//12/360
            make.left.equalTo(cell.masterView).offset(self.screenFrameWidth * 0.04)//15/360
            make.right.equalTo(cell.imgView.snp.left).offset(self.screenFrameWidth * -0.1)//15
            make.bottom.equalTo(cell.masterView)
        }
        
        self.indexPathCurrent = indexPath
//        print(self.indexPathCurrent.row)
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("MapCollection.collectionView didSElectItemAt")
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.attrIdx = self.dataSource[indexPath.row].idx!
        detailVC.type = self.dataSource[indexPath.row].type!
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//extension MapCollection: UICollectionViewDelegateFlowLayout{
//    //collectionView size
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: self.screenFrameWidth, height: self.screenFrameWidth * 0.28)//100/360
//    }
//}
