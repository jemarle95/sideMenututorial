//
//  MenuViewController.swift
//  sideMenututorial
//
//  Created by Jermal Ebanks on 22/07/2019.
//  Copyright © 2019 Jemarl Ebanks. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    
    var profileReuseID = "profileID"
    var supportReuseID = "supportID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // shows navigation Bar from user allowing them to go back
        self.navigationController?.isNavigationBarHidden = false
        
        tableView.dataSource = self
        tableView.delegate = self

    }

}

extension MenuViewController: UITableViewDelegate { }

extension MenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // show sections with the amount of items in array
       return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // --------- NEED To Fix ----------------
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: profileReuseID, for: indexPath) as? CustomTableViewMenuCell
        
        cell?.textLabel?.text = "Profile"
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if indexPath.row == 0 {
            performSegue(withIdentifier: "toProfile", sender: indexPath.row)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "toSupport", sender: indexPath.row)
        }
        
//        override func prepareForSegue(segue:UIStoryboardSegue, sender: AnyObject?) {
//
//        }
    }
    
}
