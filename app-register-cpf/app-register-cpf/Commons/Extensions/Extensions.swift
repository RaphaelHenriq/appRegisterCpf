//
//  Extensions.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import Foundation
import UIKit
import SDWebImage

extension UIView {
    func allCorner(cornerRadius: Double) {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    func shadowView() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 15
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = .zero
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

extension UIViewController {
    func showAlertCommon(title: String, message: String?, buttonOk: String?, buttonCancel: Bool, handler: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let btnOk = UIAlertAction(title: buttonOk, style: .default, handler: { _ in
            handler?()
        })
        if buttonCancel {
            let cancelAction = UIAlertAction(title: StringsAlerts.cancelRefresh, style: .default) {
                (action: UIAlertAction!) -> Void in
            }
            alert.addAction(cancelAction)
        }
        alert.addAction(btnOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func modalVC(_ viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .formSheet
        navigationController.modalTransitionStyle = .coverVertical
        present(navigationController, animated: true)
        navigationController.providesPresentationContextTransitionStyle = true
    }
}

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

extension UITableView {
    func registerCell(_ identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell of class \(type.className)")
        }
        return cell
    }
}

extension UICollectionView {
    func registerCell(_ identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell of class \(type.className)")
        }
        return cell
    }
}

extension UIImageView {
    func cacheImageSDWebImage(from link: String?, contentMode: UIView.ContentMode, renderingMode: Bool = false, placeholder: UIImage? = UIImage(named: "imageNotLoading"), completion: (() -> Void)? ) {
        
        guard let link_ = link, let url = URL(string: link_) else { return }
        self.contentMode = .center
        self.backgroundColor = .black
        
        self.sd_setImage(with: url, placeholderImage: placeholder) { (image, _, _, _) in
            DispatchQueue.main.async {
                self.contentMode = contentMode
                
                guard let image = image else {
                    self.image = placeholder ?? UIImage()
                    return
                }
                
                if renderingMode {
                    self.image = image.withRenderingMode(.alwaysTemplate)
                } else {
                    self.image = image
                }
            }
            
            completion?()
        }
    }
}
