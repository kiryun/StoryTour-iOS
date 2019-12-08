//
//  GuideVC.swift
//  StourY
//
//  Created by 김기현 on 15/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
//1. carousel collectionview구현 (뷰 앞에건 크게 뒤에건 작게)[infinite collectionview]
//2. nameKor랑 nameLang 1.구현하면 거기 index에 맞게 넣어야함
//3. 언어에 맞는 font 사이즈 조절 및 버튼 사이즈, 버튼이미지 조절

class GuideVC: UIViewController {
    var screenFrameWidth = UIScreen.main.bounds.width
    
    var navBar: UINavigationBar!
    
    @IBOutlet weak var guideView: UIView!
    
    @IBOutlet weak var containerViewCollection: UIView!
    var loadingContainterViewCollection = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0),type: .lineSpinFadeLoader, color: identityColor())
    
    var guideCollection: GuideCollection!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let guideCollection = segue.destination as? GuideCollection {
            self.guideCollection = guideCollection
            self.guideCollection.collectionView?.showsHorizontalScrollIndicator = false // scroll bar 제거
        }
    }
    
    
//    var nowCollectionIndex = 0
    var intNowCollectionIndex = 0
    
    var guideList = Array<GuideForm>()
    var arrayImage = Array<UIImage>()
    
    var resSuccess = false
    
//    var nameKor = UILabel()
//    var nameUserLang = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
        self.setupView()

//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
        if Reachability.isConnectedToNetwork(){
            getGuideList()
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
        
    }

    func getGuideList(){
        
        ApiClient.sharedApiClient.getGuideList { (res, err) in
            if err == nil{
                print("success get guide list")
                self.resSuccess = true
                setResponseData(responseObject: res, list: &self.guideList, imgList: &self.arrayImage)
                self.loadingContainterViewCollection.stopAnimating()
                self.guideCollection.arrayImage = self.arrayImage
                self.guideCollection.dataSource = self.guideList // datasource 가 가장마지막에 set되어야 함 
                
            }
            else{
                print("failed get guide list!")
            }
        }
    }
    
}


