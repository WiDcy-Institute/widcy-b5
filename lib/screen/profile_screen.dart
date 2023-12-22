import 'package:flutter/material.dart';
import 'package:widcy/screen/language_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontFamily: 'NotoSansKhmer'),),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.more_vert, color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                left:0,
                top:40,
                right: 0,
                child:  Container(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    radius: 100,
                    child: Icon(Icons.account_circle,size: 100,)
                  ),
                ),
              ),
              Opacity(
                opacity: 0.2, //from 0-1, 0.5 = 50% opacity
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/profile/banner.jpg'),
                      colorFilter: new ColorFilter.mode(Colors.white, BlendMode.dstOver),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Software Engineer',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Card(
            elevation: 0.2,
            child: ListTile(
              title: Text(AppLocalizations.of(context)!.username),
              leading: Icon(Icons.supervised_user_circle),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
          GestureDetector(
            child: Card(
              elevation: 0.2,
              child: ListTile(
                title: Text(AppLocalizations.of(context)!.language),
                leading: Icon(Icons.language),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
            onTap: (){
              final route = MaterialPageRoute(builder: (context) => LanguageScreen());
              Navigator.push(context, route);
            },
          )
        ],
      )
    );
  }


}
