//
//  RetrierHandler.swift
//  HandleStatusCode
//
//  Created by Atthachai Meethong on 8/4/18.
//  Copyright © 2018 Atthachai Meethong. All rights reserved.
//

import Foundation
import Alamofire

class RetrierHandler: RequestRetrier {
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        if let response = request.task?.response as? HTTPURLResponse {
            if response.statusCode == 401 {
                // TODO: handle unauthorized
            }
        }
        completion(false, 0.0)
    }
}
