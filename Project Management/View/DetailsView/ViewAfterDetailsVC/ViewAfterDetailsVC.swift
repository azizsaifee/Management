//
//  ViewInsideDetailsVC.swift
//  Project Management
//
//  Created by Apple on 08/02/23.
//

import UIKit

// Enums and sections.
enum Section: Int, CaseIterable {
    case outline
}

struct Item: Hashable {
    var title: String?
    var subtitle: String?
    var hasSubtitle: Bool
}

class ViewAfterDetailsVC: UIViewController, UICollectionViewDelegate {

    // MARK: - Variables
    static var stringForTitle: String?
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    static var myOptionalDictionary: [String : Any]? = nil
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelForTitle: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        labelForTitle.text = ViewAfterDetailsVC.stringForTitle
        configureCollectionView()
    }
    
    // MARK: - Required Functions
    private func createLayout() -> UICollectionViewLayout{
        let sectionProvider = {(sectionIndex: Int, layout: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            let section: NSCollectionLayoutSection
            switch sectionKind {
            case .outline:
                let configution = UICollectionLayoutListConfiguration(appearance: .plain)
                section = NSCollectionLayoutSection.list(using: configution, layoutEnvironment: layout)
            }
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    private func configureCollectionView() {
        
        collectionView.delegate = self
        collectionView.collectionViewLayout = createLayout()
        
        let categoryCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, _, item in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = item.title
            configuration.textProperties.font = .preferredFont(forTextStyle: .title3)
            cell.contentConfiguration = configuration
            if item.subtitle == "" {
                //There is no subtitle present.
            } else {
                let headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions(style: .header)
                cell.accessories = [.outlineDisclosure(options:headerDisclosureOption)]
            }
        }
        
        let categorySubCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, _, item in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = item.subtitle
            configuration.textProperties.font = .preferredFont(forTextStyle: .subheadline)
            cell.contentConfiguration = configuration
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            if let section = Section(rawValue: indexPath.section) {
                
                switch section {
                case .outline:
                    if (item.hasSubtitle) {
                        return collectionView.dequeueConfiguredReusableCell(using: categoryCellRegistration, for: indexPath, item: item)
                    } else if item.subtitle == "" {
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
        ViewAfterDetailsVC.myOptionalDictionary = getData()
        if let dictionary = ViewAfterDetailsVC.myOptionalDictionary {
            for (key, value) in dictionary {
                if let subDictionary = value as? [String: Any] {
                    let outlineItem = Item(title: key, hasSubtitle: true)
                    outlineSnapshot.append([outlineItem])
                    let subItem = subDictionary.keys.map{ Item(subtitle: $0, hasSubtitle: false) }
                    outlineSnapshot.append(subItem, to: outlineItem)
                } else {
                    // We have given subtitle an Empty String to apply some checks when adding data into collectionView.
                    let outlineItem = Item(title: "\(key)", subtitle: "", hasSubtitle: false)
                    outlineSnapshot.append([outlineItem])
                }
            }
            dataSource.apply(outlineSnapshot, to: .outline, animatingDifferences: false)
        }
    }
    
    func getData() -> [String : Any]? {
        switch ViewAfterDetailsVC.stringForTitle {
        case "Credentials" :
            return DetailsVC.objRepository.get(byIdentifier: "EcoBank")?.credentials.topic
        case "Features" :
            return DetailsVC.objRepository.get(byIdentifier: "EcoBank")?.features.topic
        case "Issues" :
            return DetailsVC.objRepository.get(byIdentifier: "EcoBank")?.issues.topic
        case "Documentation" :
            return DetailsVC.objRepository.get(byIdentifier: "EcoBank")?.documentation.topic
        default :
            return nil
        }
    }
    
    // MARK: - IBActions
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extensions
extension ViewAfterDetailsVC{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contentVC = self.storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! ContentVC
        var title: String?
        if dataSource.itemIdentifier(for: indexPath)?.subtitle == "" {
            if let selectedItem = dataSource.itemIdentifier(for: indexPath)?.title {
                title = selectedItem
                print("Selected cell title: \(title!)")
            }
        } else {
            if let selectedItem = dataSource.itemIdentifier(for: indexPath)?.subtitle
            {
                title = selectedItem
                print("Selected cell title: \(title!)")
            }
        }
        
//        if let selectedItem = dataSource.itemIdentifier(for: indexPath)?.subtitle
//        {
//            title = selectedItem
//            print("Selected cell title: \(title!)")
//        }
//        else if let selectedItem = dataSource.itemIdentifier(for: indexPath)?.title {
//            title = selectedItem
//            print("Selected cell title: \(title!)")
//        }
        
        self.navigationController?.pushViewController(contentVC, animated: true)
        ContentVC.stringForTitle = title
    }
}
