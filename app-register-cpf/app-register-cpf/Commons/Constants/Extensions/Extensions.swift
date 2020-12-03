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
