import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:internacionalizacion/l10n/l10n.dart';
import 'package:internacionalizacion/provider/locale_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LocaleProvider(),
        builder: (context, snapshot) {
          final provider = Provider.of<LocaleProvider>(context, listen: true);
          return MaterialApp(
            title: 'Localizations Sample App',
            locale: provider.locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.locales,
            home: HomePage(),
          );
        });
  }
}

class HomePage extends StatelessWidget {
  String? text;
  @override
  Widget build(BuildContext context) {
    text = AppLocalizations.of(context)!.helloWorld;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final provider = Provider.of<LocaleProvider>(context, listen: false);
          if (provider.locale.languageCode == "es") {
            provider.setLocale(L10n.locales.last);
          } else {
            provider.setLocale(L10n.locales.first);
          }
        },
      ),
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: Text(text!),
        ),
      ),
    );
  }
}
