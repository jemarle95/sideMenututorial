//
//  AboutPageViewController.swift
//  sideMenututorial
//
//  Created by Jermal Ebanks on 23/07/2019.
//  Copyright © 2019 Jemarl Ebanks. All rights reserved.
//

import UIKit

class AboutPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpBackBarButton()
        
        navigationItem.title = "About"
        
    }
    
    func setUpBackBarButton() {
        
        let leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "back"), style: .done, target: self, action: #selector(backButtonTapped))
        
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc public func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
