part of '/ui.theme/theme_app.dart';

//Esquema de colores Light
ColorScheme get _colorSchemaLight => ColorScheme.light(
      primary: _colorPrimary,
      onPrimary: _colorOnPrimary,
      secondary: _colorSecondary,
      onSecondary: _colorOnSecondary,
      error: _colorError,
      onError: _colorOnError,
      background: _colorBackground,
      onBackground: _colorOnBackground,
      surface: _colorSurface,
      onSurface: _colorOnSurface,
    );

//Esquema de colores Dark
ColorScheme get _colorSchemaDark => ColorScheme.dark(
      primary: _colorDarkPrimary,
      onPrimary: _colorDarkOnPrimary,
      secondary: _colorDarkSecondary,
      onSecondary: _colorDarkOnSecondary,
      error: _colorDarkError,
      onError: _colorDarkOnError,
      background: _colorDarkBackground,
      onBackground: _colorDarkOnBackground,
      surface: _colorDarkSurface,
      onSurface: _colorDarkOnSurface,
    );

//Modo Ligth
Color get _colorPrimary => hexToColor("#6200EE");
Color get _colorOnPrimary => _colorWhite;
Color get _colorSecondary => hexToColor("#03DAC6");
Color get _colorOnSecondary => _colorBlack;
Color get _colorError => hexToColor("#B00020");
Color get _colorOnError => _colorWhite;
Color get _colorBackground => _colorWhite;
Color get _colorOnBackground => _colorBlack;
Color get _colorSurface => _colorWhite;
Color get _colorOnSurface => _colorBlack;

//Modo Dark
Color get _colorDarkPrimary => hexToColor("#BB86FC");
Color get _colorDarkOnPrimary => _colorBlack;
Color get _colorDarkSecondary => hexToColor("#03DAC6");
Color get _colorDarkOnSecondary => _colorBlack;
Color get _colorDarkError => hexToColor("#CF6679");
Color get _colorDarkOnError => _colorBlack;
Color get _colorDarkBackground => _colorBlack;
Color get _colorDarkOnBackground => _colorWhite;
Color get _colorDarkSurface => _colorBlack;
Color get _colorDarkOnSurface => _colorWhite;

//colores negros y blancos
Color get _colorBlack => hexToColor("#000000");
Color get _colorWhite => hexToColor("#ffffff");

//Convierte de 0xFF000000 A FF000000 <- HEXADECIMAL
Color hexToColor(String code) =>
    Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
