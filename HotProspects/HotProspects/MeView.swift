//
//  MeView.swift
//  HotProspects
//
//  Created by Nikita Shyshkin on 24/07/2025.
//

import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
	@AppStorage("name") private var name = "Anonymous"
	@AppStorage("email") private var email = "you@example.com"
	
	let context = CIContext()
	let filter = CIFilter.qrCodeGenerator()

    var body: some View {
		NavigationStack {
			Form {
				Image(uiImage: generateQRCode(from: "\(name)\n\(email)"))
					.interpolation(.none)
					.resizable()
					.scaledToFit()
					.frame(width: 200, height: 200)
					
				TextField("Name", text: $name)
					.textContentType(.name)
					.font(.title)
				
				TextField("Email", text: $email)
					.textContentType(.emailAddress)
					.font(.title)
			}
			.navigationTitle("Your code")
		}
    }
	
	func generateQRCode(from string: String) -> UIImage {
		filter.message = Data(string.utf8)
		
		if let output = filter.outputImage {
			if let cgImage = context.createCGImage(output, from: output.extent) {
				return UIImage(cgImage: cgImage)
			}
		}
		
		return UIImage(systemName: "xmark.circle") ?? UIImage()
	}
}

#Preview {
    MeView()
}
