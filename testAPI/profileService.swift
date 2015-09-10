//
//  ViewController.swift
//  testAPI
//
//  Created by pooja shyam on 7/31/15.
//  Copyright (c) 2015 pooja shyam. All rights reserved.
//

//: Playground - noun: a place where people can play

import UIKit

public class profileService: UIViewController, NSURLConnectionDelegate {
    
    lazy var data = NSMutableData()
    var typeOfData = NSString();
    var combineData = NSDictionary();
    var tableData = NSNumber();
    var connectionEstablished = false;
    
    func startConnection(field:String) -> String{
        
        //establishing connection with URL containing mock JSON data
        
        let urlPath: String = "http://www.mocky.io/v2/55bb9098e47b832205c709f2"
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?
        >=nil
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
        var err: NSError?
        
        //fetched result stored in a local dictionary
        
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
        combineData = jsonResult as NSDictionary
        
        //if no error exists,render data to fields based on the cell name.
        
        switch(field){
            
            case _ where field == "NAME":
                var tempDictionary = combineData["name"] as! Dictionary<String,String>
                return toString(tempDictionary["suffix"]!) + " " + toString(tempDictionary["salutation"]!) + " " + toString(tempDictionary["firstName"]!) + " " + toString(tempDictionary["lastName"]!);
            
            
            case _ where field == "DATE OF BIRTH":
                return toString(combineData["birthDate"]!)
            
            
            case _ where field == "PHONE NUMBER":
                var tempArray = combineData["phone"] as! NSArray
                var temp: NSDictionary = tempArray[0] as! NSDictionary;
                var number  = ("(" + ((temp["extension"]!) as! String) + ") " + ((temp["Number"]!) as! String) ) as String
                return number
            
            
            case _ where field == "EMAIL":
                return toString(combineData["email"]!)
            
            
            case _ where field == "ADDRESS":
                    var tempArray = combineData["address"] as! NSArray
                    var temp = tempArray[0] as! NSDictionary
                    var address = (((temp["address1"]!) as! String) + ", " + ((temp["city"]!) as! String) + ", " + ((temp["state"]!) as! String) + ", " + ((temp["country"]!) as! String) + ", " + ((temp["zipCode"]!) as! String) ) as String
                    return address
           
        
            default:
                return "wrong field"
        }
        
    }
    
}
