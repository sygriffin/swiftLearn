//
//  MainVC.swift
//  SwiftPureCode
//
//  Created by songyang on 2018/11/28.
//  Copyright © 2018年 songyang. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    var button: UIButton?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.green
        
        self.button = UIButton(frame:CGRect(x: 20, y: 100, width: self.view.frame.width - 40, height: 44))
        button?.setTitle("执行按钮", for:.normal)
        button?.setTitleColor(UIColor.black, for:.normal)
        button?.backgroundColor = UIColor.white
        button?.addTarget(self, action: #selector(MainVC.touchButton), for:.touchUpInside)
        self.view.addSubview(button!)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func touchButton() {
        NSLog("点击了执行按钮")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
