//
//  TrailerViewController.swift
//  Trailer Flix
//
//  Created by Vinicius Loss on 19/02/23.
//

import UIKit
import AVKit

class TrailerViewController: UIViewController {

    @IBOutlet weak var ivTrailer: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var viTrailer: UIView!
    
    var trailer: Trailer!
    var player: AVPlayer!
    var playerController: AVPlayerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
        preparePlayer()
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
        }
        catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
    
    func prepareView(){
        lbTitle.text = trailer.title
        lbYear.text = "\(trailer.year)"
        var rating = "Ainda não avaliado"
        
        if(trailer.rating > 0){
            rating = ""
            for _ in 1...trailer.rating {
                rating += "⭐️"
            }
        }

        lbRating.text = rating
        ivTrailer.image = UIImage(named: trailer.poster + "-large")
    }
    
    func preparePlayer(){
        let url = URL(fileURLWithPath: trailer.url)
        player = AVPlayer(url: url)
        player.volume = 1
        playerController = AVPlayerViewController()
        playerController.player = player
        playerController.showsPlaybackControls = true
        playerController.player?.play()
        playerController.view.frame = viTrailer.bounds // view interna
        viTrailer.addSubview(playerController.view)
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
