//
//  UserDetailsViewController.swift
//  AssignmentApp
//
//  Created by Apple on 07/05/21.
//

import UIKit

protocol CustomUserDetailProtocol: AnyObject {
    func isChangeFavStaus(index: Int)
}

class UserDetailsViewController: BaseViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var userDetailsTblView: UITableView!
    @IBOutlet weak var favouirateBtn: UIButton!
    @IBOutlet weak var userNameLbl: UILabel!
    
    //MARK:- ViewModel
    var userVm: UserViewModel?
    var selectedIndex = 0
    var favBtnStatusChanged = false
    
    //Custom delegate
    weak var customDelegate : CustomUserDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setUpView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if favBtnStatusChanged {
            customDelegate?.isChangeFavStaus(index: selectedIndex)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    static func loadUserDetail() -> UserDetailsViewController? {
        return self.loadView(identifier: ScreenName.kUserDetailsVC.rawValue) as? UserDetailsViewController
    }
    
    private func setUpView() {
        self.navigationController?.navigationBar.isHidden = false
        userDetailsTblView.tableFooterView = UIView()
        userNameLbl.text = userVm?.getUserName(index: selectedIndex)
        userDetailsTblView.register(UINib(nibName: UserDetailsTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: UserDetailsTableViewCell.reuseIdentifier)
        favouirateBtn.isSelected = userVm?.isUserFavourite(index: selectedIndex) ?? false
    }
    
    @IBAction func clickOnFavouirateBtn(_ sender: UIButton) {
        favBtnStatusChanged = true
        sender.isSelected = !sender.isSelected
        userVm?.setIsUserFavourite(index: selectedIndex, flag: sender.isSelected)
    }
}


//MARK:- UITableViewDataSource , UITableViewDelegate Method
extension UserDetailsViewController : UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return userVm?.getUserSectionCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailsTableViewCell.reuseIdentifier, for: indexPath) as! UserDetailsTableViewCell
        guard let vm = userVm else {
            return cell
        }
        cell.titleLbl.text = vm.getUserSectionTitle(index: indexPath.section)
        cell.favBtn.isHidden = true
        switch indexPath.section {
        case 0:
            cell.descriptionLbl.text = vm.getName(index: selectedIndex)
        case 1:
            cell.descriptionLbl.text = "\(ScreenText.kStreet.rawValue)\(String(describing: vm.getUserStreet(index: selectedIndex) ?? ""))\n\(ScreenText.kSuite.rawValue)\(String(describing: vm.getUserSuite(index: selectedIndex) ?? ""))\n\(ScreenText.kCity.rawValue)\(vm.getUserCity(index: selectedIndex) ?? "")\n\(ScreenText.kZipcode.rawValue)\(String(describing: vm.getUserZipcode(index: selectedIndex) ?? ""))\n\(ScreenText.kLat.rawValue)\(String(describing: vm.getUserlat(index: selectedIndex) ?? ""))\n\(ScreenText.kLng.rawValue)\(String(describing: vm.getUserlng(index: selectedIndex) ?? "" ))"
        case 2:
            cell.descriptionLbl.text = "\(ScreenText.kName.rawValue)\(String(describing: vm.getCompanyName(index: selectedIndex) ?? ""))\n\(ScreenText.kPharse.rawValue)\(String(describing: vm.getCompanyCatchPhrase(index: selectedIndex) ?? ""))\n\(ScreenText.kBs.rawValue)\(String(describing: vm.getCompanyBs(index: selectedIndex) ?? ""))"
        case 3:
            cell.descriptionLbl.text = vm.getUserPhone(index: selectedIndex)
        default:
            cell.descriptionLbl.text = vm.getUserWebsite(index: selectedIndex)
        }
        return cell
    }
}
