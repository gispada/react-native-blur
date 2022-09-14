import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps, HostComponent } from 'react-native';
import type {
  WithDefault,
  Int32,
} from 'react-native/Libraries/Types/CodegenTypes';
// @ts-ignore
import type { ColorValue } from 'react-native/Libraries/StyleSheet/StyleSheetTypes';

export interface NativeProps extends ViewProps {
  blurType?: WithDefault<
    | 'dark'
    | 'light'
    | 'xlight'
    | 'prominent'
    | 'regular'
    | 'extraDark'
    | 'chromeMaterial'
    | 'material'
    | 'thickMaterial'
    | 'thinMaterial'
    | 'ultraThinMaterial'
    | 'chromeMaterialDark'
    | 'materialDark'
    | 'thickMaterialDark'
    | 'thinMaterialDark'
    | 'ultraThinMaterialDark'
    | 'chromeMaterialLight'
    | 'materialLight'
    | 'thickMaterialLight'
    | 'thinMaterialLight'
    | 'ultraThinMaterialLight',
    'dark'
  >;
  blurAmount?: WithDefault<Int32, 10>;
  reducedTransparencyFallbackColor?: ColorValue;
}

export default codegenNativeComponent<NativeProps>(
  'BlurView'
) as HostComponent<NativeProps>;