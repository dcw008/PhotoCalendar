//
//  CalendarViewController.swift
//  PhotoCalendar
//
//  Created by Derrick Wong on 10/21/17.
//  Copyright © 2017 Derrick Wong. All rights reserved.
//

import UIKit
protocol MonthCellImagePickerDelegate {
    func pickImage(row: Int)
}
class CalendarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MonthCellImagePickerDelegate {

    @IBOutlet weak var tableView: UITableView!
    var photos = ["Ada", "Derrick", "Tifanny"]
    
    
    var row = 2
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! MonthCell
        cell.nameLabel.text = photos[indexPath.row]
        cell.delegate = self
        cell.cellRow = indexPath.row
        return cell
    }
    
    func pickImage(row: Int){
        self.row = row
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        let section = 0 
        let row = self.row
        
        let indexPath = IndexPath(row: row, section: section)
        
        let cell = tableView.cellForRow(at: indexPath) as! MonthCell
        
        cell.monthImage.image = originalImage
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
