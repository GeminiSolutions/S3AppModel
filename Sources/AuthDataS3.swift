//
//  AuthDataS3.swift
//  S3AppModel
//
//  Copyright © 2017 Gemini Solutions. All rights reserved.
//

import Foundation
import Auth

public class AuthDataS3: AuthData {
    public var username: String? {
        get {
            return credentials?["username"] as? String
        }
        set {
            if credentials == nil {
                credentials = [:]
            }
            credentials!["username"] = newValue
        }
    }

    public var password: String? {
        get {
            return credentials?["password"] as? String
        }
        set {
            if credentials == nil {
                credentials = [:]
            }
            credentials!["password"] = newValue
        }
    }
}
