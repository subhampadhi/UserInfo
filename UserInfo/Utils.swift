//
//  Utils.swift
//  UserInfo
//
//  Created by Subham Padhi on 09/04/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit
class Utils {
    
    static func showAlert(title: String, message: String, presenter: UIViewController) {
        let alert = UIAlertController(title: "\(title)", message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        presenter.present(alert, animated: true, completion: nil)
    }
}
