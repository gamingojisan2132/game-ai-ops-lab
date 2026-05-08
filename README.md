# game-ai-ops-lab

AIエージェントが継続的にゲーム開発しやすい状態を作るための実験リポジトリです。

現時点ではゲーム本体の作り込みよりも、タスク管理、意思決定記録、作業ログ、レビュー観点、確認手順を整えることを優先しています。

## このリポジトリの目的

- Codex / AIエージェントが次に何をすべきか迷いにくい状態にする。
- 作業の判断理由、確認結果、未確認事項を残す。
- 1タスク1目的で小さく継続開発できる流れを作る。
- Windows環境を前提に、環境問題とプロジェクト問題を切り分ける。
- 将来的にPhaserなどの軽量Webゲーム環境で小さなゲームを試作しやすくする。

## AIエージェント運用の考え方

このリポジトリでは、実装より先に運用の見通しを重視します。

- 作業前に `docs/TASKS.md` を読む。
- 仕様判断や技術判断は `docs/DECISIONS.md` に残す。
- 作業後は `docs/WORKLOG.md` に、やったこと、コマンド、結果、失敗・回避策、次にやることを残す。
- AIの作業結果は `docs/REVIEW_GUIDE.md` に沿って人間が確認する。
- 大きな実装を一度に行わず、後続のAIエージェントが引き継げる小さな差分にする。

## ディレクトリ構成

```txt
/
├─ AGENTS.md
├─ README.md
├─ docs/
│  ├─ TASKS.md
│  ├─ DECISIONS.md
│  ├─ WORKLOG.md
│  ├─ GAME_IDEAS.md
│  └─ REVIEW_GUIDE.md
├─ prompts/
│  ├─ setup.md
│  ├─ next_task.md
│  └─ review.md
├─ scripts/
│  └─ check-repo.ps1
├─ public/
│  └─ assets/
│     ├─ images/
│     └─ audio/
└─ .github/
   └─ workflows/
      └─ build.yml
```

## 作業の始め方

まず以下を読みます。

1. `AGENTS.md`
2. `docs/TASKS.md`
3. `docs/DECISIONS.md`
4. `docs/WORKLOG.md`
5. `docs/REVIEW_GUIDE.md`

次に、`docs/TASKS.md` から未完了タスクを1つだけ選びます。

作業後は必ず以下を更新します。

- `docs/TASKS.md`
- `docs/WORKLOG.md`
- 仕様判断や技術判断があれば `docs/DECISIONS.md`

## Codexに作業を投げる手順

用途に応じて、`prompts/` の雛形を使います。

- 初期状態の把握: `prompts/setup.md`
- 次の小タスクを1つ実装: `prompts/next_task.md`
- 作業結果のレビュー: `prompts/review.md`

依頼するときは、次のように伝えると作業が小さく保ちやすくなります。

```txt
prompts/next_task.md の方針で、docs/TASKS.md から次のタスクを1つだけ選んで実施してください。
作業後は docs/TASKS.md と docs/WORKLOG.md を更新してください。
```

## 確認方法

現時点ではアプリ本体がないため、存在しないbuildは実行しません。

まずは、リポジトリの基本構成を確認します。

```powershell
.\scripts\check-repo.ps1
```

ローカル環境のPowerShell実行ポリシーで止まる場合は、次のように一時的に実行ポリシーを指定して切り分けます。

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\check-repo.ps1
```

これは環境問題の切り分け用です。通常の直し方は、利用者または管理者がPowerShellの実行ポリシーを適切に設定することです。デメリットは、その実行1回について通常より制限を緩める点です。恒久的なプロジェクト設定として使うものではありません。

## Windowsでの注意点

- ローカルのWindows環境では、Node / npm 系の作業で `npm` ではなく `npm.cmd` を優先してください。
- GitHub Actions上では、必要になった場合のみ通常の `npm` を使う想定です。
- PowerShellの実行ポリシー差分は、プロジェクト問題ではなく環境問題として切り分けてください。
- 実画面を確認できない場合は、完了扱いにせず「未確認」と記録してください。

## 現在の未確認事項

- GitHub Actions上での実行結果。
- 実ゲーム画面の表示確認。
- ブラウザコンソールエラーの確認。
- Phaserを採用した場合の実際の開発サーバー起動手順。
- Phaserを採用した場合のbuild手順。
- 人間が `README.md` と `AGENTS.md` を読んで、運用方針が期待通りか。
