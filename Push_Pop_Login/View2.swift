//
//  View2.swift
//  Push_Pop_Login
//
//  Created by Nguyen Cong Toan on 3/21/17.
//  Copyright © 2017 mr.t. All rights reserved.
//

import UIKit

class View2: UIViewController {

    var ranDom_Pos = 0
    var time = 0
    var dung = 0
    var sai = 0
    var timer = Timer()
    @IBOutlet weak var lb_number1: UILabel!
    @IBOutlet weak var lb_number2: UILabel!
    @IBOutlet weak var lb_t: UILabel!
    @IBOutlet weak var lb_f: UILabel!
    @IBOutlet weak var btn_kq1: UIButton!
    @IBOutlet weak var btn_kq2: UIButton!
    @IBOutlet weak var btn_kq3: UIButton!
    @IBOutlet weak var lb_time: UILabel!
    
    
    
    
    @IBAction func btn_action1(_ sender: UIButton) {
        action(ranDom_Pos1: 1)
    }
    @IBAction func btn_action2(_ sender: UIButton) {
        action(ranDom_Pos1: 2)
    }
    @IBAction func btn_action3(_ sender: UIButton) {
        action(ranDom_Pos1: 3)
    }
    @IBAction func btn_Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRandom()
        Start()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(View2.dem_time), userInfo: nil, repeats: true)

    }
    
    
    func Start()
    {
        time  = 60
    }
    
    func dem_time()
    {
        time -= 1
        lb_time.text = String(time)
        if time == 0
        {
            choilai()
        }
        
    }
    
    func action(ranDom_Pos1: Int)
    {
        if ranDom_Pos == ranDom_Pos1
        {
            dung += 1
        }
        else {
                dung -= 1
                if dung < 0 || sai < 0
                {
                    choilai()
                }
                sai += 1
            }
        Check_T_F()
        setRandom()
        }
    
    
    func Check_T_F()
    {
        lb_t.text = String(format: "%d", dung)
        lb_f.text = String(format: "%d", sai)
    }
    
    func choilai()
    {
        time = 60
        dung = 0
        lb_t.text = String(dung)
        sai = 0
        lb_f.text = String(sai)
        setRandom()
    }
    
    
    func setRandom()
    {
        let random1 = Int(arc4random_uniform(9)) + 1
        let random2 = Int(arc4random_uniform(9)) + 1
        lb_number1.text = String(random1)
        lb_number2.text = String(random2)
        setResult(ranDomA: random1, ranDomB: random2)
    }
    func setResult(ranDomA: Int, ranDomB: Int)
    {
        ranDom_Pos = Int(arc4random_uniform(3)) + 1
        if ranDom_Pos == 1
        {
            btn_kq1.setTitle(String(sum(p1: ranDomA, p2: ranDomB)), for: UIControlState.normal)
            btn_kq2.setTitle(String(ranDomA), for: UIControlState.normal)
            btn_kq3.setTitle(String(ranDomB), for: UIControlState.normal)
        }
        else if ranDom_Pos == 2
        {
            btn_kq1.setTitle(String(ranDomA), for: UIControlState.normal)
            btn_kq2.setTitle(String(sum(p1: ranDomA, p2: ranDomB)), for: UIControlState.normal)
            btn_kq3.setTitle(String(ranDomB), for: UIControlState.normal)
        }
        else
        {
            btn_kq1.setTitle(String(ranDomB), for: UIControlState.normal)
            btn_kq2.setTitle(String(ranDomA), for: UIControlState.normal)
            btn_kq3.setTitle(String(sum(p1: ranDomA, p2: ranDomB)), for: UIControlState.normal)
        }
    }
    func sum(p1: Int, p2: Int) -> Int
    {
        return p1 + p2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
