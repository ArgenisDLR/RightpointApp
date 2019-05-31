//
//  HomeVC.swift
//  RightpointApp
//
//  Created by argenis delarosa on 5/6/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import UIKit


class FirstTableViewController: UITableViewController {
  
  var users: [User] = []
  
//  var indexRow : Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: - Logout Button 
  
  @IBAction func logoutButton(_ sender: Any) {
    
    self.performSegue(withIdentifier: "goToLogin", sender: self)
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return users.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    let user = users[indexPath.row]
    cell.textLabel!.text = user.firstName
    cell.detailTextLabel?.text = user.lastName
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
//    indexRow = indexPath.row
    
//    let user = users[indexPath.row]

//    performSegue(withIdentifier: "FirstToSecond", sender: user)
    
//    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//      if segue.identifier == "FirstToSecond" {
//
//        if let indexPath = self.tableView.indexPathForSelectedRow {
//
//          let destination = segue.destination as! SecondTableViewController
//
//          //        destination = users[indexPath.row]
//        }
//
//      }
//
//    }
    
  }
  
}

