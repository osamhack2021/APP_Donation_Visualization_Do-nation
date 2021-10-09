const String serverUrl = "3.37.235.153:8000";
const String apiPrefix = "api/v1";
const String publicPath = "public";

String getAPIUrl(String api) => "$serverUrl/$apiPrefix/$api";
String getPublicUrl(String name) => "$serverUrl/$publicPath/$name";
