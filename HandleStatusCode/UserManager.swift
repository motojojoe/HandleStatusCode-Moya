//
//  UserManager.swift
//  HandleStatusCode
//
//  Created by Atthachai Meethong on 8/4/18.
//  Copyright © 2018 Atthachai Meethong. All rights reserved.
//

import Foundation
import RxSwift

class UserManager {
    static let shareInstance = UserManager()
    let logoutIfNeed = PublishSubject<Bool>()
    
    func clearSession() {
        logoutIfNeed.onNext(true)
    }
}
