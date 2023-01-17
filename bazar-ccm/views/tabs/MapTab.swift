//
//  userView.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import SwiftUI
import MapKit

struct MapTab: View {
    @StateObject private var mapsModel = MapsModel()
    
    var body: some View {
        Map(coordinateRegion: $mapsModel.region, showsUserLocation: true).onAppear {
            mapsModel.checkIfLocationIsEnabled()
        }
    }
}

struct userView_Previews: PreviewProvider {
    static var previews: some View {
        MapTab()
    }
}

final class MapsModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    func checkIfLocationIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
        } else {
            print("Localisation error")
        }
    }
    
    private func askLocationPermission() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Votre localisation est restreinte")
        case .denied:
            print("Vous avez bloquer l'autorisation")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            break
        @unknown default:
            break
        }

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        askLocationPermission()
    }
}
