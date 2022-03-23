//
//  AssetsViewController.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/03/2022.
//  Copyright (c) 2022 anapp4that. All rights reserved.
//

import UIKit

class AssetsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIView!
    
    private let viewModel = AssetsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        var path: String
        if self.traitCollection.userInterfaceStyle == .dark {
            path = "https://bitpanda-assets.s3-eu-west-1.amazonaws.com/static/cryptocoin/xpt_dark.svg"
        } else {
            path = "https://bitpanda-assets.s3-eu-west-1.amazonaws.com/static/cryptocoin/xpt.svg"
        }
        guard let svg = SVGImage(frame: CGRect(x: 0, y: 0, width: 44, height: 44), path: path) else {
            print("Invalid url")
            return
        }
        imageView.addSubview(svg)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

