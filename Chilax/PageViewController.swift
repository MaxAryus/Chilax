//
//  PageViewController.swift
//  Chilax
//
//  Created by Max Aryus on 14.04.20.
//  Copyright © 2020 Max Aryus. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    
    var viewControllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            // retrieves the index of the currently displayed view contrioller
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            // shows the last view of controller when the user swipes back from the first view contriller
            if index == 0 {
                return parent.viewControllers.last
            }
            
            // shows the view controller before the currently displayed view controller
            return parent.viewControllers[index - 1]
            
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            // retrieves the index of the currently displayed vie controller
            guard let index = parent.viewControllers.firstIndex(of: viewController) else {
                return nil
            }
            
            // shows the first view controller when the user swipes futher from the last view controller
            if index + 1 == parent.viewControllers.count {
                return parent.viewControllers.first
            }
            
            // shows the view controller after the currently displayed view controller
            return parent.viewControllers[index + 1]
            
        }
    }
}
