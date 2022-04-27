//
//  PlacePresenter.swift
//  TestiOSProject
//
//  Created by ODC on 27/4/2022.
//

import Foundation


protocol PlaceNotifier
{
    
    func showLoading()
    func getAllPlaces(listOfPlaces:[PlaceModel])
    func hideLoading()
    
}



class PlacePresenter
{
    
    var placeNotifier:PlaceNotifier!
    
    
    func fetchAllPlaces()
    {
    
        placeNotifier.showLoading()
        
        var myArr:[PlaceModel] = [ PlaceModel(title: "", category: "", distance: ""),PlaceModel(title: "", category: "", distance: "") ]
        
        placeNotifier.getAllPlaces(listOfPlaces: myArr)
        
        placeNotifier.hideLoading()
    }
    
}
