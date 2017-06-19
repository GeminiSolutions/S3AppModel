//
//  UserS3.swift
//  S3AppModel
//
//  Copyright © 2017 Gemini Solutions. All rights reserved.
//

import Foundation
import Users

public class UserS3: User {
    public var firstName: String? {
        get {
            return content["firstName"] as? String
        }
        set {
            set(newValue, for: "firstName")
        }
    }

    public var lastName: String? {
        get {
            return content["lastName"] as? String
        }
        set {
            set(newValue, for: "lastName")
        }
    }
    
    public var phone: String? {
        get {
            return content["phone"] as? String
        }
        set {
            set(newValue, for: "phone")
        }
    }
    
    override class public func validate(_ json: JSONObjectType) -> Bool {
        guard super.validate(json) else { return false }
        //add validation
        return true
    }

    override class public var Fields: [[String:Any]] {
        return super.Fields +
               [["name":"firstName", "label": "First Name", "type":"String", "required":"false"],
                ["name":"lastName", "label": "Last Name", "type":"String", "required":"false"],
                ["name":"phone", "label": "Phone Number", "type":"String", "required":"false"]]
    }
}
