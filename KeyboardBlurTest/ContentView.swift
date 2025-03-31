import SwiftUI

struct ContentView: View {
    @State private var selectedStyle: Int = 0
    @State private var text: String = ""

    var body: some View {
        ScrollView {
            VStack {
                Text(blurStyles[selectedStyle]!)

                Picker("Select Blur Style", selection: $selectedStyle) {
                    ForEach(blurStyles.keys.sorted(), id: \.self) { key in
                        Text("\(key): \(blurStyles[key]!)").tag(key)
                    }
                }
                .pickerStyle(.wheel)
                .background(.regularMaterial)
                TextField("Input text here", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom, spacing: 0){
            UIMaterialEffect(style: blurStyle(for: selectedStyle))
                .overlay( Text("Accessory View") )
                .foregroundStyle(.blue)
                .ignoresSafeArea(.container, edges: .bottom)
                .frame(height: 60)

        }
        .background(
            Image(.img)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
        )
    }

    private func blurStyle(for rawValue: Int) -> UIBlurEffect.Style {
        return UIBlurEffect.Style(rawValue: rawValue)!
    }
}

struct UIMaterialEffect: UIViewRepresentable {
    let style: UIBlurEffect.Style

    init(style: UIBlurEffect.Style) {
        self.style = style
    }

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}


let blurStyles: [Int: String] = [
    0: "ExtraLight",
    1: "Light",
    2: "Dark",
    3: "ExtraDark",
    4: "Regular",
    5: "Prominent",
    6: "SystemUltraThinMaterial",
    7: "SystemThinMaterial",
    8: "SystemMaterial",
    9: "SystemThickMaterial",
    10: "SystemChromeMaterial",
    11: "SystemUltraThinMaterialLight",
    12: "SystemThinMaterialLight",
    13: "SystemMaterialLight",
    14: "SystemThickMaterialLight",
    15: "SystemChromeMaterialLight",
    16: "SystemUltraThinMaterialDark",
    17: "SystemThinMaterialDark",
    18: "SystemMaterialDark",
    19: "SystemThickMaterialDark",
    20: "SystemChromeMaterialDark",
    99: "UltraDark",
    100: "UltraColored",
    501: "LightKeyboard",
    502: "LightEmojiKeyboard",
    1000: "Automatic",
    1100: "SystemChromeBackground",
    1101: "SystemChromeBackgroundLight",
    1102: "SystemChromeBackgroundDark",
    1200: "SystemVibrantBackgroundRegular",
    1201: "SystemVibrantBackgroundUltraThin",
    1202: "SystemVibrantBackgroundThin",
    1203: "SystemVibrantBackgroundThick",
    1204: "SystemVibrantBackgroundRegularLight",
    1205: "SystemVibrantBackgroundUltraThinLight",
    1206: "SystemVibrantBackgroundThinLight",
    1207: "SystemVibrantBackgroundThickLight",
    1208: "SystemVibrantBackgroundRegularDark",
    1209: "SystemVibrantBackgroundUltraThinDark",
    1210: "SystemVibrantBackgroundThinDark",
    1211: "SystemVibrantBackgroundThickDark"
]

#Preview {
    ContentView()
}
