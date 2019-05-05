//
//  DetailViewController.swift
//  CollectionView
//
//  Created by VyacheslavKrivoi on 5/3/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var image = UIImage()
    var name = ""
    var desc = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgImage.image = image
        lblName.text = name
        lblDescription.text = desc
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
