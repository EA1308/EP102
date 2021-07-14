//
//  BaseViewController.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//



import UIKit

protocol CoordinatorDelegate: UIViewController {
    var coordinator: CoordinatorProtocol? { get set }
}
