# FCM送信サンプル

## 環境情報

| \\\/\\\/\\\/ | Version | Memo |
| ------------ | ------- | ---- |
| Flutter      | 3.22.2  |      |
| Dart         | 3.4.3   |      |
| DevTools     | 2.34.3  |      |

> 管理者権限で`fvm use dev`のコマンドを実施してください。

## プロジェクト作成

```bash
fvm spawn 3.22.2 create --platforms ios,android --org cn.gekal.example --project-name firebase_cloud_messaging .
# 管理者権限で実施して、`.fvmrc`を作成できる。
fvm use 3.22.2
```

## クラウドメッセージング

### FCM プラグインをインストールする

1. 必要なコマンドライン ツールをインストールする

    ```bash
    # Ref: https://firebase.google.com/docs/cli
    curl -sL https://firebase.tools | bash

    # ログイン
    firebase login
    firebase projects:list

    # Ref: https://pub.dev/packages/flutterfire_cli
    # 必要によて、PATHを変更してください。
    #   Windows: Pathに `%LOCALAPPDATA%\Pub\Cache\bin` を追加ください。
    #   Mac/Linux: `export PATH="$PATH":"$HOME/.pub-cache/bin"`
    dart pub global activate flutterfire_cli
    ```

2. アプリで Firebase を初期化する

    ```bash
    flutter pub add firebase_core
    flutter pub add firebase_messaging
    flutter pub add fluttertoast
    flutter pub add flutter_local_notifications
    ```

3. Firebase を使用するようにアプリを構成する

    ```bash
    # 認証＆設定を自動配置します。
    flutterfire configure

    # 登録されたアプリを確認します。
    firebase apps:list --project gekal-99999
    ```

## アプリケーション起動

1. ライブラリー取得

    ```bash
    flutter pub get
    ```

2. アプリ起動

    ```bash
    # エミュレータを確認して起動する。
    flutter emulators
    flutter emulators --launch Pixel_6_Pro_API_33
    
    # アプリケーションを起動する。
    flutter run
    
    # 複数デバイスがある時、デバイスIDを確認して起動してください。
    # flutter devices
    # flutter run --device-id xxxxxx
    ```
