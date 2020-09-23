//
//  AlertVC.swift
//  HelloSwift
//
//  Created by songyang on 2018/12/3.
//  Copyright © 2018年 songyang. All rights reserved.
//

import UIKit

class AlertVC: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlertAction(_ sender: Any) {
        
        let alertView = UIAlertController(title: "Attention!", message: "是否跳转下一页", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { action in
            NSLog("确定")
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .destructive) { action in
            NSLog("取消")
        }
        //展示按钮与顺序有关
        alertView.addAction(cancelAction)
        alertView.addAction(okAction)
        
        
        self.present(alertView, animated: true, completion: nil)
    }

    
    
    @IBAction func showActionSheet(_ sender: Any) {
        
        let acctionSheet = UIAlertController(title: "是否跳转下一页", message: nil, preferredStyle:.actionSheet)
        
        let okAction = UIAlertAction(title: "ok", style: .default) { action in
            NSLog("确定")
        }
        
        let cancelAction = UIAlertAction(title: "cancel", style: .destructive) { action in
            NSLog("取消")
        }
        
        acctionSheet.addAction(okAction)
        acctionSheet.addAction(cancelAction)
        
        self.present(acctionSheet, animated: true, completion: nil)
        
        
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
