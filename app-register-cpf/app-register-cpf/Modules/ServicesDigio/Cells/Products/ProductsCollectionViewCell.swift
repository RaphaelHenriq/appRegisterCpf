//
//  ProductsCollectionViewCell.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/4/20.
//

import UIKit

protocol ProductsCollectionViewCellDelegate: class {
    func tapButtonProduct(name: String?)
}

class ProductsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    
    // MARK: - Class properties
    
    weak var delegate: ProductsCollectionViewCellDelegate?
    private var nameProduct: String?
    
    // MARK: - Init methods
    
    override var reuseIdentifier: String {
        return ProductsCollectionViewCell.className
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .clear
        self.productView.backgroundColor = .white
        self.productView.allCorner(cornerRadius: 15)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapButton))
        self.productView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func tapButton() {
        self.delegate?.tapButtonProduct(name: self.nameProduct)
    }
    
    // MARK: - Public properties
    
    func passData(_ data: Product) {
        self.nameProduct = data.name
        self.productImageView.cacheImageSDWebImage(from: data.imageURL, contentMode: .scaleAspectFill, completion: nil)
    }


}
