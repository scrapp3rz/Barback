// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift

import Barback
import UIKit

struct R {
    static func validate() {
        storyboard.main.validateImages()
        storyboard.main.validateViewControllers()
        storyboard.iPad.validateImages()
        storyboard.iPad.validateViewControllers()
        storyboard.launchScreen.validateImages()
        storyboard.launchScreen.validateViewControllers()
    }
    
    struct image {
        static var appIcon: UIImage? { return UIImage(named: "AppIcon") }
        static var teenyappicon: UIImage? { return UIImage(named: "teenyappicon") }
    }
    
    struct nib {
        
    }
    
    struct reuseIdentifier {
        static var brandCell: ReuseIdentifier<UITableViewCell> { return ReuseIdentifier(identifier: "brandCell") }
        static var drinkCell: ReuseIdentifier<UITableViewCell> { return ReuseIdentifier(identifier: "drinkCell") }
        static var ingredientCell: ReuseIdentifier<UITableViewCell> { return ReuseIdentifier(identifier: "ingredientCell") }
        static var recipeCell: ReuseIdentifier<UITableViewCell> { return ReuseIdentifier(identifier: "recipeCell") }
        static var similarCell: ReuseIdentifier<UITableViewCell> { return ReuseIdentifier(identifier: "similarCell") }
    }
    
    struct segue {
        static var ingredientDetail: String { return "ingredientDetail" }
        static var recipeDetail: String { return "recipeDetail" }
        static var similarRecipe: String { return "similarRecipe" }
    }
    
    struct storyboard {
        struct iPad {
            static var ingredientDetailViewController: Barback.IngredientDetailViewController? { return instance.instantiateViewControllerWithIdentifier("IngredientDetailViewController") as? Barback.IngredientDetailViewController }
            static var initialViewController: UISplitViewController? { return instance.instantiateInitialViewController() as? UISplitViewController }
            static var instance: UIStoryboard { return UIStoryboard(name: "iPad", bundle: nil) }
            static var recipeDetail: Barback.RecipeDetailViewController? { return instance.instantiateViewControllerWithIdentifier("recipeDetail") as? Barback.RecipeDetailViewController }
            
            static func validateImages() {
                
            }
            
            static func validateViewControllers() {
                assert(recipeDetail != nil, "[R.swift] ViewController with identifier 'recipeDetail' could not be loaded from storyboard 'iPad' as 'Barback.RecipeDetailViewController'.")
                assert(ingredientDetailViewController != nil, "[R.swift] ViewController with identifier 'ingredientDetailViewController' could not be loaded from storyboard 'iPad' as 'Barback.IngredientDetailViewController'.")
            }
        }
        
        struct launchScreen {
            static var initialViewController: UIViewController? { return instance.instantiateInitialViewController()! as UIViewController }
            static var instance: UIStoryboard { return UIStoryboard(name: "LaunchScreen", bundle: nil) }
            
            static func validateImages() {
                
            }
            
            static func validateViewControllers() {
                
            }
        }
        
        struct main {
            static var ingredientDetail: Barback.IngredientDetailViewController? { return instance.instantiateViewControllerWithIdentifier("ingredientDetail") as? Barback.IngredientDetailViewController }
            static var initialViewController: UITabBarController? { return instance.instantiateInitialViewController() as? UITabBarController }
            static var instance: UIStoryboard { return UIStoryboard(name: "Main", bundle: nil) }
            static var recipeDetail: Barback.RecipeDetailViewController? { return instance.instantiateViewControllerWithIdentifier("recipeDetail") as? Barback.RecipeDetailViewController }
            static var searchRecipeListViewController: Barback.SearchRecipeListViewController? { return instance.instantiateViewControllerWithIdentifier("SearchRecipeListViewController") as? Barback.SearchRecipeListViewController }
            
            static func validateImages() {
                
            }
            
