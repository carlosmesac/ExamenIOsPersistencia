//
//  MasterViewController.swift
//  ExamenIOSPersitenciaFirebase
//
//  Created by alumno on 01/01/2020.
//  Copyright © 2020 alumno. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController,UITableViewDataSource {
    
    
    var personArrayList:[PersonItem]=[]
    var masterModel = MasterModel()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        //llenamos el array
        masterModel.fillArray { (error, array) in
            if(!error){
                self.personArrayList = array
                self.tableView.reloadData()
                
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("hi")
        return  personArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda")
      
      //Añadimos la opcion de pulsar en el collectionViewCell

      DispatchQueue.global().async { [weak self] in
          self!.masterModel.fillArray { (error, array) in
              if(error == false){
                  self!.personArrayList = array
                  if (indexPath.row < self!.personArrayList.count) {
                      DispatchQueue.main.async {
                        cell?.textLabel?.text = "\(array[indexPath.row].name),DNI: \( array[indexPath.row].dni)"
                        cell?.detailTextLabel?.text = "Valoracion :\(array[indexPath.row].valoracion)"
                              
                          }
                          
                      }
                  }
                  
              }
              
          }
      
        return cell!
  }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            print("MasteriviewController prepare: segue=\(String(describing: segue.identifier))")
            
            if segue.identifier == "MuestraDetalles" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let controladorVistaDetalle  = segue.destination as! DetailViewController
                    
                    controladorVistaDetalle.person = personArrayList[indexPath.row]
                    print(personArrayList[indexPath.row])
                    
                    controladorVistaDetalle.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                    controladorVistaDetalle.navigationItem.leftItemsSupplementBackButton = true
                }
            }
        }
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
}
