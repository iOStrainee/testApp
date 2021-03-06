//
//  CartTableViewController.swift
//  bambook
//
//  Created by Admin on 18/01/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
private var reuseIdentifier = "cart"
class CartTableViewController: UITableViewController {
    
    //MARK: - properties navigationItem properties
    var leftNavCustomView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.colorRectangle()
        return view
    }()
    var leftNavItem:UIBarButtonItem = {
        let view = UIBarButtonItem()
        view.customView?.alpha = 1.0
        return view
    }()
    var rightNavCustomView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.colorRectangle()
        return view
    }()
    var rightNavItem:UIBarButtonItem = {
        let view = UIBarButtonItem()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingNavigationBar()
        self.createNavigationItems()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    //MARK: - navigationBar settings backgroundColor , title-font
    private func settingNavigationBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.backgroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.appetite24()]
        self.navigationController?.navigationBar.topItem?.title = "Корзина"
        self.navigationController?.navigationBar.barTintColor = UIColor.mainColor()
    }
    
    //MARK: - create navigation bar buttons
    private func createNavigationItems() {
        if let nav = self.navigationController?.navigationBar {
            self.leftNavItem.customView = self.leftNavCustomView
            self.leftNavCustomView.bounds.size = CGSize(width: nav.bounds.width*1/4, height: nav.bounds.height*1/17)
            self.navigationItem.leftBarButtonItem = self.leftNavItem
            
            self.rightNavItem.customView = self.rightNavCustomView
            self.rightNavCustomView.bounds.size = CGSize(width: nav.bounds.width*1/4, height: nav.bounds.height*1/17)
            self.navigationItem.rightBarButtonItem = self.rightNavItem
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CartTableViewCell else {
            print("has trouble cast to cartcell")
            return UITableViewCell()
        }

        return cell
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - conform to delegate ViewModelDelegate
extension CartTableViewController: ViewModelDelegate {
    func willLoadAnimation() {
        print("start spinner animation")
    }
    
    func didLoadAnimation() {
        print("stop spinner animation and reload data")
        self.tableView.reloadData()
    }
    
    func hasError() {
       print("has error")
    }
}
