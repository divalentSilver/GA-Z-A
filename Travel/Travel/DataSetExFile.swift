//
//  DataSetExFile.swift
//  Travel
//
//  Created by cscoi044 on 2018. 1. 19..
//  Copyright © 2018년 lollol. All rights reserved.
//

import Foundation


struct User{
    var posts: [Post] = []

    init() {
        
    }
    
    mutating func addPost(newPost: Post) {
        self.posts.append(newPost)
    }
    
    mutating func deletePost(binPost: Post) {
        //posts.
    }
    
}

struct Post{
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
    
    /*
    func addPictures(newPictures: [Picture]){
        pictures += newPictures
    }
    
    func deletePictures(binPictures: [Picture]){
        for i in 0..<binPictures.count{
            //pictures = pictures.filter{$0 != binPictures[i]}
        }
    }
    
    func editTravelDate(newTravelDate: [Int]){
        travelDate = newTravelDate
    }
    */
    
}

struct Picture{
    var comment: String = ""
    let picDate: [Int] = [] //사진에서 정보 가져올 것임
    let picLocation: String = "" //사진에서 정보 가져올 것임
    //var favoriteButtonState: Bool = false
    
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


