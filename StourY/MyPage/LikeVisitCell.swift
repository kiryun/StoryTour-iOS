//
//  LikeVisitCell.swift
//  StourY
//
//  Created by 김기현 on 26/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
import TagListView

class LikeVisitCell: UITableViewCell {

    @IBOutlet weak var cellShadowView: UIView!
    @IBOutlet weak var cellMasterView: UIView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var buttonLike: UIButton!
    @IBOutlet weak var viewTags: TagListView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
