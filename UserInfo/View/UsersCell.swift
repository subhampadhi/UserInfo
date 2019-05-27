//
//  UsersCell.swift
//  UserInfo
//
//  Created by Subham Padhi on 08/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class UsersCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        initViews()
    }
    
    var profileNameLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-BoldItalic", size: 20)
        label.textColor = #colorLiteral(red: 0.4078431373, green: 0.1176470588, blue: 0.4392156863, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    var profileImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = UIView.ContentMode.scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var profileAge: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IBMPlexSans-Medium", size: 14)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    func initViews() {
        
        let marginGuide = contentView.layoutMarginsGuide
        
        contentView.addSubview(profileImage)
        contentView.addSubview(profileNameLabel)
        contentView.addSubview(profileAge)
        
       
        profileImage.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 15).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        profileImage.layer.cornerRadius = 40
        
        profileNameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 25).isActive = true
        profileNameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -15).isActive = true
        profileNameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor , constant: 10).isActive = true
        
        profileAge.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 25).isActive = true
        profileAge.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -15).isActive = true
        profileAge.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 15).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

