//
//  InfoView.swift
//  KenCard
//
//  Created by Ken Mau on 2022-01-09.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let iconColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(iconColor)
                    Text(text)
                        .foregroundColor(.black)
                }
            )
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "hello world", iconColor: .black)
            .previewLayout(.sizeThatFits)
    }
}
