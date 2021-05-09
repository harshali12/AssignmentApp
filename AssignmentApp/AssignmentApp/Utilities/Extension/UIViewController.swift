//
//  UIViewController.swift
//  AssignmentApp
//
//  Created by Apple on 08/05/21.
//

import Foundation
import UIKit

class BaseViewController : UIViewController {
    
    private let activityView = UIActivityIndicatorView(style: .large)
    
    static func loadView(identifier: String) -> UIViewController? {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier) 
    }
    
    func displayAlert(message: String) {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            self.dismiss(animated: true, completion: nil)
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func showActivityIndicator() {
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityView.stopAnimating()
    }
    
}
