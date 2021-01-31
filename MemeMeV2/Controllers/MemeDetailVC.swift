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
        self.memedImage.image = getMemeImage()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editMeme))
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.memedImage.image = getMemeImage()
    }

    @objc func editMeme() {
        
        if let memeVC = storyboard?.instantiateViewController(identifier: "MemeMeVC") as? MemeMeVC {
            memeVC.modalPresentationStyle = .fullScreen
            memeVC.memeIndex = memeIndex
            present(memeVC, animated: true, completion: nil)
        }
        
    }
    
    private func getMemeImage() -> UIImage? {

        if memes.indices.contains(memeIndex) {
            return memes[self.memeIndex].memedImage
        }
        navigationItem.rightBarButtonItem?.isEnabled = false
        return nil
    }
    
}
