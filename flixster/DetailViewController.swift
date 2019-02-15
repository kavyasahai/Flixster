//
//  DetailViewController.swift
//  flixster
//
//  Created by Kavya Sahai on 2/8/19.
//  Copyright © 2019 Kavya Sahai. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var backdropPoster: UIImageView!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var movie: [String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backdropPoster.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        backdropPoster.addGestureRecognizer(tapGesture)
        
        
        titleLabel.text=movie?["title"] as! String
        
        
        overviewLabel.text=movie?["overview"] as! String
        
        dateLabel.text=movie?["release_date"] as! String
        
        
        let smallbaseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie?["poster_path"] as! String
        let posterURL = URL(string: smallbaseURL + posterPath)
        
        moviePoster.af_setImage(withURL: posterURL!)
        
        let baseURL = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie?["backdrop_path"] as! String
        let backdropURL=URL(string: baseURL + backdropPath )
        
        backdropPoster.af_setImage(withURL: backdropURL!)
        
        print(movie?["title"] as! String)
        // Do any additional setup after loading the view.
    }
  
    @objc func tapGesture(){
        performSegue(withIdentifier: "showVideo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let videoViewController = segue.destination as! VideoViewController
//        print(movie!["id"]!)
        videoViewController.id=movie!["id"] as! NSNumber
    }

}
