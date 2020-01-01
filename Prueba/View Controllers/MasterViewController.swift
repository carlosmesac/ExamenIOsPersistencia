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
           DispatchQueue.global().async { [weak self] in
               self!.masterModel.fillArray { (error, array) in
                   if(error == false){
                               DispatchQueue.main.async {
                                   cell?.textLabel?.text = array[indexPath.row].name
                                   cell?.detailTextLabel?.text = array[indexPath.row].dni

                                   print(array.count, "cantidad")
                                   
                               }
                           }
                       self?.personArrayList = array
                       
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
