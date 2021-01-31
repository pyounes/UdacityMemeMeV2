//
//  SentMemesCollectionVC.swift
//  MemeMeV2
//
//  Created by Pierre Younes on 1/25/21.
//

import UIKit

class SentMemesCollectionVC: UICollectionViewController {

    // MARK: - Outlets
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    // MARK: - Variables
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        print(dimension)
        // flowlayout spces
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: 120.0, height: 120.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        print("CollectionView WillAppear")
    }
    
    // MARK: - Collection View Delegate
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeMeCollectionViewCell", for: indexPath) as! MemeMeCollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.imageView?.image = meme.memedImage
        
        
        return cell
    }


    // Open Meme Detail VC When an Item is selected
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let detailVC = storyboard?.instantiateViewController(identifier: "MemeDetailVC") as? MemeDetailVC {
            detailVC.memeIndex = (indexPath as NSIndexPath).row
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
}
