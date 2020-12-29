//
//  PagerViewCell.swift
//  PagingViewHB
//
//  Created by Habib Durodola on 2020-12-23.
//

import UIKit

class PagerViewCell : UICollectionViewCell  {


    var page : Page? {
        didSet {
            guard let unwrappedPage = page else {
                return
            }
            centreImageView.image = UIImage(named: unwrappedPage.imageUrlString)?.withRenderingMode(.alwaysOriginal)
            middleText.text = unwrappedPage.headerString
        }
    }

    //MARK:- UIVIEWS
    var centreImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "bear_first")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var middleText : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 10
        label.textAlignment = .center
        return label

    }()

    var prevBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("PREV", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .red
        return btn
    }()

    var nextBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("NEXT", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .red
        return btn
    }()

    var pageDots : UIPageControl = {
        let dots = UIPageControl()
        dots.currentPage = 0
        dots.numberOfPages = 5
        dots.currentPageIndicatorTintColor = .green
        dots.translatesAutoresizingMaskIntoConstraints = false
        dots.pageIndicatorTintColor = .red
        dots.backgroundColor = .darkGray
        return dots
    }()

    func setupCellView(){
        addSubview(centreImageView)
        addSubview(middleText)
//        addSubview(prevBtn)
//        addSubview(pageDots)
//        addSubview(nextBtn)
        setupAutoContrainst()
        setLabelText()
    }

    fileprivate func setupAutoContrainst(){
        var constraints = [NSLayoutConstraint]()

        constraints += [NSLayoutConstraint.init(item: centreImageView, attribute: .centerY, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .centerY, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: centreImageView, attribute: .centerX, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: centreImageView, attribute: .height, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .height, multiplier: 1/8, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: centreImageView, attribute: .width, relatedBy: .equal, toItem: centreImageView, attribute: .height, multiplier: 1.0, constant: 0.0)]
//        NSLayoutConstraint.activate([centreImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
//                                     centreImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//                                     centreImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/8),
//                                     centreImageView.widthAnchor.constraint(equalTo: centreImageView.widthAnchor)
//        ])


        constraints += [NSLayoutConstraint.init(item: middleText, attribute: .top, relatedBy: .equal, toItem: centreImageView, attribute: .bottom, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: middleText, attribute: .centerX, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .centerX, multiplier: 1.0, constant: 0.0)]

//        NSLayoutConstraint.activate([
//            middleText.centerXAnchor.constraint(equalTo: centerXAnchor),
//            middleText.centerYAnchor.constraint(equalTo: centerYAnchor)
//
//        ])

//        var constraints = [NSLayoutConstraint]()
//        let prevNextView: [UIView] = [prevBtn,pageDots, nextBtn]
//        let fullStackView = UIStackView.init(arrangedSubviews: prevNextView)
//        fullStackView.axis = .horizontal
//        fullStackView.alignment = .fill
//        fullStackView.distribution = .fill
//        fullStackView.translatesAutoresizingMaskIntoConstraints = false

     //  addSubview(fullStackView)

//        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
//        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
//        constraints += [NSLayoutConstraint.init(item: fullStackView, attribute: .bottom, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]
//
//        // pager dot width
//
//        constraints += [NSLayoutConstraint.init(item: pageDots, attribute: .width, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .width, multiplier: 1/2, constant: 0.0)]
//        constraints += [NSLayoutConstraint.init(item: prevBtn, attribute: .width, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .width, multiplier: 1/4, constant: 0.0)]
//        constraints += [NSLayoutConstraint.init(item: nextBtn, attribute: .width, relatedBy: .equal, toItem: prevBtn, attribute: .width, multiplier: 1.0, constant: 0.0)]
//
       addConstraints(constraints)
    }

    func setLabelText(){
        let quote = "Haters gonna hate"
        let font = UIFont.systemFont(ofSize: 10)
        let attributes = [NSAttributedString.Key.font: font]
        let attributedQuote = NSAttributedString(string: quote, attributes: attributes)
        let attributedQuoteNNNN = NSAttributedString(string: "\n\n\nThis is appended", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue , NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)])
        let combination = NSMutableAttributedString()
        combination.append(attributedQuote)
        combination.append(attributedQuoteNNNN)

        middleText.attributedText = combination
    }


    //MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellView()
        backgroundColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




}
