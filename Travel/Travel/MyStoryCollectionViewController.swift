//
//  MyStoryCollectionViewController.swift
//  Travel
//
//  Created by cscoi044 on 2018. 1. 24..
//  Copyright © 2018년 lollol. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MyStoryCell"

class MyStoryCollectionViewController: UIViewController, UICollectionViewDataSource{

    struct Story {
        var name: String
        var image: UIImage
    }
    
    var myStoryData = [
        Story(name: "HongKong", image: #imageLiteral(resourceName: "CollectionViewCell1")),
        Story(name: "Vietnam", image: #imageLiteral(resourceName: "CollectionViewCell2")),
        Story(name: "Japan", image: #imageLiteral(resourceName: "CollectionViewCell3")),
        Story(name: "Korea", image: #imageLiteral(resourceName: "CollectionViewCell4")),
        Story(name: "USA", image: #imageLiteral(resourceName: "CollectionViewCell5")),
        Story(name: "Canada", image: #imageLiteral(resourceName: "CollectionViewCell6")),
        Story(name: "Mexico", image: #imageLiteral(resourceName: "CollectionViewCell7")),
        Story(name: "Russia", image: #imageLiteral(resourceName: "CollectionViewCell8")),
        Story(name: "China", image: #imageLiteral(resourceName: "CollectionViewCell9")),
        Story(name: "Taiwan", image: #imageLiteral(resourceName: "CollectionViewCell10")),
        Story(name: "Norway", image: #imageLiteral(resourceName: "CollectionViewCell11"))
        
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return myStoryData.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyStoryCollectionViewCell
        let item = myStoryData[indexPath.item]
        cell.MyStory.image = item.image
        
    
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
