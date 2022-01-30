//
//  CustomTableCell.swift
//  CollectionView-Inside-TableView
//
//  Created by Kathan Lunagariya on 30/12/21.
//

import UIKit

class CustomTableCell:UITableViewCell{
    
    var counts = 0
    var IndexPath = Int()
    var i = 0
    
    let collection:UICollectionView = {
    
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CustomCollectionCell.self, forCellWithReuseIdentifier: "cell")
        cv.register(NewCustomCollectionCell.self, forCellWithReuseIdentifier: "cell2")
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        collection.delegate = self
        collection.dataSource = self
        contentView.addSubview(collection)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.topAnchor, constant: 3),
            collection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            collection.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            collection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CustomTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if IndexPath == 1{
            return (counts/3) + (counts%3 > 0 ? 1 : 0)
        }else{
            return counts
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if IndexPath == 1{
            guard let cell2 = collection.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? NewCustomCollectionCell else {
                print("can't cast new-collection cell...")
                return UICollectionViewCell()
            }
            
            let btnFreq = counts/3 >= 1 ? 3 : counts % 3
            cell2.configStackButtons(btnCount: btnFreq, tagNo: i)
            counts -= btnFreq
            i += 1
            
            cell2.layoutIfNeeded()
            return cell2
        }
        else{
            guard let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionCell else {
                print("can't cast cell...")
                return UICollectionViewCell()
            }
            
            cell.containerItemLbl.text = String(indexPath.row + 1)
            cell.layoutIfNeeded()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collection.frame.height - 5, height: collection.frame.height - 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(collection.tag, indexPath.row)
        
        guard let cell = collection.cellForItem(at: indexPath) as? CustomCollectionCell else {
            print("can't cast cell...")
            return
        }
        
        print(cell.containerItemLbl.text!)
    }
}
