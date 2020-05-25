// https://github.com/Quick/Quick

import Quick
import Nimble
import ConstraintsMonitor

class AnyView: UIView {
    
}

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        
        describe("Single view constraints") {
            
            fit("should print correctly") {
                
                let view = UIView()
                
                expect (view.widthAnchor.constraint(equalToConstant: 10).description)
                    == "UIView.width == 10.0"
                
                expect (view.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).description)
                    == "UIView.width >= 20.0"
                
                expect (view.widthAnchor.constraint(lessThanOrEqualToConstant: 30).description)
                    == "UIView.width <= 30.0"
                
                let subclassedView = AnyView()
                
                expect (subclassedView.widthAnchor.constraint(lessThanOrEqualToConstant: 30).description)
                == "AnyView.width <= 30.0"
                
                view.addSubview(subclassedView)
                expect (subclassedView.widthAnchor.constraint(lessThanOrEqualToConstant: 30).description)
                    == "UIView.AnyView.width <= 30.0"
            }
        }
        
        describe("Two views constraints") {
            
            it("should print correctly") {
                let view = UIView()
                let otherView = UIView()
                
                expect (view.widthAnchor.constraint(equalTo: otherView.widthAnchor).description)
                    == "UIView.width == UIView.width (constant: 0.0)"
                
                expect (view.widthAnchor.constraint(equalTo: otherView.widthAnchor, constant: 10).description)
                    == "UIView.width == UIView.width (constant: 10.0)"
                
                expect (view.heightAnchor.constraint(equalTo: otherView.heightAnchor, multiplier: 2).description)
                    == "UIView.height == UIView.height (multiplier: 2.0)"
                
                expect (view.leadingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: -5).description)
                    == "UIView.leading == UIView.trailing (constant: -5.0)"
                
                expect (view.firstBaselineAnchor.constraint(equalTo: otherView.lastBaselineAnchor, constant: -5).description)
                    == "UIView.firstBaseline == UIView.lastBaseline (constant: -5.0)"
                
                let constraintWithPriority = view.leadingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: -5)
                constraintWithPriority.priority = .defaultLow
                expect (constraintWithPriority.description)
                    == "UIView.leading == UIView.trailing (constant: -5.0, priority: .defaultLow (250.0))"
            }
        }
    }
}
