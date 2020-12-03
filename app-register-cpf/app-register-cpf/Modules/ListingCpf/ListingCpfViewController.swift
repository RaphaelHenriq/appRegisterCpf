//
//  ListingCpfViewController.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import UIKit

class ListingCpfViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var listingTableView: UITableView!
    
    // MARK: - Class properties
    
    private let viewModel: ListingCpfViewModel
    
    // MARK: - Init Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.viewModel.coreData()
        
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
        view.backgroundColor = .white
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
        let cpfData = String(describing: cpf.value(forKey: StringsCoreData.dateAttribute))
        let cpfText = cpf.value(forKey: StringsCoreData.textAttribute) as? String ?? Strings.avoid
        
        cell.passData(cpf: cpfText, date: cpfData)
        return cell
    }
    
    
}
