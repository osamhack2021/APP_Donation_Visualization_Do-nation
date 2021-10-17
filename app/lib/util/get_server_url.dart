const String serverUrl = "https://694a-3-37-235-153.ngrok.io"; //must be https
const String apiPrefix = "api/v1";
const String publicPath = "public";

String getAPIUrl(String api) => "$serverUrl/$apiPrefix/$api";
String getPublicUrl(String name) => "$serverUrl/$publicPath/$name";
