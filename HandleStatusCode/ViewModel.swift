//
//  ViewModel.swift
//  HandleStatusCode
//
//  Created by Atthachai Meethong on 8/4/18.
//  Copyright © 2018 Atthachai Meethong. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class ViewModel {
    
    let disposeBag = DisposeBag()
    
    lazy var provider: MoyaProvider<UserService> = {
        let provider = MoyaProvider<UserService>()
        provider.manager.retrier = RetrierHandler()
        return provider
    }()
    
    func getProfile() {
        provider.request(.profile(id: "1234")) { result in
            switch result {
            case .success(let value):
                print(value.data)
            case .failure(let error):
                if let response = error.response {
                    print("error status code : " + String(response.statusCode))
                    // TODO: handle the error
                }
            }
        }
    }
    
    func getProfileRX() {
        provider.rx.request(.profile(id: "1234"))
            .subscribe(onSuccess: { reponse in
                print(String(data: reponse.data, encoding: String.Encoding.utf8)!)
            }, onError: { error in
                let moyaError = error as! MoyaError
                if let response = moyaError.response {
                    print("error status code : " + String(response.statusCode))
                }
            }).disposed(by: disposeBag)
    }
}
