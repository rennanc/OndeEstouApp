//
//  ViewController.swift
//  teste
//
//  Created by Rennan Franco Chagas on 27/07/17.
//  Copyright © 2017 Rennan Franco Chagas. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    
    var gerenciadorLocalizacao = CLLocationManager()
    

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
        
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //pegando onde estou
        let novaLocalizacao = locations.last
        let anotacao = MKPointAnnotation()
        anotacao.title = "Eu estou aqui"
        anotacao.subtitle = "Ainda"
        
        //let deltaLat: CLLocationDegrees = 0.01
        //let deltaLon: CLLocationDegrees = 0.01
        
        //pegando as coordenadas onde estou e ponto no pto
        anotacao.coordinate = (novaLocalizacao?.coordinate)!
        //let areaExibicao: MKCoordinateSpan = MKCoordinateSpanMake(deltaLat, deltaLon)
        //let regiao: MKCoordinateRegion = MKCoordinateRegion = MKCoordinateRegionMake((novaLocalizacao?.coordinate)!, areaExibicao)
        
        //novo Zoom
        // mapa.setRegion(regiao, animated: true)
        mapa.addAnnotation(anotacao)
        
        print(locations)
    }

}

