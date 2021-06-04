//
//  PageViewController.swift
//  Landmarks
//
//  Created by Jared  Long on 5/24/21.
//

import Foundation
import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
//    stores an array of Page instances
    var pages: [Page]
//    this is a page binding var
    @Binding var currentPage: Int
    
//    SwiftUI calls makeCoordinator() method before makeUIViewController, to have access to the coordinator object when configuring view controller
    func makeCoordinator() -> Coordinator{
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
            )
//        adding the coordinator as the data source
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
            pageViewController.setViewControllers(
//                controllers initiate only once before updating view controller
                [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
        }
    
//    this class helps with the swipe side to side functionality
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map  { UIHostingController(rootView: $0) }
        }
        
//        These two methods establish the relationships between view controllers, to be able swipe back and forth between them
        
        func pageViewController(
                    _ pageViewController: UIPageViewController,
                    viewControllerBefore viewController: UIViewController) -> UIViewController?
                {
                    guard let index = controllers.firstIndex(of: viewController) else {
                        return nil
                    }
                    if index == 0 {
                        return controllers.last
                    }
                    return controllers[index - 1]
                }

        func pageViewController(
                    _ pageViewController: UIPageViewController,
                    viewControllerAfter viewController: UIViewController) -> UIViewController?
                {
                    guard let index = controllers.firstIndex(of: viewController) else {
                        return nil
                    }
                    if index + 1 == controllers.count {
                        return controllers.first
                    }
                    return controllers[index + 1]
                }
        func pageViewController(
                    _ pageViewController: UIPageViewController,
                    didFinishAnimating finished: Bool,
                    previousViewControllers: [UIViewController],
                    transitionCompleted completed: Bool) {
                    if completed,
                       let visibleViewController = pageViewController.viewControllers?.first,
                       let index = controllers.firstIndex(of: visibleViewController) {
                        parent.currentPage = index
                    }
                }
    }
}
