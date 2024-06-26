import 'package:flutter/material.dart';

class Home {
  static const title = "Home Page";
}

// Fictitious brand color. 0xFF
const Color brandBlue = Color(0xFF0F52BA);
// COLORS outside of color scheme
const Color primaryLight = Color(0xFF5786CF);
const Color secondaryContainer = Color(0xFF4CCFA7);
const Color onCards = Color(0xFF344054);
const Color divider = Color(0xFFDDE5E9);
const Color primaryButton = Color(0xFF0F52BA);
const Color primaryButtonHover = Color(0xFF2260BF);
const Color primaryButtonFocus = Color(0xFF2C67C2);
const Color secondaryButton = Color(0xFFFFFFFF);
const Color secondaryButtonHover = Color(0xFFECF2FA);
const Color secondaryButtonFocus = Color(0xFFE2EAF6);
const Color toggle = Color(0xFF0F52BA);
const Color checkbox = Color(0xFF0F52BA);
const Color radioButton = Color(0xFF0F52BA);
const Color sidebarBackground = Color(0xFFFFFFFF);
const Color sidebarSelectedText = Color(0xFF344054);
const Color sidebarIndicator = Color(0xFFDBE5F5);
const Color disabled = Color(0xFFDDDFE1);
const Color dropdownIndicator = Color(0xFFF3F6FB);
const Color dropdownSelected = Color(0xFFDBE5F5);
const Color filtersText = Color(0xFF0F52BA);
const Color filtersBackground = Color(0xFFFFFFFF);
const Color scrim = Color(0xFFB3E5FC);
const Color outlineVariant = Color(0xFF9E9E9E);
const Color outline = Color(0xFF607D8B);
const Color inversePrimary = Color(0xFF03A9F4);
const Color inverseSurface = Color(0xFFBBDEFB);
const Color onInverseSurface = Color(0xFF212121);
const Color tertiary = Color(0xFF027A48);
const Color tertiaryContainer = Color(0xFFF6FEF9);
const Color surface = Color(0xFFF9FBFD);
const Color surfaceTint = Color(0xFFBDBDBD);
const Color surfaceVariant = Color(0xFF98A2B3);
const Color shadow = Color(0xFF616161); // Semi-transparent black for shadow
const Color aboutUsGradientData = Color(0xFF81B0FB);
const Color errorField = Color(0xFFB3261E);

const Color hintColor = Color(0xFFB9B9B9);
const Color normalTileColor = Color(0xFFF7F9FB);

const Color activeStepper = Color.fromRGBO(15, 82, 186, 1);
const Color activeTextStepper = Colors.black;
const Color activeLineStepper = Colors.grey;
const Color activeBackgroundStepper = Color.fromRGBO(238, 243, 248, 1);
const Color unreachedStepper = Color.fromRGBO(15, 82, 186, 0.7);
const Color finishedBackgroundStepper = Color.fromRGBO(0, 142, 117, 0.05);
const Color finishedStepper = Color.fromRGBO(0, 142, 117, 1);
const Color stepProgress = Colors.green;
const Color questionDropDown = Color.fromRGBO(221, 229, 233, 1);

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: brandBlue,
  // Primary color and its variants
  primary: const Color(0xFF0F52BA),
  onPrimary: const Color(0xFFE7EEF8),
  primaryContainer: const Color(0xFF5786CF),
  onPrimaryContainer: const Color(0xFFFFFFFF),

  // Secondary color and its variants
  secondary: const Color(0xFF008E75),
  onSecondary: const Color(0xFFFFFFFF),
  // secondaryContainer: const Color(0xFF4CCFA7),
  secondaryContainer: inverseSurface,
  onSecondaryContainer: const Color(0xFFA6FFD1),

  // Background color and its variant
  background: const Color(0xFFFFFFFF),
  onBackground: const Color(0xFF344054),

  // Error color and its variants
  error: const Color(0xFFB42318),
  onError: const Color(0xFFFFFFFF),
  errorContainer: const Color(0xFFFEC84B),
  onErrorContainer: const Color(0xFF344054),
  brightness: Brightness.light,

  // Colors for various UI components
  scrim: const Color(0xFFB3E5FC),
  outlineVariant: const Color(0xFF9E9E9E),
  outline: const Color(0xFF607D8B),
  inversePrimary: const Color(0xFF03A9F4),
  inverseSurface: const Color(0xFFBBDEFB),
  onInverseSurface: const Color(0xFF212121),
  tertiary: const Color(0xFF027A48),
  tertiaryContainer: const Color(0xFFF6FEF9),
  surface: const Color(0xFFF9FBFD),
  surfaceTint: const Color(0xFFBDBDBD),
  surfaceVariant: const Color(0xFF98A2B3),
  shadow: const Color(0xFF616161), // Semi-transparent black for shadow
);

//!DARK_COLOR

Color getComplementary(Color color) {
  return Color(0xFFFFFF - color.value + 0xFF000000);
}

