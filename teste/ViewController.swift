//
//  ViewController.swift
//  teste
//
//  Created by Rennan Franco Chagas on 27/07/17.
//  Copyright © 2017 Rennan Franco Chagas. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude: CLLocationDegrees = -22.9060548
        let longitude: CLLocationDegrees = -43.1790855
        
        let deltaLat: CLLocationDegrees = 0.01
        let deltaLon: CLLocationDegrees = 0.01
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let areaExibicao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLat, deltaLon)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegionMake(localizacao, areaExibicao)
        mapa.setRegion(regiao, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

