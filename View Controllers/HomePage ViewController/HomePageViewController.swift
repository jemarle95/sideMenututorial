//
//  HomePageViewController.swift
//  sideMenututorial
//
//  Created by Jermal Ebanks on 22/07/2019.
//  Copyright © 2019 Jemarl Ebanks. All rights reserved.
//

import UIKit
import MapKit

class HomePageViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var mapKit: MKMapView!

    var reuseTableViewID = "tableViewCellID"

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Tableview Delegates IMPORTANT!
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120
        tableView.tableFooterView = UIView()
        
       
    }
    
    // Hides navigation Bar from user.
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//
//    // Hides navigation Bar from user.
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//        navigationController?.setNavigationBarHidden(false, animated: false)
//    }
    

}

extension HomePageViewController: UITableViewDelegate { }

extension HomePageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // returns section 1,2,3 etc...
        return "Section \(section)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // make this the count of the amount of added houses/ work places.
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseTableViewID, for: indexPath) as? CustomTableViewCell
        {
            return cell
        }
        return UITableViewCell()
    }
    
}
