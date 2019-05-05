//
//  SectionHeaderView.swift
//  CollectionView
//
//  Created by VyacheslavKrivoi on 5/5/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    var categoryTitle: String? {
        didSet {
            categoryTitleLabel.text = categoryTitle
        }
    }
}
