//
//  CustomSegmentController.swift
//  StoryTour
//
//  Created by 김기현 on 05/09/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit
//@objc protocol NavigationSegmentControllerDataSource{
//    func getSegmentSelectedIndex() -> Int
//}

@IBDesignable
class NavigationSegmentController: UIControl {
    
    var buttons = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0//현재 눌린 segmentIndex
    
    //    var dataSource: NavigationSegmentControllerDataSource? = nil{
    //        didSet{
    //
    //        }
    //    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    
    @IBInspectable var borderColor: UIColor = .clear {
        
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var commaSeperatedButtonTitles: String = "" {
        
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var textColor: UIColor = .lightGray {
        
        didSet {
            updateView()
        }
    }
    
    
    @IBInspectable var selectorColor: UIColor = .darkGray {
        
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var selectorTextColor: UIColor = .green {
        
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateView() {
        //print("update NavisegmentCtrl")
        buttons.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        let buttonTitles = commaSeperatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles {
            
            let button = UIButton.init(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
            //            button.setTitleColor(button.isSelected ? UIColor.gray : selectorTextColor, for: .normal)
        }
        
        buttons[selectedSegmentIndex].setTitleColor(selectorTextColor, for: .normal) //update가 되더라도 사용자가 직접 버튼을 바꾸지 않는 이상 바꾸지 않도록 현재 눌린 selector를 유지
        //buttons[0].setTitleColor(selectorTextColor, for: .normal) //
        //print("selectedSegmentIndex: ",selectedSegmentIndex)
        
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        
        let y =    (self.frame.maxY - self.frame.minY) - 3.0
        let  selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(selectedSegmentIndex) // selector의 위치값 selectedSegmentIndex값에 맞게 설정
        
        selector = UIView.init(frame: CGRect.init(x: selectorStartPosition, y: y, width: selectorWidth, height: 3.0)) //x를 selectedSegmentIndex로 설정
        //selector.layer.cornerRadius = frame.height/2
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        // Create a StackView
        
        let stackView = UIStackView.init(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0.0
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        // Drawing code
        
        // layer.cornerRadius = frame.height/2
        
    }
    
    //버튼 현재 위치만 바꿔줌
    func changeSelectedButton(nowSelect: Int){
        let btn = buttons[selectedSegmentIndex]
        
        btn.setTitleColor(textColor, for: .normal)
        selectedSegmentIndex = nowSelect
        
        //print("selectedSegmentIndex: ", selectedSegmentIndex)
        
        let  selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(nowSelect)
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.selector.frame.origin.x = selectorStartPosition
        })
        
        btn.setTitleColor(selectorTextColor, for: .normal)
    }
    
    @objc func buttonTapped(button: UIButton) {
        //print("navi seg ctrl button tapped")
        
        for (buttonIndex,btn) in buttons.enumerated() {
            
            btn.setTitleColor(textColor, for: .normal)
            
            if btn == button {
                selectedSegmentIndex = buttonIndex
                
                print("selectedSegmentIndex: ", selectedSegmentIndex)
                
                let  selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                
                UIView.animate(withDuration: 0.3, animations: {
                    
                    self.selector.frame.origin.x = selectorStartPosition
                })
                
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        
        sendActions(for: .valueChanged)
        
    }
    
    
    func updateSegmentedControlSegs(index: Int) {
        
        for btn in buttons {
            btn.setTitleColor(textColor, for: .normal)
        }
        
        let  selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(index)
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.selector.frame.origin.x = selectorStartPosition
        })
        
        buttons[index].setTitleColor(selectorTextColor, for: .normal)
        
    }
    
    
    
    //    override func sendActions(for controlEvents: UIControlEvents) {
    //
    //        super.sendActions(for: controlEvents)
    //
    //        let  selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(selectedSegmentIndex)
    //
    //        UIView.animate(withDuration: 0.3, animations: {
    //
    //            self.selector.frame.origin.x = selectorStartPosition
    //        })
    //
    //        buttons[selectedSegmentIndex].setTitleColor(selectorTextColor, for: .normal)
    //
    //    }
    
    
}
