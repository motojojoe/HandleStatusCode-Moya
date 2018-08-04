//
//  UserService.swift
//  HandleStatusCode
//
//  Created by Atthachai Meethong on 8/4/18.
//  Copyright © 2018 Atthachai Meethong. All rights reserved.
//

import Foundation
import Moya

enum UserService {
    case profile(id: String)
}

extension UserService: TargetType {
    
    var baseURL: URL {
        return URL(string:"http://localhost:3000")!
    }
    
    var path: String {
        return "users/profile/failure"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "sucess".data(using: .utf8)!
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var validationType: ValidationType {
        return .successAndRedirectCodes
    }
    
}
