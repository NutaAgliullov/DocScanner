//
//  File.swift
//  
//
//  Created by Раис Аглиуллов on 30.01.2022.
//

import UIKit
import RAFoundation

class TestCell: UICollectionViewCell {
   
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        label.numberOfLines = 1
        label.textColor = UIColor.black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialSetUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialSetUp()
    }
    
    func setup(title: String) {
        self.titleLabel.text = title
    }
    
    static func getCellHeight(title: String, width: CGFloat) -> CGFloat {
        var height: CGFloat = 0.0
        
        //Отступ от contentView.top до imageView
        height += 8.0
        
        //Высота картинки
        height += 40.0
        
        //Отступ от imageView.bottom до title.top
        height += 8.0
        
        //Высота title
        let titleHeight = title.heightWithBoundingWidth(width, font: UIFont.preferredFont(forTextStyle: .body))
        height += titleHeight
        
        //Отступ от titleLabel.bottom до contentView.bottom
        height += 8.0
        
        return height
    }
    
    private func initialSetUp() {
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.systemBackground
        
        self.contentView.addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            self.titleLabel.leftAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leftAnchor),
            self.contentView.layoutMarginsGuide.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            self.contentView.layoutMarginsGuide.bottomAnchor.constraint(equalTo: self.titleLabel.bottomAnchor)
        ])
    }
}
