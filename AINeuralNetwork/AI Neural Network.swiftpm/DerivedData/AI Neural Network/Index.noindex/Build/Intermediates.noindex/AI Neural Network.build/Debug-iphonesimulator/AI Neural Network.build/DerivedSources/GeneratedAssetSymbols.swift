import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension ColorResource {

    /// The "__PresetAccentColor" asset catalog color resource.
    static let presetAccent = ColorResource(name: "__PresetAccentColor", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 11.0, macOS 10.7, tvOS 11.0, *)
extension ImageResource {

    /// The "1+e" asset catalog image resource.
    static let _1E = ImageResource(name: "1+e", bundle: resourceBundle)

    /// The "1+e2" asset catalog image resource.
    static let _1E2 = ImageResource(name: "1+e2", bundle: resourceBundle)

    /// The "AnswerRight" asset catalog image resource.
    static let answerRight = ImageResource(name: "AnswerRight", bundle: resourceBundle)

    /// The "AnswerWrong" asset catalog image resource.
    static let answerWrong = ImageResource(name: "AnswerWrong", bundle: resourceBundle)

    /// The "Icon" asset catalog image resource.
    static let icon = ImageResource(name: "Icon", bundle: resourceBundle)

    /// The "MultiIcon" asset catalog image resource.
    static let multiIcon = ImageResource(name: "MultiIcon", bundle: resourceBundle)

    /// The "Network00" asset catalog image resource.
    static let network00 = ImageResource(name: "Network00", bundle: resourceBundle)

    /// The "Network01" asset catalog image resource.
    static let network01 = ImageResource(name: "Network01", bundle: resourceBundle)

    /// The "Network02" asset catalog image resource.
    static let network02 = ImageResource(name: "Network02", bundle: resourceBundle)

    /// The "Network03" asset catalog image resource.
    static let network03 = ImageResource(name: "Network03", bundle: resourceBundle)

    /// The "Network04" asset catalog image resource.
    static let network04 = ImageResource(name: "Network04", bundle: resourceBundle)

    /// The "Network05" asset catalog image resource.
    static let network05 = ImageResource(name: "Network05", bundle: resourceBundle)

    /// The "NeuralNetwork" asset catalog image resource.
    static let neuralNetwork = ImageResource(name: "NeuralNetwork", bundle: resourceBundle)

    /// The "Neuron" asset catalog image resource.
    static let neuron = ImageResource(name: "Neuron", bundle: resourceBundle)

    /// The "funcIcon" asset catalog image resource.
    static let funcIcon = ImageResource(name: "funcIcon", bundle: resourceBundle)

    /// The "plusIcon" asset catalog image resource.
    static let plusIcon = ImageResource(name: "plusIcon", bundle: resourceBundle)

}

// MARK: - Backwards Deployment Support -

/// A color resource.
struct ColorResource: Hashable {

    /// An asset catalog color resource name.
    fileprivate let name: String

    /// An asset catalog color resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize a `ColorResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

/// An image resource.
struct ImageResource: Hashable {

    /// An asset catalog image resource name.
    fileprivate let name: String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

#if canImport(AppKit)
@available(macOS 10.13, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// Initialize a `NSColor` with a color resource.
    convenience init(resource: ColorResource) {
        self.init(named: NSColor.Name(resource.name), bundle: resource.bundle)!
    }

}

protocol _ACResourceInitProtocol {}
extension AppKit.NSImage: _ACResourceInitProtocol {}

@available(macOS 10.7, *)
@available(macCatalyst, unavailable)
extension _ACResourceInitProtocol {

    /// Initialize a `NSImage` with an image resource.
    init(resource: ImageResource) {
        self = resource.bundle.image(forResource: NSImage.Name(resource.name))! as! Self
    }

}
#endif

#if canImport(UIKit)
@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// Initialize a `UIColor` with a color resource.
    convenience init(resource: ColorResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}

@available(iOS 11.0, tvOS 11.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// Initialize a `UIImage` with an image resource.
    convenience init(resource: ImageResource) {
#if !os(watchOS)
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
#else
        self.init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Color {

    /// Initialize a `Color` with a color resource.
    init(_ resource: ColorResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SwiftUI.Image {

    /// Initialize an `Image` with an image resource.
    init(_ resource: ImageResource) {
        self.init(resource.name, bundle: resource.bundle)
    }

}
#endif