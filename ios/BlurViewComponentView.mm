#ifdef RCT_NEW_ARCH_ENABLED

#import "BlurViewComponentView.h"

#import <React/RCTConversions.h>
#import <React/RCTFabricComponentsPlugins.h>

#import <react/renderer/components/rnblurview/ComponentDescriptors.h>
#import <react/renderer/components/rnblurview/EventEmitters.h>
#import <react/renderer/components/rnblurview/Props.h>
#import <react/renderer/components/rnblurview/RCTComponentViewHelpers.h>

#import "BlurView.h"

using namespace facebook::react;

@interface BlurViewComponentView () <RCTBlurViewViewProtocol>
@end

@implementation BlurViewComponentView
{
  BlurView *_blurView;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<BlurViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const BlurViewProps>();
    _props = defaultProps;
    _blurView = [[BlurView alloc] initWithFrame:self.bounds];
    self.contentView = _blurView;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<const BlurViewProps>(_props);
  const auto &newViewProps = *std::static_pointer_cast<const BlurViewProps>(props);
  
  if (oldViewProps.blurAmount != newViewProps.blurAmount) {
    NSNumber *blurAmount = [NSNumber numberWithInt:newViewProps.blurAmount];
    [_blurView setBlurAmount:blurAmount];
  }

  if (oldViewProps.blurType != newViewProps.blurType) {
    NSString *blurType = [NSString stringWithUTF8String:toString(newViewProps.blurType).c_str()];
    [_blurView setBlurType:blurType];
  }
  
  if (oldViewProps.reducedTransparencyFallbackColor != newViewProps.reducedTransparencyFallbackColor) {
    UIColor *color = RCTUIColorFromSharedColor(newViewProps.reducedTransparencyFallbackColor);
    [_blurView setReducedTransparencyFallbackColor:color];
  }
  
  [super updateProps:props oldProps:oldProps];
}

@end

Class<RCTComponentViewProtocol> BlurViewCls(void)
{
  return BlurViewComponentView.class;
}

#endif // RCT_NEW_ARCH_ENABLED