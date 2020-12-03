//
//  ListingCpfViewController.swift
//  app-register-cpf
//
//  Created by Raphael Henrique on 12/2/20.
//

import UIKit
import CoreData

class ListingCpfViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var listingTableView: UITableView!

    // MARK: - Init Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
    }
    
    // MARK: - Class methods
    
    private var tableView: UITableView!
    private var context: NSManagedObjectContext!
    var cpf: [NSManagedObject] = []
    
    // MARK: - Class methods
    
    private func configureTableView() {
        self.tableView = UITableView(frame: self.view.frame)
        view.backgroundColor = .white
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCell(ItemListingTableViewCell.className)
    }
    
    func coreData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
        
    }

    func getCpf() {
        let requisition = NSFetchRequest<NSFetchRequestResult>(entityName: "Cpf")
        do {
            let getRequisition = try context.fetch(requisition)
        } catch let erro as Error {
            print(erro.localizedDescription)
        }
    }

}


// MARK: - Extensions

extension ListingCpfViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cpf.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(ofType: ItemListingTableViewCell.self, for: indexPath)
//        cell.passData(data)
        return cell
    }
    
    
}
