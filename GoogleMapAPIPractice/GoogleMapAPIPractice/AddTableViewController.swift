//
//  AddTableViewController.swift
//  GoogleMapAPIPractice
//
//  Created by cscoi014 on 2018. 1. 30..
//  Copyright © 2018년 KaEun Rhee. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {
    
/////CellSizing 2nd line: From
    ///Cell 선택 이벤트
    @IBAction func FromPicker(_ sender: Any) {
        
    }
    
    
    @IBOutlet var AddTableView: AddTableView!
    
    
    var cellExpanse: Bool = false
    
    func tableView(_tableView: AddTableView, didSelectRowAt indexPath: IndexPath){
        if indexPath.row == 1 {
            cellExpanse = !cellExpanse
            tableView.reloadRows(at: [ IndexPath(row: 1, section: 0)], with: .automatic)
        } else if indexPath.row == 2 {
            cellExpanse = !cellExpanse
            tableView.reloadRows(at: [ IndexPath(row: 2, section: 0)], with: .automatic)
        }
    }
    ///Cell 높이 설정=>높이 얼마로 할지???
    func tableView(_tableView: AddTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 230
        }
        else if indexPath.row == 2 {
            return 230
        }
        return 230
    }
    
/////CellSizing 3rd line: To
    ///Cell 선택 이벤트
    @IBAction func ToPicker(_ sender: Any) {
        
    }
    

/////CellSizing 4th line: Select
    @IBAction func SelectPicture(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
            
            
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FromCell", for: indexPath)
            
            
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToCell", for: indexPath)
            
            
            
            return cell
        } else { //indexPath.row == 3
            let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell", for: indexPath)
            
            
            
            return cell
        }
    }
    

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