            static func validateViewControllers() {
                assert(recipeDetail != nil, "[R.swift] ViewController with identifier 'recipeDetail' could not be loaded from storyboard 'Main' as 'Barback.RecipeDetailViewController'.")
                assert(ingredientDetail != nil, "[R.swift] ViewController with identifier 'ingredientDetailViewController' could not be loaded from storyboard 'Main' as 'Barback.IngredientDetailViewController'.")
                assert(searchRecipeListViewController != nil, "[R.swift] ViewController with identifier 'searchRecipeListViewController' could not be loaded from storyboard 'Main' as 'Barback.SearchRecipeListViewController'.")
            }
        }
    }
}

struct _R {
    struct nib {
        
    }
}

struct ReuseIdentifier<T>: CustomStringConvertible {
    let identifier: String
    
    var description: String { return identifier }
}

protocol NibResource {
    var instance: UINib { get }
}

protocol Reusable {
    typealias T
    
    var reuseIdentifier: ReuseIdentifier<T> { get }
}

extension UITableView {
    func dequeueReusableCellWithIdentifier<T : UITableViewCell>(identifier: ReuseIdentifier<T>, forIndexPath indexPath: NSIndexPath?) -> T? {
        if let indexPath = indexPath {
            return dequeueReusableCellWithIdentifier(identifier.identifier, forIndexPath: indexPath) as? T
        }
        return dequeueReusableCellWithIdentifier(identifier.identifier) as? T
    }
    
    func dequeueReusableCellWithIdentifier<T : UITableViewCell>(identifier: ReuseIdentifier<T>) -> T? {
        return dequeueReusableCellWithIdentifier(identifier.identifier) as? T
    }
    
    func dequeueReusableHeaderFooterViewWithIdentifier<T : UITableViewHeaderFooterView>(identifier: ReuseIdentifier<T>) -> T? {
        return dequeueReusableHeaderFooterViewWithIdentifier(identifier.identifier) as? T
    }
    
    func registerNib<T: NibResource where T: Reusable, T.T: UITableViewCell>(nibResource: T) {
        registerNib(nibResource.instance, forCellReuseIdentifier: nibResource.reuseIdentifier.identifier)
    }
    
    func registerNibForHeaderFooterView<T: NibResource where T: Reusable, T.T: UIView>(nibResource: T) {
        registerNib(nibResource.instance, forHeaderFooterViewReuseIdentifier: nibResource.reuseIdentifier.identifier)
    }
    
    func registerNibs<T: NibResource where T: Reusable, T.T: UITableViewCell>(nibResources: [T]) {
        nibResources.map(registerNib)
    }
}

extension UICollectionView {
    func dequeueReusableCellWithReuseIdentifier<T: UICollectionViewCell>(identifier: ReuseIdentifier<T>, forIndexPath indexPath: NSIndexPath) -> T? {
        return dequeueReusableCellWithReuseIdentifier(identifier.identifier, forIndexPath: indexPath) as? T
    }
    
    func dequeueReusableSupplementaryViewOfKind<T: UICollectionReusableView>(elementKind: String, withReuseIdentifier identifier: ReuseIdentifier<T>, forIndexPath indexPath: NSIndexPath) -> T? {
        return dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: identifier.identifier, forIndexPath: indexPath) as? T
    }
    
    func registerNib<T: NibResource where T: Reusable, T.T: UICollectionViewCell>(nibResource: T) {
        registerNib(nibResource.instance, forCellWithReuseIdentifier: nibResource.reuseIdentifier.identifier)
    }
    
    func registerNib<T: NibResource where T: Reusable, T.T: UICollectionReusableView>(nibResource: T, forSupplementaryViewOfKind kind: String) {
        registerNib(nibResource.instance, forSupplementaryViewOfKind: kind, withReuseIdentifier: nibResource.reuseIdentifier.identifier)
    }
    
    func registerNibs<T: NibResource where T: Reusable, T.T: UICollectionViewCell>(nibResources: [T]) {
        nibResources.map(registerNib)
    }
    
    func registerNibs<T: NibResource where T: Reusable, T.T: UICollectionReusableView>(nibResources: [T], forSupplementaryViewOfKind kind: String) {
        nibResources.map { self.registerNib($0, forSupplementaryViewOfKind: kind) }
    }
}