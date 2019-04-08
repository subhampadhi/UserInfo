//
//  UsersVC.swift
//  UserInfo
//
//  Created by Subham Padhi on 08/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class UsersVC: UITableViewController {
    
    let url = "https://raw.githubusercontent.com/iranjith4/radius-intern-mobile/master/users.json"
    var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profiles"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UsersCell.self, forCellReuseIdentifier: "usersCell")
        getData(url: url)
    }
    
    func getData(url:String) {
        guard let url = URL(string:url) else {return}
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            if let error = error {
                Utils.showAlert(title: "Oops", message: "\(error.localizedDescription)", presenter: self)
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let value = try decoder.decode(UserResponse?.self, from: data)
                self.results = (value?.results)!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let err {
                Utils.showAlert(title: "Oops", message: "\(err.localizedDescription)", presenter: self)
            }
            }.resume()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(results.count)
        return (results.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell") as! UsersCell
        
        let user = results[indexPath.row]
        
        let firstName = ((user.name?.first!)!).capitalizingFirstLetter()
        let lastName = ((user.name?.last!)!).capitalizingFirstLetter()
        cell.profileNameLabel.text = firstName + " " + lastName
        
        let imageUrl = URL(string: (user.picture?.large!)!)
        cell.profileImage.kf.setImage(with: imageUrl)
        
        let age = user.dob?.age
        let gender = user.gender
        cell.profileAge.text = "\(age!), \(gender!)"
        return cell
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
