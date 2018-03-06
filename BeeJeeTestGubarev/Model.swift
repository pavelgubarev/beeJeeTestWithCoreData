//
//  Model.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation
import UIKit
import CoreData

enum EditFormMode {
    case add
    case edit
}


class Model {
    
    private let initialJSONFile = "initialContacts"
    
    public var contacts = [Contact]()
    
    public var currentContact : Int = 0
    
    public var newContact : Contact?
    
    public var editFormMode : EditFormMode = .add
    
    var managedContext : NSManagedObjectContext!
    
    init() {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        managedContext = appDelegate.persistentContainer.viewContext

    }
    
    
    public func readDataOnLaunch() {
        readContactsFromStorage()
        
        if model.contacts.count == 0 {
            model.loadInitialJSON()
        }
    }
    
    public func createNewContact() {
        
        var ids = [Int]()
        
        for contact in contacts {
            ids.append(Int(contact.id))
        }
        
        let nextID = ids.max()!
        
        let entity =
            NSEntityDescription.entity(forEntityName: "Contact",
                                       in: managedContext)!
        
        
        newContact = Contact(entity: entity, insertInto: managedContext)
        
        newContact!.id = Int16(nextID)
        newContact!.firstName = ""
    }
    
    public func appendNewContact() {
        contacts.append(newContact!)
    }
    
    public func dropNewContact() {
        newContact = nil
    }
    
    public func delete(_ contact : Contact) {
        self.contacts.remove(at: contacts.index(of: contact)!)
        
        managedContext.delete(contact)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    public func loadInitialJSON() {
        
        if let path = Bundle.main.path(forResource: initialJSONFile, ofType: "json") {
            do {
                
                
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                
                let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String:Any]]
                
                for oneContactJSON in json! {
                    if let oneContact = model.parseFrom(json: oneContactJSON) {
                        contacts.append(oneContact)
                    }
                }
                            
                
            } catch {
                print(error)
            }
        } else {
            print("Wrong file")
        }
        
    }
    
    public func saveContacts() {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    public func readContactsFromStorage() {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<Contact>(entityName: "Contact")
        
        do {
            contacts = try managedContext.fetch(fetchRequest)
            
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    
    
    private func parseFrom(json: [String: Any]) -> Contact? {
        
        
        guard let ID = json["ID"] as? Int else { return nil }
        
        guard let firstName = json["firstName"] as? String  else { return nil }
        
        guard let lastName = json["lastName"] as? String  else { return nil }
        
        //  guard let phoneNumberString = json["phoneNumber"] as? String else { return nil }
        
        guard let zipCode = json["zipCode"] as? String  else { return nil }
        
        guard let city = json["city"] as? String  else { return nil }
        
        guard let streetAddress1 = json["streetAddress1"] as? String  else { return nil }
        
        guard  let streetAddress2 = json["streetAddress2"] as? String  else { return nil }
        
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return nil
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let entity =
            NSEntityDescription.entity(forEntityName: "Contact",
                                       in: managedContext)!
        
        
        let newContactObject = Contact(entity: entity, insertInto: managedContext)
        
        
        
        newContactObject.id = Int16(ID)
        newContactObject.firstName = firstName
        newContactObject.lastName = lastName
        newContactObject.zipCode = zipCode
        newContactObject.city = city
        newContactObject.streetAddress1 = streetAddress1
        newContactObject.streetAddress2 = streetAddress2
        
        return newContactObject
        
    }
    
    
}
