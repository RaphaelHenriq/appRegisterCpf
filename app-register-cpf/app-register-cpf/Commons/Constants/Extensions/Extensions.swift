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
        let btnOk = UIAlertAction(title: Strings.okAlertButton, style: .default, handler: { _ in
        handler?()
      })
      alert.addAction(btnOk)
      self.present(alert, animated: true, completion: nil)
    }
}
