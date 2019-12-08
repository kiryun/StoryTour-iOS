//
//  SpaceViewPager.swift
//  StourY
//
//  Created by 김기현 on 09/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import Foundation


import UIKit
import SnapKit

@objc public protocol  SpaceViewPagerDataSource {
    func numberOfItems(viewPager:SpaceViewPager) -> Int
    func viewAtIndex(viewPager:SpaceViewPager, index:Int, view:UIView?) -> UIView
    
    @objc optional func didSelectedItem(index:Int)
    
}

public class SpaceViewPager: UIView {
    //var pageControl: UIPageControl = UIPageControl() //동그란 점 말하는거임
    var scrollView: UIScrollView = UIScrollView()
    var currentPosition: Int = 0
    
    var dataSource: SpaceViewPagerDataSource? = nil{
        didSet{
            reloadData()
        }
    }
    
    var numberOfItems: Int = 0
    var itemViews: Dictionary<Int, UIView> = [:] // view의 index와 view 들어가는 곳
    
    //1
    required public init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setupView()
    }
    
    //2
    func setupView(){
        self.addSubview(scrollView)
        //self.addSubview(pageControl)
        setupScrollView()
        reloadData()
    }
    
    //3
    //scrollView 정의
    func setupScrollView(){
        scrollView.isPagingEnabled = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self
        //scrollView.layer.zPosition = 100
        //scrollView constraint
        scrollView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self) // scrollview 크기는 viewpager를 만드는 곳에서 정의 됨
        }
        
    }
    
    
    //    //pageControl정의 동그란 점 말하는거임
    //    func setupPageControl(){
    //        self.pageControl.numberOfPages = numberOfItems
    //        self.pageControl.currentPage = 0
    //        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
    //        self.pageControl.currentPageIndicatorTintColor = UIColor.green
    //
    //        pageControl.snp_makeConstraints { (make) in
    //            make.top.bottom.left.right.equalTo(self)
    //        }
    //    }
    
    //4
    func reloadData(){
        if(dataSource != nil){
            numberOfItems = (dataSource?.numberOfItems(viewPager: self))! // datasource 정의 하는 쪽에서 가져옴
        }
        //        self.pageControl.numberOfPages = numberOfItems
        
        itemViews.removeAll() // 새롭게 정의 되는 것이니 item array 초기화
        for view in self.scrollView.subviews { // view에 표출 된 것도 지우기 위해
            view.removeFromSuperview()
        }
        
        DispatchQueue.main.async { // 비동기로 scrollview의 컨텐츠 사이즈 정의
            self.scrollView.contentSize = CGSize(width: (self.scrollView.frame.width * 0.9) *  CGFloat(self.numberOfItems) , height: self.scrollView.frame.height)
            self.scrollView.contentInset.left = self.scrollView.frame.width * 0.1
            self.reloadViews(index: 0)
        }
    }
    
    //viewPager, view 동작을 정의
    func loadViewAtIndex(index:Int){
        //스택 view 로 받아야함 그래야 view사이 거리 재기 쉬움
        //let stckView: UIStackView
        
        let view:UIView?
        if(dataSource != nil){
            view =  (dataSource?.viewAtIndex(viewPager: self, index: index, view: itemViews[index]))!
        }else{
            view = UIView()
        }
        
        setFrameForView(view: view!, index: index);
        
        
        if(itemViews[index] == nil){
            itemViews[index] = view
            let tap = UITapGestureRecognizer(target: self, action:  #selector(self.handleTapSubView))
            tap.numberOfTapsRequired = 1
            itemViews[index]!.addGestureRecognizer(tap)
            
            scrollView.addSubview(itemViews[index]!)
        }else{
            itemViews[index] = view
        }
        
    }
    
    @objc func handleTapSubView() {
        if(dataSource?.didSelectedItem != nil){
            dataSource?.didSelectedItem!(index: currentPosition)
        }
    }
    
    
    func reloadViews(index:Int){
        
        for i in (index-1)...(index+1) {
            if(i>=0 && i<numberOfItems){
                loadViewAtIndex(index: i);
            }
        }
        
        // print(scrollView.subviews.count)
    }
    
    
    func setFrameForView(view:UIView,index:Int){
        view.frame = CGRect(x: (self.scrollView.frame.width)*CGFloat(index), y: 0, width: self.scrollView.frame.width * 0.9, height: self.scrollView.frame.height);
    }
    
    
}

extension SpaceViewPager:UIScrollViewDelegate{
    
    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        var pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageNumber = pageNumber + 1
        //        pageControl.currentPage = Int(pageNumber)
        //        currentPosition = pageControl.currentPage
        scrollToPage(index: Int(pageNumber))
    }
    
    //http://stackoverflow.com/a/1857162
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        NSObject.cancelPreviousPerformRequests(withTarget: scrollView)
        self.perform(#selector(self.scrollViewDidEndScrollingAnimation(_:)), with: scrollView, afterDelay: 0.3)
    }
    
}

extension SpaceViewPager{
    
    
    //    func animationNext(){
    //        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewPager.moveToNextPage), userInfo: nil, repeats: true)
    //    }
    @objc func moveToNextPage (){
        if(currentPosition <= numberOfItems && currentPosition > 0) {
            scrollToPage(index: currentPosition)
            currentPosition = currentPosition + 1
            if currentPosition > numberOfItems {
                currentPosition = 1
            }
        }
    }
    
    func scrollToPage(index:Int) {
        if(index <= numberOfItems && index > 0) {
            let zIndex = index - 1
            let iframe = CGRect(x: self.scrollView.frame.width*CGFloat(zIndex), y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height);
            scrollView.setContentOffset(iframe.origin, animated: true)
            //            pageControl.currentPage = zIndex
            reloadViews(index: zIndex)
            currentPosition = index
        }
    }
    
}
