# FCM送信サンプル

## プロジェクト作成

```bash
flutter create --platforms ios,android --project-name firebase_cloud_messaging .
```

## クラウドメッセージング

### FCM プラグインをインストールする

1. 必要なコマンドライン ツールをインストールする

    ```bash
    curl -sL https://firebase.tools | bash
    
    # ログイン
    firebase login
    firebase projects:list
    
    dart pub global activate flutterfire_cli
    ```

3. アプリで Firebase を初期化する

    ```bash
    flutter pub add firebase_core
    flutter pub add firebase_messaging
    flutter pub add fluttertoast
    flutter pub add flutter_local_notifications
    ```

4. Firebase を使用するようにアプリを構成する

    ```bash
    flutterfire configure
    ```