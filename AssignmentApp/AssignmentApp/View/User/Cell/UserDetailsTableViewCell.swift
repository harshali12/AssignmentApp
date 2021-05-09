//
//  UserDetailsTableViewCell.swift
//  AssignmentApp
//
//  Created by Apple on 08/05/21.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {
    //MARK:- IBOutlet
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    //MARK:- ReuseIdentifier
    static let reuseIdentifier = "UserDetailsTableViewCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    

}
