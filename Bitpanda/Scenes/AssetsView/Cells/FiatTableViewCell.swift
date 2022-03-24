//
//  FiatTableViewCell.swift
//  Bitpanda
//
//  Created by Christopher Alford on 23/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import UIKit

/*
 - Each list item must contain the fiat's icon, name, symbol .
 */

class FiatTableViewCell: UITableViewCell {
    
    var viewModel: FiatView?
    
    let iconTop = 4.0
    let iconLeft = 0.0
    let iconWidth = 32.0
    let iconHeight = 32.0
    
    private lazy var iconView: UIView = {
        let view = UIView(frame: .zero)
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
    
    func layout() {
        self.addSubview(iconView)
        self.addSubview(nameView)
        self.addSubview(symbolView)
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: iconTop),
            iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: iconLeft),
            
            nameView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            nameView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 44),
            
            symbolView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            symbolView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 44),
            symbolView.widthAnchor.constraint(equalToConstant: 54)
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
