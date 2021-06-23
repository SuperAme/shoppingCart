//
//  CustomCollectionViewCell.swift
//  ShoppingCartAMQ
//
//  Created by IDS Comercial on 23/06/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productPriceLabel)
        contentView.addSubview(productImage)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("initCoder has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productImage.frame = CGRect(x: 5,
                                   y: 0,
                                   width: contentView.frame.size.width-10,
                                   height: contentView.frame.size.height/2)
        productNameLabel.frame = CGRect(x: 5,
                                        y: productImage.frame.origin.y+productImage.frame.size.height+5,
                               width: contentView.frame.size.width-10,
                               height: 45)
        productPriceLabel.frame = CGRect(x: 5, y: productNameLabel.frame.origin.y+productNameLabel.frame.size.height+5, width: contentView.frame.size.width-10, height: 30)
        
    }
    
    public func configure(productName: String, productPrice: Double) {
        productNameLabel.text = productName
        productPriceLabel.text = String(productPrice)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productNameLabel.text = nil
        productPriceLabel.text = nil
    }
}
