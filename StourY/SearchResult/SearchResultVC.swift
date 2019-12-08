//
//  SearchResultVC.swift
//  StourY
//
//  Created by 김기현 on 15/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import Tags
import NVActivityIndicatorView

class SearchResultVC: UIViewController {
    var screenFrameWidth = UIScreen.main.bounds.width
    
    var navBar: UINavigationBar!
    
    //ui
    let searchBarText = UITextField()
    @IBOutlet weak var tableView: UITableView!
    var arraySearchResult = Array<AroundForm>()
    var intNextPageSearchResultCnt: Int = 0
    var arrayImage = Array<UIImage>()
    var loadingTableView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0),type: .lineSpinFadeLoader, color: identityColor())
    
    
    var viewBackgroundFilter = UIView()
    var viewBottom = UIView()
    var viewFilter = UIView()
    
    let viewTagsCategory = TagsView()
    let viewTagsLocation = TagsView()
    
    //data
    let arrayTagsLocationENG = ["Hongdae", "Gangnam", "Itaewon", "Geondae", "Jong-ro"]//, "Direct input"]
    let arrayTagsLocationKOR = ["홍대","강남","이태원","건대","종로"]//,"직접입력"]
    let arrayTagsCategoryENG = ["Nature Spot", "History Tourist Attractions", "Resort", "Experiential Sightseeing Spots", "Industrial tourism", "Street", "Western food", "Oriental food", "Vegetarian restaurant", "Bar / Cafe", "Festival"]
    let arrayTagsCategoryKOR = ["자연관광","역사관광지","휴양관광지","체험관광지","산업관광지","거리", "서양식", "동양식", "채식전문점", "바/카페", "축제"]
    
    let arrayTagsLocationLat = ["37.552781","37.497932","37.534478","37.539933","37.573799"]//,"직접입력"]
    let arrayTagsLocationLon = ["126.929165","127.027592","126.993881","127.070569","126.986358"]//,"직접입력"]
    let arrayTagsCategory = ["101","102","103","104","105","106","201","202","203","204","300"]
    
    var arraySelectLocation = Array<Int>()
    var arraySelectCategory = Array<Int>()
    
    //받아온 데이터
    var stringQuery = ""
    
    //param(필터) 데이터
    var intPageCount: Int = 1
    var arrayParams = [String:Any]()
    
    //해당 뷰컨트롤러 클래스가 생성될 때(ViewWillAppear전에 실행) 실행됩니다. Low memory와같은 특별한 경우가 아니라면 딱 한번만 실행되기 때문에 초기화 할 때 사용 할 수 있습니다.
    override func viewDidLoad() {
        print("SearchResultVC.viewDidLoad")
        super.viewDidLoad()
        
    }
    
    //뷰 컨트롤러가 화면에 나타난 직후에 실행됩니다. 화면에 적용될 애니메이션을 그리거나 API로 부터 정보를 받아와 화면을 업데이트 할 때 이곳에 로직을 위치시키면 좋습니다. 왜냐하면 지나치게 빨리 애니메이션을 그리거나 API에서 정보를 받아와 뷰 컨트롤러를 업데이트 할 경우 화면에 반영되지 않습니다.
//    override func viewDidAppear(_ animated: Bool) {
//        self.viewDidAppear(animated)
//        print("SearchResultVC.viewDidAppear")
//
//    }
    
    // 뷰 컨트롤러가 화면에 나타나기 직전에 실행됩니다. 뷰 컨트롤러가 나타나기 직전에 항상 실행되기 때문에 해당 뷰 컨트롤러가 나타나기 직전마다 일어나는 작업들을 여기에 배치 시킬 수 있습니다.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //textfiled
        self.searchBarText.delegate = self
        
        //ui
        self.view.backgroundColor = backgroundColor()
        self.setupNaviBar()
        self.setupView()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none // tableView 선 제거
        
        
        //get
        self.arrayParams["query"] = self.stringQuery
        self.getList()
    }



}
