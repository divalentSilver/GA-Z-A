//
//  StoryTableViewController.swift
//  GoogleMapAPIPractice
//
//  Created by cscoi014 on 2018. 1. 31..
//  Copyright © 2018년 KaEun Rhee. All rights reserved.
//

import UIKit
import Photos

class StoryTableViewController: UITableViewController {

    
    var latestPhotoAssetsFetched: PHFetchResult<PHAsset>? = nil

////////
//작성 내용 저장하기
//https://soooprmx.com/archives/1984
//rootviewcontroller 불러오기는 아래
//    let viewController: UIViewController = UIApplication.sharedApplication().delegate!.window!!.rootViewController!
//그런데 rootviewcontroller.h가 필요하다고 뭐지
//거기에다 아래 추가
//    #import <UIKit/UIKit.h>
//
//    @interface RootViewController : UIViewController
//    {
//    NSString *dataFilePath;
//    }
//    @property (nonatomic, strong) IBOutlet UITextView *memo;
//    -(IBAction)saveData:(id)sender;
//    @end
    //*memo가 인터페이스 빌더에서 추가한 텍스트뷰의 아울렛: 뭐가 텍스트뷰? 라벨? 텍스트필드?
//    출처: http://devsc.tistory.com/19 [You Know Programing?]
//
    
    
    
    @IBOutlet weak var StoryMemoTextField: UITextField!
    @IBOutlet weak var StoryImageView: UIImageView!
    @IBOutlet weak var StoryDateLabel: UILabel!
    @IBOutlet weak var StoryPlaceLabel: UILabel!
    @IBOutlet weak var StoryMemoLabel: UILabel!
/////StoryMemoLabel이 Edit하면 사용자가 작성한 내용으로 변경되어야 함
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return (latestPhotoAssetsFetched?.count)!
    }
/*
/////////////스토리 내 각 이미지+메모 구성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as! StoryTableView

        cell.StoryImageView?.UIImage = latestPhotoAssetsFetched[indexPath.row]
        ///////////데이터셋 각 이미지
        //cell.StoryDateLabel?.text = PHAsset.
        //cell.StoryPlaceLabel?.text = PHAsset.
        //cell.StoryMemoLabel?.text = PHAsset.
        
        return cell
    }
*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
