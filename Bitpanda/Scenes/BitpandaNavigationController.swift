//
//  BitpandaNavigationController.swift
//  Bitpanda
//
//  Created by Christopher Alford on 28/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import UIKit

class BitpandaNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

class BitpandaNavigationBar: UINavigationBar {
    
    var aFrame: CGRect
    var title: String
    var subTitle: String
    
    lazy var navigationView: UIView = {
        let view = UIView(frame: CGRect(x: aFrame.origin.x,
                                        y: aFrame.origin.y,
                                        width: aFrame.size.width,
                                        height: aFrame.size.height - 20))
        view.translatesAutoresizingMaskIntoConstraints = false

        let imageView = UIImageView(image:UIImage(named: "BitpandaNavLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
    
        let topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        topLabel.text = title
        topLabel.sizeToFit()
        
        let bottomLabel = UILabel()
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.font = UIFont.preferredFont(forTextStyle: .body)
        bottomLabel.text = subTitle
        bottomLabel.sizeToFit()
        
        let stack = UIStackView(arrangedSubviews: [imageView, topLabel, bottomLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.sizeToFit()
        view.addSubview(stack)
        view.sizeToFit()
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            stack.leftAnchor.constraint(equalTo: view.leftAnchor),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        return view
    }()
    
    init(frame: CGRect, title: String, subTitle: String) {
        self.aFrame = frame
        self.title = title
        self.subTitle = subTitle
        super.init(frame: frame)
        self.addSubview(navigationView)
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            navigationView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            navigationView.leftAnchor.constraint(equalTo: leftAnchor),
            navigationView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension UINavigationBar {
//    public override func sizeThatFits(_ size: CGSize) -> CGSize {
//        return CGSize(width: frame.width, height: 130)
//    }
//}
