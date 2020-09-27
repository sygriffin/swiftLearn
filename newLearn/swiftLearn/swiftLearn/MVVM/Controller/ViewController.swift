//
//  ViewController.swift
//  swiftLearn
//
//  Created by sy on 2020/9/25.
//  Copyright © 2020 sy. All rights reserved.
//

/**  rxSwift开始
 *   暂时全部放在Controller
 */

import UIKit

private let minimalUsernameLength = 5
private let minimalPasswordLength = 5

class ViewController: BaseViewController {

    @IBOutlet weak var usernameOutlet: UITextField!
    
    @IBOutlet weak var usernameValidOutlet: UILabel!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBOutlet weak var passwordValidOutlet: UILabel!
    
    @IBOutlet weak var doSomethingOutlet: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Observable - 产生事件
        // Observer - 响应事件
        // Operator - 创建变化组合事件
        // Disposable - 管理绑定（订阅）的生命周期
        // Schedulers - 线程队列调配 => 都有哪些 是干什么的
        

        // 拆解查看
        /**
        // Observable -> text
        let text = usernameOutlet.rx.text.orEmpty.asObservable()
        // Operator => Observable -> bool
        let passValid = text.map { $0.count >= 5 }
        // Observer
        let observer = usernameValidOutlet.rx.isHidden
        // Disposable and Schedulers
        let disposable = passValid
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .bind(to: observer)
        //退出页面时 移除
        disposable.dispose()
        */
        
        
        
        usernameValidOutlet.text = "Username has to be at least \(minimalUsernameLength) characters"
        passwordValidOutlet.text = "Password has to be at least \(minimalPasswordLength) characters"

        let usernameValid = usernameOutlet.rx.text.orEmpty
            .map { value in return value.count >= minimalUsernameLength }
            .share(replay: 1)
        usernameValid.bind(to: usernameValidOutlet.rx.isHidden).disposed(by: disposeBag)
        
        let passwordValid = passwordOutlet.rx.text.orEmpty
            .map { $0.count >= minimalPasswordLength }
            .share(replay: 1)

        let everythingValid = Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .share(replay: 1)

        usernameValid
            .bind(to: passwordOutlet.rx.isEnabled)
            .disposed(by: disposeBag)

        usernameValid
            .bind(to: usernameValidOutlet.rx.isHidden)
            .disposed(by: disposeBag)

        passwordValid
            .bind(to: passwordValidOutlet.rx.isHidden)
            .disposed(by: disposeBag)

        everythingValid
            .bind(to: doSomethingOutlet.rx.isEnabled)
            .disposed(by: disposeBag)

        doSomethingOutlet.rx.tap
            .subscribe(onNext: { [weak self] _ in self?.nextVC() })
            .disposed(by: disposeBag)
        }

    func nextVC() {
        let vc = ViewControllerOne()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}

