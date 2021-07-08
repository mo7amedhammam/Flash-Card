//
//  splashScreenVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 17/05/2021.
//

import UIKit
import AVKit
import AVFoundation

class splashScreenVC: UIViewController {
    var player: AVPlayer?
    var timer: Timer?
    var second = 0
    var logedIn = 1

    //
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()
        videoTimer()
        
    }
    func videoTimer () {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.updateTimer()
        })
    }
    @objc func updateTimer() {
        if second == 5 {
            // go to login or home
            skipView()
            timer?.invalidate()
        }
        second += 1
    }
    
    private func loadVideo() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        } catch { }
        
        let path = Bundle.main.path(forResource: "bluelogo", ofType:"mp4")
        
        player = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
        let videoPlayer = AVPlayerLayer(player: player)
        
        videoPlayer.frame = self.view.frame
        videoPlayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPlayer.zPosition = -1
        self.view.layer.addSublayer(videoPlayer)
        player!.seek(to: CMTime.zero)
        player!.play()
        
    }
    func skipView()  {
        if Shared.shared.logedin == 0{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Login") as! Login
            vc.modalPresentationStyle = .fullScreen
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeTabBar") as! HomeTabBar
            vc.modalPresentationStyle = .fullScreen
            ////                    self.present(vc, animated: true, completion: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


