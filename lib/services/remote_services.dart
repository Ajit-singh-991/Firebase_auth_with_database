
import 'package:http/http.dart' as http;
import 'package:welcome_screen/pages/albums.dart';
class RemoteServices{
  Future<Problems?> getPosts() async{
var client = http.Client();
var uri = Uri.parse('https://pastebin.com/jKVv22p8');
var response =await client.get(uri);
if(response.statusCode == 200){
  var json = response.body;
  return problemsFromJson(json);
}
return null;
 

  }
}