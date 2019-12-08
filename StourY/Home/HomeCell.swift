//
//  AttrCell.swift
//  StoryTour
//
//  Created by 김기현 on 05/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import TagListView //https://github.com/ElaWorkshop/TagListView
//protocol HomeCellDelegate: class {
//    func didPressLike(_ tag: Int)
//}

class HomeCell: UITableViewCell {
    
    //    @IBOutlet weak var test_title: UILabel!
    //    @IBAction func testButton(_ sender: UIButton) {
    //        print("tapped button in tableViewCell")
    //    }
//    weak var delegate: HomeCellDelegate?
    
    //    @IBAction func testButton(_ sender: UIButton) {
    //        print("testButton")
    //        delegate?.didPressLike(sender.tag)
    //    }
    
//    @IBOutlet weak var viewSpacing: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var cellMasterView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var filterView: UIView!
    
    @IBOutlet weak var btnLike: UIButton!
//    @IBAction func btnLikePressed(_ sender: UIButton) {
//        print("btnLikePressed")
//        delegate?.didPressLike(sender.tag)
//    }
    
//    @IBOutlet weak var likeCnt: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var viewTags: TagListView!
    //    @IBOutlet weak var tagView: UIView!
//    var viewTags = UIView()
//    var tags = Array<InsetLabel>()
    
}

