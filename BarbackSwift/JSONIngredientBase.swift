//
//  IngredientBase.swift
//  BarbackSwift
//
//  Created by Justin Duke on 6/22/14.
//  Copyright (c) 2014 Justin Duke. All rights reserved.
//

import Foundation

class JSONIngredientBase {
    var name: String
    var lowercaseName: String // Making this an actual variable for performance reasons.
    var brands: [JSONBrand]
    var type: IngredientType
    var description: String
    
    convenience init() {
        self.init(name: "")
    }
    
    init(name: String, brands: [JSONBrand], description: String, type: IngredientType) {
        self.name = name
        self.lowercaseName = name.lowercaseString
        self.brands = brands
        self.description = description
        self.type = type
    }
    
    convenience init(name: String) {
        self.init(name: name, brands: [JSONBrand](), description: "", type: IngredientType.Other)
    }

    convenience init(rawIngredient: NSDictionary) {
        let name = (rawIngredient.objectForKey("name") as String)
        let description = rawIngredient.objectForKey("description") as String
        let type = IngredientType.fromRaw(rawIngredient.objectForKey("type") as String)!
        
        
        let rawBrands = rawIngredient.objectForKey("brands") as [NSDictionary]
        let brands = rawBrands.map({
            (rawBrand: NSDictionary) -> JSONBrand in
            return JSONBrand(rawBrand: rawBrand)
            })
        self.init(name: name, brands: brands, description: description, type: type)
    }
    
    class func fromJSONFile() -> [JSONIngredientBase] {
        let filepath = NSBundle.mainBundle().pathForResource("ingredients", ofType: "json")
        let jsonData = NSString.stringWithContentsOfFile(filepath!, encoding:NSUTF8StringEncoding, error: nil)
        let ingredientData = jsonData.dataUsingEncoding(NSUTF8StringEncoding)
        var rawIngredients = NSJSONSerialization.JSONObjectWithData(ingredientData!, options: nil, error: nil) as [NSDictionary]
        
        return rawIngredients.map({JSONIngredientBase(rawIngredient: $0)})
    }
}