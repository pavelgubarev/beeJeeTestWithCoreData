//
//  EditTableViewController.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import UIKit


class EditTableViewController: UITableViewController, EditTableViewProtocol {
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        cancelEditing()
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        save()
    }
    
    var presenter : EditPresenterProtocol!
    
    var contact : Contact!
    
    var fields = [EditableField]()
    
    func fillFields(withContact : Contact) {
        self.contact = withContact
        
        fields = self.contact.editableContactsWithLabels()
        
        tableView.reloadData()
        
    }
    
    func cancelEditing() {
        presenter.cancel()
    }

    func save() {
        
        contact.setContactFromFields(fields: fields)
        
        presenter.save(contact)
    }

    func goBack() {        
        self.navigationController?.popViewController(animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        assembler.registerEditContactView(withView: self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
         presenter.editorDidAppear()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditContactTableViewCell", for: indexPath) as! EditContactTableViewCell
        
        cell.fieldName.text = fields[indexPath.row].name
        cell.fieldValue.text = fields[indexPath.row].value
        
        cell.owner = self
        cell.rowNumber = indexPath.row
        
        return cell
    }
    
    func updateField(number: Int, value: String ) {
        fields[number].value = value
    }

  

}
