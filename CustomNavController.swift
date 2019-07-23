//
//  CustomNavController.swift
//  sideMenututorial
//
//  Created by Jermal Ebanks on 23/07/2019.
//  Copyright © 2019 Jemarl Ebanks. All rights reserved.
//

import UIKit

class CustomNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // makes the navigation bar transparent. 
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        // removes a black line
        self.navigationBar.shadowImage = UIImage()
    }
    
    
    func setUpBackBarButton() {
        
        let leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    @objc public func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUpHomePageButton() {

        let rightButtonItem = UIBarButtonItem.init(image: UIImage(named: "buttonFly"), style: .done, target: self, action: #selector(homeButtonPressed))

        self.navigationItem.rightBarButtonItem = rightButtonItem
    }

    @objc public func homeButtonPressed() {
      
    }
}
