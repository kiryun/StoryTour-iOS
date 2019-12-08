//
//  PlayBarCollection.swift
//  StourY
//
//  Created by 김기현 on 08/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension PlayBarVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.collectionView.frame.size.width * 0.29
//        print("size: ",size)
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let baseURL = "http://13.125.83.183:8080/resources/guides/voice/img/"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayBarImageCell", for: indexPath) as! PlayBarImageCell
        
        if let url = NSURL(string: baseURL+self.arrayImageList[indexPath.row].imgAddress!+".jpg"){
            print(baseURL+self.arrayImageList[indexPath.row].imgAddress!+".jpg")
            let data = NSData(contentsOf: url as URL)
            
            cell.imgView.image = UIImage(data: data! as Data)
        }
        cell.imgView.contentMode = .scaleAspectFit
        cell.imgView.snp.makeConstraints { (make) in
            make.width.height.equalTo(cell)
            make.center.equalTo(cell)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            print("PlayBarVC.collectionView didSelectItemAt")
            
            let bigImageVC = self.storyboard?.instantiateViewController(withIdentifier: "BigImageVC") as! BigImageVC
            var arrayDummy = Array<String>()
            for each in self.arrayImageList{
                arrayDummy.append(each.imgAddress!)
            }
            bigImageVC.arrayBigImageList = arrayDummy
            bigImageVC.intArrayIdx = indexPath.row
            self.present(bigImageVC, animated: true, completion: nil)
            
        }
    }
}
