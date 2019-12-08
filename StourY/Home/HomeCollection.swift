//
//  HomeCollection.swift
//  StourY
//
//  Created by 김기현 on 03/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = self.arrayMainRecommand.count
//        print("collectionView count: ", count)
        return count
    }
    
    //collectionView size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width * 0.4, height: self.collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCell", for: indexPath) as! RecommandCell
        //cell.prepareForReuse()
        
        cell.layer.cornerRadius = 10.0
        
        //name
        if let name = self.arrayMainRecommand[indexPath.row].name{
            cell.name.text = name
            cell.name.textAlignment = .center
        }
        cell.name.snp.makeConstraints { (make) in
            make.width.equalTo(cell)
            make.height.equalTo(self.screenFrameWidth * 0.06)//(6+15)/350
            make.bottom.equalTo(cell)
        }
        
        //name이 다나와야 함 그래서 name의 top에 image의 bottom을 붙인다.
        //image
//        if let thumnailImage = NSURL(string: self.arrayMainRecommand[indexPath.row].thumnailAddr!){
//            //print("thumnailImage: ", thumnailImage)
//            
//            let data = NSData(contentsOf: thumnailImage as URL)
//            cell.image.image = UIImage(data: data! as Data)
//        }
        cell.image.image = self.arrayCollectionImageList[indexPath.row]
        cell.image.contentMode = .scaleToFill
        cell.image.snp.makeConstraints { (make) in
            make.width.equalTo(cell)
            make.height.equalTo(self.screenFrameWidth * 0.28)//99/360
            make.bottom.equalTo(cell.name.snp.top)
        }
        
        //filterView
        cell.filterView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        cell.filterView.snp.makeConstraints { (make) in
            make.width.height.equalTo(cell.image)
            make.center.equalTo(cell.image)
        }
        
//        cell.viewTags.removeAll()
//        cell.viewTags.paddingLeftRight = 3
//        cell.viewTags.paddingTopBottom = 1
//        cell.viewTags.marginLeftRight = 3
//        cell.viewTags.marginTopBottom = 1
//        cell.viewTags.tagFont = .systemFont(ofSize: 6)
//        if let arrayTags = self.arrayMainRecommand[indexPath.row].tagSet{
//            cell.viewTags.append(contentsOf: arrayTags)
//            print(arrayTags)
//        }
//        cell.viewTags.snp.makeConstraints { (make) in
//            make.width.equalTo(cell.filterView)
//            make.center.equalTo(cell.filterView)
//        }
        //recommandTextLabel (둥근 네모 박스)
        cell.recommandTextLabel.text = ""
        if let recommandText = self.arrayMainRecommand[indexPath.row].tagSet{
            if recommandText.count != 0{
                cell.recommandTextLabel.text = " \(recommandText[0])   "
                cell.recommandTextLabel.textColor = UIColor(red: 201/255, green: 201/255, blue: 201/255, alpha: 1)
                cell.recommandTextLabel.textAlignment = .center
                cell.recommandTextLabel.layer.borderColor = UIColor(red: 201/255, green: 201/255, blue: 201/255, alpha: 1).cgColor
                cell.recommandTextLabel.layer.borderWidth = 1.0
                cell.recommandTextLabel.layer.cornerRadius = 10.0
                cell.recommandTextLabel.numberOfLines = 0
                cell.recommandTextLabel.sizeToFit()
            }
        }
        cell.recommandTextLabel.font = UIFont(name: cell.recommandTextLabel.font.fontName, size: 20)
        cell.filterView.addSubview(cell.recommandTextLabel)

        cell.recommandTextLabel.snp.makeConstraints { (make) in
            make.center.equalTo(cell.filterView)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastItem = self.arrayMainRecommand.count - 1
        
        if indexPath.row == lastItem && self.arrayNextTablePageCnt[3] > 0{
            self.loadMoreCollectionCell()
        }
    }
    
    func loadMoreCollectionCell(){
        print("loadMoreCollectionCell")
        self.getMainRecommand()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select collectionView Cell: ",indexPath.row)
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.attrIdx = self.arrayMainRecommand[indexPath.row].idx!
        detailVC.type = self.arrayMainRecommand[indexPath.row].type!
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
