//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Court Kizer on 5/29/15.
//  Copyright (c) 2015 Court Kizer. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var exploreTab: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var trendingViewController : UIViewController!
    var profileViewController : UIViewController!
    var isPresenting : Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as! UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as! UIViewController
        profileViewController = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController") as! UIViewController
    
        // Initial view will be Trending
        containerView.addSubview(trendingViewController.view)
    }
    
    // Home Nav Button

    @IBAction func onHomeButton(sender: AnyObject) {
        
        // Discard any existing View Controllers 
        
        searchViewController.view.removeFromSuperview()
        trendingViewController.view.removeFromSuperview()
        profileViewController.view.removeFromSuperview()
        
        containerView.addSubview(homeViewController.view)
        
        homeButton.selected = true
        profileButton.selected = false
        searchButton.selected = false
        trendingButton.selected = false

        
    }
    
    // Search Nav Button

    @IBAction func onSearchButton(sender: AnyObject) {
        
        // Discard any existing View Controllers

        homeViewController.view.removeFromSuperview()
        trendingViewController.view.removeFromSuperview()
        profileViewController.view.removeFromSuperview()
        
        self.addChildViewController(searchViewController)
        containerView.addSubview(searchViewController.view)
        searchViewController.didMoveToParentViewController(self)
        
        searchButton.selected = true
        homeButton.selected = false
        trendingButton.selected = false
        profileButton.selected = false

    }
    
    // Trending Nav Button

    @IBAction func onTrendingButton(sender: AnyObject) {
        
        // Discard any existing View Controllers

        homeViewController.view.removeFromSuperview()
        searchViewController.view.removeFromSuperview()
        profileViewController.view.removeFromSuperview()

        containerView.addSubview(trendingViewController.view)
        
        trendingButton.selected = true
        homeButton.selected = false
        searchButton.selected = false
        profileButton.selected = false
        
    }
    
    // Profile Nav Button

    @IBAction func onProfileButton(sender: AnyObject) {
        
        // Discard any existing View Controllers

        homeViewController.view.removeFromSuperview()
        searchViewController.view.removeFromSuperview()
        trendingViewController.view.removeFromSuperview()
        
        containerView.addSubview(profileViewController.view)
        
        profileButton.selected = true
        homeButton.selected = false
        searchButton.selected = false
        trendingButton.selected = false
        
    }
    
    @IBAction func onComposeButton(sender: AnyObject) {
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.performSegueWithIdentifier("composeSegue", sender: self)
        })
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var destinationViewController = segue.destinationViewController as! UIViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = destinationViewController as! ComposeViewController
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        }
    

}
