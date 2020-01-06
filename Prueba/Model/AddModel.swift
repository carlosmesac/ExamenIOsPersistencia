//
//  AddModel.swift
//  Prueba
//
//  Created by alumno on 01/01/2020.
//  Copyright © 2020 alumno. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
class AddModel{
    func addPerson(name:String,surname:String,dni:String,age:String,job:String,cv:String,image:UIImage, completion: @escaping (Bool) -> Void){
        let ref = Database.database().reference()
        ref.observeSingleEvent(of: .value) { (snapshot) in
            if(snapshot.childSnapshot(forPath: "users").hasChild(dni)){
                completion(true)
            }else{
                
                let dictionary = ["name": name, "surname": surname, "dni": dni, "age": age, "job": job, "cv": cv]
                ref.child("users").child(dni).setValue(dictionary)
                let imageData = image.jpegData(compressionQuality: 1.0)
                UserDefaults.standard.set(imageData, forKey: dni)
                //Constants.Values.images.updateValue(image, forKey: dni)
               // UserDefaults.standard.set(image, forKey: dni)

                completion(false)
            }
        }
    }
    func validateFields(name: String,surname:String,dni:String,age:String,job:String,cv:String,image:UIImage, completion: @escaping (Bool,String) -> Void ) {
        //comprobamos si los campos estan llenos
        if(name.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            surname.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            dni.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            age.trimmingCharacters(in: .whitespacesAndNewlines)=="" || job.trimmingCharacters(in: .whitespacesAndNewlines)=="" || cv.trimmingCharacters(in: .whitespacesAndNewlines)=="" ||
            image == nil
            ){
            
            completion(true,"Please fill in all fields")
        }else{
            completion(false,"")
            
        }
        
    }
    
}
