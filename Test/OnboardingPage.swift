//
//  OnboardingPage.swift
//  Test
//
//  Created by Donald Nguyen on 9/22/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import UIKit

class OnboardingPage: UIPageViewController {
    
    func getStepZero() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "zero")
    }
    
    func getStepOne() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "one")
    }
    
    func getStepTwo() -> UIViewController {
        return storyboard!.instantiateViewController(withIdentifier: "two")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        
        
        
         let pageController = UIPageControl.appearance()
         pageController.pageIndicatorTintColor = UIColor.lightGray
         pageController.currentPageIndicatorTintColor = UIColor.yellow
         pageController.backgroundColor = UIColor.clear
 

        dataSource = self
        setViewControllers([getStepZero()], direction: .forward, animated: false, completion: nil)
        
        
        //Note: You’re not setting the background color on the dots, but on the Page View Controller.  With the built-in implementation, pages no longer take up the full height of the screen — rather, Page View Controller exposes a region of itself on the bottom dedicated to the Page Control.
        
    }
}

extension OnboardingPage: UIPageViewControllerDataSource {
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.restorationIdentifier == "two" {
            return getStepOne()
        } else if viewController.restorationIdentifier == "one" {
            return getStepZero()
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if viewController.restorationIdentifier == "zero" {
            return getStepOne()
        } else if viewController.restorationIdentifier == "one" {
            return getStepTwo()
        } else {
            return nil
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    //clear background
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
        
    }

}

