//
//  EditModel.swift
//  Prueba
//
//  Created by alumno on 04/01/2020.
//  Copyright © 2020 alumno. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
class EditModel{
    func editPerson(name:String,surname:String,dni:String,age:String,job:String,cv:String,valoracion:String, completion: @escaping (Bool) -> Void){
        let ref = Database.database().reference()
        ref.observeSingleEvent(of: .value) { (snapshot) in
            let dictionary = ["name": name, "surname": surname, "dni": dni, "age": age, "job": job, "cv": cv, "valoracion": valoracion]
                ref.child("usersIOS").child(dni).setValue(dictionary)

                completion(false)
            }
        }
    
    func validateFields(name: String,surname:String,dni:String,age:String,job:String,cv:String, valoracion:String, completion: @escaping (Bool,String) -> Void ) {
        //comprobamos si los campos estan llenos
        if(name.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            surname.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            dni.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            age.trimmingCharacters(in: .whitespacesAndNewlines)=="" || job.trimmingCharacters(in: .whitespacesAndNewlines)=="" || cv.trimmingCharacters(in: .whitespacesAndNewlines)==""){
            
            completion(true,"Please fill in all fields")
        }else{
            switch valoracion {
            case "1":
                completion(false,"")
            case "2":
                completion(false,"")
            case "3":
                completion(false,"")
            case "4":
                completion(false,"")
            case "5":
                completion(false,"")
            default:
                completion(true,"make sure valoracion from 1 to 5")
            }

        }
        
    }
    
}
