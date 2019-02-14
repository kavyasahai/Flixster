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
    
    var movie: [String:Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text=movie?["title"] as! String
        overviewLabel.text=movie?["overview"] as! String
        
        
        let baseURL = "https://image.tmdb.org/t/p/w780"
        let posterPath = movie?["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        moviePoster.af_setImage(withURL: posterURL!)
        
        let backdropPath = movie?["backdrop_path"] as! String
        let backdropURL=URL(string: baseURL + backdropPath )
        
        backdropPoster.af_setImage(withURL: backdropURL!)
        
        print(movie?["title"] as! String)
        // Do any additional setup after loading the view.
    }
  

}
