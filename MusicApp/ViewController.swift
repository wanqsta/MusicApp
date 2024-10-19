import UIKit
import AVFoundation
import SnapKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   // это начало методов UITableViewDataSource
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = musicList[indexPath.row].title
        
        return cell
    }
    
    // это конец метода UITableViewDataSource
    
    // это начало UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        _ = musicList[row]
        
        let musicController = MusicController()
        present(musicController, animated: true)
        
        //let player = AVPlayer(url: music.url)
        //let playerViewController = PlayerViewController(player: player)
        //present(playerViewController, animated: true)
    }
    
    
    
    // это конец
    
    let musicList: [Music] = [
        .init(url: URL(string: "https://cdn.pixabay.com/audio/2024/10/01/audio_d9e2d28b63.mp3")!, title: "Artist", duration: 30),
        .init(url: URL(string: "https://cdn.pixabay.com/audio/2024/10/01/audio_d9e2d28b63.mp3")!, title: "Artist2", duration: 30),
        .init(url: URL(string: "https://cdn.pixabay.com/audio/2023/02/16/audio_1b7d87b603.mp3")!, title: "Artist3", duration: 30)
        ]
    
    override func viewDidLoad() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        tableView.reloadData()
        
    }
    
    lazy var tableView: UITableView = {
        let lableView = UITableView()
        lableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        lableView.dataSource = self
        lableView.delegate = self
        return lableView
    }()
}
