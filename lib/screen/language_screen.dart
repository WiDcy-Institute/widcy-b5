import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widcy/util/language_provider.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  @override
  void initState() {
    super.initState();
  }

  bool checkLanguage(String lang, LanguageProvider languageProvider){
     return lang == languageProvider.appLocal.languageCode;
  }

  @override
  Widget build(BuildContext context) {

    var languageProvider = Provider.of<LanguageProvider>(context);
    final locale = languageProvider.appLocal;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.changeLanguage, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'NotoSansKhmer'),),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
          iconTheme: IconThemeData(color: Colors.white)
      ),
      body: ListView(
        children: [
          CheckboxListTile(
              title: new Text(
                AppLocalizations.of(context)!.englishLanguage!,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5),
              ),
              value: locale.languageCode == "en",
              secondary: Container(
                height: 50,
                width: 50,
                child: Icon(Icons.language),
              ),
              onChanged: (bool? val) {
                final provider = Provider.of<LanguageProvider>(context, listen: false);
                provider.changeLanguage(Locale("en"));
              }
          ),
          Divider(),
          CheckboxListTile(
            activeColor: Colors.pink[300],
            //font change
            title: new Text(
              AppLocalizations.of(context)!.khmerLanguage!,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5),
            ),
            value: locale.languageCode == "km" ? true : false,
            secondary: Container(
              height: 50,
              width: 50,
              child: Icon(Icons.language),
            ),
            onChanged: (bool? value) {
              final provider = Provider.of<LanguageProvider>(context, listen: false);
              provider.changeLanguage(Locale("km"));
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
