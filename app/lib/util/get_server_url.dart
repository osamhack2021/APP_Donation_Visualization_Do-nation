const String serverUrl = "https://8e0f-13-76-112-200.ngrok.io";
const String apiPrefix = "api/v1";
const String publicPath = "public";

String getAPIUrl(String api) => "$serverUrl/$apiPrefix/$api";
String getPublicUrl(String name) => "$serverUrl/$publicPath/$name";
