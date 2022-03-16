import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internacionalizacion/l10n/l10n.dart';
import 'package:internacionalizacion/provider/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LocaleProvider(),
        builder: (context, _) {
          final provider = Provider.of<LocaleProvider>(context, listen: true);
          return MaterialApp(
            title: 'Material App',
            home: MyHomePage(),
            debugShowCheckedModeBanner: false,
            locale: provider.locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.locales,
          );
        });
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String texto = AppLocalizations.of(context)!.hello;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        final provider = Provider.of<LocaleProvider>(context, listen: false);
        if (provider.locale.languageCode == "es") {
          provider.setLocale(L10n.locales.last);
        } else {
          provider.setLocale(L10n.locales.first);
        }
      }),
      body: Container(
        child: Center(child: Text(texto)),
      ),
    );
  }
}
