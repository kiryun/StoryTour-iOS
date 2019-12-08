
//
//  SearchActiion.swift
//  StourY
//
//  Created by 김기현 on 13/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation

extension SearchVC{
    @objc func tappedBack(btn: UIButton){
        print("SearchVC.tappedBack")
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func tappedSearch(btn: UIButton){
        print("SearchVC.tappedSearch")
        self.searchBarText.endEditing(true)
        let searchResultVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
        searchResultVC.stringQuery = self.searchBarText.text!
        navigationController?.pushViewController(searchResultVC, animated: true)
    }
    
    func tappedReturn(){
        print("SearchVC.tappedReturn")
        let searchResultVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
        searchResultVC.stringQuery = self.searchBarText.text!
        navigationController?.pushViewController(searchResultVC, animated: true)
    }
}
