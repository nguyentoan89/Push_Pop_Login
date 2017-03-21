//
//  ViewController.swift
//  Push_Pop_Login
//
//  Created by Nguyen Cong Toan on 3/21/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var lb_Name: UILabel!
    @IBOutlet weak var lb_Text: UILabel!
    @IBOutlet weak var lb_Notifi: UILabel!
    
    @IBOutlet weak var tf_User: UITextField!
    @IBOutlet weak var tf_Pass: UITextField!
    @IBOutlet weak var btn_login1: UIButton!
    
    var users = ["congtoan":"congtoan9","hahuyen":"iloveyou"]
    
    @IBAction func btn_Login(_ sender: Any) {
        if users[tf_User.text!] != tf_User.text
        {
            lb_Notifi.text = "User not right"
            lb_Notifi.isHidden = false
        }
        login()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Logo!.alpha = 0
        lb_Text!.alpha = 0
        lb_Name!.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 4, animations: {self.Logo!.alpha = 1})
        {
            (finished) in
            UIView.animate(withDuration: 1, animations: {
                self.lb_Text!.center = CGPoint(x: self.Logo!.center.x, y: 100)
                self.lb_Text!.alpha = 1
            })
            UIView.animate(withDuration: 5, animations: {
                self.lb_Name!.center = CGPoint(x: self.Logo!.center.x, y: 700)
                self.lb_Name!.alpha = 1
            })
        }
    }
    
    func login()
    {
        if let password = users[tf_User.text!]
        {
            if password == tf_Pass.text            {
                let v2 = self.storyboard?.instantiateViewController(withIdentifier: "V2") as! View2
                self.navigationController?.pushViewController(v2, animated: true)
               lb_Notifi.isHidden = true
                xoa()
            }
            else
            {
                print("Password not right")
                lb_Notifi.isHidden = false
                lb_Notifi.text = "Password not right"
                xoa()
            }
        }
    }

    func xoa()
    {
        tf_Pass.text = nil
        tf_User.text = nil
    }
}

