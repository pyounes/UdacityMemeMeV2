//
//  MemeDetailVC.swift
//  MemeMeV2
//
//  Created by Pierre Younes on 1/31/21.
//

import UIKit

class MemeDetailVC: UIViewController {

    // Outlets
    @IBOutlet weak var memedImage: UIImageView!
    
    // Variables
    var memeIndex: Int!
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.memedImage.image = memes[self.memeIndex].memedImage
    }
    

}
