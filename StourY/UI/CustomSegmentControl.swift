//
//  CustomSegmentControl.swift
//  CustomSegmentedControlTuto
//
//  Created by 김기현 on 03/10/2018.
//  Copyright © 2018 김기현. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSegmentControl: UIControl { // UIView 는 action을 달 수 없다.즉, valueChanged 값을 알 수가 없음
    var buttons = [UIButton]()
    var selector = UIView()
    var selectedSegmentIndex = 0
//    var selectedSegmentIndex = 0{
//        didSet{
//            self.updateView()
//        }
//    }
    
//    override init(frame: CGRect) {
//        super.init()
//        self.backgroundColor = .white
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    @IBInspectable
    var borderWidth: CGFloat = 1{
        didSet{
            layer.borderWidth = borderWidth //boderWidth의 값이 설정되면 layer.borderWidth의 값이 borderWith으로 변경 된다.
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var commaSeparatedButtonTitles: String = ""{
        didSet{
            self.updateView()
        }
    }
    
    @IBInspectable
    var textColor: UIColor = .lightGray{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor: UIColor = .darkGray{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var selectorTextColor: UIColor = .white {
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        buttons.removeAll()
        subviews.forEach {
            //(view) in view.removeFromSuperview()
            $0.removeFromSuperview() // same as above
        }
        
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")//String.componets(separatedBy: String) 매개변수의 값을 기준으로 string  분리 해줌
        
        for buttonTitle in buttonTitles{
            let button = UIButton(type: .custom) // custom->system
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(self.textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            buttons.append(button)
        }
        
        buttons[self.selectedSegmentIndex].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
//        selector.frame = CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height)
//        print("selectedSegmentIndex: ", selectedSegmentIndex)
        selector.frame = CGRect(x: selectorWidth * CGFloat(selectedSegmentIndex), y: 0, width: selectorWidth, height: frame.height)
//        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
//        print("selector.frame",selector.frame)
//        print("frame.width", frame.width)
        selector.layer.cornerRadius = frame.height / 2
        selector.backgroundColor = selectorColor
        self.addSubview(selector)
//        selector.snp.makeConstraints { (make) in
//            make.width.equalTo(self.snp.width / (buttonTitles.count))
//            make.height.equalTo(self)
//            make.top.left.equalTo(self)
//        }
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal //stackView 쌓이는게 가로 방향
        stackView.alignment = .fill //사이 간격 같게 해줌
        stackView.distribution = .fillEqually //stackView내의 element들의 크기를 같게 해줌 fillProportionally
//        stackView.distribution = .fillProportionally // stackView 내의 element들 warpContent효과
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false //autoResizing해재
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        //->stackView.snp.makeConstraints( (make) in { make.top.bottom.left.right.eqaulTo(self) } )
        
        
    }
    
    override func draw(_ rect: CGRect){
        layer.cornerRadius = frame.height/2
    }
    
    @objc func buttonTapped(button: UIButton){
        for (buttonIndex, btn)in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            
            if btn == button {
                selectedSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width/CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorStartPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        
        sendActions(for: .valueChanged) // button tapped하면 valueChanged라는 신호를 발생시킴
    }
    
    func changeSelectedButton(nowSelect: Int){
        let btn = buttons[nowSelect]
        btn.setTitleColor(selectorTextColor, for: .normal)//누른 곳 색을 하이라이트
        
        buttons[self.selectedSegmentIndex].setTitleColor(textColor, for: .normal) //이전 것을 노말로
        
        //그리고 위치 옮겨줌
        let selectorStartPosition = frame.width/CGFloat(buttons.count) * CGFloat(nowSelect)
        self.selector.frame.origin.x = selectorStartPosition
        
        
        self.selectedSegmentIndex = nowSelect
        
    }
    
    
    
}
