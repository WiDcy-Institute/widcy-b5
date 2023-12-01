
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageDemoScreen extends StatefulWidget {

  const StorageDemoScreen({super.key});

  @override
  State<StorageDemoScreen> createState() => _StorageDemoScreenState();
}

class _StorageDemoScreenState extends State<StorageDemoScreen> {

  final Future<SharedPreferences> pref = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    saveData();
  }
   Future<void> saveData() async {
    SharedPreferences sPref = await pref;
    sPref.setString("school","WIDCY Institute2");
   }

   Future<String> getData() async{
    SharedPreferences sPref = await pref;
    return sPref.getString("school") ?? "" ;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Storage Demo"),
      ),
      body: Center(
        child: getSchoolInfo,
      ),
    );
  }

  Widget get getSchoolInfo{
    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context , AsyncSnapshot<String> snapshot) {

          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              return Text(snapshot.data.toString());
            }else{
              return Text("No Data");
            }
          }else{
            return CircularProgressIndicator();
          }
        }
        );
  }

}
