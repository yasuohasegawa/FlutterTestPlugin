#import "FlutterTestPlugin.h"
#if __has_include(<FlutterTestPlugin/FlutterTestPlugin-Swift.h>)
#import <FlutterTestPlugin/FlutterTestPlugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "FlutterTestPlugin-Swift.h"
#endif

@implementation FlutterTestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterTestPlugin registerWithRegistrar:registrar];
}
@end
