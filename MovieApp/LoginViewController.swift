//
//  LoginViewController.swift
//  MovieApp-master
//
//  Created by miceli on 6/14/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!

    @IBOutlet weak var lbError: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = "Đăng Nhập"
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnDangky(_ sender: Any) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "RegisterController") as? RegisterController else {
            return
        }
        self.navigationController?.pushViewController(controller, animated: true)
    }

    @IBAction func bntLogin(_ sender: Any) {
        if(txtUsername.text != "" && txtPassword.text != ""){
            Auth.auth().signIn(withEmail: txtUsername.text!, password: txtPassword.text!) { (user, error) in
                if error != nil {
                    self.lbError.text = error?.localizedDescription
                }else{
                    guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as? UserViewController else {
                        return
                    }
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }
        }else{
            self.lbError.text = "Điền đầy đủ thông tin!!"
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
