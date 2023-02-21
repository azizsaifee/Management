//
//  iOSVC.swift
//  Project Management
//
//  Created by Apple on 07/02/23.
//

import Foundation
import UIKit
import CoreMedia

class iOSVC: UIViewController {
    
    enum Section: Int, CaseIterable {
        case outline
    }
    struct Item: Hashable {
        var title: String?
        var Appicon: String?
        var symbol: SymbolItem?
        var isChild: Bool
        
        init(title: String? = nil,Appicon: String? = nil, symbol: SymbolItem? = nil, isChild: Bool = false) {
            self.title = title
            self.Appicon = Appicon
            self.symbol = symbol
            self.isChild = isChild
        }
        
        private let identifier = UUID()
    }
    
    // MARK: - Variables
    var itemSection = ItemSection()
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var collectionView: UICollectionView! = nil
    
    // MARK: IBOutlets
    //@IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelForTitle: UILabel!
    
    // MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        labelForTitle.text = "iOS Apps"
    }
    
    // MARK: - Required Methods
    
    private func createLayout() -> UICollectionViewLayout{
            let sectionProvider = {(sectionIndex: Int, layout: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
                let section: NSCollectionLayoutSection
                switch sectionKind {
                case .outline:
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                    section = NSCollectionLayoutSection(group: group)
                    section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                }
                return section
            }
            return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        }

    
    private func configureCollectionView() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        
        labelForTitle.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: labelForTitle.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        collectionView.delegate = self
        
        // Creating Layout For the collectionView.
        collectionView.collectionViewLayout = createLayout()
        
        let categoryCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, _, item in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = item.title
            configuration.textProperties.font = .preferredFont(forTextStyle: .title2)
            configuration.textProperties.color = .black
            if item.title == "Eco Bank" {
                configuration.image = UIImage(named: item.Appicon ?? "")
                configuration.imageProperties.maximumSize = CGSize(width: 80, height: 45)
            } else {
                configuration.image = UIImage(named: item.Appicon ?? "")
                configuration.imageProperties.maximumSize = CGSize(width: 45, height: 40)
            }
            
            cell.contentConfiguration = configuration
            
            if configuration.text == "DTB"{
                let headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions(style: .header)
                cell.accessories = [.outlineDisclosure(options:headerDisclosureOption)]
            }
        }
        
        let categorySubCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, _, item in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = item.symbol?.title
            configuration.textProperties.font = .preferredFont(forTextStyle: .title3)
            configuration.image = UIImage(named: item.symbol?.Appicon ?? "")
            configuration.imageProperties.maximumSize = CGSize(width: 35, height: 35)
            cell.contentConfiguration = configuration
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            if let section = Section(rawValue: indexPath.section) {
                
                switch section {
                case .outline:
                    
                    if (item.isChild) {
                        return collectionView.dequeueConfiguredReusableCell(using: categoryCellRegistration, for: indexPath, item: item)
                    } else {
                        return collectionView.dequeueConfiguredReusableCell(using: categorySubCellRegistration, for: indexPath, item: item)
                    }
                }
            }
            return UICollectionViewCell()
        })
        applySnapshot()
    }
    
    private func applySnapshot() {
        var outlineSnapshot = NSDiffableDataSourceSectionSnapshot<Item>()
        
        for item in itemSection.outlineItem {
            let outlineItem = Item(title: item.title,Appicon: item.Appicon , isChild: true)
            outlineSnapshot.append([outlineItem])
            
            let subItem = item.symbol.map{ Item(symbol: $0)}
            outlineSnapshot.append(subItem, to: outlineItem)
        }
        dataSource.apply(outlineSnapshot, to: .outline, animatingDifferences: false)
    }
}

// MARK: - Extensions
extension iOSVC:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        var title: String?
        if let selectedItem = dataSource.itemIdentifier(for: indexPath)?.symbol?.title
                {
                     title = selectedItem
                    print("Selected cell title: \(title!)")
                }
        else if let selectedItem = dataSource.itemIdentifier(for: indexPath)?.title {
            title = selectedItem
            print("Selected cell title: \(title!)")
        }
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
        DetailsVC.stringForTitle = title ?? ""
        detailsVC.title = title
    }
}
