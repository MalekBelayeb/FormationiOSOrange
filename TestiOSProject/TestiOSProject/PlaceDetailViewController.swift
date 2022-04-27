//
//  PlaceDetailViewController.swift
//  TestiOSProject
//
//  Created by ODC on 26/4/2022.
//

import UIKit

class PlaceDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    var placeModel:PlaceModel?
    
    @IBAction func showMoreDidTapped(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let placeModel = placeModel {
            self.titleLabel.text = placeModel.name
            self.categoryLabel.text = placeModel.kinds
        
        }
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
