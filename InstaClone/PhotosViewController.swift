//
//  PhotosViewController.swift
//  InstaClone
//
//  Created by Jose Montes de Oca on 9/28/15.
//  Copyright © 2015 JoseOnline!. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var medias = [Media]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("about to load data")
        
        Media.fetchPopularMedia({ (medias) -> Void in
            self.medias = medias
            
            for media in medias {
                print(media)
            }
        }) { (error) -> Void in
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
