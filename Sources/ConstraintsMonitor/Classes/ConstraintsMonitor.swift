import UIKit

extension NSLayoutConstraint.Relation: CustomStringConvertible {
    public var description: String {
        switch self {
        case .equal: return "=="
        case .greaterThanOrEqual: return ">="
        case .lessThanOrEqual: return "<="
        }
    }
}

extension NSLayoutConstraint.Attribute: CustomStringConvertible {
    public var description: String {
        switch self {
        case .left:
            return "left"
        case .right:
            return "right"
        case .top:
            return "top"
        case .bottom:
            return "bottom"
        case .leading:
            return "leading"
        case .trailing:
            return "trailing"
        case .width:
            return "width"
        case .height:
            return "height"
        case .centerX:
            return "centerX"
        case .centerY:
            return "centerY"
        case .lastBaseline:
            return "lastBaseline"
        case .firstBaseline:
            return "firstBaseline"
        case .leftMargin:
            return "leftMargin"
        case .rightMargin:
            return "rightMargin"
        case .topMargin:
            return "topMargin"
        case .bottomMargin:
            return "bottomMargin"
        case .leadingMargin:
            return "leadingMargin"
        case .trailingMargin:
            return "trailingMargin"
        case .centerXWithinMargins:
            return "centerXWithinMargins"
        case .centerYWithinMargins:
            return "centerYWithinMargins"
        case .notAnAttribute:
            return "notAnAttribute"
        }
    }
}

extension NSLayoutConstraint {
    
    open override var description: String {
        let firstView = (firstItem as? UIView) ?? (firstItem as? UILayoutGuide)?.owningView
        let secondView = (secondItem as? UIView) ?? (secondItem as? UILayoutGuide)?.owningView
        
        if let firstView = firstView, let secondView = secondView {
            return twoViewsConstraintMessage(firstView: firstView, secondView: secondView)
        }
        
        if let singleView = firstView ?? secondView {
            return singleViewContraintMessage(view: singleView)
        }
        
        return super.description
    }
    
    fileprivate func singleViewContraintMessage(view: UIView) -> String {
        let parentViewName = superviewName(view: view)
        let viewName = name(view: view)
        
        let resizingMaskMessage = super.description.contains("NSAutoresizingMaskLayoutConstraint") ? " (Did you set translatesAutoresizingMaskIntoConstraints = false?)" : ""
        
        return "\(parentViewName)\(viewName).\(firstAttribute) \(relation) \(constant)\(resizingMaskMessage)"
    }
    
    fileprivate func twoViewsConstraintMessage(firstView: UIView, secondView: UIView) -> String {
        let firstViewName = name(view: firstView)
        let secondViewName = name(view: secondView)
        let firstViewParentName = superviewName(view: firstView)
        let secondViewParentName = firstView.superview == secondView.superview ? "" : superviewName(view: secondView)
        
        return "\(firstViewParentName)\(firstViewName).\(firstAttribute) \(relation) \(secondViewParentName)\(secondViewName).\(secondAttribute)\(propertiesMessage)"
    }
    
    fileprivate var propertiesMessage: String {
        let showMultiplier = multiplier != 1
        let showPriority = priority != UILayoutPriority.required
        let identifierPrefix = identifier.map { "identifier: \($0), "} ?? ""
        
        return " ("
            + identifierPrefix
            + (showMultiplier ?
                "multiplier: \(String(format: "%.3f", Double(multiplier)))" :
                "constant: \(constant)")
            + (showPriority ?
                ", priority: " + String(describing: priority) :
                "")
            + ")"
    }
}

extension UILayoutPriority: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .defaultHigh:
            return ".defaultHigh \(rawValue)"
        case .defaultLow:
            return ".defaultLow (\(rawValue))"
        case .dragThatCannotResizeScene:
            return ".dragThatCannotResizeScene \(rawValue)"
        case .dragThatCanResizeScene:
            return ".dragThatCanResizeScene \(rawValue)"
        case .fittingSizeLevel:
            return ".fittingSizeLevel \(rawValue)"
        case .required:
            return ".required \(rawValue)"
        case .sceneSizeStayPut:
            return ".sceneSizeStayPut \(rawValue)"
        default:
            return "\(rawValue)"
        }
    }
    
}

//fileprivate extension UILayoutPriority {
//
//    var name: String {
//        switch self {
//        case .defaultHigh:
//
//        }
//    }
//
//}

private func name(view: UIView) -> String {
    return view.accessibilityIdentifier ?? String(describing: type(of: view))
}

private func superviewName(view: UIView) -> String {
    return view.superview.map { name(view: $0) + "." } ?? ""
}

extension UIView {
    
    public func debugConstraints() {
        constraints.forEach { print($0) }
    }
    
}
