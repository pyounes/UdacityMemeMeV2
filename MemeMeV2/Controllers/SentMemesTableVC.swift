//
//  SentMemesTableVC.swift
//  MemeMeV2
//
//  Created by Pierre Younes on 1/25/21.
//

import UIKit

class SentMemesTableVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print("ViewWillAppear Called")
    }

}


// MARK: - TableView Delegates
extension SentMemesTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.text = "\(meme.topText) ... \(meme.bottomText)"
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    // Open Meme Detail VC When a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = storyboard?.instantiateViewController(identifier: "MemeDetailVC") as? MemeDetailVC {
            detailVC.memeIndex = (indexPath as NSIndexPath).row
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    // Swipe To Delete meme
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            (UIApplication.shared.delegate as! AppDelegate).memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
