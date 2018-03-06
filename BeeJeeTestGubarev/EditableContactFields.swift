//
//  ContactEditableFields.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

class EditableField : Field {
    var rows : Int =  1

    override init(_ withName : String) {
        super.init(withName)
        self.rows = 1
    }
    
}

extension Contact {
    
    // Это, конечно, сомнительное решение, но есть свои плюсы
    
    func editableContactsWithLabels() -> [EditableField] {
        
        var EditableFields = [EditableField]()
        
        var newEditableField = EditableField("Name")
        newEditableField.value = self.firstName!
        EditableFields.append(newEditableField)

        newEditableField = EditableField("Last Name")
        newEditableField.value = self.lastName ?? ""
        EditableFields.append(newEditableField)

        newEditableField = EditableField("Phone")
        
        
            newEditableField.value = String(self.phoneNumber)
        EditableFields.append(newEditableField)
        
        newEditableField = EditableField("Zip")
        newEditableField.value = zipCode ?? ""
        EditableFields.append(newEditableField)

        newEditableField = EditableField("City")
        newEditableField.value = city ?? ""
        EditableFields.append(newEditableField)

        newEditableField = EditableField("Address")
        newEditableField.value = streetAddress1 ?? ""
        EditableFields.append(newEditableField)

        newEditableField = EditableField("Address line 2")
        newEditableField.value = streetAddress2 ?? ""
        EditableFields.append(newEditableField)

        return EditableFields
        
    }
    
    func setContactFromFields(fields : [EditableField]) {
        for field in fields {
            switch field.name {
                
            case "Name":
                self.firstName = field.value
                break

            case "Last Name":
                self.lastName = field.value
                break
                
            case "Phone":
                
                let phoneFromField = Int(field.value)!
                
                self.phoneNumber = Int16(phoneFromField)
                break

            case "Zip":
                self.zipCode = field.value
                break

            case "City":
                self.city = field.value
                break

            case "Address":
                self.streetAddress1 = field.value
                break

            case "Address line 2":
                self.streetAddress1 = field.value
                break

                default:
                break
            }
        }
    }
    
}
