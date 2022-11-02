import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/person.dart';
import 'package:mathematics/mathematics.dart';

void main() {
  test('${GsAlgo().toString()} ${GsAlgo().matching.toString()}', () {
    Person menA = const Person(id: 'men01',awareness: SelfAwareness.men);
    Person menB = const Person(id: 'men02',awareness: SelfAwareness.men);
    Person menC = const Person(id: 'men03',awareness: SelfAwareness.men);

    Person womenA = const Person(id: 'woman01',awareness: SelfAwareness.women);
    Person womenB = const Person(id: 'woman02',awareness: SelfAwareness.women);
    Person womenC = const Person(id: 'woman03',awareness: SelfAwareness.women);

    menA = menA.copyWith(fave: faveList([womenC,womenA,womenB]));
    menB = menB.copyWith(fave: faveList([womenC,womenB,womenA]));
    menC = menC.copyWith(fave: faveList([womenA,womenC,womenB]));

    womenA = womenA.copyWith(fave: faveList([menA,menB,menC]));
    womenB = womenB.copyWith(fave: faveList([menC,menA,menB]));
    womenC = womenC.copyWith(fave: faveList([menC,menB,menA]));

    List<Person> mens = [menA,menB,menC];
    List<Person> women = [womenA,womenB,womenC];

    final testClass = GsAlgo();
    final res = testClass.matching(mens, women);
    res.sort((a, b)=> a.first.id.compareTo(b.first.id));
    List<List<Person>> answers = [[menA,womenA],[menB,womenB],[menC,womenC]];
    pairsPrinter('res', res);
    pairsPrinter('answers', answers);
    for (int i=0; i < answers.length; i++) {
      var actMen = res[i].first;
      var actWomen = res[i].last;
      var expMen = answers[i].first;
      var expWomen = answers[i].last;
      // print('index: $i pairs ');
      // print('actMen.id:${actMen.id} expMen.id:${expMen.id}');
      // print('actWomen.id:${actWomen.id} expWomen.id:${expWomen.id}');
      expect(actMen.id, expMen.id);
      expect(actWomen.id, expWomen.id);
    }
  });
}

void pairsPrinter(String title, List<List<Person>> pairs){
  print(title);
  int i = 0;
  for (var element in pairs) {
    pairPrinter(i.toString(), element);
    i++;
  }
}

void pairPrinter(String index, List<Person> pair){
  print('index: $index pairs ');
  for (var value in pair) {
    print('id: ${value.id}');
  }
}

List<String> faveList(List<Person> list){
  return list.map((e) => e.id).toList();
}