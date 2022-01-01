import UIKit

extension Double {
    func round(to decimalPlaces: Int) -> Double {
        // * number of decimalPlaces
        let precision = pow(10, Double(decimalPlaces))
        var n = self
        n = n * precision
        
        // round
        n.round()
        
        // / number of decimalPlaces
        n = n / precision
        
        return n
    }
}

extension UIButton {
    func makeCircular() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

var double = 3.14159

let myRoundedDouble: String = String(format: "%.1f", double)

print(myRoundedDouble)

double.round(to: 3)


let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button.backgroundColor = .red
button.makeCircular()

