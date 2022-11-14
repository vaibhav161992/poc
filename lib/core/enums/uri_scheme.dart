/// Defines the [Uri] scheme to use within the API client.
///
/// `http` should only be used within dev for sending data to the CL endpoint,
/// as it does not use https.
enum UriScheme {
  https,
  http,
}
