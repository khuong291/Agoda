//
//  HomePageViewController.swift
//  Agoda
//
//  Created by Khuong Pham on 6/7/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import UIKit

class HomePageViewController: UIPageViewController {

    var pageControl: UIPageControl!
    var pageCount: Int {
        get {
            return datas.count
        }
    }
    var datas: [Place]!

    override func viewDidLoad() {
        super.viewDidLoad()

        datas = [Place]()
        let names = ["Santorini", "Maldives", "Hallstatt Village", "Taiwan", "Bali"]
        let images = ["santorini", "maldives", "hallstatt", "taiwan", "bali"].map{ UIImage(named: $0)! }
        for i in 0..<names.count {
            let data = Place()
            data.name = names[i]
            data.image = images[i]
            datas.append(data)
        }

        setViewControllers([vcForPage(0)], direction: .Forward, animated: true, completion: nil)
        dataSource = self

        let pageControlHeight: CGFloat = 30
        pageControl = UIPageControl(frame: CGRect(x: 20, y: CGRectGetHeight(view.frame) - pageControlHeight, width: 150, height: pageControlHeight))
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = 0
        pageControl.transform = CGAffineTransformMakeScale(2.0, 2.0)
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()

        view.addSubview(pageControl)

        delegate = self
    }

    private func vcForPage(inPage: Int) -> ViewController {
        let vc = storyboard!.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        let page = min(max(0, inPage), pageCount-1)
        vc.page = page

        if page == 0 {
            vc.name = datas[0].name
            vc.image = datas[0].image
        } else if page == 1 {
            vc.name = datas[1].name
            vc.image = datas[1].image
        } else if page == 2 {
            vc.name = datas[2].name
            vc.image = datas[2].image
        } else if page == 3 {
            vc.name = datas[3].name
            vc.image = datas[3].image
        } else if page == 4 {
            vc.name = datas[4].name
            vc.image = datas[4].image
        }
        
        return vc
    }
}

extension HomePageViewController: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let vc = viewController as? ViewController where vc.page < pageCount - 1 {
            return vcForPage(vc.page + 1)
        }
        return nil
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let vc = viewController as? ViewController where vc.page > 0 {
            return vcForPage(vc.page - 1)
        }
        return nil
    }
}

extension HomePageViewController: UIPageViewControllerDelegate {
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let vc = pageViewController.viewControllers![0] as? ViewController {
            pageControl.currentPage = vc.page
        }
    }
}
