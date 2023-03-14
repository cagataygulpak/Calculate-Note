class Ders {
  String ad;
  double harfdegeri;
  double krediDegeri;

  Ders({required this.ad, required this.harfdegeri, required this.krediDegeri});

  @override
  String toString() {
    
    return "$ad ve $harfdegeri ve $krediDegeri";
  }
}
