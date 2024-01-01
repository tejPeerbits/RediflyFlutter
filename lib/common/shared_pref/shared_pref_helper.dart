import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();
  //
  // static void saveTemplate(Template template) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   print("organsation id =${template.organisationId}");
  //   sharedPreferences.setString("template", jsonEncode(template));
  // }
  //
  // static Future<Template> getTemplate() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return Template.fromJson(
  //     jsonDecode(sharedPreferences.getString("template")!),
  //   );
  // }
}
