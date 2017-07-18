//
//  PlaceS3.swift
//  S3AppModel
//
//  Copyright © 2017 Gemini Solutions. All rights reserved.
//

import Foundation
import Places

public class PlaceS3: Place {
    public static let AddressStreetKey = "street"
    public static let AddressCityKey = "city"
    public static let AddressStateKey = "state"
    public static let AddressPostalCodeKey = "postal_code"
    public static let AddressCountryKey = "country"
    
    public var addressDictionary: [String:String]? {
        get {
            return content["address"] as? [String:String]
        }
        set {
            set(newValue, for: "address")
        }
    }

    public var description: String? {
        get {
            return content["description"] as? String
        }
        set {
            set(newValue, for: "description")
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

    public var fax: String? {
        get {
            return content["fax"] as? String
        }
        set {
            set(newValue, for: "fax")
        }
    }

    public var url: String? {
        get {
            return content["url"] as? String
        }
        set {
            set(newValue, for: "url")
        }
    }

    public var email: String? {
        get {
            return content["email"] as? String
        }
        set {
            set(newValue, for: "email")
        }
    }

    public var mediaItems: [String]? {
        get {
            return content["media"] as? [String]
        }
        set {
            set(newValue, for: "media")
        }
    }

    public var formattedAddress: String? {
        var addressComponents = [String]()
        
        if let street = addressDictionary?[PlaceS3.AddressStreetKey] {
            addressComponents.append(street)
        }
        if let city = addressDictionary?[PlaceS3.AddressCityKey] {
            addressComponents.append(city)
        }
        if let postalCode = addressDictionary?[PlaceS3.AddressPostalCodeKey] {
            addressComponents.append(postalCode)
        }
        if let state = addressDictionary?[PlaceS3.AddressStateKey] {
            addressComponents.append(state)
        }
        if let country = addressDictionary?[PlaceS3.AddressCountryKey] {
            addressComponents.append(country)
        }

        return addressComponents.joined(separator: ", ")
    }

    override class public func validate(_ json: JSONObjectType) -> Bool {
        guard super.validate(json) else { return false }
        //add validation
        return true
    }

    override class public var Fields: [[String:Any]] {
        return super.Fields +
               [["name":"address", "label": "Address", "type":"Dictionary<String:String>", "required":"false", "fields" : [
                    ["name": PlaceS3.AddressStreetKey, "label": PlaceS3.AddressStreetKey.capitalized, "type":"String", "required":"false"],
                    ["name": PlaceS3.AddressCityKey, "label": PlaceS3.AddressCityKey.capitalized, "type":"String", "required":"false"],
                    ["name": PlaceS3.AddressStateKey, "label": PlaceS3.AddressStateKey.capitalized, "type":"String", "required":"false"],
                    ["name": PlaceS3.AddressPostalCodeKey, "label": PlaceS3.AddressPostalCodeKey.capitalized, "type":"String", "required":"false"],
                    ["name": PlaceS3.AddressCountryKey, "label": PlaceS3.AddressCountryKey.capitalized, "type":"String", "required":"false"]]],
                ["name":"description", "label": "Description", "type":"String", "required":"false"],
                ["name":"phone", "label": "Phone Number", "type":"String", "required":"false"],
                ["name":"fax", "label": "Fax Number", "type":"String", "required":"false"],
                ["name":"url", "label": "Site", "type":"String", "required":"false"],
                ["name":"email", "label": "Email", "type":"String", "required":"false"],
                ["name":"media", "label": "Media Items", "type":"Array<String>", "required":"false"]]
    }
}
