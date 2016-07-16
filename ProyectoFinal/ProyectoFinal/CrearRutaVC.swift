//
//  CrearRutaVC.swift
//  ProyectoFinal
//
//  Created by Fernando Renteria Correa on 11/07/2016.
//  Copyright © 2016 Fernando Renteria Correa. All rights reserved.
//

import UIKit

class CrearRutaVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var fotoVista: UIImageView!
    @IBOutlet weak var agregarFotoBtn: UIButton!
    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var descripcion: UITextView!
    
    private let myPicker = UIImagePickerController()
    
    var ruta :Ruta = Ruta()
    
    @IBAction func camara() {
        myPicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(myPicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !UIImagePickerController.isSourceTypeAvailable(.Camera) {
            agregarFotoBtn.hidden = true
        }
        
        myPicker.delegate = self
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        fotoVista.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        var validationFlag : Bool = true
        let tituloTmp : String = self.titulo.text!
        let descTemp : String = self.descripcion.text!
        
        if (tituloTmp == "") {
            alertaValidacion("Favor de ingresar titulo.")
            validationFlag = false
        }
        if (descTemp == "") {
            alertaValidacion("Favor de ingresar descripcion.")
            validationFlag = false
        }
        return validationFlag
    }
    
    func alertaValidacion(mensaje : String) {
        let alerta = UIAlertController(title: "Error", message: mensaje, preferredStyle: .Alert)
        let accionOk = UIAlertAction(title: "Ok", style: .Default, handler: {accion in } )
        alerta.addAction(accionOk)
        self.presentViewController(alerta, animated: true, completion: nil)
    
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "crearRuta" {
            self.ruta.titulo = self.titulo.text!
            self.ruta.descripcion = self.descripcion.text!
            if (fotoVista.image != nil) {
                UIImageWriteToSavedPhotosAlbum(fotoVista.image!, nil, nil, nil)
            }
            let crearRutaView = segue.destinationViewController as! MapLocatorVC
            crearRutaView.ruta = self.ruta
        }
    }

}
