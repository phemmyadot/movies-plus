class ConfigurationResponse {
  final String baseUrl;
  final String secureBaseUrl;

  ConfigurationResponse({
    this.baseUrl,
    this.secureBaseUrl,
  });

  factory ConfigurationResponse.fromJson(Map<dynamic, dynamic> json) {
    return ConfigurationResponse(
      baseUrl: json['base_url'],
      secureBaseUrl: json['secure_base_url'],
    );
  }
}
