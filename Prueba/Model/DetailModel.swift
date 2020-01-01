//
//  DetailModel.swift
//  Prueba
//
//  Created by alumno on 01/01/2020.
//  Copyright © 2020 alumno. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
class DetailModel{
    func delete(dni:String,completion:@escaping(Bool)->Void) {
        var ref = Database.database().reference().child("users")
        ref.child(dni).removeValue()
        completion(false)
    }
}
