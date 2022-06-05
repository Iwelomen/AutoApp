//
//  ExploreViewController.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import UIKit
import Foundation

class ExploreViewController: UIViewController {

    var brandCollectionViewModel = [BrandCollectionViewModel]()
    var mainCollectionViewModel = [MainCollectionViewModel]()
    var cars: [MakeList]?
    var carsAndDetails: [Result]?
    
    var list: CarsListModel?
    
    // MARK: - TIME LABEL TO DISPLAY THE PAGE TITLE
    lazy var titlePageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Explore"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.numberOfLines = 1
        return label
    }()
    // MARK: EXPLORE IMAGE ICON
    lazy var exploreIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Explore-Image-Icon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // MARK: - CART BUTTON ICON FOR NOTIFICATION
    lazy var cartIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Cart-Icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //MARK: // SEARCH BAR CONTROLLER
    let searchBar: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        textField.layer.borderWidth = 0
        textField.placeholder = "🔎 "
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 10
        func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
            textField.placeholder = ""
            return true
          }
        return textField
    }()
    // MARK: - FILTER BUTTON SEARCHBAR
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Filter-Button"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - COLLECTION VIEW
    lazy var brandCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.collectionView?.isPagingEnabled = true
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier: BrandCollectionViewCell.identifier)
        collectionView.isUserInteractionEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return collectionView
    }()
    // MARK: - COLLECTION VIEW
    lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.collectionView?.isPagingEnabled = true
        layout.minimumLineSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray6
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupConstraints()
        populateBrandCollectionView()
        populateMainCollectionView()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - SETUP VIEWS FUNCTION
    func addDefaultViews() {
        view.addSubview(titlePageLabel)
        view.addSubview(exploreIcon)
        view.addSubview(cartIcon)
        view.addSubview(searchButton)
        view.addSubview(mainCollectionView)
        view.addSubview(brandCollectionView)
        view.addSubview(searchBar)
    }
    // MARK: - FUNCTION TO SETUP VIEW CONSTRAINTS
    func setupConstraints() {
        addDefaultViews()
        NSLayoutConstraint.activate([
            //MARK: - CONSTRAINTS FOR EXPLORE ICON
            exploreIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            exploreIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            exploreIcon.heightAnchor.constraint(equalToConstant: 25),
            exploreIcon.widthAnchor.constraint(equalToConstant: 25),
            //MARK: - CONSTRAINTS FOR PAGETITLE LABEL
            titlePageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titlePageLabel.leadingAnchor.constraint(equalTo: exploreIcon.trailingAnchor, constant: 10),
            //MARK: - CONSTRAINTS FOR PAGETITLE LABEL
            cartIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cartIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cartIcon.heightAnchor.constraint(equalToConstant: 30),
            cartIcon.widthAnchor.constraint(equalToConstant: 30),
            //MARK: - CONSTRAINTS FOR SEARCH BAR
            searchBar.topAnchor.constraint(equalTo: exploreIcon.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: exploreIcon.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            searchBar.widthAnchor.constraint(equalToConstant: 50),
            //MARK: - CONSTRAINTS FOR SEARCH BUTTON
            searchButton.topAnchor.constraint(equalTo: searchBar.topAnchor),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.widthAnchor.constraint(equalToConstant: 50),
            //MARK: - BRANDCOLLECTIONVIEW CONSTRAINTS
            brandCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            brandCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            brandCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //MARK: - MAINCOLLECTIONVIEW CONSTRAINTS
            mainCollectionView.topAnchor.constraint(equalTo: brandCollectionView.bottomAnchor, constant: 20),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            
            
        ])
    }

}
