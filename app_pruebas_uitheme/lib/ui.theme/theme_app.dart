import 'package:flutter/material.dart';
import 'package:app_pruebas_uitheme/ui.theme/size_app.dart';

part 'package:app_pruebas_uitheme/ui.theme/colors_app.dart';
part 'package:app_pruebas_uitheme/ui.theme/styles/style_text_app.dart';

TextTheme get _themeBase => TextTheme(
      displayLarge: _styleH1,
      displayMedium: _styleH2,
      displaySmall: _styleH3,
      headlineMedium: _styleH4,
      headlineSmall: _styleH5,
      titleLarge: _styleH6,
      titleMedium: _styleSubtitle1,
      titleSmall: _styleSubtitle2,
      bodyLarge: _styleBodyText1,
      bodyMedium: _styleBodyText2,
      labelLarge: _styleButton,
      bodySmall: _styleCaption,
      labelSmall: _styleOverline,
    );
TextTheme get _textThemeLight => _themeBase.apply(
      bodyColor: _colorSchemaLight.onBackground,
      displayColor: _colorSchemaLight.onBackground,
    );
TextTheme get _textThemeDark => _themeBase.apply(
      bodyColor: _colorSchemaDark.onBackground,
      displayColor: _colorSchemaDark.onBackground,
    );
/*    
TextTheme get _textThemePrimary => _themeBase.apply(
      bodyColor: _colorSchemaDark.primary,
      displayColor: _colorSchemaDark.primary,
    );
*/
ThemeData get themeDataLight => ThemeData(
      textTheme: _textThemeLight,
      colorScheme:
          _colorSchemaLight.copyWith(background: _colorSchemaLight.background),
    );

ThemeData get themeDataDark => ThemeData(
      textTheme: _textThemeDark,
      colorScheme:
          _colorSchemaDark.copyWith(background: _colorSchemaDark.background),
    );
