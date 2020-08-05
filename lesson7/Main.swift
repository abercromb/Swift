//
//  main.swift
//  lesson7
//
//  Created by Vladislav Elkin on 05.08.2020.
//  Copyright © 2020 Vladislav Elkin. All rights reserved.
//

import Foundation

enum AuthorizationError: Error, CustomStringConvertible {
    case userNotFound
    case invalidLoginOrPassword
    case userBlocked
    
    var description: String {
    switch self {
    case .invalidLoginOrPassword:
        return "Неправильный логин или пароль"
    case .userBlocked:
        return "Юзер заблокирован"
    case .userNotFound:
        return "Юзер не найден"
    }
  }
}

enum RegistrationError: Error {
    case userExists
}

struct User
{
    var login: String
    var password: String
    var isBlocked: Bool
    
}

class Site
{
    var users = [
        "123@mail.ru": User(login: "123@mail.ru", password: "123123", isBlocked: false),
        "user@gmail.com": User(login: "user@gmail.com", password: "admin", isBlocked: false),
        "root@site.ru": User(login: "root@site.ru", password: "qwerty", isBlocked: true)
    ]
    
    func login(_ username: String, _ password: String) throws -> Bool
    {
        guard let user = users[username] else {
            throw AuthorizationError.userNotFound
        }
        
        if user.isBlocked {
            throw AuthorizationError.userBlocked
        }
        
        if user.login == username && user.password == password {
            return true
        } else {
            throw AuthorizationError.invalidLoginOrPassword
        }
        
    }
    
    func register(username: String, password: String) throws -> Bool
    {
        if let user = users[username]  {
            throw RegistrationError.userExists
        }
        
        users[username] = User(login: username, password: password, isBlocked: false)
        
        return true
    }
}

var site = Site()

do {
    var success = try site.register(username: "newuser@mail.ru", password: "9999")
    print(success)
    success = try site.login("newuser@mail.ru", "97999")
    print(success)
}
catch RegistrationError.userExists {
    print("Юзер с таким именем уже зарегистрирован")
} catch let userError as AuthorizationError
{
    print(userError.description)
}


