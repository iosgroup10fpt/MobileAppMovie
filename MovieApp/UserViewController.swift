//
//  UserViewController.swift
//  MovieApp-master
//
//  Created by miceli on 6/4/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import UIKit
import Firebase
class UserViewController: UIViewController {
    //commit
    override func viewDidLoad() {
        super.viewDidLoad()
        userCurrent()
        // Do any additional setup after loading the view.
    }
    @IBAction func updateButton(_ sender: Any) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as? ChangePasswordViewController else {
            return
        }
        self.navigationController?.pushViewController(controller, animated: true)
        
        }
    
    func handleLogout() {
        
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
        func userCurrent(){
            Auth.auth().addStateDidChangeListener { (auth, user) in
                // ...
                if user != nil {
                    //self.lbNameuser.text = user?.displayName
                    self.lbUsername.text = user?.email
                    //self.lbTenfilm.text  = user.idFilm
                    
                    
                }else {
                    // No user is signed in.
                    print("No user is signed in.")
                }
                //print(user?.email)
            }
        }
    @IBOutlet weak var lbNameuser: UILabel!

    @IBOutlet weak var lbUsername: UILabel!

    @IBOutlet weak var lbTenfilm: UILabel!
    @IBOutlet weak var lbnumberTicket: UILabel!
//    let cellId = "cellId"
    @IBOutlet weak var lbLocal: UILabel!
//    
//    var users = [UserInfo]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
//        
//        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
//        
//        //fetchUser()
//        userCurrent()
//    }
//    //var userName
//    func userCurrent(){
//        Auth.auth().addStateDidChangeListener { (auth, user) in
//            // ...
//            if user != nil {
//                
////                Database.database().reference().queryOrdered(byChild: "users" )
////                    .queryEqual(toValue: (user?.email)!)
////                    .observe(.value, with: { snapshot in
////                        if let dictionary = snapshot.value as? [String: AnyObject] {
////                            let user1 = UserInfo(dictionary: dictionary)
////                            self.users.append(user1)
////                        }
////                        print("Log users")
////                        print(self.users)
////                })
//            }else {
//                // No user is signed in.
//                print("No user is signed in.")
//            }
//            //print(user?.email)
//        }
//    }
//    func fetchUser() {
//        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
//            //dư
//            if let dictionary = snapshot.value as? [String: AnyObject] {
//                let user = UserInfo(dictionary: dictionary)
//                self.users.append(user)
//                
//                //this will crash because of background thread, so lets use dispatch_async to fix
//                DispatchQueue.main.async(execute: {
//                    self.tableView.reloadData()
//                })
//            }
//            
//        }, withCancel: nil)
//    }
//    
//    func handleCancel() {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return users.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserCell
//        
//        let user = users[indexPath.row]
//        cell.textLabel?.text = user.name
//        cell.detailTextLabel?.text = user.email
//        
//        //if let profileImageUrl = user.profileImageUrl {
//        //    cell.profileImageView.loadImageUsingCacheWithUrlString(profileImageUrl)
//        //}
//        
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 72
//    }
//    
//}
//class UserCell: UITableViewCell {
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        textLabel?.frame = CGRect(x: 64, y: textLabel!.frame.origin.y - 2, width: textLabel!.frame.width, height: textLabel!.frame.height)
//        
//        detailTextLabel?.frame = CGRect(x: 64, y: detailTextLabel!.frame.origin.y + 2, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
//    }
//    
//    let profileImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.layer.cornerRadius = 24
//        imageView.layer.masksToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        return imageView
//    }()
//    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
//        
//        addSubview(profileImageView)
//        
//        //ios 9 constraint anchors
//        //need x,y,width,height anchors
//        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
//        profileImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        profileImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
//        profileImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//}
}

