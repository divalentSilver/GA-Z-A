//
//  DataSetExFile.swift
//  Travel
//
//  Created by cscoi044 on 2018. 1. 19..
//  Copyright © 2018년 lollol. All rights reserved.
//


import UIKit

/*
class User{
    var posts: [Post] = []

    init() {
        
    }
    
    func addPost(newPost: Post) {
        self.posts.append(newPost)
    }
    
    func deletePost(binPost: Post) {
        //posts.
    }
    
}
 */

class Post{
    var pictures: [Picture] = []
    var travelStartDate: Date?
    var travelEndDate: Date?
    var travelName: String = ""
    /*
    init(pictures: [Picture], travelStartDate: Date, travelEndDate: Date, travelName: String){
        self.pictures = pictures
        self.travelStartDate = travelStartDate
        self.travelEndDate = travelEndDate
        self.travelName = travelName
    }
    */
}

class Picture{
    var comment: String = ""
    var picDate: Date?//사진에서 정보 가져올 것임
    var picLocation: CLLocationCoordinate2D?//사진에서 정보 가져올 것임
    var picImage: UIImage? //일단은 Asset에서 가져올 것임
    var favoriteButtonState: Bool = false
    
    /*
    init(picDate: Date, picLocation: CLLocationCoordinate2D, picImage: UIImage){
        self.picDate = picDate
        self.picLocation = picLocation
        self.picImage = picImage
    }
    */
}


