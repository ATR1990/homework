//
//  homeworkApp.swift
//  homework
//
//  Created by Тауекел on 15.05.2024.
//

import SwiftUI

@main
struct homeworkApp: App {
    // @UIApplicationDelegateAdaptor связывает ваш класс AppDelegate с UIKit
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            Text("Hello, World!") // Этот вид не будет использоваться, но требуется для SwiftUI приложения.
        }
    }
}

