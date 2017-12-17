//
//  ViewController.swift
//  Hustle-Mode
//
//  Created by YuLiangze on 12/17/17.
//  Copyright © 2017 YuLiangze. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBG: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var BlueSky: UIImageView!
    @IBOutlet weak var rocket: UIImageView!
    
    @IBOutlet weak var cloud: UIImageView!
    @IBOutlet weak var holderCloud: UIView!
    
    @IBOutlet weak var On: UITextField!
    @IBOutlet weak var hustle: UITextField!
    
    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType:"wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError{
            print(error.description)
        }
    }

    @IBAction func buttonPressed(_ sender: Any) {
        holderCloud.isHidden = false
        button.isHidden = true
        darkBG.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3,animations: {
            self.rocket.frame = CGRect(x:0,y:272,width:375,height:169)}){ (finish) in
                self.hustle.isHidden = false
                self.On.isHidden = false}
    }
    
}

