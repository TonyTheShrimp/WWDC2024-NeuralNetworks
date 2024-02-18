#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"TonyMa.AI-Neural-Network";

/// The "__PresetAccentColor" asset catalog color resource.
static NSString * const ACColorNamePresetAccentColor AC_SWIFT_PRIVATE = @"__PresetAccentColor";

/// The "NeuralNetwork" asset catalog image resource.
static NSString * const ACImageNameNeuralNetwork AC_SWIFT_PRIVATE = @"NeuralNetwork";

/// The "Neuron" asset catalog image resource.
static NSString * const ACImageNameNeuron AC_SWIFT_PRIVATE = @"Neuron";

/// The "funcIcon" asset catalog image resource.
static NSString * const ACImageNameFuncIcon AC_SWIFT_PRIVATE = @"funcIcon";

/// The "plusIcon" asset catalog image resource.
static NSString * const ACImageNamePlusIcon AC_SWIFT_PRIVATE = @"plusIcon";

#undef AC_SWIFT_PRIVATE