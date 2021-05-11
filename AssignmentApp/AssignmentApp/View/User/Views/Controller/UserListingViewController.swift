//
//  ViewController.swift
//  AssignmentApp
//
//  Created by Apple on 06/05/21.
//

import UIKit

class UserListingViewController: BaseViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var userListingTblView: UITableView!
    
    //MARK:- ViewModel
    private lazy var userVm: UserViewModel = {
        return UserViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        fetchUserList()
    }
    
    private func setUpView(){
        self.navigationController?.navigationBar.isHidden = true
        userListingTblView.register(UINib(nibName: UserDetailsTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: UserDetailsTableViewCell.reuseIdentifier)
    }
    
    private func fetchUserList() {
        self.showActivityIndicator()
        userVm.fetchUserListRequest { result in
            DispatchQueue.main.async {
                self.hideActivityIndicator()
                switch result {
                case .success(_):
                    self.userListingTblView.reloadData()
                case .failure(let error):
                    self.displayAlert(message: error.localizedDescription)
                }
            }
        }
    }
    
}

//MARK:- UITableViewDataSource , UITableViewDelegate Method
extension UserListingViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userVm.getUserListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailsTableViewCell.reuseIdentifier) as! UserDetailsTableViewCell
        cell.titleLbl.isHidden = true
        cell.favBtn.isSelected
            = userVm.isUserFavourite(index: indexPath.row) ?? false
        cell.descriptionLbl.text = "\(ScreenText.kName.rawValue)\(String(describing: userVm.getName(index: indexPath.row) ?? ""))\n\(ScreenText.kPhone.rawValue)\(String(describing: userVm.getUserPhone(index: indexPath.row) ?? ""))\n\(ScreenText.kWebsite.rawValue)\(String(describing: userVm.getUserWebsite(index: indexPath.row) ?? ""))\n\(ScreenText.kCompanyName.rawValue)\(String(describing: userVm.getCompanyName(index: indexPath.row) ?? ""))"
        cell.descriptionLbl.attributedText =  cell.descriptionLbl.text?.attributedStringWithColor([ScreenText.kName.rawValue,ScreenText.kPhone.rawValue,ScreenText.kWebsite.rawValue,ScreenText.kCompanyName.rawValue], color: .black)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UserDetailsViewController.loadUserDetail() {
            vc.selectedIndex = indexPath.row
            vc.userVm = userVm
            vc.customDelegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension UserListingViewController: CustomUserDetailProtocol {
    func isChangeFavStaus(index: Int) {
        userListingTblView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
    }
}
