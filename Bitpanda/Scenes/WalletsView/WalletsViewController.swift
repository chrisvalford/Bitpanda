//
//  WalletsViewController.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/03/2022.
//  Copyright (c) 2022 anapp4that. All rights reserved.
//

import CoreData
import UIKit

class WalletsViewController: UIViewController {
    
    let walletCellId = "WalletCell"
    let fiatWalletCellId = "FiatWalletCell"
    let commodityWalletCellId = "CommodityWalletCell"
    
    private let viewModel = WalletsViewModel()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(WalletTableViewCell.self, forCellReuseIdentifier: walletCellId)
        tv.register(FiatWalletTableViewCell.self, forCellReuseIdentifier: fiatWalletCellId)
        tv.register(CommodityWalletTableViewCell.self, forCellReuseIdentifier: commodityWalletCellId)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        addContsraints()
        viewModel.fetchedResultsController.delegate = self
        do {
            try viewModel.fetchedResultsController.performFetch()
        } catch {
            print("An error occurred")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addContsraints() {
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension WalletsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = viewModel.fetchedResultsController.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = viewModel.fetchedResultsController.sections {
            let currentSection = sections[section]
            return currentSection.numberOfObjects
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionInfo = viewModel.fetchedResultsController.sections?[indexPath.section] else {
            return UITableViewCell()
        }
        switch sectionInfo.name {
        case "Fiat Wallet":
            let cell = tableView.dequeueReusableCell(withIdentifier: fiatWalletCellId, for: indexPath) as! FiatWalletTableViewCell
            cell.viewModel = WalletView(viewModel.fetchedResultsController.object(at: indexPath).attributes!)
            cell.layer.borderWidth = 1.0
            cell.layer.borderColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor.gray.cgColor : UIColor.lightGray.cgColor
            cell.layout()
            return cell
        case "Wallet":
            let cell = tableView.dequeueReusableCell(withIdentifier: walletCellId, for: indexPath) as! WalletTableViewCell
            cell.viewModel = WalletView(viewModel.fetchedResultsController.object(at: indexPath).attributes!)
            cell.layout()
            return cell
        case "Commodity Wallet":
            let cell = tableView.dequeueReusableCell(withIdentifier: commodityWalletCellId, for: indexPath) as! CommodityWalletTableViewCell
            cell.viewModel = WalletView(viewModel.fetchedResultsController.object(at: indexPath).attributes!)
            cell.layout()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionInfo = viewModel.fetchedResultsController.sections?[section] else {
            return nil
        }
        return sectionInfo.name
    }
}

extension WalletsViewController: NSFetchedResultsControllerDelegate {
    
}
