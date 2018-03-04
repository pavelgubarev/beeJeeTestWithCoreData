//
//  ViewOneContactTableViewController.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import UIKit


class OneContactTableViewController: UITableViewController, OneContactViewProtocol {
    
    @IBAction func editButtonAction(_ sender: Any) {
        editButtonPressed()
    }
    
    var presenter : OneContactPresenterProtocol!
    
    var contact : Contact!
    
    var fields = [Field]()
    
    func editButtonPressed() {
        presenter.editCurrentContact()
    }

    
    func showOne(contact: Contact) {
        self.contact = contact
        
        fields = self.contact!.printableContactsWithLabels()
        
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        assembler.registerOneContactView(withView: self)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.oneContactViewDidAppear()
        
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        
        print(self.navigationItem.rightBarButtonItem?.isEnabled)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return contact != nil ? 1 : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fields.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OneContactTableViewCell", for: indexPath) as! OneContactTableViewCell

        cell.fieldName.text = fields[indexPath.row].name
        cell.fieldValue.text = fields[indexPath.row].value

        

        return cell
    }
    
    func gotoEditingCurrentContact() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "editContact")
        self.navigationController?.pushViewController(controller, animated: false)

    }
   

}
