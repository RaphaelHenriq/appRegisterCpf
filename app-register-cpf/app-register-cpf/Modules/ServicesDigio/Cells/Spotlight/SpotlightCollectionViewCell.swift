//
//  SpotlightCollectionViewCell.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/4/20.
//

import UIKit
import Foundation

protocol SpotlightCollectionViewCellDelegate: class {
    func tapButtonSpotlight(name: String?)
}

class SpotlightCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var spotlightView: UIView!
    @IBOutlet weak var spotlightImageView: UIImageView!
    
    // MARK: - Class properties
    
    weak var delegate: SpotlightCollectionViewCellDelegate?
    private var nameSpotlight: String?
    
    // MARK: - Init methods
    
    override var reuseIdentifier: String {
        return SpotlightCollectionViewCell.className
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .clear
        self.spotlightView.backgroundColor = .white
        self.spotlightView.allCorner(cornerRadius: 15)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapButton))
        self.spotlightView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func tapButton() {
        self.delegate?.tapButtonSpotlight(name: self.nameSpotlight)
    }
    
    // MARK: - Public methods
    
    func passData(_ data: Spotlight) {
        self.nameSpotlight = data.name
        self.spotlightImageView.cacheImageSDWebImage(from: data.bannerURL, contentMode: .scaleAspectFill, completion: nil)
    }
}
