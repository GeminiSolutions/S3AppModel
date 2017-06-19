//
//  PlacesMetadataS3.swift
//  S3AppModel
//
//  Copyright © 2017 Gemini Solutions. All rights reserved.
//

import Foundation
import Places

public class PlacesMetadataS3: PlacesMetadata {
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
}
