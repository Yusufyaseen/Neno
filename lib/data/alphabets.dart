class Alphabets{


  final Map _all = {
    'A' : ["animal","Alligator","Ant","Apple"],
    'B' : ["Baby","Ball","Basket","Bean"],
    'C' : ["Cake","Cap","Car","Cat","Clock"],
    'D' : ["Daughter","Deer","Desk","Dolphin","Duck"],
    'E' : ["Ear","Egg","Elephant","Eye"],
    'F' : ["Face","Father","Finger","Flower","Friend"],
    'G' : ["Garden","Glass","Goat","Gold","Green"],
    'H' : ["Hair","Hand","Heart","Horse","House"],
    'I' : ["Ice-cream","Ink","Insect","Iron"],
    'J' : ["Jam","Jelly","juice"],
    'K' : ["Kangaroo","Key","Kids","King","Kite"],
    'L' : ["Ladder","Lemon","Lamp","Line"],
    'M' : ["Market","Milk","Monkey","Moon","Mouth"],
    'N' : ["Necklace","Nest","Night","Nose"],
    'O' : ["Off","Office","On","Open","Orange"],
    'P' : ["Paint","Paper","Picture","Plan","Planet"],
    'Q' : ["Queen","Question","Quiver","Quiz"],
    'R' : ["Rabbit","Radio","Rain","Ring","Round"],
    'S' : ["Snake","Snow","Square","Stop"],
    'T' : [ "Taxi","Telephone","Tennis","Tiger","Train"],
    'U' : [ "Umbrella","Uncle","Unicorn","Uniform"],
    'V' : ["Van","Vase","Vegetable","Violin","Volcano"],
    'W' : ["Wake-up","Wasp","White","Window","Winter"],
    'X' : [ "X-ray","Xylophone"],
    'Y' : ["Yacht","Yellow","Yogurt","Yoyo"],
    'Z' : ["Zebra","Zero","Zigzag","Zoo"],
  };
  List getAsList() {
    return _all.entries.toList();
  }
  List getWords(String? s) {
    return _all[s];
  }
}





