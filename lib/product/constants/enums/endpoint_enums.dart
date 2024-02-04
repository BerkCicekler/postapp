enum NetworkEndPoints {
  user('/users'),
  post('/posts');

  final String value;

  const NetworkEndPoints(this.value);
}
