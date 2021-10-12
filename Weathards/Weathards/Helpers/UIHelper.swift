//
//  UIHelper.swift
//  WeatherApp
//
//  Created by Waind Storm on 10.10.21.
//

import SwiftUI

enum UIHelper {
    static func statusBarHeight() -> CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
}
