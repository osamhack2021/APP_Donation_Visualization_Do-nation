const String serverUrl = "https://66e1-20-205-186-233.ngrok.io";
const String apiPrefix = "api/v1";
const String publicPath = "public";

String getAPIUrl(String api) => "$serverUrl/$apiPrefix/$api";
String getPublicUrl(String name) => "$serverUrl/$publicPath/$name";
