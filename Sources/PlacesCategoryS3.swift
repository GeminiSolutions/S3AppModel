//
//  PlacesCategoryS3.swift
//  S3AppModel
//
//  Copyright © 2017 Gemini Solutions. All rights reserved.
//

import Foundation
import DataStore

public class PlacesCategoryS3: DataStoreContentJSONDictionary<String,Any> {
    public typealias JSONObjectType = [String:Any]

    public var name: String? {
        get {
            return content["name"] as? String
        }
        set {
            set(newValue, for: "name")
        }
    }

    public var tags: [String]? {
        get {
            return content["tags"] as? [String]
        }
        set {
            set(newValue, for: "tags")
        }
    }

    public var iconUrl: String? {
        get {
            return content["icon-url"] as? String
        }
        set {
            set(newValue, for: "icon-url")
        }
    }

    public var mapPinUrl: String? {
        get {
            return content["map-pin-url"] as? String
        }
        set {
            set(newValue, for: "map-pin-url")
        }
    }

    public var iconGradientColors: [String]? {
        get {
            return content["gradient-icon"] as? [String]
        }
        set {
            set(newValue, for: "gradient-icon")
        }
    }

    public var viewGradientColors: [String]? {
        get {
            return content["gradient-view"] as? [String]
        }
        set {
            set(newValue, for: "gradient-view")
        }
    }

    public var categories: [PlacesCategoryS3]? {
        get {
            guard let categoriesContent = content["categories"] as? [PlacesCategoryS3.JSONObjectType] else { return nil }
            return categoriesContent.map({ return PlacesCategoryS3(content: $0) ?? PlacesCategoryS3() })
        }
        set {
            let categoriesContent: [PlacesCategoryS3.JSONObjectType]? = newValue?.map({ return $0.content })
            set(categoriesContent, for: "categories")
        }
    }

    override public required init() {
        super.init()
    }

    public required init?(content: JSONObjectType) {
        guard PlacesCategoryS3.validate(content) else { return nil }
        super.init(json: content)
    }

    class func validate(_ json: JSONObjectType) -> Bool {
        guard json.keys.contains("name") else { return false }
        guard json.keys.contains("tags") else { return false }
        return true
    }
}
