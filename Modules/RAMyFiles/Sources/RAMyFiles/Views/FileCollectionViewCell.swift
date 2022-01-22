//
//  FileCollectionViewCell.swift
//  
//
//  Created by Раис Аглиуллов on 23.01.2022.
//

import Foundation

import UIKit
import RAFoundation

class FileCollectionViewCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.orange
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        label.numberOfLines = 0
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
    
    func setup(title: String, imageName: String?) {
        self.titleLabel.text = title
        
        if let imageName = imageName {
            let image = UIImage(systemName: imageName)
            self.imageView.image = image
        }
    }
    
    static func getCellHeight(title: String, width: CGFloat) -> CGFloat {
        var height: CGFloat = 0.0
        
        //Отступ от contentView.top до imageView
        height += 8.0
        
        //Высота картинки
        height += 80.0
        
        //Отступ от imageView.bottom до title.top
        height += 8.0
        
//        //Высота title
//        let titleHeight = title.heightWithBoundingWidth(width, font: UIFont.preferredFont(forTextStyle: .body))
//        height += titleHeight
//
//        //Отступ от titleLabel.bottom до contentView.bottom
//        height += 8.0
        
        return height
    }
    
    private func initialSetUp() {
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.systemBackground
        
        self.contentView.addSubview(self.imageView)
        self.contentView.addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.imageView.heightAnchor.constraint(equalToConstant: 80.0),
            self.imageView.widthAnchor.constraint(equalToConstant: 40.0),
            self.imageView.leftAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leftAnchor, constant: 8.0),
            self.contentView.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 8.0),
            
            self.titleLabel.leftAnchor.constraint(equalTo: self.imageView.rightAnchor, constant: 16.0),
            self.contentView.layoutMarginsGuide.rightAnchor.constraint(equalTo: self.titleLabel.rightAnchor, constant: 8.0),
            self.titleLabel.topAnchor.constraint(equalTo: self.imageView.topAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor)
        ])
    }
}
