//
//  CustomCollectionCell.swift
//  CollectionView-Inside-TableView
//
//  Created by Kathan Lunagariya on 30/12/21.
//

import UIKit

class CustomCollectionCell:UICollectionViewCell{
    
    let container:UIView = {
       
        let v = UIView()
        v.backgroundColor = .black
        v.layer.cornerRadius = 7
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let containerItemLbl:UILabel = {
       
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = .preferredFont(forTextStyle: .largeTitle)
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        container.addSubview(containerItemLbl)
        contentView.addSubview(container)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor, constant: 7),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 7),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -7),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7)
        ])
        
        containerItemLbl.frame = container.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
