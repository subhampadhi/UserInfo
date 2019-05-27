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

class UsersVC: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    let url = "https://raw.githubusercontent.com/iranjith4/radius-intern-mobile/master/users.json"
    var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profiles"
        setUpViews()
    //    table.rowHeight = UITableView.automaticDimension
        navigationController?.navigationBar.prefersLargeTitles = true
        table.register(UsersCell.self, forCellReuseIdentifier: "usersCell")
        getData(url: url)
    }
    
    var table: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func setUpViews() {
        table.dataSource = self
        table.delegate = self
        view.addSubview(table)
        
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
                    self.table.reloadData()
                }
            } catch let err {
                Utils.showAlert(title: "Oops", message: "\(err.localizedDescription)", presenter: self)
            }
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(results.count)
        return (results.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell") as! UsersCell
        
        let user = results[indexPath.row]
        
        let firstName = ((user.name?.first!)!).capitalizingFirstLetter()
        let lastName = ((user.name?.last!)!).capitalizingFirstLetter()
        //   cell.profileNameLabel.text = firstName + " " + lastName
        if indexPath.row % 2 == 0 {
            cell.profileNameLabel.text = "dfksjf fkdjgndfklg fkglnfdgflkdg gfkldngdf fglknfdg fld ergknlv fc"
            
        }else {
            cell.profileNameLabel.text = "Hello world"
            
        }
        
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
