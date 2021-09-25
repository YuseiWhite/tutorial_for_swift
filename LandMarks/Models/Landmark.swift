//
//  Landmank.swift
//  LandMarks
//
//  Created by 田中優成 on 2021/09/22.
//
import UIKit
import SwiftUI
import CoreLocation
 
struct Landmark: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
        }
    
    enum Category: String, CaseIterable, Hashable, Codable{
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}
 
struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}
