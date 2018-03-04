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
        newEditableField.value = name.firstName
        EditableFields.append(newEditableField)

        newEditableField = EditableField("Last Name")
        newEditableField.value = name.lastName ?? ""
        EditableFields.append(newEditableField)

        newEditableField = EditableField("Phone")
        
        
        if let phone = phoneNumber {
            newEditableField.value = String(phone)
        } else {
            newEditableField.value = ""
        }
        EditableFields.append(newEditableField)
        
        newEditableField = EditableField("Zip")
        newEditableField.value = address.zipCode ?? ""
        EditableFields.append(newEditableField)

        newEditableField = EditableField("City")
        newEditableField.value = address.city ?? ""
        EditableFields.append(newEditableField)

        newEditableField = EditableField("Address")
        newEditableField.value = address.streetAddress1 ?? ""
        EditableFields.append(newEditableField)

        newEditableField = EditableField("Address line 2")
        newEditableField.value = address.streetAddress2 ?? ""
        EditableFields.append(newEditableField)

        return EditableFields
        
    }
    
    mutating func setContactFromFields(fields : [EditableField]) {
        for field in fields {
            switch field.name {
                
            case "Name":
                self.name.firstName = field.value
                break

            case "Last Name":
                self.name.lastName = field.value
                break
                
            case "Phone":
                
                let phoneFromField = Int(field.value)
                
                self.phoneNumber = phoneFromField == 0 ? nil : phoneFromField
                break

            case "Zip":
                self.address.zipCode = field.value
                break

            case "City":
                self.address.city = field.value
                break

            case "Address":
                self.address.streetAddress1 = field.value
                break

            case "Address line 2":
                self.address.streetAddress1 = field.value
                break

                default:
                break
            }
        }
    }
    
}
