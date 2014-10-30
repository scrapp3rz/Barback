//
//  ShoppingListViewController.swift
//  BarbackSwift
//
//  Created by Justin Duke on 6/19/14.
//  Copyright (c) 2014 Justin Duke. All rights reserved.
//

import UIKit

class ShoppingListViewController: RecipeListViewController {

    var ingredients: [IngredientBase] = [IngredientBase]() {
    willSet(newIngredients) {
        ingredientTypes = IngredientType.allValues.filter({
            (type: IngredientType) -> Bool in
            return (
                newIngredients.filter({ IngredientType.fromRaw($0.type) == type }).count > 0
            )
        })
    }
    }
    var ingredientTypes: [IngredientType] = [IngredientType]()
    
    override var viewTitle: String {
        get {
            return "Shopping List"
        }
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    func setIngredients(ingredients: [IngredientBase]) {
        self.ingredients = ingredients
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create ourselves a back button.
        let backButton = UIBarButtonItem(title: "Back", style:UIBarButtonItemStyle.Bordered, target: self, action: "goBack")
        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: UIFont.primaryFont(), size: 16)], forState: UIControlState.Normal)
        navigationItem.leftBarButtonItem = backButton
        
        // Preserve selection of table elements.
        clearsSelectionOnViewWillAppear = false
    }
    
    func goBack() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return ingredientTypes.count
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        let ingredientType = ingredientTypes[section]
        let ingredientsForType = ingredients.filter({IngredientType.fromRaw($0.type) == ingredientType})
        return ingredientsForType.count
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        var sectionLabel = UILabel()
        sectionLabel.frame = CGRectMake(20, 0, 320, 40)
        sectionLabel.font = UIFont(name: UIFont.heavyFont(), size: 16)
        sectionLabel.textAlignment = NSTextAlignment.Left
        sectionLabel.textColor = UIColor.lightColor()
        
        sectionLabel.text = ingredientTypes[section].pluralize().capitalizedString
        
        var headerView = UIView()
        headerView.addSubview(sectionLabel)
        
        return headerView
    }
    
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String {
        return ingredientTypes[section].toRaw()
    }
    
    func ingredientForIndexPath(indexPath: NSIndexPath) -> IngredientBase {
        let ingredientType = ingredientTypes[indexPath.section]
        let ingredientsForType = ingredients.filter({IngredientType.fromRaw($0.type) == ingredientType})
        return ingredientsForType[indexPath.row]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "shoppingCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        if !(cell != nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdentifier)
        }
        
        cell!.textLabel?.text = ingredientForIndexPath(indexPath).name
        cell!.stylePrimary()
        
        return cell!
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("IngredientDetailViewController") as IngredientDetailViewController
        controller.setIngredient(ingredientForIndexPath(indexPath))
        navigationController?.pushViewController(controller, animated: true)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
