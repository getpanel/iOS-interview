//
//  Typealias.swift
//  iOS-interview
//
//  Created by Caleb Davis on 4/3/23.
//

import Foundation

typealias Closure = () -> Void
typealias NetworkingCompletion<T> = (Result<T, NetworkingError>) -> Void
typealias NetworkingResponse = Result<Response, NetworkingError>
