//
//  TrailerViewController.swift
//  Trailer Flix
//
//  Created by Vinicius Loss on 19/02/23.
//

import UIKit

class TrailerViewController: UIViewController {

    @IBOutlet weak var ivTrailer: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var viTrailer: UIView!
    
    var trailer: Trailer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lbTitle.text = trailer.title
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
