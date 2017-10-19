//
//	Athlete.swift
//
//	Create by Ahmed Tawfik on 18/10/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Athlete : NSObject, NSCoding, Mappable{

	var brief : String?
	var image : String?
	var name : String?


	class func newInstance(map: Map) -> Mappable?{
		return Athlete()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		brief <- map["brief"]
		image <- map["image"]
		name <- map["name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         brief = aDecoder.decodeObject(forKey: "brief") as? String
         image = aDecoder.decodeObject(forKey: "image") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if brief != nil{
			aCoder.encode(brief, forKey: "brief")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}