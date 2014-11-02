//
//  IngredientBase.swift
//  
//
//  Created by Justin Duke on 10/6/14.
//
//

import Foundation
import CoreData

class IngredientBase: NSManagedObject {

    @NSManaged var information: String
    @NSManaged var name: String
    @NSManaged var type: String
    @NSManaged var brands: NSSet
    @NSManaged var uses: NSSet
    
    class func fromAttributes(name: String, information: String, type: IngredientType) -> IngredientBase {
        let newBase: IngredientBase = NSEntityDescription.insertNewObjectForEntityForName("IngredientBase", inManagedObjectContext: managedContext()) as IngredientBase
        newBase.name = name
        newBase.information = information
        newBase.type = type.rawValue ?? "other"
        return newBase
    }
    
    class func fromDict(rawIngredient: NSDictionary) -> IngredientBase {
        let name = (rawIngredient.objectForKey("name") as String)
        let description = rawIngredient.objectForKey("description") as String
        let type = IngredientType(rawValue: rawIngredient.objectForKey("type") as String)!
        let base = fromAttributes(name, information: description, type: type)
    
        return base
    }
    
    class func fromJSONFile(filename: String) -> [IngredientBase] {
        let filepath = NSBundle.mainBundle().pathForResource(filename, ofType: "json")
        let jsonData = NSString(contentsOfFile: filepath!, encoding:NSUTF8StringEncoding, error: nil)!
        let ingredientData = jsonData.dataUsingEncoding(NSUTF8StringEncoding)
        var rawIngredients = NSJSONSerialization.JSONObjectWithData(ingredientData!, options: nil, error: nil) as [NSDictionary]
        
        return rawIngredients.map({IngredientBase.fromDict($0)})
    }
    
    class func all() -> [IngredientBase] {
        return managedContext().objects(IngredientBase.self)!
    }
    
    class func nameContainsString(string: String) -> [IngredientBase] {
        let predicate = NSPredicate(format: "name CONTAINS[cd] \"\(string)\"")
        return managedContext().objects(IngredientBase.self, predicate: predicate)!
    }
    
    class func forName(name: String) -> IngredientBase? {
        return managedContext().objectForName(IngredientBase.self, name: name)
    }
}
