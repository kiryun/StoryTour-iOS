//
//  ViewPager.swift
//  StoryTour
//
//  Created by 김기현 on 07/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

//usage

//class ViewPagerVC: UIViewController {
//
//    //ui
//    @IBOutlet weak var viewPager: ViewPager! // viewPager maked in storyboard
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.viewPager.dataSource = self
//    }
//
//}

//extension ViewPagerVC: ViewPagerDataSource{
//    func numberOfItems(viewPager: ViewPager) -> Int {
//        return viewPagerList.count
//    }
//
//    func viewAtIndex(viewPager: ViewPager, index: Int, view: UIView?) -> UIView {
//        var newView = view;
//
//
//            newView?.addSubview(imgView!)
//        }else{
//            imgView = newView?.viewWithTag(1) as? UIImageView
//        }
//
//        return newView!
//    }
//
//}


import UIKit
import SnapKit

@objc public protocol  ViewPagerDataSource {
    func numberOfItems(viewPager:ViewPager) -> Int
    func viewAtIndex(viewPager:ViewPager, index:Int, view:UIView?) -> UIView

    @objc optional func didSelectedItem(index:Int)

}

public class ViewPager: UIView {
    //var pageControl: UIPageControl = UIPageControl() //동그란 점 말하는거임
    var scrollView: UIScrollView = UIScrollView()
    var currentPosition: Int = 0

    var dataSource: ViewPagerDataSource? = nil{
        didSet{
            reloadData()
        }
    }

    var numberOfItems: Int = 0
    var itemViews: Dictionary<Int, UIView> = [:] // view의 index와 view 들어가는 곳

    required public init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setupView()
    }

    func setupView(){
        self.addSubview(scrollView)
        //self.addSubview(pageControl)
        setupScrollView()
        reloadData()
    }

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
        scrollView.snp_makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self)
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

    func reloadData(){
        if(dataSource != nil){
            numberOfItems = (dataSource?.numberOfItems(viewPager: self))!
        }
        //        self.pageControl.numberOfPages = numberOfItems

        itemViews.removeAll()
        for view in self.scrollView.subviews {
            view.removeFromSuperview()
        }

        DispatchQueue.main.async {
            self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width *  CGFloat(self.numberOfItems) , height: self.scrollView.frame.height)
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
        view.frame = CGRect(x: self.scrollView.frame.width*CGFloat(index), y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height);
    }


}

extension ViewPager:UIScrollViewDelegate{

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

extension ViewPager{


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
