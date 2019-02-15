//
//  VideoViewController.swift
//  flixster
//
//  Created by Kavya Sahai on 2/14/19.
//  Copyright © 2019 Kavya Sahai. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    var id: NSNumber = 0.0
    var key: String = ""
  
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(id)
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let results=dataDictionary["results"] as! NSArray
//                let key=(results[0] as AnyObject)
                let first=results[0] as! [String:Any]
                self.key=first["key"] as! String
                print(self.key)
//                self.EmbedVideoYoutube(StrYoutubeVidId: key)
                
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                
            }
        }
        task.resume()
    }
    
   
    
    
    @IBAction func closeAction(_ sender: Any) {
           dismiss(animated: true, completion: nil)
    }
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
