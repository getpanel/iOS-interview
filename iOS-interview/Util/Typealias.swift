//
//  Typealias.swift
//  iOS-interview
//
//  Created by Caleb Davis on 4/3/23.
//

import Foundation

typealias NetworkingCompletion<T> = (Result<T, NetworkingError>) -> Void
