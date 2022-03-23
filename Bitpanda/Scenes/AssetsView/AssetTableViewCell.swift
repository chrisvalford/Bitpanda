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
    let iconLeft = 8.0
    let iconWidth = 24.0
    let iconHeight = 24.0
    
    private lazy var iconView: UIView = {
        let view = UIView(frame: CGRect(x: iconTop, y: iconLeft, width: iconWidth, height: iconHeight))
        guard let path = self.traitCollection.userInterfaceStyle == .dark ? viewModel?.iconDark : viewModel?.iconLight else {
            print("Invalid url")
            return UIView()
        }
        guard let svg = SVGImage(frame: CGRect(x: iconTop, y: iconLeft, width: iconWidth, height: iconHeight), url: path) else {
            print("Invalid SVG")
            return UIView()
        }
        view.addSubview(svg)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel?.name
        return label
    }()
    
    lazy var symbolView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel?.symbol
        return label
    }()
    
    lazy var averagePriceView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = viewModel?.averagePrice
        return label
    }()
    
    lazy var rightStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameView, averagePriceView])
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fillEqually
        stack.backgroundColor = .orange
        return stack
    }()
    
    lazy var outerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconView, rightStack])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillProportionally
        return stack
    }()
    
    func layout() {
        self.addSubview(outerStack)
//        outerStack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        outerStack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        outerStack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        outerStack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
//        iconView.topAnchor.constraint(equalTo: outerStack.topAnchor, constant: iconTop).isActive = true
//        iconView.leftAnchor.constraint(equalTo: outerStack.leftAnchor, constant: iconLeft).isActive = true
//        iconView.widthAnchor.constraint(equalToConstant: iconWidth).isActive = true
//        iconView.heightAnchor.constraint(equalToConstant: iconHeight).isActive = true
//
//        nameView.topAnchor.constraint(equalTo: rightStack.topAnchor, constant: 8).isActive = true
//        nameView.leftAnchor.constraint(equalTo: rightStack.leftAnchor).isActive = true
//        nameView.rightAnchor.constraint(equalTo: rightStack.rightAnchor).isActive = true
//        nameView.bottomAnchor.constraint(equalTo: rightStack.bottomAnchor).isActive = true
    }
    
    private func addContsraints() {
        
//

//
//        symbolView.topAnchor.constraint(equalTo: assetSelector.bottomAnchor, constant: 8).isActive = true
//        symbolView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
//        symbolView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
//        symbolView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//
//        averagePriceView.topAnchor.constraint(equalTo: assetSelector.bottomAnchor, constant: 8).isActive = true
//        averagePriceView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
//        averagePriceView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
//        averagePriceView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
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
