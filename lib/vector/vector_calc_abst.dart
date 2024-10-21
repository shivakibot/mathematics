/// 線形回帰演算クラス
/// 以下の操作を規定
///
/// グロス傾向算出（基底ベクトル算出）
/// 類似性算出（線形従属判定）
/// 類似性算出（ドット積）
/// 射影（影響寄与算出）
/// ブランド志向性算出（線形結合）
///
abstract class VectorCalcAbst{
  void getGross();
  bool isLinearDependence();
  bool isAffinity();
  void getEngagement();
  void getBasis();
}