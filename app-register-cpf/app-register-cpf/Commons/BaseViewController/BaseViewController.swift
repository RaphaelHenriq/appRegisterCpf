//
//  BaseViewController.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/3/20.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    func addMenuNavigationButton() {
      let imageInfo = UIImage(named: "InformationListing")?.withRenderingMode(.alwaysOriginal)
        let followButton = UIButton(type: .system)
        followButton.setImage(imageInfo, for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
      self.navigationItem.leftBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 0.7294117647, blue: 0, alpha: 1)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    func configureRightButtontNavigationBar() {
        let imageInfo = UIImage(named: "InformationListing")?.withRenderingMode(.alwaysTemplate)
          let followButton = UIButton(type: .system)
          followButton.setImage(imageInfo, for: .normal)
          followButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
          
        self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 1, green: 0.7294117647, blue: 0, alpha: 1)
          self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
//    func configureBackButtonNavigationBar() {
//      let button2 = UIButton(type: .custom)
//      button2.setImage(UIImage(named: "arrow_ios_left"), for: .normal)
//      let attributedTitle = NSAttributedString(string: "", attributes: [NSAttributedString.Key.font : UIFont.getFont(type: .roboto, style: .bold, size: 14), NSAttributedString.Key.foregroundColor : UIColor.white])
//      button2.setAttributedTitle(attributedTitle, for: .normal)
//      button2.addTarget(self, action: #selector(dismissModule), for: .touchUpInside)
//      button2.backgroundColor = .clear
//      button2.contentEdgeInsets = UIEdgeInsets(top: 11, left: 11, bottom: 11, right: 11)
//      self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button2)
//      self.setJeepNationNavigationTitle()
//      self.setupTranslucentNavigationBar()
//      self.tabBarController?.tabBar.isHidden = true
//    }
    
}
