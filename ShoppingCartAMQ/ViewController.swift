//
//  ViewController.swift
//  ShoppingCartAMQ
//
//  Created by IDS Comercial on 22/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    let sneakersArray = ShoppingViewModel().getTotalOfSneakers()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    private func setupLayout() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 30, width: view.frame.size.width, height: 44))
        let navItem = UINavigationItem(title: "SomeTitle")
        let doneItem = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil)
        let counter = UIBarButtonItem(title: "0", style: .plain, target: self, action: nil)
        navItem.rightBarButtonItems = [counter,doneItem]
        navBar.setItems([navItem], animated: false)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset.left = 2
        layout.sectionInset.right = 2
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-4,
                                 height: (view.frame.size.width/2)-4)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: navBar.frame.origin.y+navBar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height), collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        view.addSubview(navBar)
        view.addSubview(collectionView)
    }

}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sneakersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.configure(productName: sneakersArray[indexPath.row].name, productPrice: sneakersArray[indexPath.row].price)
//        cell.configure(label: sneakersArray[indexPath.row].name)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item \(indexPath.row) selected")
    }
}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sneakersArray.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = sneakersArray[indexPath.row].name
//        return cell
//    }
//}

