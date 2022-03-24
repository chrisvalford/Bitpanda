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
    let cryptocoinCellId = "CryptocoinCell"
    let fiatCellId = "FiatCell"
    
    private let viewModel = AssetsViewModel()
    
    lazy var assetSelector: UISegmentedControl = {
        let segmented = UISegmentedControl(items: AssetsSelection.allValues())
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.selectedSegmentIndex = viewModel.selectedAsset.rawValue
        segmented.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        return segmented
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(AssetTableViewCell.self, forCellReuseIdentifier: assetCellId)
        tv.register(CryptocoinTableViewCell.self, forCellReuseIdentifier: cryptocoinCellId)
        tv.register(FiatTableViewCell.self, forCellReuseIdentifier: fiatCellId)
        return tv
    }()
    
// TODO:
// The view building process should be completed in loadView()
// Need to ensure the data has 'empty' values to do this and then populate the table view in viewDidLoad()
//    override func loadView() {
//        self.view.addSubview(assetSelector)
//        self.view.addSubview(tableView)
//        addContsraints()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.select(assetsSelection: viewModel.selectedAsset)
        self.view.addSubview(assetSelector)
        self.view.addSubview(tableView)
        addContsraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "AssetsUpdated"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    private func segmentedValueChanged(_ sender: UISegmentedControl) {
        viewModel.selectedAsset = AssetsSelection(rawValue: sender.selectedSegmentIndex) ?? .commodities
    }

    @objc
    func reloadData(notification : NSNotification) {
        self.tableView.reloadSections(IndexSet(integer: 0), with: .fade)
        self.tableView.reloadData()
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
        case .cryptocoins:
            return viewModel.cryptocoinData.count
        case .commodities:
            return viewModel.commodityData.count
        case .fiats:
            return viewModel.fiatData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.selectedAsset {
        case .commodities:
            let cell = tableView.dequeueReusableCell(withIdentifier: assetCellId, for: indexPath) as! AssetTableViewCell
            cell.viewModel = viewModel.commodityData[indexPath.row]
            cell.layout()
            return cell
        case .cryptocoins:
            let cell = tableView.dequeueReusableCell(withIdentifier: cryptocoinCellId, for: indexPath) as! CryptocoinTableViewCell
            cell.viewModel = viewModel.cryptocoinData[indexPath.row]
            cell.layout()
            return cell
        case .fiats:
            let cell = tableView.dequeueReusableCell(withIdentifier: fiatCellId, for: indexPath) as! FiatTableViewCell
            cell.viewModel = viewModel.fiatData[indexPath.row]
            cell.layout()
            return cell
        }
    }
}
