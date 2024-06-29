//
//  MapControls.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/22/24.
//

import SwiftUI

struct SymbolToggleStyle: ToggleStyle {
    
    var systemImage: String = "checkmark"
    var activeColor: Color = .green
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            
            Spacer()
            
            RoundedRectangle(cornerRadius: 30)
                .fill(configuration.isOn ? activeColor : Color(.systemGray5))
                .overlay {
                    Circle()
                        .fill(.white)
                        .padding(3)
                        .overlay {
                            Image(systemName: systemImage)
                                .foregroundColor(configuration.isOn ? activeColor : Color(.systemGray5))
                        }
                        .offset(x: configuration.isOn ? 10 : -10)
                    
                }
                .frame(width: 50, height: 32)
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
        }
    }
}

struct TestButtons: View {
    @State private var isOn = false
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
     
      
                    
                Toggle("Wi-Fi", systemImage: isOn ? "map" : "map.fill", isOn: $isOn)
                    .labelStyle(.iconOnly)
                    .backgroundStyle(.ultraThickMaterial)
                    .toggleStyle(.button)
                    .buttonStyle(.bordered)
                    .font(.largeTitle)
                    .contentTransition(.symbolEffect)
                    .padding()
                
                
                Toggle("Wi-Fi", systemImage: isOn ? "map" : "map.fill", isOn: $isOn)
                    .tint(.blue)
                    .labelStyle(.iconOnly)
                    .toggleStyle(.button)
                    .font(.largeTitle)
                    .contentTransition(.symbolEffect)
                    .padding()
                
                Button {
                    print("presses")
                } label: {
                    Label("Learn More", systemImage: "book.fill")
                }
                .font(.largeTitle)
                .buttonStyle(.bordered)
//                .buttonBorderShape(.roundedRectangle(radius:8))
//                .foregroundColor(.pink)
//                .tint(.gray)
                
                Button{
                    print("mail")
                } label: {
                    Text("Mail")
                }
                .buttonStyle(.map)
                    Spacer()
           
            }

        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: "paperplane")
                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            Divider()
                .padding(.vertical,8)
            configuration.label
        }
        .frame(width: 150, height: 55)
        .background(.mint)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension ButtonStyle where Self == CustomButtonStyle {
    static var map: CustomButtonStyle { .init()}
}
#Preview {
    TestButtons()
}
