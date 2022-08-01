
import 'package:http/http.dart' as http;
import 'package:welcome_screen/pages/albums.dart';
class RemoteServices{
  Future<List<Albums>?> getPosts() async{
var client = http.Client();
var uri = Uri.parse('https://jsonplaceholder.typicode.com/albums');
var response =await client.get(uri);
if(response.statusCode == 200){
  var json = response.body;
  return albumsFromJson(json);
}
return null;
 

  }
}