//
//  NamesVC.swift
//  RightpointApp
//
//  Created by argenis delarosa on 5/6/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import UIKit

class SecondTableViewController: UITableViewController {
  
  var users: [User] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  // MARK: - Logout Button
  
  @IBAction func logoutButton(_ sender: Any) {
    
    self.performSegue(withIdentifier: "goToLogin", sender: self)
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    cell.textLabel?.text = "Last Users"
    
    return cell
  }
  
}
