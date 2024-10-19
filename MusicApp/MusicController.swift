import UIKit
import AVFoundation
import SnapKit


struct Music {
    let url: URL
    let title: String
    let duration: Double
}


class MusicController: UIViewController {
    
    lazy var slider: UISlider = {
        let view = UISlider()
        let initialValue: Float = 8.0
        view.minimumValue = 0.0
        view.maximumValue = 10.0
        view.value = initialValue
        view.tintColor = .orange

        return view
        
    }()
    

    
    lazy  var playBtn: UIButton = {
        let play = UIButton()
        
        play.snp.makeConstraints { make in
            make.height.width.equalTo(50)
            
        }
        
        play.setImage(UIImage (systemName: "play"), for: .normal)
        
        play.addTarget(self, action: #selector(selectTrack), for: .touchUpInside)
        
        return play
    }()
    
    
    
    lazy var singerName: UILabel = {
        let sngr = UILabel()
        sngr.text = "No Singer"
        return sngr
    }()
    
    lazy var trackName: UILabel = {
        let track = UILabel()
        track.text = "No Song"
        return track
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.9, green: 0.0, blue: 0.0, alpha: 1.0)
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @objc
    
    func selectTrack() {
        
        if isPlaying {
            stopMusic()
        } else {
            
            if player.currentItem != nil {
                unPauseMusic()
            } else {
                
                playMusic()
            }
            
        }
        
        isPlaying = !isPlaying
        
    }
    
    func setupUI() {
        let stack = UIStackView(arrangedSubviews: [slider, playBtn, singerName, trackName])
        
        stack.axis = .vertical
        
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
        
            make.width.equalTo(200)
            make.center.equalTo(self.view)
        }
        
        
    }
    
    let player = AVPlayer()
    
    var isPlaying = false
    
    func playMusic() {
        
        let playerItem = AVPlayerItem(url: URL(string: "https://cdn.pixabay.com/audio/2024/10/01/audio_d9e2d28b63.mp3")!)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        player.addPeriodicTimeObserver(forInterval: CMTime(value: 10, timescale: 10), queue: .main) { [self]
            cmTime in
            self.slider.value = Float(cmTime.seconds)
        }
        singerName.text = "New Artist"
        trackName.text = "New Song"
        
    }
    func stopMusic() {
        player.pause()
       // player.replaceCurrentItem(with: nil)
    }
    
    func unPauseMusic() {
        player.play()
            
    }

}

