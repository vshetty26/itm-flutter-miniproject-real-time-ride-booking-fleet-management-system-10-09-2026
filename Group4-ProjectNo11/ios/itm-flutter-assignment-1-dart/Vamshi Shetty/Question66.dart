mixin Playable {
  void play();
}

class Guitar with Playable {
  @override
  void play() {
    print("Strumming guitar");
  }
}

class Piano with Playable {
  @override
  void play() {
    print("Playing piano chords");
  }
}

void main() {
  Guitar g = Guitar();
  Piano p = Piano();
  g.play();
  p.play();
}
