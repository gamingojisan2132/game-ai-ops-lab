# 作業ログ

作業ログを記録するファイルです。

作業後は、実施内容、実行したコマンド、結果、失敗や回避策、次にやることを残してください。

## 記録形式

```md
## YYYY-MM-DD

### やったこと

### 実行したコマンド

### 結果

### 失敗・回避策

### 次にやること
```

## 2026-05-09

### やったこと

- 初期リポジトリ構成を作成した。
- `AGENTS.md`、`README.md`、`docs/`、`prompts/`、`scripts/`、`public/assets/`、`.github/workflows/` を追加した。
- AIエージェント向け作業ルール、タスク管理、意思決定ログ、作業ログ、レビューガイド、ゲーム案メモ、定型プロンプトを作成した。
- `scripts/check-repo.ps1` を作成し、必須ファイルと必須ディレクトリの存在を確認できるようにした。
- `.github/workflows/build.yml` を作成し、GitHub Actionsで軽量な構成チェックを行うようにした。

### 実行したコマンド

```powershell
.\scripts\check-repo.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\check-repo.ps1
```

### 結果

- `.\scripts\check-repo.ps1` はローカルPowerShellの実行ポリシーで停止した。
- `powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\check-repo.ps1` は成功し、`Repository structure check passed.` を確認した。

### 失敗・回避策

- 失敗: ローカルPowerShellの実行ポリシーにより、通常のスクリプト実行が停止した。
- 回避策: 環境問題の切り分けとして、実行時だけ `-ExecutionPolicy Bypass` を指定した。
- 通常の直し方: 利用者または管理者がローカルPowerShellの実行ポリシーを適切に設定する。
- デメリット: その実行1回について通常より制限を緩める。
- 将来的に戻すべきか: ローカル環境設定が整えば、通常の `.\scripts\check-repo.ps1` 実行に戻すべき。
- 区分: PowerShell実行ポリシーは環境問題。
- 補足: スクリプト内の日本語出力がWindows PowerShellで文字化けしたため、CIとローカル互換性を優先してスクリプト出力をASCIIにした。これはプロジェクト側の互換性対応。

### 次にやること

- `docs/GAME_IDEAS.md` をPhaserで作りやすい小ゲーム案として整理する。
- `docs/DECISIONS.md` に初期技術判断を記録する。
- `README.md` を人間向けの作業開始手順として整理する。

## 2026-05-09

### やったこと

- `AGENTS.md` を指定ルールに沿って整理した。
- `docs/TASKS.md` を、現在の目的、未完了タスク、完了タスク、確認済みコマンド、未確認事項、次に人間が確認すべきことが分かる形式に整理した。

### 実行したコマンド

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\check-repo.ps1
```

### 結果

- `AGENTS.md` をUTF-8として読み、指定ルールが反映されていることを確認した。
- 構成チェックは成功し、`Repository structure check passed.` を確認した。

### 失敗・回避策

- 回避策: PowerShell実行ポリシーの環境差分を切り分けるため、`-ExecutionPolicy Bypass` を使った。
- 通常の直し方: 利用者または管理者がローカルPowerShellの実行ポリシーを適切に設定する。
- デメリット: その実行1回について通常より制限を緩める。
- 将来的に戻すべきか: ローカル環境設定が整えば、通常実行へ戻すべき。
- 区分: 環境問題。

### 次にやること

- Phaserで作りやすい小ゲーム案を整理する。
- 技術判断とレビュー観点を更新する。

## 2026-05-09

### やったこと

- `docs/DECISIONS.md` を仕様判断・技術判断の記録ファイルとして整理した。
- 軽量なWebゲーム環境を優先する判断、Phaser / three.js / 素のWeb実装を候補にする判断、UI中心の2DゲームではPhaserを第一候補にする判断、ドキュメント駆動で進める判断を記録した。
- `docs/GAME_IDEAS.md` にPhaserで1〜3日で試作しやすいスマホ縦画面向け小ゲーム案を10個記録した。
- `docs/REVIEW_GUIDE.md` を、人間がAIの作業結果を確認する観点として整理した。
- `prompts/` の3ファイルを、今後Codexに投げるための雛形として整理した。
- `README.md` を人間向けに、目的、AIエージェント運用、構成、作業の始め方、Codexへの依頼手順、Windows注意点、未確認事項が分かるように更新した。
- `.github/workflows/build.yml` を、アプリ本体がない現段階では軽量な構成チェックのみ行うワークフローとして整理した。

### 実行したコマンド

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\check-repo.ps1
```

