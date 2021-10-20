const String serverUrl = "https://donationvisualization.ml"; //must be https
const String apiPrefix = "api/v1";
const String publicPath = "public";

String getAPIUrl(String api) => "$serverUrl/$apiPrefix/$api";
String getPublicUrl(String name) => "$serverUrl/$publicPath/$name";
