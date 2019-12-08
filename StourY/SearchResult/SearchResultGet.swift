//
//  SearchResultGet.swift
//  StourY
//
//  Created by 김기현 on 15/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension SearchResultVC{
    func getList(){
        if Reachability.isConnectedToNetwork(){
            ApiClient.sharedApiClient.getSearchResultList(params: self.arrayParams, page: 1) { (res, err) in
                if err == nil{
                    print("success get search result list")
                    setSearchResultData(responseObject: res, list: &self.arraySearchResult, imgList: &self.arrayImage)
                    self.intPageCount += 1
                    //                print(self.arraySearchResult)
                    self.loadingTableView.stopAnimating()
                    self.tableView.reloadData()
                    self.getNextPageCnt()
                }else{
                    print("get search result list fail!")
                }
            }
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
        
    }
    
    //table view 아래로 내려서 page 다시 로드 할 때 필요함
    func getListAgain(){
        if Reachability.isConnectedToNetwork(){
            self.loadingTableView.startAnimating()
            ApiClient.sharedApiClient.getSearchResultList(params: self.arrayParams, page: self.intPageCount) { (res, err) in
                if err == nil{
                    print("success get search result list")
                    setResponseData(responseObject: res, list: &self.arraySearchResult, imgList: &self.arrayImage)
                    self.intPageCount += 1
                    //                print(self.arraySearchResult)
                    self.loadingTableView.stopAnimating()
                    self.tableView.reloadData()
                    self.getNextPageCnt()
                }else{
                    print("get search result list fail!")
                }
            }
        }else{
            ToastView.shared.short(self.view, txt_msg: "Check your connection and try again")
        }
        
    }
    
    func getNextPageCnt(){
        ApiClient.sharedApiClient.getSearchResultList(params: self.arrayParams, page: self.intPageCount) { (res, err) in
            if err == nil{
                print("success get search pageCnt")
                self.intNextPageSearchResultCnt = (res?.count)!
            }else{
                print("get search pageCnt fail!")
            }
        }
    }
}
