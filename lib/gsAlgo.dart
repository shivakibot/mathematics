part of 'mathematics.dart';

/// Gale–Shapley アルゴリズム
/// 安定マッチング
class GsAlgo{
  List<List<Person>> matching(List<Person> askOut, List<Person> askedOut){
    List<List<Person>> pairs = [];
    /// askOut が全員キープされるまで、マッチングを行う。
    while(pairs.length != askOut.length){
      for (int j = 0; j < askOut.length; j++) {
        if(askOut[j].keep != null) continue;
        /// 今ままで振られていない中で一番結婚したい askedOut に告白する。
        var first = askOut[j].fave.where((target) => askOut[j].dumped.contains(target) == false).first;
        for(int i = 0; i < askedOut.length; i++){
          if(askedOut[i].id != first){
            print('not askedOut');
            continue;
          }
          /// キープされていなければ、ペアになる。
          if(askedOut[i].keep == null){
            print('success ask');
            pairs.add([askOut[j],askedOut[i]]);
            var updatedAsked = askedOut[i].copyWith(keep: askOut[j].id);
            var updatedAsk = askOut[j].copyWith(keep: askedOut[i].id);
            askedOut[i] = updatedAsked;
            askOut[j] = updatedAsk;
            break;
          }
          /// 今のキープしている askOutよりも良い相手なら、告白してきた人をキープする。（今ままでキープしていた人とはさよならする。）
          if(askedOut[i].fave.indexOf(askOut[j].id) < askedOut[i].fave.indexOf(askedOut[i].keep!)){
            print('success ask and dump keep');
            pairs.removeWhere((element)=> (element.first.id == askedOut[i].keep! && element.last.id == askedOut[i].id));
            pairs.add([askOut[j],askedOut[i]]);
            var updatedAsked = askedOut[i].copyWith(
              dumped: {...askedOut[i].dumped,askedOut[i].keep!},
              keep: askOut[j].id,
            );
            var dumper = askOut.indexOf(askOut.firstWhere((element) => element.id == askedOut[i].keep!));
            var updatedAsk = askOut[dumper].copyWith(
              dumped: {...askOut[dumper].dumped,askedOut[i].id},
              keep: null,
            );
            askedOut[i] = updatedAsked;
            askOut[dumper] = updatedAsk;
          }else{
            print('dump keep');
            /// 普通に振る。
            var updatedAsked = askedOut[i].copyWith(
              dumped: {...askedOut[i].dumped,askOut[j].id},
              keep: askOut[j].id,
            );
            var updatedAsk = askOut[j].copyWith(
              dumped: {...askOut[j].dumped,askedOut[i].id},
              keep: askedOut[i].id,
            );
            askedOut[i] = updatedAsked;
            askOut[j] = updatedAsk;
          }
          break;
        }
      }
    }

    return pairs;
  }
}