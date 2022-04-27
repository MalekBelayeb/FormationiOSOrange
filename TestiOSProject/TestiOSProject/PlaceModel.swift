//
//  PlaceModel.swift
//  TestiOSProject
//
//  Created by ODC on 26/4/2022.
//

import Foundation


class PlacePoint:Decodable {
    
    var lon: Double?
    var lat: Double?
    
}

class PlaceModel:Decodable
{
    
    var xid : String?
    var name: String?
    var dist: Double?
    var kinds:String?
    var point:PlacePoint?
    
}
