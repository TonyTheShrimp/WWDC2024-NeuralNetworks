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

/// The "1+e" asset catalog image resource.
static NSString * const ACImageName1E AC_SWIFT_PRIVATE = @"1+e";

/// The "1+e2" asset catalog image resource.
static NSString * const ACImageName1E2 AC_SWIFT_PRIVATE = @"1+e2";

/// The "AnswerRight" asset catalog image resource.
static NSString * const ACImageNameAnswerRight AC_SWIFT_PRIVATE = @"AnswerRight";

/// The "AnswerWrong" asset catalog image resource.
static NSString * const ACImageNameAnswerWrong AC_SWIFT_PRIVATE = @"AnswerWrong";

/// The "Icon" asset catalog image resource.
static NSString * const ACImageNameIcon AC_SWIFT_PRIVATE = @"Icon";

/// The "MultiIcon" asset catalog image resource.
static NSString * const ACImageNameMultiIcon AC_SWIFT_PRIVATE = @"MultiIcon";

/// The "Network00" asset catalog image resource.
static NSString * const ACImageNameNetwork00 AC_SWIFT_PRIVATE = @"Network00";

/// The "Network01" asset catalog image resource.
static NSString * const ACImageNameNetwork01 AC_SWIFT_PRIVATE = @"Network01";

/// The "Network02" asset catalog image resource.
static NSString * const ACImageNameNetwork02 AC_SWIFT_PRIVATE = @"Network02";

/// The "Network03" asset catalog image resource.
static NSString * const ACImageNameNetwork03 AC_SWIFT_PRIVATE = @"Network03";

/// The "Network04" asset catalog image resource.
static NSString * const ACImageNameNetwork04 AC_SWIFT_PRIVATE = @"Network04";

/// The "Network05" asset catalog image resource.
static NSString * const ACImageNameNetwork05 AC_SWIFT_PRIVATE = @"Network05";

/// The "NeuralNetwork" asset catalog image resource.
static NSString * const ACImageNameNeuralNetwork AC_SWIFT_PRIVATE = @"NeuralNetwork";

/// The "Neuron" asset catalog image resource.
static NSString * const ACImageNameNeuron AC_SWIFT_PRIVATE = @"Neuron";

/// The "funcIcon" asset catalog image resource.
static NSString * const ACImageNameFuncIcon AC_SWIFT_PRIVATE = @"funcIcon";

/// The "plusIcon" asset catalog image resource.
static NSString * const ACImageNamePlusIcon AC_SWIFT_PRIVATE = @"plusIcon";

#undef AC_SWIFT_PRIVATE