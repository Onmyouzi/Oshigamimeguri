# 関西ビギナーズハッカソンvol.2

チーム11_陰陽師

プロダクト名：推し神めぐり

# 推し神めぐり


## 環境構築・最初にやって欲しいこと
1. `git clone https://github.com/Onmyouzi/Oshigamimeguri.git`
2. `flutter pub get`
3. `open -a Simulator`
4. `SimulatorのFileタブ→new Simulator→iPhone 13`
5. `SimulatorのFileタブ→open Simulator→iPhone 13`
6. `flutter run`

## firebaseについて
これはハッカソン本番に全員でmain.dartの非同期処理ができていることの確認が終わってからやりましょう！

上記の環境構築・最初にやって欲しいことを行ってから行ってください。

1. `firebase login`

    firebaseにチームgoogleアカウントでログイン

2. `dart pub global activate flutterfire_cli`

    チームのfirebaseプロジェクトを検索エンジンで開いておく。

3. `flutterfire configure`

    チームのfirebaseプロジェクトを選択

4. main.dartに以下がimportされているか確認
```shell
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
```
5. main.dartのvoid main()が以下の様になっているか確認
```shell
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
```


## flutter pubについて
`flutter pub add pub名`で新しいpubの追加

## Branch strategy
- 機能開発: features-ブランチ名

## Commit message
```shell
feat: 新しい機能
fix: バグの修正
docs: ドキュメントのみの変更
style: 空白、フォーマット、セミコロン追加など
refactor: 仕様に影響がないコード改善(リファクタ)
perf: パフォーマンス向上関連
test: テスト関連
chore: ビルド、補助ツール、ライブラリ関連
```
```shell
feat: 〇〇なため、△△を追加
ex) 記事の分類ができないため、タグ機能を追加
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
