//
//  Media.swift
//  InstaClone
//
//  Created by Jose Montes de Oca on 9/28/15.
//  Copyright © 2015 JoseOnline!. All rights reserved.
//

import UIKit

enum InstagramMediaType: String {
    case Image = "image"
    case Video = "video"
}

class Media: NSObject {
    var type: InstagramMediaType!
    var username: String?
    var userProfilePictureURL: NSURL?
    var userFullName: String?
    var imageUrl: NSURL?
    var videoUrl: NSURL?
    
    override var description: String {
        return "[type: \(self.type!)]" +
            "\n[username: \(self.username!)]" +
            "\n[imageUrl: \(self.imageUrl!)]"
    }
    
    
    init(json: NSDictionary) {
        
        let typeString = json["type"] as? String
        
        if typeString != nil {
            self.type = InstagramMediaType(rawValue: typeString!)
        }
        
        if let user = json["user"] as? NSDictionary {
            if let username = user["username"] as? String {
                self.username = username
            }
            
            if let userProfilePictureURLString = user["profile_picture"] as? String {
                self.userProfilePictureURL = NSURL(string: userProfilePictureURLString)!
            }
            
            if let userFullName = user["full_name"] as? String {
                self.userFullName = userFullName
            }
        }
        
        if let images = json["images"] as? NSDictionary {
            if let imageStandarRes = images["standard_resolution"] as? NSDictionary {
                if let imageStandarResURLString = imageStandarRes["url"] as? String {
                    self.imageUrl = NSURL(string: imageStandarResURLString)!
                }
            }
        }
        
        if let videos = json["videos"] as? NSDictionary {
            if let videoStandarRes = videos["standard_resolution"] as? NSDictionary {
                if let videoStandarResURLString = videoStandarRes["url"] as? String {
                    self.videoUrl = NSURL(string: videoStandarResURLString)!
                }
            }
        }
    }
    
    class func medias(array array: [NSDictionary]) -> [Media] {
        var medias = [Media]()
        for dictionary in array {
            let media = Media(json: dictionary)
            medias.append(media)
        }
        return medias
    }
    
    class func fetchPopularMedia(successCallback: ([Media]) -> Void, errorCallback: ((NSError?) -> Void)?) {
        InstagramClient.fetchPopularMedia(successCallback, errorCallback: errorCallback)
    }
}