//
//  Anchors.swift
//  ios_interview
//
//  Created by Caleb Davis on 4/3/23.
//

import UIKit

extension UIView {

    @discardableResult
    func fill(_ inset: UIEdgeInsets = .zero) -> UIView {
        guard let superView = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor, constant: inset.top).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: inset.left).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: inset.right).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: inset.bottom).isActive = true
        return self
    }

    @discardableResult
    func pin(top: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: top, constant: padding).isActive = true
        return self
    }

    @discardableResult
    func pin(leading: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: leading, constant: padding).isActive = true
        return self
    }

    @discardableResult
    func pin(trailing: NSLayoutXAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: trailing, constant: padding).isActive = true
        return self
    }

    @discardableResult
    func pin(bottom: NSLayoutYAxisAnchor, padding: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: bottom, constant: padding).isActive = true
        return self
    }

    @discardableResult
    func setWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }

    @discardableResult
    func setHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }

    @discardableResult
    func centerHorizontally(in view: UIView) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return self
    }

    @discardableResult
    func centerVertically(in view: UIView) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return self
    }
}
