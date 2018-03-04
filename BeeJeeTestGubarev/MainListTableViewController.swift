//
//  MainListTableViewController.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import UIKit

class MainListTableViewController: UITableViewController, MainListViewProtocol {
   
    
    
    @IBAction func addButtonAction(_ sender: Any) {
        presenter.showAddContactForm()
    }
    
    var presenter : MainListPresenterProtocol!
    
    var contacts = [Contact]()
    
    func showCurrentMainList(withContacts: [Contact]) {
        contacts = withContacts
        
        tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        assembler.registerMainTableView(withView: self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        presenter.mainListDidAppear()
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
        return contacts.count == 0 ? 0 : 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainListTableViewCell", for: indexPath) as! MainListTableViewCell

        cell.firstNameLabel.text = contacts[indexPath.row].name.firstName
        cell.lastNameLabel.text = contacts[indexPath.row].name.lastName

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.showOne(contact: indexPath.row)
        
    }
    
    func goToContactView() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "viewContact")
        self.navigationController?.show(controller, sender: nil)
        
    }
    
    
    func gotoAddContact() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "editContact") as! EditTableViewController
        
        self.navigationController?.show(controller, sender: nil)
        
    }

    

}
