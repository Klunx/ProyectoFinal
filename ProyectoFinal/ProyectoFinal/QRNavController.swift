//
//  QRNavController.swift
//  ProyectoFinal
//
//  Created by Fernando Renteria Correa on 10/07/2016.
//  Copyright © 2016 Fernando Renteria Correa. All rights reserved.
//

import UIKit

class QRNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let origen = sender as! QRReaderVC
        let vc = segue.destinationViewController as! QRDisplayVC
        origen.sesion?.stopRunning()
        vc.urls = origen.urls
    }
    
}
