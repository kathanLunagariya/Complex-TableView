//
//  CustomBtn.swift
//  CollectionView-Inside-TableView
//
//  Created by Kathan Lunagariya on 31/12/21.
//

import UIKit

class CustomBtn:UIButton{
    
    let container:UIView = {
       
        let v = UIView()
        v.backgroundColor = .darkGray
        v.layer.cornerRadius = 7
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let btnLabel:UILabel = {
       
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.adjustsFontSizeToFitWidth = true
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let btn:UIButton = {
       
        let btn = UIButton()
        btn.configuration = .tinted()
        btn.configuration?.title = "click"
        btn.configuration?.cornerStyle = .capsule
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(btnLabel)
        container.addSubview(btn)
        self.addSubview(container)
        
        btn.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            btn.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5),
            btn.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            btn.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.4, constant: -5),
            btn.heightAnchor.constraint(equalToConstant: 30),
            
            btnLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 5),
            btnLabel.trailingAnchor.constraint(equalTo: btn.leadingAnchor, constant: -5),
            btnLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            btnLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5)
        ])
    }
    
    @objc func didTapButton(sender:UIButton){
        print(sender.tag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
