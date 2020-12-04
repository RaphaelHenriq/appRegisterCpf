//
//  ServicesDigioViewController.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/4/20.
//

import UIKit

class ServicesDigioViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var spotlightCollectionView: UICollectionView!
    @IBOutlet weak var labelDigioCash: UILabel!
    @IBOutlet weak var imageViewDigioCash: UIImageView!
    @IBOutlet weak var productsLabel: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    // MARK: - Class properties

    // MARK: - Public properties
    
    let viewModel: ServicesDigioViewModel
    
    // MARK: - Init methods
    
    init() {
        let provider = ServicesDigioProvider()
        self.viewModel = ServicesDigioViewModel(provider: provider)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionsView() 
    }

    // MARK: - Class methods
    
    private func setupCollectionsView() {
        self.spotlightCollectionView.delegate = self
        self.spotlightCollectionView.dataSource = self
        self.spotlightCollectionView.registerCell(SpotlightCollectionViewCell.className)
        self.spotlightCollectionView.backgroundColor = .clear
    
        self.productCollectionView.delegate = self
        self.productCollectionView.dataSource = self
        self.productCollectionView.registerCell(ProductsCollectionViewCell.className)
        self.productCollectionView.backgroundColor = .clear
    }
    

}
// MARK: - Extensions

extension ServicesDigioViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.spotlightCollectionView {
            
        } else {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.spotlightCollectionView {
            
        } else {
            
        }
    }

    
}
