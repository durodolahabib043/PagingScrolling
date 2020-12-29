//
//  ViewController.swift
//  PagingViewHB
//
//  Created by Habib Durodola on 2020-12-20.
//

import UIKit

class ViewController: UICollectionViewController {

    // MARK:- CONSTANTS

    let cellId = "cellId"

    let pageArray : [Page] = [Page(imageUrlString: "bear_first", headerString: "This is bear first ", contentString: "This is the content of it") ,
                              Page(imageUrlString: "heart_second", headerString: "This is bear second ", contentString: "This is the content of it  second"),
                              Page(imageUrlString: "leaf_third", headerString: "This is bear leaf_third ", contentString: "This is the leaf_third of it ") ]


    //MARK:- VIEWS
    var prevBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("PREV", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return btn
    }()
    var nextBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("NEXT", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return btn
    }()

    lazy  var pageDots : UIPageControl = {
        let dots = UIPageControl()
        dots.currentPage = 0
        dots.numberOfPages = pageArray.count
        dots.currentPageIndicatorTintColor = .green
        dots.translatesAutoresizingMaskIntoConstraints = false
        dots.pageIndicatorTintColor = .red
        dots.backgroundColor = .darkGray
        return dots
    }()

    func setupPagerView(){
        view.addSubview(prevBtn)
        view.addSubview(pageDots)
        view.addSubview(nextBtn)
        //        setupAutoContrainst()
        //        setLabelText()
    }


    //MARK:- VIEW DIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .red
        // Do any additional setup after loading the view.
        setupNavigation()
        setupCollectionView()
        setupPagerView()
        setupAutoContrainst()
    }



    //MARK:- SETUP METHODS

    @objc func handleNext(){
        print("Handle Next")

        let nextNN = min(pageDots.currentPage + 1 , pageArray.count - 1)
        let indexPath = IndexPath(item: nextNN, section: 0)
        pageDots.currentPage = nextNN
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        // collectionView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    }
    @objc func handlePrev(){
        print("Handle Next")

        let nextNN = max(pageDots.currentPage - 1 , 0)
        let indexPath = IndexPath(item: nextNN, section: 0)
        pageDots.currentPage = nextNN
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        // collectionView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    }

    func setupCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.register(PagerViewCell.self, forCellWithReuseIdentifier: cellId)

        //  collectionView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    }

    fileprivate func  setupNavigation() {
        navigationItem.title = "Paging"
    }
    fileprivate func setupAutoContrainst(){

        var constraints = [NSLayoutConstraint]()
        let prevNextView: [UIView] = [prevBtn,pageDots,nextBtn]
        let fullStackView = UIStackView.init(arrangedSubviews: prevNextView)
        fullStackView.axis = .horizontal
        fullStackView.alignment = .fill
        fullStackView.distribution = .fill
        fullStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(fullStackView)

        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .height, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .height, multiplier: 1/8, constant: 0.0)]

        // pager dot width

        constraints += [NSLayoutConstraint.init(item: pageDots, attribute: .width, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .width, multiplier: 1/2, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: prevBtn, attribute: .width, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .width, multiplier: 1/4, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: nextBtn, attribute: .width, relatedBy: .equal, toItem: prevBtn, attribute: .width, multiplier: 1.0, constant: 0.0)]

        view.addConstraints(constraints)
    }


    //MARK:- Collection Delegates

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PagerViewCell
        cell.page = pageArray[indexPath.item]
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageArray.count
    }
}


extension ViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.width, height: 400)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

