//
//  ViewController.swift
//  Travel
//
//  Created by cscoi044 on 2018. 1. 17..
//  Copyright © 2018년 lollol. All rights reserved.
//

import UIKit

class User{
    var name: String = ""
    var id: String = ""
    var profilePic: String = ""
    var numOfVisitedCountries: Int = 0
    var posts: [Post] = []
    init(name: String, id: String, profilePic: String) {
        self.name = name
        self.id = id
        self.profilePic = profilePic
    }
    
    func addPost(newPost: Post) {
        posts.append(newPost)
    }
    
    func deletePost(binPost: Post) {
        //posts.
    }
    
}

class Post{
    var pictures: [Picture] = []
    var travelDate: [Int] = [] //0: year, 1: month, 2: day
    init(pictures: [Picture], travelDate: [Int]){
        self.pictures = pictures
        self.travelDate = travelDate
    }
    
    func addPictures(newPictures: [Picture]){
        pictures += newPictures
        //pictures.sorted(by: )
        
    }
    
    func deletePictures(binPictures: [Picture]){
        for i in 0..<binPictures.count{
            //pictures = pictures.filter{$0 != binPictures[i]}
        }
    }
    
    func editTravelDate(newTravelDate: [Int]){
        travelDate = newTravelDate
    }
    
    //대표사진 고르는 함수
    
    
}

class Picture{
    var explanation: String = ""
    let picDate: [Int] = [] //사진에서 정보 가져 올 것임
    let picLocation: String = ""
    var saveButtonState: Bool = false
    init(explanation: String, picDate: [Int], picLocation: String) {
        self.explanation = explanation
        self.picDate = picDate
        self.picLocation = picLocation
    }
    func toggleSaveButton(){
        saveButtonState = !saveButtonState
    }
    
    func editExplanation(){
    }

}



let profile1 =


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