### 結果

- 構成チェックは成功し、`Repository structure check passed.` を確認した。

### 失敗・回避策

- 現時点では新しい失敗・回避策なし。
- PowerShell実行ポリシーの環境差分については、引き続き `-ExecutionPolicy Bypass` による切り分け確認を使う。
- 通常の直し方: 利用者または管理者がローカルPowerShellの実行ポリシーを適切に設定する。
- デメリット: その実行1回について通常より制限を緩める。
- 将来的に戻すべきか: ローカル環境設定が整えば、通常実行へ戻すべき。
- 区分: 環境問題。

### 次にやること

- `docs/GAME_IDEAS.md` の10案から、最初に試作する候補を1つ選ぶ。
- Phaser採用時の開発サーバー、build、実画面確認手順を決める。

## 2026-05-09

### やったこと

- GitHubリポジトリURL、HTTPS方式、Gitユーザー名、Gitメールアドレスを確認した。
- `.gitignore` を追加した。
- `.gitattributes` を追加した。
- ローカルGit初期化、ユーザー設定、リモート登録、初回コミットを行った。

### 実行したコマンド

```powershell
git status --short
git init
git config user.name "gamingojisan2132"
git config user.email "201351951+gamingojisan2132@users.noreply.github.com"
git remote add origin https://github.com/gamingojisan2132/game-ai-ops-lab
git add .
git commit -m "Initial repository operations setup"
git branch -M main
git push -u origin main
```

### 結果

- 作業開始時点では、ローカルディレクトリはまだGitリポジトリではなかった。
- Gitリポジトリを初期化した。
- `origin` を `https://github.com/gamingojisan2132/game-ai-ops-lab` に設定した。
- 初回コミットを作成した。
- ブランチ名を `main` に変更した。
- `git push -u origin main` は失敗した。
- 人間が対象ディレクトリをGitの `safe.directory` に追加したあと、`git push -u origin main` が成功した。

### 失敗・回避策

- 新しい回避策はなし。
- 認証情報、秘密鍵、トークンは作成、保存、変更しない。
- Gitコミット時に改行コードの自動変換警告が出たため、通常の直し方として `.gitattributes` を追加し、主要なテキストファイルの改行方針を記録した。これはプロジェクト側の差分安定化対応であり、回避策ではない。
- push失敗: `schannel: AcquireCredentialsHandle failed: SEC_E_NO_CREDENTIALS` により、GitHub HTTPS認証情報が取得できなかった。
- 通常の直し方: 人間がGit Credential Manager、GitHub CLI、またはブラウザ認証でGitHub HTTPS認証を完了する。
- デメリット: 認証が完了するまでAIエージェント側ではpushできない。
- 将来的に戻すべきか: 認証が完了したら、通常の `git push -u origin main` を再実行する。
- 区分: 環境問題。プロジェクトファイルやリモートURLの問題ではない。
- push再実行時に、Gitのdubious ownership検出が出た。
- 通常の直し方: Gitが提示した対象ディレクトリのみを `safe.directory` に追加する。
- デメリット: そのディレクトリを現在のWindowsユーザーが信頼する設定になる。
- 将来的に戻すべきか: この作業ディレクトリを継続利用するなら維持してよい。不要になったらグローバルGit設定から削除できる。
- 区分: Codex側ユーザーと人間側Windowsユーザーの所有者差分による環境問題。

### 次にやること

- Git初期化、ユーザー設定、初回コミット、リモート登録を行う。
- GitHub Actionsの初回実行結果を確認する。
- Actionsが失敗している場合は、ログを見て環境問題かプロジェクト問題か切り分ける。
