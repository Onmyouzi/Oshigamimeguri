# 関西ビギナーズハッカソンvol.2

チーム11_陰陽師

プロダクト名：推し神めぐり

# 推し神めぐり


## 環境構築
1. `git clone https://github.com/Onmyouzi/Oshigamimeguri.git`
2. `flutter pub get`
3. `open -a Simulator`
4. `SimulatorのFileタブ→new Simulator→iPhone 13`
5. `SimulatorのFileタブ→open Simulator→iPhone 13`
6. `flutter run`

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
