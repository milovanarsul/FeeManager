//
//  ViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 12.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var welcomeText: UILabel = {
        let label = UILabel()
        label.initialize(text: "Salut, \(FirebaseFireStore.currentUserData.fullName ?? "")", color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 23)!, alignment: .left, lines: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var navigationBar: UIView = {
        let view = NavigationBarView()
        view.tag = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainPageViewController: UIView = {
        let view = UIView()
        FeeManager.embed.mainPageViewController(parent: self, container: view)
        view.layer.cornerRadius = 24
        view.dropShadow = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var feeCreator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var accountViewer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    lazy var modal: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var modalSubView: ModalView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates.main = self
        self.setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        navigationBar.viewWithTag(1)!.dropShadow = true
    }
    
    var welcomeTextTopConstraint: NSLayoutConstraint?
    var mainPageViewControllerHeightConstraint: NSLayoutConstraint?
    var navigationBarWidthConstraint: NSLayoutConstraint?
    var navigationBarHeightConstraint: NSLayoutConstraint?
    var navigationBarBottomConstraint: NSLayoutConstraint?
    var modalBottomConstraint: NSLayoutConstraint?
    
    func setup(){
        view.backgroundColor = .white
        view.addSubviews([welcomeText, mainPageViewController, navigationBar, modal])
        
        welcomeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        welcomeTextTopConstraint = welcomeText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -100)
        welcomeTextTopConstraint!.isActive = true
        welcomeText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        navigationBarWidthConstraint = navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        navigationBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigationBarBottomConstraint = navigationBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100)
        navigationBarHeightConstraint = navigationBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        navigationBarWidthConstraint!.isActive = true
        navigationBarBottomConstraint!.isActive = true
        navigationBarHeightConstraint!.isActive = true
        
        mainPageViewController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainPageViewController.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainPageViewController.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainPageViewControllerHeightConstraint = mainPageViewController.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.89)
        mainPageViewControllerHeightConstraint!.isActive = true
        
        modal.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        modal.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        modal.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        modalBottomConstraint = modal.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 1500)
        modalBottomConstraint!.isActive = true
        
        startupAnimations()
    }
    
    func startupAnimations(){
        welcomeTextTopConstraint!.isActive = false
        welcomeTextTopConstraint = welcomeText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        welcomeTextTopConstraint!.isActive = true
        
        navigationBarBottomConstraint!.isActive = false
        navigationBarBottomConstraint = navigationBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        navigationBarBottomConstraint!.isActive = true
        
        UIView.animate(withDuration: 0.4, delay: 0.3, animations: { [self] in
            welcomeText.layoutIfNeeded()
            navigationBar.layoutIfNeeded()
            view.layoutIfNeeded()
        }, completion: { [self] finished in
            delegates.navigationBarView.startupAnimation()
            
            mainPageViewControllerHeightConstraint!.isActive = false
            mainPageViewControllerHeightConstraint = mainPageViewController.heightAnchor.constraint(equalTo: view.heightAnchor)
            mainPageViewControllerHeightConstraint!.isActive = true
            
            UIView.animate(withDuration: 0.4, delay: 5, animations: { [self] in
                mainPageViewController.layoutIfNeeded()
                view.layoutIfNeeded()
            })
        })
    }
}

extension MainViewController: MainDelegate{
    func addFee(type: AnimationType, data: FeeCreator, completion: @escaping (_ finished: Bool) -> Void){
        navigationBarWidthConstraint!.isActive = false
        navigationBarBottomConstraint!.isActive = false
        navigationBarHeightConstraint!.isActive = false
        
        switch type{
        case .show:
            navigationBarWidthConstraint = navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
            navigationBarBottomConstraint = navigationBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            navigationBarHeightConstraint = navigationBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.15)
        case .hide:
            navigationBarWidthConstraint = navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
            navigationBarBottomConstraint = navigationBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
            navigationBarHeightConstraint = navigationBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        }
        
        navigationBarWidthConstraint!.isActive = true
        navigationBarBottomConstraint!.isActive = true
        navigationBarHeightConstraint!.isActive = true
        
        UIView.animate(withDuration: 0.5, animations: {
            self.navigationBar.layoutIfNeeded()
            self.view.layoutIfNeeded()
        }, completion: { finished in
            if type == .show{
                FeeManager.embed.feeCreatorViewController(parent: self, container: self.feeCreator, data: data)
                self.feeCreator.isHidden = false
                delegates.navigationBarView.addView(view: self.feeCreator)
                completion(true)
            } else {
                self.feeCreator.isHidden = true
            }
        })
    }
    
    func accountView(type: AnimationType){
        navigationBarWidthConstraint!.isActive = false
        navigationBarBottomConstraint!.isActive = false
        navigationBarHeightConstraint!.isActive = false
        
        switch type{
        case .show:
            navigationBarWidthConstraint = navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
            navigationBarBottomConstraint = navigationBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            navigationBarHeightConstraint = navigationBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65)
        case .hide:
            navigationBarWidthConstraint = navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
            navigationBarBottomConstraint = navigationBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
            navigationBarHeightConstraint = navigationBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        }
        
        navigationBarWidthConstraint!.isActive = true
        navigationBarBottomConstraint!.isActive = true
        navigationBarHeightConstraint!.isActive = true
        
        UIView.animate(withDuration: 0.5, animations: {
            self.navigationBar.layoutIfNeeded()
            self.view.layoutIfNeeded()
        }, completion: { finished in
            if type == .show{
                FeeManager.embed.accountViewerViewController(parent: self, container: self.accountViewer)
                self.accountViewer.isHidden = false
                delegates.navigationBarView.addView(view: self.accountViewer)
            } else {
                self.accountViewer.isHidden = true
            }
        })
    }
    
    func presentPickerView(pickerViewController: UIViewController? = nil, animationType: AnimationType){
        modalBottomConstraint!.isActive = false
        
        switch animationType {
        case .show:
            modalSubView = ModalView(content: pickerViewController!, parent: self)
            modalSubView!.translatesAutoresizingMaskIntoConstraints = false
            modal.addSubview(modalSubView!)
            
            modalSubView!.centerXAnchor.constraint(equalTo: modal.centerXAnchor).isActive = true
            modalSubView!.bottomAnchor.constraint(equalTo: modal.bottomAnchor).isActive = true
            modalSubView!.widthAnchor.constraint(equalTo: modal.widthAnchor).isActive = true
            modalSubView!.heightAnchor.constraint(equalTo: modal.heightAnchor, multiplier: 0.35).isActive = true
            
            modalBottomConstraint = modal.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        case .hide:
            modalBottomConstraint = modal.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 1500)
        }
        
        modalBottomConstraint!.isActive = true
        
        UIView.animate(withDuration: 0.4, animations: { [self] in
            modal.layoutIfNeeded()
            view.layoutIfNeeded()
        }, completion: {[self] finished in
            if animationType == .hide{
                modalSubView!.removeFromSuperview()
                modalSubView = nil
            }
        })
    }
    
    func presentFee(fee: UIViewController){
        fee.transitioningDelegate = self
        if let sheet = fee.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 24
        }
        
        present(fee, animated: true, completion: nil)
    }
    
    func goToOnboarding(){
        defaults.set(false, forKey: "notFirstLaunch")
        presentView(view: LaunchViewController(), animated: true, presentationStyle: .fullScreen, dismissPrevious: false)
        view.layoutIfNeeded()
        removeFromParent()
    }
}

extension MainViewController: UIViewControllerTransitioningDelegate{
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if dismissed is PresentFeeViewController{
            delegates.home.reloadTableView()
        }
        return nil
    }
}
