//
//  ChangePasswordViewController.swift
//  MovieApp-master
//
//  Created by Cntt20 on 6/7/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import UIKit
import Firebase


class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var passOld: UITextField!
    @IBOutlet weak var replacePassNew: UITextField!

    @IBOutlet weak var passNew: UITextField!
    @IBOutlet weak var lberror: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lberror.isHidden = true
        userCurrent()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func userCurrent(){
        Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
            if user != nil {
                self.userName.text = user?.email
            }else {
                // No user is signed in.
                print("No user is signed in.")
            }
            //print(user?.email)
        }
    }

    @IBAction func submit(_ sender: Any) {
        if(passNew.text == "" || passOld.text == "" || replacePassNew.text == ""){
            lberror.isHidden = false
            lberror.text = "Please enter input"
        }
        else{
            lberror.isHidden = true
            Auth.auth().currentUser?.updatePassword(to: passNew.text!) { (error) in
                if(error != nil){
                    self.lberror.isHidden = false
                    self.lberror.text = "Password is wrong"
                }else{
                    self.lberror.isHidden = false
                    self.lberror.text = "Susscess"
                    self.passOld.text=""
                    self.passNew.text=""
                    self.replacePassNew.text=""
                }
                //                        // [START_EXCLUDE]
                //                        self.hideSpinner {
                //                            self.showTypicalUIForUserUpdateResults(withTitle: self.kChangePasswordText, error: error)
                //                        }
                //                        // [END_EXCLUDE]
                //                    }
                //                    // [END change_password]
                //                }

        }
        
    }
    }

}
