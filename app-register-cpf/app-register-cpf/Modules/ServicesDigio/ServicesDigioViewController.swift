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
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var spotlightCollectionView: UICollectionView!
    @IBOutlet weak var labelDigioCash: UILabel!
    @IBOutlet weak var imageViewDigioCash: UIImageView!
    @IBOutlet weak var productsLabel: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var loadingActivity: UIActivityIndicatorView!

    // MARK: - Class properties
    
    private let viewModel: ServicesDigioViewModel
    
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
        self.loadingActivity.startAnimating()
        self.viewModel.delegate = self
        self.configureCollectionsView()
        self.configureContentServicesDigio()
        self.viewModel.fetchData()
    }

    // MARK: - Class methods
    
    private func configureCollectionsView() {
        self.spotlightCollectionView.delegate = self
        self.spotlightCollectionView.dataSource = self
        self.spotlightCollectionView.registerCell(SpotlightCollectionViewCell.className)
        self.spotlightCollectionView.backgroundColor = .clear
    
        self.productCollectionView.delegate = self
        self.productCollectionView.dataSource = self
        self.productCollectionView.registerCell(ProductsCollectionViewCell.className)
        self.productCollectionView.backgroundColor = .clear
    }
    
    private func configureContentServicesDigio() {
        self.viewContent.isHidden = true
        self.view.backgroundColor = .systemGray5
        self.viewContent.backgroundColor = .clear
        self.imageViewDigioCash.allCorner(cornerRadius: 10)
        self.userImageView.layer.cornerRadius = 0.5 * userImageView.bounds.size.width
        self.userImageView.layer.borderWidth = 2
        self.userImageView.layer.borderColor = UIColor.black.cgColor
        self.userImageView.clipsToBounds = true
        self.imageViewDigioCash.isUserInteractionEnabled = true
        let tapGestureImageDigioCash = UITapGestureRecognizer(target: self, action: #selector(tapButtonDigioCash))
        self.imageViewDigioCash.addGestureRecognizer(tapGestureImageDigioCash)
    }
    
    private func dataServicesDigio() {
        self.labelDigioCash.text = self.viewModel.digioCash?.title
        self.imageViewDigioCash.cacheImageSDWebImage(from: self.viewModel.digioCash?.bannerURL, contentMode: .scaleAspectFill, completion: nil)
        self.productsLabel.text = StringsServicesDigioVC.labelProduct
        self.userImageView.image = UIImage(named: StringsServicesDigioVC.imageUser)
        self.userLabel.text = StringsServicesDigioVC.user
    }
    
    private func showErrorScreen() {
        self.viewContent.isHidden = true
    }
    
    private func showSucessScreen() {
        self.viewContent.isHidden = false
    }
    
    // MARK: - Action
    
    @objc
    private func tapButtonDigioCash() {
        if let nameScreen = self.viewModel.digioCash?.title {
            print("Ir para tela \(nameScreen)")
        }
    }
}

// MARK: - Extensions

extension ServicesDigioViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.spotlightCollectionView {
            return self.viewModel.imagesSpotlight.count
        } else {
            return self.viewModel.imagesProduct.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.spotlightCollectionView {
            let cellSpotlight = self.spotlightCollectionView.dequeueReusableCell(ofType: SpotlightCollectionViewCell.self, for: indexPath)
            
            cellSpotlight.passData(self.viewModel.spotlight[indexPath.row])
            cellSpotlight.delegate = self
            return cellSpotlight
            
        } else {
            let cellProducts = self.productCollectionView.dequeueReusableCell(ofType: ProductsCollectionViewCell.self, for: indexPath)
            
            cellProducts.passData(self.viewModel.product[indexPath.row])
            cellProducts.delegate = self
            return cellProducts
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.spotlightCollectionView {
            return CGSize(width: self.spotlightCollectionView.frame.width/1.3, height: self.spotlightCollectionView.frame.height)
        } else {
            return CGSize(width: self.productCollectionView.frame.width/2.8, height: self.productCollectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.spotlightCollectionView {
            return 20
        } else {
            return 13
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == self.spotlightCollectionView {
            let borderLeftCollection = CGFloat(20) // 24 borda da tela, menos 4 da sombra esquerda
            let borderRightCollection = CGFloat(24)
            return UIEdgeInsets(top: 0,left: borderLeftCollection,bottom: 0,right: borderRightCollection)
            
        } else {
            let borderLeftCollection = CGFloat(15) // 24 borda da tela, menos 9 da sombra esquerda
            let borderRightCollection = CGFloat(20) // 24 borda da tela, menos 4 da sombra direita
            return UIEdgeInsets(top: 0,left: borderLeftCollection,bottom: 0,right: borderRightCollection)
        }
    }
}

extension ServicesDigioViewController: SpotlightCollectionViewCellDelegate {
    func tapButtonSpotlight(nameScreen: String?) {
        if let screen = nameScreen {
            print("Ir para tela \(screen) do Spotlight")
        }
    }
}

extension ServicesDigioViewController: ProductsCollectionViewCellDelegate {
    func tapButtonProduct(nameScreen: String?) {
        if let screen = nameScreen {
            print("Ir para tela \(screen) do Produtos")
        }
    }
}

extension ServicesDigioViewController: ServicesDigioViewModelDelegate {
    func successResponse() {
        DispatchQueue.main.async {
            self.dataServicesDigio()
            self.spotlightCollectionView.reloadData()
            self.productCollectionView.reloadData()
            self.showSucessScreen()
            self.loadingActivity.hidesWhenStopped = true
            self.loadingActivity.stopAnimating()
        }
    }
    
    func errorResponse(error: ServiceError) {
        DispatchQueue.main.async {
            self.showErrorScreen()
            self.showAlertCommon(title: StringsAlerts.errorAlert, message: nil, buttonOk: StringsAlerts.textButtonRefresh, buttonCancel: true, handler: self.viewModel.fetchData)
        }
    }
}
