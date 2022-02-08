//
//  ContentView.swift
//  Map
//
//  Created by Ierchenko Anna  on 2/2/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
}


struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        //create point at the map
        let annotation = MKPointAnnotation()
        annotation.title = "Ekaterenburg"
        annotation.subtitle = "Town"
        annotation.coordinate = CLLocationCoordinate2DMake(56.84, 60.64)
        mapView.addAnnotation(annotation)
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //
    }
    
    //feedback
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    class Coordinator: NSObject,  MKMapViewDelegate {
        var parent: MapView
        
        func mapViewDidChangeVisisbleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        //custom anotation
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            return view
        }
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
