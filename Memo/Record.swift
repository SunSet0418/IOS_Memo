//
//  Record.swift
//  Memo
//
//  Created by SungWoon Cho on 2018. 3. 10..
//  Copyright © 2018년 SunSet. All rights reserved.
//

import UIKit

class Record: UIViewController {
    @IBOutlet weak var TextView: UITextView!
    var Memos = [String]()
    var point : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.bool(forKey: "IsTable"))
        Memos = UserDefaults.standard.object(forKey: "data") as? [String] ?? [String]()
        if UserDefaults.standard.bool(forKey: "IsTable") == true {
            point = UserDefaults.standard.integer(forKey: "number")
            TextView.text = Memos[point]
        }
        else {
            TextView.text = ""
        }
        
    }
    
    @IBAction func SaveMemo(_ sender: Any) {
        print(UserDefaults.standard.bool(forKey: "IsTable"))
        if UserDefaults.standard.bool(forKey: "IsTable") == true{
            Memos[point] = TextView.text
        }
        else {
            Memos.append(TextView.text)
        }
        UserDefaults.standard.set(false, forKey:"IsTable")
        UserDefaults.standard.set(Memos, forKey:"data")
        Memos = UserDefaults.standard.object(forKey: "data") as? [String] ?? [String]()
        print(Memos)
        self.performSegue(withIdentifier: "ToMain", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
