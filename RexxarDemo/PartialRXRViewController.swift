//
//  PartialRexxarViewController.swift
//  RexxarDemo
//
//  Created by GUO Lin on 5/19/16.
//  Copyright © 2016 Douban.Inc. All rights reserved.
//

import UIKit

class PartialRexxarViewController: UIViewController {

  var rexxarURI: URL
  var childRexxarViewController: RXRViewController

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(URI: URL) {
    rexxarURI = URI
    childRexxarViewController = FullRXRViewController(uri: rexxarURI)

    super.init(nibName: nil, bundle: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.lightGray
    childRexxarViewController.view.backgroundColor = UIColor.white

    addChild(childRexxarViewController)
    childRexxarViewController.view.frame = CGRect(x: 0,
                                                  y: 100,
                                                  width: view.frame.size.width,
                                                  height: 500)
    view.addSubview(childRexxarViewController.view)
    childRexxarViewController.didMove(toParent: self)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    childRexxarViewController.beginAppearanceTransition(true, animated: animated)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    childRexxarViewController.endAppearanceTransition()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    childRexxarViewController.beginAppearanceTransition(false, animated: animated)
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    childRexxarViewController.endAppearanceTransition()
  }

}
