//
//  ProductViewController.swift
//  ShoppingCartAMQ
//
//  Created by IDS Comercial on 24/06/21.
//

import UIKit

class ProductViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    var productName: String?
    var productPrice: String?
    var productImageString: String?
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productPiecesStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.autorepeat = true
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        return stepper
    }()
    
    private let productPiecesLabel: UILabel = {
        let label = UILabel()
        label.text = "Pieces"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productPiecesCounterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let purchaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(signUpPressed(sender:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        productNameLabel.text = productName
        productPriceLabel.text = productPrice
        if productImageString != nil {
            if let url = URL(string: productImageString!) {
                if let data = try? Data(contentsOf: url) {
                    productImage.image = UIImage(data: data)
                }
            }
        }
        
    }
    
    @objc func SubmitButtonTouched() {
        productPiecesStepper.value = 0
        productPiecesCounterLabel.text = "0"
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func stepperValueChanged(_ sender: UIStepper) {
        productPiecesCounterLabel.text = "\(Int(sender.value))"
        print("\(Int(sender.value))")
    }
    
    @objc func signUpPressed(sender: Any) {
        print("Sign in pressed")
    }
    
    private func setupScrollView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 30, width: view.frame.size.width, height: 44))
        let navItem = UINavigationItem(title: productName!)
        let doneItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(SubmitButtonTouched))
        navItem.leftBarButtonItems = [doneItem]
        navBar.setItems([navItem], animated: false)
        
        view.addSubview(navBar)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupLayout() {
        productNameLabel.text = productName
        productPriceLabel.text = productPrice
        
        contentView.addSubview(productImage)
        contentView.addSubview(productNameLabel)
        contentView.addSubview(productPriceLabel)
        contentView.addSubview(productPiecesStepper)
        contentView.addSubview(productPiecesLabel)
        contentView.addSubview(productPiecesCounterLabel)
        contentView.addSubview(purchaseButton)
        
        productImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        productImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        
        productNameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20).isActive = true
        productNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        productNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        
        productPriceLabel.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 40).isActive = true
        productPriceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        productPriceLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        
        productPiecesLabel.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor, constant: 20).isActive = true
        productPiecesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40).isActive = true
        
        productPiecesCounterLabel.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor, constant: 20).isActive = true
        productPiecesCounterLabel.leadingAnchor.constraint(equalTo: productPriceLabel.leadingAnchor, constant: 80).isActive = true
        
        productPiecesStepper.topAnchor.constraint(equalTo: productPriceLabel.bottomAnchor, constant: 20).isActive = true
        productPiecesStepper.leadingAnchor.constraint(equalTo: productPiecesCounterLabel.leadingAnchor, constant: 40).isActive = true
        
        purchaseButton.topAnchor.constraint(equalTo: productPiecesStepper.bottomAnchor, constant: 40).isActive = true
        purchaseButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        purchaseButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
        purchaseButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

}
