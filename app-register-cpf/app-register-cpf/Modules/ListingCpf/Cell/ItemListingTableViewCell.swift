//
//  ItemListingTableViewCell.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/3/20.
//

import UIKit

class ItemListingTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cpfLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var separationView: UIView!
    
    // MARK: - Init cycle
    
    override var reuseIdentifier: String {
      return ItemListingTableViewCell.className
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureTableViewCell()
    }
    
    // MARK: - Class methods
    
    private func configureTableViewCell() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.separationView.backgroundColor = .systemGray2
    }
    
    // MARK: - Public methods
    
    func passData(cpf: String, date: String) {
        self.cpfLabel.text =   "\(StringsListiningVC.textListingCpf)" + "\(cpf)"
        self.dateLabel.text =  "\(StringsListiningVC.textListingDate)" + "\(date)"
    }
    
}
