//
//  DataClass.swift
//  CollectionView
//
//  Created by VyacheslavKrivoi on 5/3/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

class Model {
    var name: String
    var image: UIImage
    var description: String
    var categoryID: Int
    var categoryName: String
    
    init(name: String, image: UIImage, categoryID: Int, description: String, categoryName: String) {
        self.name = name
        self.image = image
        self.categoryID = categoryID
        self.description = description
        self.categoryName = categoryName
    }
}
