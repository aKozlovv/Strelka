import SwiftUI
import MapKit

struct RoutesView: View {
    
    @State
    private var markItems = [MKMapItem]()
    
    @State
    private var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    var body: some View {
        Map(position: $cameraPosition) {
            Marker("Mok", coordinate: .mokLocation)
                .tint(.accent)
        }
        .botomSheet(
            presentationDetents: [.medium, .large, .height(70)], isPresented: .constant(true)) {
                ScrollView(.vertical, showsIndicators: false) {
                    HStack {
                        Text("Your routes")
                            .font(.title.bold().smallCaps())
                            .foregroundStyle(.secondary)
                        Spacer()
                        Button {} label: {
                            Image(systemName: "plus")
                        }
                    }
                    .padding(.all, 25)
                }
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .ignoresSafeArea()
                )
            } onDismiss: {}
            
    }
    
}


extension View {
    @ViewBuilder
    func botomSheet<Content: View>(
        presentationDetents: Set<PresentationDetent>,
        isPresented: Binding<Bool>,
        indicatorVisibility: Visibility = .visible,
        sheetCornerRadius: CGFloat = 20,
        largestUndimmedIdentifier: UISheetPresentationController.Detent.Identifier = .large,
        isTransparent: Bool = true,
        interactiveDisabled: Bool = true,
        @ViewBuilder content: @escaping () -> Content,
        onDismiss: @escaping () -> Void
    ) -> some View {
        self
            .sheet(isPresented: isPresented, onDismiss: { onDismiss() }) {
                content()
                    .presentationDetents(presentationDetents)
                    .presentationDragIndicator(indicatorVisibility)
                    .interactiveDismissDisabled(interactiveDisabled)
                    .presentationBackgroundInteraction(.enabled)
                    .onAppear {
                        guard let windows = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
                            return
                        }
                        
                        if let controller = windows.windows.first?.rootViewController?.presentedViewController,
                           let sheet = controller.sheetPresentationController {
                            
                            if isTransparent {
                                controller.view.backgroundColor = .clear
                            }
                            
                            
                            controller.presentingViewController?.view.tintAdjustmentMode = .normal
                            
                            sheet.largestUndimmedDetentIdentifier = largestUndimmedIdentifier
                            sheet.preferredCornerRadius = sheetCornerRadius
                        }
                    }
            }
    }
}

#Preview {
    RoutesView()
}
