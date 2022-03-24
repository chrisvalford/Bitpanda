//
//  WalletsViewController.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/03/2022.
//  Copyright (c) 2022 anapp4that. All rights reserved.
//

import UIKit

class WalletsViewController: UIViewController {
    
    let walletCellId = "WalletCell"
    let fiatWalletCellId = "FiatWalletCell"
    
    private let viewModel = WalletsViewModel()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(WalletTableViewCell.self, forCellReuseIdentifier: walletCellId)
        tv.register(FiatWalletTableViewCell.self, forCellReuseIdentifier: fiatWalletCellId)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        addContsraints()
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
        return viewModel.walletData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.walletData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: fiatWalletCellId, for: indexPath) as! FiatWalletTableViewCell
            cell.viewModel = viewModel.walletData[indexPath.section][indexPath.row]
            cell.layout()
            cell.backgroundColor = .blue
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: walletCellId, for: indexPath) as! WalletTableViewCell
            cell.viewModel = viewModel.walletData[indexPath.section][indexPath.row]
            cell.layout()
            cell.backgroundColor = indexPath.section == 0 ? .green : .yellow
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.headerData[section]
    }
}
