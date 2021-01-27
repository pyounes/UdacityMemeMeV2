//
//  MemeMeCollectionViewCell.swift
//  MemeMeV2
//
//  Created by Pierre Younes on 1/25/21.
//

import UIKit

class MemeMeCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(meme: Meme) {
        self.imageView.image = meme.memedImage
    }
    
}
