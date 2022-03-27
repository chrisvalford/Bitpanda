//
//  CryptocoinTableViewCell.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import UIKit

/*
 Each list item must contain the asset's icon, name, symbol, average price.
 - Each price must have the number of decimals described by precision for fiat price (see cryptocoin/commodity properties in the Masterdata).
 - Each price must also show the fiat symbol, as the prices are in euro fiat.
 - Each price must take the regional location of the device into account for formatting. For example 1298.99 euros in Austria would be formatted to 1.298,99 € but in the USA, it would be formatted to $1,298.99.
 */

class CryptocoinTableViewCell: UITableViewCell {
    
    var viewModel: CryptocoinView? {
        didSet {
            nameView.text = viewModel?.name
            symbolView.text = viewModel?.symbol
            averagePriceView.text = viewModel?.averagePrice
            guard let iconLight = viewModel?.iconLight else {
                iconView.image = UIImage()
                return
            }
            guard let iconDark = viewModel?.iconDark else {
                iconView.image = UIImage()
                return
            }
            let icon = ImageCache.image(path: ((self.traitCollection.userInterfaceStyle == .dark ? iconDark : iconLight)), size: CGSize(width: 32, height: 32))
            iconView.image = icon
        }
    }
    
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
        label.sizeToFit()
        return label
    }()
    
    lazy var symbolView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    lazy var averagePriceView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.sizeToFit()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(iconView)
        self.addSubview(nameView)
        self.addSubview(symbolView)
        self.addSubview(averagePriceView)
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: iconTop),
            iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: iconLeft),
            
            nameView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            nameView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 16),
            
            symbolView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            symbolView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 16),
            symbolView.widthAnchor.constraint(equalToConstant: 54),
            
            averagePriceView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            averagePriceView.leftAnchor.constraint(equalTo: symbolView.rightAnchor, constant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        viewModel = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
