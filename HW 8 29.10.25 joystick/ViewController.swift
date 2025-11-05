
import UIKit

enum Direction {
    case up
    case down
    case left
    case right
}

class ViewController: UIViewController {

    @IBOutlet weak var cycleButton: UIButton!
    @IBOutlet weak var frameForButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
//        var maxX = view.frame.size.width - cycleButton.frame.size.width
//        var maxY = view.frame.size.height - cycleButton.frame.size.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        createCycle()
    }
    
    func createCycle() {
        cycleButton.frame = CGRect(x: 100, y: 150, width: 70, height: 70)
        cycleButton.backgroundColor = .orange
        cycleButton.layer.cornerRadius = cycleButton.frame.height / 2
        view.addSubview(cycleButton)
    }
    
    @IBAction func upButtonPressed(_ sender: UIButton) {
        move(direction: .up)
    }
    
    @IBAction func downButtonPressed(_ sender: UIButton) {
        move(direction: .down)
    }

    @IBAction func leftButtonPressed(_ sender: UIButton) {
        move(direction: .left)
    }
    
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        move(direction: .right)
    }
    
        func move(direction: Direction) {
            let step: CGFloat = 50
            var newX = cycleButton.frame.origin.x
            var newY = cycleButton.frame.origin.y

            switch direction {
            case .up:
                let potentialY = newY - step
                // Проверяем, не вышли ли за верх экрана
                if potentialY >= 0 {
                    newY = potentialY
                }
            case .down:
                let potentialY = newY + step
                // Нижняя граница: верх frameForButton минус высота кружка
                let lowerLimit = frameForButton.frame.origin.y - cycleButton.frame.height
                if potentialY <= lowerLimit {
                    newY = potentialY
                }
            case .left:
                let potentialX = newX - step
                // Проверяем левую границу экрана
                if potentialX >= 0 {
                    newX = potentialX
                }
            case .right:
                let potentialX = newX + step
                // Правая граница экрана минус ширина кружка
                let rightLimit = view.frame.width - cycleButton.frame.width
                if potentialX <= rightLimit {
                    newX = potentialX
                }
            }

            cycleButton.frame.origin = CGPoint(x: newX, y: newY)
        }
        
    

}

// почему по правой стороне есть отступ ?
