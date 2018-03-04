//
//  EditPresenterProtocol.swift
//  BeeJeeTestGubarev
//
//  Created by Павел Губарев on 04/03/2018.
//  Copyright © 2018 Pavel Gubarev. All rights reserved.
//

import Foundation

public protocol EditPresenterProtocol {
    
    func editorDidAppear()
    
    func save( _ contact: Contact)
    
    func cancel()
    
}
