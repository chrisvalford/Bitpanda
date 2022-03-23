//
//  AssetTableViewCell.swift
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

class AssetTableViewCell: UITableViewCell {
    
    var viewModel: CommodityView?
    
    let iconTop = 4.0
    let iconLeft = 0.0
    let iconWidth = 32.0
    let iconHeight = 32.0
    
    private lazy var iconView: UIView = {
        let view = UIView(frame: .zero)// CGRect(x: iconTop, y: iconLeft, width: iconWidth, height: iconHeight))
        guard let path = self.traitCollection.userInterfaceStyle == .dark ? viewModel?.iconDark : viewModel?.iconLight else {
            print("Invalid url")
            return UIView()
        }
        guard let svg = SVGImage(frame: CGRect(x: iconTop, y: iconLeft, width: iconWidth, height: iconHeight), url: path) else {
            print("Invalid SVG")
            return UIView()
        }
        svg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(svg)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    lazy var averagePriceView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.text = "Average price: \(viewModel?.averagePrice ?? "")"
        label.sizeToFit()
        return label
    }()
    
    func layout() {
        self.addSubview(iconView)
        self.addSubview(nameView)
        let hStack = UIStackView(arrangedSubviews: [symbolView, averagePriceView])
        hStack.axis = .horizontal
        hStack.distribution = .fillProportionally
        hStack.spacing = 8
//        self.addSubview(hStack)
        self.addSubview(symbolView)
        self.addSubview(averagePriceView)
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: iconTop),
            iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: iconLeft),
            
            nameView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            nameView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 44),
            //        nameView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            
            symbolView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            symbolView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 44),
            symbolView.widthAnchor.constraint(equalToConstant: 54),

            averagePriceView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            averagePriceView.leftAnchor.constraint(equalTo: symbolView.rightAnchor, constant: 8),
//            averagePriceView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)
//            hStack.leftAnchor.constraint(equalTo: iconView.rightAnchor),
//            hStack.rightAnchor.constraint(equalTo: self.rightAnchor)
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
