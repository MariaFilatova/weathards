//
//  CitySelectionView.swift
//  Weathards
//
//  Created by Waind Storm on 14.10.21.
//

import SwiftUI

struct CitySelectionView: View {
    @StateObject var viewModel = CitySelectionViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    
    init() {
        UITableView.appearance().separatorStyle = .singleLine
        UITableViewCell.appearance().backgroundColor = .black
        UITableView.appearance().backgroundColor = .black
    }
    
    var body: some View {
        VStack {
            LazyVStack {
                SearchBar(text: $searchText)
                    .padding(EdgeInsets(top: UIHelper.statusBarHeight() + 10,
                                        leading: 16,
                                        bottom: 16,
                                        trailing: 16))
            }
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.133))
            Spacer()
            List(viewModel.cityList.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { item in
                CityRow(name: "\(item.name), \(item.country)")
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CitySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CitySelectionView()
    }
}
