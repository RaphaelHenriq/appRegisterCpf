//
//  ListingCpfViewController.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import UIKit
import Foundation

class ListingCpfViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var listingTableView: UITableView!
    
    // MARK: - Class properties
    
    private let viewModel: ListingCpfViewModel
    private let enumInformation: idInformation = .listingVC
    
    // MARK: - Init Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.viewModel.coreData()
        self.configureRightButtonNavigationBar(enumIdInformation: enumInformation)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.viewModel.getCpf(reloadTableView: self.listingTableView)
    }
    
    init() {
        self.viewModel = ListingCpfViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Class methods
    
    private func configureTableView() {
        self.listingTableView.backgroundColor = .systemGray5
        self.listingTableView.delegate = self
        self.listingTableView.dataSource = self
        self.listingTableView.registerCell(ItemListingTableViewCell.className)
    }

}


// MARK: - Extensions

extension ListingCpfViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.Cpf.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.listingTableView.dequeueReusableCell(ofType: ItemListingTableViewCell.self, for: indexPath)
        let cpf = self.viewModel.Cpf[indexPath.row]
        let cpfText = cpf.value(forKey: StringsCoreData.textAttribute) as? String ?? Strings.avoid
        let cpfData = self.viewModel.formatDate(date: cpf.value(forKey: StringsCoreData.dateAttribute) as Any)
        cell.passData(cpf: cpfText, date: cpfData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let index = indexPath.row
            let cpf = self.viewModel.Cpf[index]
            
            
            self.viewModel.context.delete(cpf)
            self.viewModel.Cpf.remove(at: index)
            
            self.listingTableView.deleteRows(at: [indexPath], with: .automatic)
            self.viewModel.reSaveCpf()
            
        }
    }
}
