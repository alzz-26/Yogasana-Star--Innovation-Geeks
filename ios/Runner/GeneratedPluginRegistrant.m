//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<audio_manager/AudioManagerPlugin.h>)
#import <audio_manager/AudioManagerPlugin.h>
#else
@import audio_manager;
#endif

#if __has_include(<audio_session/AudioSessionPlugin.h>)
#import <audio_session/AudioSessionPlugin.h>
#else
@import audio_session;
#endif

#if __has_include(<camerawesome/CamerawesomePlugin.h>)
#import <camerawesome/CamerawesomePlugin.h>
#else
@import camerawesome;
#endif

#if __has_include(<flutter_speech/FlutterSpeechRecognitionPlugin.h>)
#import <flutter_speech/FlutterSpeechRecognitionPlugin.h>
#else
@import flutter_speech;
#endif

#if __has_include(<google_ml_kit/GoogleMlKitPlugin.h>)
#import <google_ml_kit/GoogleMlKitPlugin.h>
#else
@import google_ml_kit;
#endif

#if __has_include(<image_picker/FLTImagePickerPlugin.h>)
#import <image_picker/FLTImagePickerPlugin.h>
#else
@import image_picker;
#endif

#if __has_include(<just_audio/JustAudioPlugin.h>)
#import <just_audio/JustAudioPlugin.h>
#else
@import just_audio;
#endif

#if __has_include(<path_provider/FLTPathProviderPlugin.h>)
#import <path_provider/FLTPathProviderPlugin.h>
#else
@import path_provider;
#endif

#if __has_include(<shared_preferences/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences;
#endif

#if __has_include(<speech_to_text/SpeechToTextPlugin.h>)
#import <speech_to_text/SpeechToTextPlugin.h>
#else
@import speech_to_text;
#endif

#if __has_include(<url_launcher/FLTURLLauncherPlugin.h>)
#import <url_launcher/FLTURLLauncherPlugin.h>
#else
@import url_launcher;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AudioManagerPlugin registerWithRegistrar:[registry registrarForPlugin:@"AudioManagerPlugin"]];
  [AudioSessionPlugin registerWithRegistrar:[registry registrarForPlugin:@"AudioSessionPlugin"]];
  [CamerawesomePlugin registerWithRegistrar:[registry registrarForPlugin:@"CamerawesomePlugin"]];
  [FlutterSpeechRecognitionPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterSpeechRecognitionPlugin"]];
  [GoogleMlKitPlugin registerWithRegistrar:[registry registrarForPlugin:@"GoogleMlKitPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [JustAudioPlugin registerWithRegistrar:[registry registrarForPlugin:@"JustAudioPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [SpeechToTextPlugin registerWithRegistrar:[registry registrarForPlugin:@"SpeechToTextPlugin"]];
  [FLTURLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTURLLauncherPlugin"]];
}

@end
