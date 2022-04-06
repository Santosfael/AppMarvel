//
//  CustomUIButton.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 05/04/22.
//

import UIKit

class CustomUIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configButton()
    }
    
    private func configButton() {
        translatesAutoresizingMaskIntoConstraints = false
        setTitle("Veja mais eventos", for: .normal)
        backgroundColor = #colorLiteral(red: 0.6366813397, green: 0.1702153683, blue: 0.2569398284, alpha: 1)
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
    }
    
    public override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.beginFromCurrentState, .curveEaseOut]) { [self] in
                self.backgroundColor = self.isHighlighted ? #colorLiteral(red: 0.6366813397, green: 0.07542901626, blue: 0.14562499, alpha: 1) : #colorLiteral(red: 0.6366813397, green: 0.1702153683, blue: 0.2569398284, alpha: 1)
                self.transform = self.isHighlighted ? .init(translationX: 0, y: 3) : .identity
            } completion: { _ in
                
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
