//
//  InstagramClient.swift
//  InstaClone
//
//  Created by Jose Montes de Oca on 9/28/15.
//  Copyright © 2015 JoseOnline!. All rights reserved.
//

import UIKit
import AFNetworking

let instagramClientId = "aee9bb48abe84bbb8fa17484f646fa17"
let instagramBaseUrl = "https://api.instagram.com/v1"
let instagramPopularMediaUrl = instagramBaseUrl + "/media/popular"

class InstagramClient {
    class func fetchPopularMedia(successCallback: ([Media]) -> Void, errorCallback: ((NSError?) -> Void)?) {
        let manager = AFHTTPRequestOperationManager()
        let parameters: [String : AnyObject] = ["client_id": instagramClientId]
        
        manager.GET(instagramPopularMediaUrl, parameters: parameters, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            
            let dictionaries = response["data"] as? [NSDictionary]
            if dictionaries != nil {
                successCallback(Media.medias(array: dictionaries!))
            }
        }, failure: { (operation: AFHTTPRequestOperation!, request) -> Void in
            if let error = errorCallback {
                error(request)
            }
        })
    }
}