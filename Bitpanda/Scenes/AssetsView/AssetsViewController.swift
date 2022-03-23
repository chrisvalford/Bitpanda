//
//  AssetsViewController.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/03/2022.
//  Copyright (c) 2022 anapp4that. All rights reserved.
//

import UIKit

class AssetsViewController: UIViewController {
    
    let assetCellId = "AssetCell"
    let fiatCellId = "FiatCell"
    
    private let viewModel = AssetsViewModel()
    
    lazy var assetSelector: UISegmentedControl = {
        let segmented = UISegmentedControl(items: AssetsSelection.allValues())
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.selectedSegmentIndex = viewModel.selectedAsset.rawValue
        return segmented
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(AssetTableViewCell.self, forCellReuseIdentifier: assetCellId)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.select(assetsSelection: viewModel.selectedAsset)
        self.view.addSubview(assetSelector)
        self.view.addSubview(tableView)
        addContsraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func addContsraints() {
        assetSelector.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        assetSelector.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        assetSelector.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        assetSelector.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: assetSelector.bottomAnchor, constant: 8).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension AssetsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.selectedAsset {
        case .cryptocoins, .commodities:
            return viewModel.commodityData.count
        case .fiats:
            return viewModel.fiatData.count
        case .all:
            return 0 // TODO:
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.selectedAsset {
        case .cryptocoins, .commodities:
            let cell = tableView.dequeueReusableCell(withIdentifier: assetCellId, for: indexPath) as! AssetTableViewCell
            cell.viewModel = viewModel.commodityData[indexPath.row]
            cell.layout()
            return cell
        case .fiats:
            return UITableViewCell()
        case .all:
            return UITableViewCell()
        }
        
    }
    
    
}

