import UIKit

class DemoMenuContentController: UITableViewController, CariocaDataSource {

	var blurStyle: UIBlurEffectStyle?

	var menuItems: [CariocaMenuItem] = []

    // MARK: - menu data source
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath,
				   withEdge edge: UIRectEdge) -> UITableViewCell {
		let menuItem = menuItems[indexPath.row]
		//swiftlint:disable force_cast
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuItemCell
		//swiftlint:enable force_cast
		cell.titleLabel.text = menuItem.title
		cell.titleLabel.textAlignment = (edge == .left) ? .right : .left
		cell.iconLeftConstraint?.priority = (edge == .left) ? UILayoutPriority(50.0) : UILayoutPriority(100.0)
		cell.iconRightConstraint?.priority = (edge == .right) ? UILayoutPriority(50.0) : UILayoutPriority(100.0)
		cell.iconView.display(icon: menuItem.icon)
		return cell
	}

    func heightForRow() -> CGFloat {
        return 70.0
    }
}

class MenuItemCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var iconView: CariocaIconView!
	@IBOutlet weak var iconLeftConstraint: NSLayoutConstraint?
	@IBOutlet weak var iconRightConstraint: NSLayoutConstraint?
}
