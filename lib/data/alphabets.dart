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
  final List<String> _numbers = ["1","1 hand","2","2 hand","3","3 hand","4","4 hand","5","5 hand","6","6 hand","7","7 hand","8","8 hand","9","9 hand","10","10 hand","11","11 hand","12","12 hand","13","13 hand","14","14 hand","15","15 hand","16","16 hand","17","17 hand","18","18 hand","19","19 hand","20","20 hand"] ;

  List getAsList() {
    return _all.entries.toList();
  }
  List getWords(String? s) {
    return _all[s];
  }
  List getNumber(){
    return _numbers;
  }
}





