//
//  TextPageViewController.swift
//  PlainOldFeatureModule
//
//  Created by Brice Pollock on 6/13/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

import Foundation

class TextPageViewController: UIViewController {
    var presenter: TextPagePresenter?
    var eventHandler: TextPageEventInterface?
    var viewModel: TextPageViewModel?

    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: Life Cycle
    
    class func createInstance(flowController flowController: FlowController, featureUUID: String) -> TextPageViewController {
        let moduleStoryboard = UIStoryboard(name: "TextPageViewController", bundle: NSBundle(forClass: TextPageViewController.self))
        let newViewControllerInstance = moduleStoryboard.instantiateViewControllerWithIdentifier("TextPageViewController") as! TextPageViewController
        newViewControllerInstance.presenter = TextPagePresenter(flowController: flowController, featureUUID: featureUUID)
        return newViewControllerInstance
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = presenter?.viewModel
        eventHandler = presenter
        loadViewData(presenter?.viewData)
        self.view.backgroundColor = UIColor.grayColor()
    }
    
    // MARK: Static View Data Access
    
    func loadViewData(viewData: TextPageViewData?) {
        if let viewData = viewData {
            descriptionLabel.text = viewData.descriptionText
        }
    }
}