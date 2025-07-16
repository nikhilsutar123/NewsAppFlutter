class Constant {
  Constant._();

  /// api constants*
  static const baseUrl = "https://newsapi.org/v2/";
  static const headlines = "${baseUrl}top-headlines";
  static const searchNews = "${baseUrl}everything";
  static const defaultPageSize = "20";
  static const countryCodeUs = "us";
  static const apiKey = "c9352055c9294ad588fcd013fe50381c";

  /// app constants*
  static const newsApp = "News App";
  static const blackDot = "●";

  /// status codes*
  static const timeout = 10;
  static const successCode = 200;
  static const badRequest = 400;
  static const unauthorizedRequest = 401;

  /// image path
  static const placeholder = "lib/asset/image/placeholder.png";
  static const homescreenIcon = "lib/asset/image/home.svg";
  static const savedNewsIcon = "lib/asset/image/saved.svg";
  static const searchNewsIcon = "lib/asset/image/search.svg";

  /// database name
  static const newsDatabase = "newsBox";

  /// error msgs
  static const savedNewsLoadError = "Failed to saved news...";
  static const savedNewsEmpty = "No Saved News yet.";
}
