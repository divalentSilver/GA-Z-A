//
//  DataSetExFile.swift
//  Travel
//
//  Created by cscoi044 on 2018. 1. 19..
//  Copyright © 2018년 lollol. All rights reserved.
//

import UIKit


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

class Post{
    var pictures: [Picture] = []
    var travelStartDate: [Int] = [] //0: year, 1: month, 2: day
    var travelEndDate: [Int] = [] //0: year, 1: month, 2: day
    var travelName: String = ""
    
    init(pictures: [Picture], travelStartDate: [Int], travelEndDate: [Int], travelName: String){
        self.pictures = pictures
        self.travelStartDate = travelStartDate
        self.travelEndDate = travelEndDate
        self.travelName = travelName
    }
}

class Picture{
    var comment: String = ""
    let picDate: Date! //사진에서 정보 가져올 것임
    let picLocation: [Double] = [] //사진에서 정보 가져올 것임
    var favoriteButtonState: Bool = false
    var picData: UIImage!
    
    init() {
    }
    
    /*
     func toggleSaveButton(){
     saveButtonState = !saveButtonState
     }
     
     func editExplanation(){
     }
     */
    
}


