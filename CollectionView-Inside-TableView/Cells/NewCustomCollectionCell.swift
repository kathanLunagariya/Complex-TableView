//
//  NewCustomCollectionCell.swift
//  CollectionView-Inside-TableView
//
//  Created by Kathan Lunagariya on 31/12/21.
//

import UIKit

class NewCustomCollectionCell: UICollectionViewCell {
    
    let container:UIView = {
       
        let v = UIView()
        v.backgroundColor = .systemGray6
        v.layer.cornerRadius = 7
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        return v
    }()
    
    let stack:UIStackView = {
       
        let s = UIStackView()
        s.axis = .vertical
        s.spacing = 5
        s.distribution = .equalSpacing
        s.alignment = .center
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        container.addSubview(stack)
        contentView.addSubview(container)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
//            stack.topAnchor.constraint(equalTo: container.topAnchor, constant: 3),
//            stack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 3),
//            stack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -3),
//            stack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -3)
            
            stack.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
    }
    
    func configStackButtons(btnCount:Int, tagNo:Int){
        
        for i in 0..<btnCount{
            let btn = CustomBtn()
            btn.tag = tagNo * 3 + i + 1
            btn.btn.tag = btn.tag
            btn.btnLabel.text = String(btn.tag)
            
            stack.addArrangedSubview(btn)
        }
        
        for subview in stack.arrangedSubviews{
            NSLayoutConstraint.activate([
                subview.widthAnchor.constraint(equalTo: container.widthAnchor),
                subview.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
