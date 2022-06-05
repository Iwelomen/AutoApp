//
//  ProductDetailsViewController.swift
//  Cars-App
//
//  Created by Obami on 6/4/22.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    var result : Result?
    
    // MARK: - UI labels, views, buttons and image views
    lazy var titlePageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Product"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.numberOfLines = 1
        return label
    }()
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var cartIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Cart-Icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Product Name"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        label.numberOfLines = 1
        return label
    }()
    lazy var transmissionTextView: UILabel = {
        let textView = UILabel()
        textView.text = "Product Name"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.font = UIFont(name: "NunitoSans-Bold", size: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let yearTextView: UILabel = {
        let textView = UILabel()
        textView.text = "year"
        textView.font = UIFont.boldSystemFont(ofSize: 13)
        textView.font = UIFont(name: "NunitoSans-Regular", size: 13)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let fuelTypeLabel: UILabel = {
        let textView = UILabel()
        textView.text = "Petrol"
        textView.font = UIFont(name: "NunitoSans-Regular", size: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let cityTextView: UILabel = {
        let textView = UILabel()
        textView.text = "$111.67"
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.font = UIFont(name: "NunitoSans-Semibold", size: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let productImageV: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.97, alpha: 1.00)
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 20
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let productDetailsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let interiorColorTextView: UILabel = {
        let textView = UILabel()
        textView.text = "interior color"
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.font = UIFont(name: "NunitoSans-Semibold", size: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let purchaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var purchaseBigButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.setTitleColor(.yellow, for: .normal)
        button.setTitle("Add to cart", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    lazy var marketPlacePriceLabel: UILabel = {
        let textView = UILabel()
        textView.text = "4800000"
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.font = UIFont(name: "NunitoSans-Semibold", size: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
        
    }()
    lazy var engineTypeLabel: UILabel = {
        let textView = UILabel()
        textView.text = "EngineType"
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.font = UIFont(name: "NunitoSans-Semibold", size: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
        
    }()
    lazy var mileageLabel: UILabel = {
        let textView = UILabel()
        textView.text = "mileage"
        textView.font = UIFont.boldSystemFont(ofSize: 14)
        textView.font = UIFont(name: "NunitoSans-Semibold", size: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    var id = "CT7utxnNU"
    var productName = ""
    var transmission = ""
    var productPrice = ""
    var productImage = UIImage()
    
    // MARK: - Methods
    func configure(with urlString: String){
        guard let url = URL(string: urlString) else {
            return
        }
        if urlString.contains("png"){
//
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return}
                DispatchQueue.main.async {
                    guard let image: UIImage = UIImage(data: data) else {
                        return
                    }
                    self.productImageV.image = UIImage(data: data)
                    guard let img  = UIImage(data: data) else { return }
                    self.productImageV.image = img
                }
            }.resume()

        } else {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return}
                DispatchQueue.main.async {
                    self.productImageV.image = UIImage(data: data)
                }
            }.resume()
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data , error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.productImageV.image = image ?? UIImage(systemName: "car")
            }
        }.resume()
    }
    
    func setUpData() {
        let query: String? = UserDefaults.standard.string(forKey: "id")
        let urlString = "https://api-prod.autochek.africa/v1/inventory/car/\(query ?? "")"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [ weak self ] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode(MediaResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self?.transmissionTextView.text = jsonResult.transmission
                    self?.yearTextView.text = "Year: \(jsonResult.year)"
                    self?.engineTypeLabel.text = "\(jsonResult.engineType)"
                    self?.mileageLabel.text = "\(jsonResult.mileage)\(jsonResult.mileageUnit)"
                    self?.fuelTypeLabel.text = jsonResult.fuelType
                    self?.marketPlacePriceLabel.text = "\(jsonResult.marketplacePrice) naira"
                    self?.interiorColorTextView.text = "Interior color: " + jsonResult.interiorColor
                    self?.cityTextView.text = jsonResult.city
                    
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        productNameLabel.text = productName
        transmissionTextView.text = productName
        transmissionTextView.text = transmission
        cityTextView.text = productPrice
        navigationController?.navigationBar.isHidden = true
        setupConstraints()
        setUpData()
    }
    // MARK: - SETUP VIEWS FUNCTION
    func addDefaultViews() {
        view.addSubview(titlePageLabel)
        view.addSubview(backButton)
        view.addSubview(cartIcon)
        view.addSubview(productNameLabel)
        view.addSubview(productDetailsView)
        view.addSubview(purchaseView)
        purchaseView.addSubview(purchaseBigButton)
        purchaseView.addSubview(interiorColorTextView)
        purchaseView.addSubview(engineTypeLabel)
        productDetailsView.addSubview(transmissionTextView)
        productDetailsView.addSubview(productImageV)
        productDetailsView.addSubview(fuelTypeLabel)
        productDetailsView.addSubview(cityTextView)
        productDetailsView.addSubview(yearTextView)
        productDetailsView.addSubview(marketPlacePriceLabel)
        productDetailsView.addSubview(mileageLabel)
    }
    
    @objc func didTapTopBackArrowButton() {
        dismiss(animated: false)
    }
    // MARK: - FUNCTION TO SETUP VIEW CONSTRAINTS
    func setupConstraints() {
        addDefaultViews()
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            
            titlePageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titlePageLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 10),
            
            cartIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cartIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cartIcon.heightAnchor.constraint(equalToConstant: 30),
            cartIcon.widthAnchor.constraint(equalToConstant: 30),
            
            productNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productNameLabel.topAnchor.constraint(equalTo: titlePageLabel.bottomAnchor, constant: 30),
            
            productDetailsView.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 30),
            productDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            productDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
            productImageV.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 60),
            productImageV.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 20),
            productImageV.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
            productImageV.bottomAnchor.constraint(equalTo: productDetailsView.bottomAnchor, constant: -150),
            
            transmissionTextView.topAnchor.constraint(equalTo: productImageV.bottomAnchor, constant: 40),
            transmissionTextView.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 20),
            
            yearTextView.topAnchor.constraint(equalTo: transmissionTextView.bottomAnchor, constant: 10),
            yearTextView.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 20),
            
            cityTextView.topAnchor.constraint(equalTo: yearTextView.bottomAnchor, constant: 10),
            cityTextView.leadingAnchor.constraint(equalTo: productDetailsView.leadingAnchor, constant: 20),
            
            fuelTypeLabel.topAnchor.constraint(equalTo: productImageV.bottomAnchor, constant: 40),
            fuelTypeLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
            
            marketPlacePriceLabel.topAnchor.constraint(equalTo: fuelTypeLabel.bottomAnchor, constant: 10),
            marketPlacePriceLabel.trailingAnchor.constraint(equalTo: productDetailsView.trailingAnchor, constant: -20),
            
            mileageLabel.topAnchor.constraint(equalTo: marketPlacePriceLabel.bottomAnchor, constant: 10),
            mileageLabel.trailingAnchor.constraint(equalTo: marketPlacePriceLabel.trailingAnchor),
            
            purchaseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            purchaseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            purchaseView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            purchaseView.heightAnchor.constraint(equalToConstant: 150),
            
            purchaseBigButton.leadingAnchor.constraint(equalTo: purchaseView.leadingAnchor, constant: 20),
            purchaseBigButton.trailingAnchor.constraint(equalTo: purchaseView.trailingAnchor, constant: -20),
            purchaseBigButton.bottomAnchor.constraint(equalTo: purchaseView.bottomAnchor, constant: -30),
            purchaseBigButton.heightAnchor.constraint(equalToConstant: 50),
            
            interiorColorTextView.topAnchor.constraint(equalTo: purchaseView.topAnchor, constant: 20),
            interiorColorTextView.trailingAnchor.constraint(equalTo: purchaseView.trailingAnchor, constant: -20),
            
            engineTypeLabel.topAnchor.constraint(equalTo: purchaseView.topAnchor, constant: 20),
            engineTypeLabel.leadingAnchor.constraint(equalTo: purchaseView.leadingAnchor, constant: 20)
        ])
    }

}
