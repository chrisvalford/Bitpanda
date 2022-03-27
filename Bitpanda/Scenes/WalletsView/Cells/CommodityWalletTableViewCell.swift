//
//  WalletTableViewCell.swift
//  Bitpanda
//
//  Created by Christopher Alford on 24/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import UIKit

class CommodityWalletTableViewCell: UITableViewCell {
    
    var viewModel: WalletView?
    
    let iconTop = 4.0
    let iconLeft = 0.0
    let iconWidth = 32.0
    let iconHeight = 32.0
    
    lazy var iconView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var nameView: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel?.name
        label.sizeToFit()
        return label
    }()
    
    lazy var symbolView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel?.symbol
        label.sizeToFit()
        return label
    }()
    
    lazy var balanceView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.text = "Balance: \(viewModel?.balance ?? "")"
        label.sizeToFit()
        return label
    }()
    
    func layout() {
        self.addSubview(iconView)
        self.addSubview(nameView)
        self.addSubview(symbolView)
        self.addSubview(balanceView)
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: iconTop),
            iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: iconLeft),
            
            nameView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            nameView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 44),
            
            symbolView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            symbolView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 44),
            symbolView.widthAnchor.constraint(equalToConstant: 54),
            
            balanceView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            balanceView.leftAnchor.constraint(equalTo: symbolView.rightAnchor, constant: 44),
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
