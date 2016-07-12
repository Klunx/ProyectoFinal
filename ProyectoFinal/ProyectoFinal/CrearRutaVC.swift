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
    
    var ruta = Ruta()
    
    @IBAction func camara() {
        myPicker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(myPicker, animated: true, completion: nil)
    }
    
    @IBAction func salvarRuta() {
        ruta.titulo = titulo.text!
        ruta.descripcion = descripcion.text!
        UIImageWriteToSavedPhotosAlbum(fotoVista.image!, nil, nil, nil)
        print(ruta.titulo)
        print(ruta.descripcion)
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
