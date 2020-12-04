//
//  Extensions.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import Foundation
import UIKit

extension UIView {
    func allCorner(cornerRadius: Double) {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(cornerRadius)
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

extension UIViewController {
    func showAlertCommon(title: String, message: String?, handler: (() -> Void)?) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let btnOk = UIAlertAction(title: StringsAlerts.okAlertButton, style: .default, handler: { _ in
        handler?()
      })
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