Color primaryLightDark = getComplementary(const Color(0xFF5786CF));
Color onCardsDark = getComplementary(const Color(0xFF344054));
Color dividerDark = getComplementary(const Color(0xFFDDE5E9));
Color primaryButtonDark = getComplementary(const Color(0xFF0F52BA));
Color primaryButtonHoverDark = getComplementary(const Color(0xFF2260BF));
Color primaryButtonFocusDark = getComplementary(const Color(0xFF2C67C2));
Color secondaryButtonDark = getComplementary(const Color(0xFFFFFFFF));
Color secondaryButtonHoverDark = getComplementary(const Color(0xFFECF2FA));
Color secondaryButtonFocusDark = getComplementary(const Color(0xFFE2EAF6));
Color toggleDark = getComplementary(const Color(0xFF0F52BA));
Color checkboxDark = getComplementary(const Color(0xFF0F52BA));
Color radioButtonDark = getComplementary(const Color(0xFF0F52BA));
Color sidebarBackgroundDark = getComplementary(const Color(0xFFFFFFFF));
Color sidebarSelectedTextDark = getComplementary(const Color(0xFF344054));
Color sidebarIndicatorDark = getComplementary(const Color(0xFFDBE5F5));
Color disabledDark = getComplementary(const Color(0xFFDDDFE1));
Color dropdownIndicatorDark = getComplementary(const Color(0xFFF3F6FB));
Color dropdownSelectedDark = getComplementary(const Color(0xFFDBE5F5));
Color filtersTextDark = getComplementary(const Color(0xFF0F52BA));
Color filtersBackgroundDark = getComplementary(const Color(0xFFFFFFFF));
Color scrimDark = getComplementary(const Color(0xFFB3E5FC));
Color outlineVariantDark = getComplementary(const Color(0xFF9E9E9E));
Color outlineDark = getComplementary(const Color(0xFF607D8B));
Color inversePrimaryDark = getComplementary(const Color(0xFF03A9F4));
Color inverseSurfaceDark = getComplementary(const Color(0xFFBBDEFB));
Color onInverseSurfaceDark = getComplementary(const Color(0xFF212121));
Color tertiaryDark = getComplementary(const Color(0xFF027A48));
Color tertiaryContainerDark = getComplementary(const Color(0xFFF6FEF9));
Color surfaceTintDark = getComplementary(const Color(0xFFBDBDBD));
Color surfaceVariantDark = getComplementary(const Color(0xFF98A2B3));
Color shadowDark = getComplementary(
    const Color(0xFF616161)); // Semi-transparent black for shadow

// final darkColorScheme = ColorScheme.fromSeed(
//   seedColor: brandBlue,
//   primary: getComplementary(const Color(0xFF0F52BA)),
//   onPrimary: getComplementary(const Color(0xFFE7EEF8)),
//   primaryContainer: getComplementary(const Color(0xFF5786CF)),
//   onPrimaryContainer: getComplementary(const Color(0xFFFFFFFF)),
//   secondary: getComplementary(const Color(0xFF008E75)),
//   onSecondary: getComplementary(const Color(0xFFFFFFFF)),
//   secondaryContainer: getComplementary(const Color(0xFF4CCFA7)),
//   onSecondaryContainer: getComplementary(const Color(0xFFA6FFD1)),
//   background: getComplementary(const Color(0xFFFFFFFF)),
//   onBackground: getComplementary(const Color(0xFF344054)),
//   error: getComplementary(const Color(0xFFB42318)),
//   onError: getComplementary(const Color(0xFFFFFFFF)),
//   errorContainer: getComplementary(const Color(0xFFFEC84B)),
//   onErrorContainer: getComplementary(const Color(0xFF344054)),
//   brightness: Brightness.dark,
//   scrim: scrimDark,
//   outlineVariant: outlineVariantDark,
//   outline: outlineDark,
//   inversePrimary: inversePrimaryDark,
//   inverseSurface: inverseSurfaceDark,
//   onInverseSurface: onInverseSurfaceDark,
//   tertiary: tertiaryDark,
//   tertiaryContainer: tertiaryContainerDark,
//   surface: getComplementary(const Color(0xFFF9FBFD)),
//   surfaceTint: surfaceTintDark,
//   surfaceVariant: surfaceVariantDark,
//   shadow: shadowDark,
// );

//LEGACY
final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: brandBlue,
  // Primary color and its variants
  primary: const Color(0xFF0F52BA),
  onPrimary: const Color(0xFFE7EEF8),
  primaryContainer: const Color(0xFF002366),
  onPrimaryContainer: const Color(0xFFFFFFFF),

  // Secondary color and its variants
  secondary: const Color(0xFF008E75),
  onSecondary: const Color(0xFFFFFFFF),
  secondaryContainer: const Color(0xFF00524C),
  onSecondaryContainer: const Color(0xFFFFFFFF),

  // Background color and its variant
  background: const Color(0xFF000000),
  onBackground: const Color(0xFFFFFFFF),

  // Error color and its variants
  error: const Color(0xFFB42318),
  onError: const Color(0xFFFFFFFF),
  errorContainer: const Color(0xFF7A150D),
  onErrorContainer: const Color(0xFFFFFFFF),

  // Colors for various UI components
  scrim: const Color(0xFF0F52BA),
  outlineVariant: const Color(0xFF424242),
  outline: const Color(0xFF1B1B1B),
  inversePrimary: const Color(0xFF03A9F4),
  inverseSurface: const Color(0xFF121212),
  onInverseSurface: const Color(0xFFFFFFFF),
  tertiary: const Color(0xFF00BCD4),
  tertiaryContainer: const Color(0xFF007788),
  surface: const Color(0xFF121212),
  surfaceTint: const Color(0xFF424242),
  surfaceVariant: const Color(0xFF242424),
  shadow: const Color(0xFF000000),
);
