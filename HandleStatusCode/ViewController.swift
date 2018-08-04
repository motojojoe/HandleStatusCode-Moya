//
//  ViewController.swift
//  HandleStatusCode
//
//  Created by Atthachai Meethong on 8/4/18.
//  Copyright © 2018 Atthachai Meethong. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // For example : if this view controller is rootViewController
        subscribeLogoutIfNeed()
    }

    @IBAction func sendRequest(_ sender: Any) {
        viewModel.getProfile()
    }

    private func subscribeLogoutIfNeed() {
        UserManager.shareInstance.logoutIfNeed.subscribe { value in
            if let isLogout = value.element, isLogout == true {
                self.showAlert()
            }
            }.disposed(by: disposeBag)
    }
    
    private func showAlert() {
        let alertVC = UIAlertController(title: "Session Expire", message: "Please retry to login agian", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
}

