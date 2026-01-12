### プロジェクト：Foam × Cursor × GraphRAG による「AIの外部脳」構築

- **ステップ1：Foamによるナレッジベース構築**
    - CursorにFoamを導入し、日々の思考や「新時代の議事録」の構想をMarkdownで蓄積。
    - `[[ ]]`（双方向リンク）を積極的に使い、知識のネットワークを可視化する。
- **ステップ2：RAG / GraphRAGの実装**
    - **ベクトル化**: Markdownの中身をベクトルDB（Chroma等）に入れ、意味検索を可能にする。
    - **グラフ化**: ノート間のリンク構造を抽出し、Neo4jなどのグラフDB、またはLlamaIndexのProperty Graph Indexで構造化。
    - **ハイブリッド検索**: ベクトル検索とグラフ構造を組み合わせ、文脈に強いRAGを構築。
- **ステップ3：AIエージェントへの統合**
    - 構築した外部脳を、以前メモした「新時代の議事録」エージェントの参照用ナレッジとして接続。
    - 自分の思考のクセや過去のアイデアを完璧に把握した「分身」のようなAIを目指す。

■ コンセプト
"The Programmable Knowledge Base for Hackers."

- CLI First: 全ての操作はターミナルとテキストエディタ（VS Code/Neovim）で完結可能。
- File System as Database: データベースは使わず、ローカルのMarkdownファイルとフォルダ構造が正義（Single Source of Truth）。
- Notion-like Web UI: モバイルや閲覧時は、NotionのようなリッチなUIで操作。
- Extreme Customizability: 設定画面（GUI）は排除。設定ファイルとコード（Reactコンポーネント）で、見た目と挙動をハックする。
1. システムアーキテクチャ
ローカルサーバーでMarkdownをホストし、外部からはVPN経由でアクセスする構成。
| レイヤー | 技術スタック | 役割 |
|---|---|---|
| Data | Markdown + FrontMatter | データの実体。docs/ 配下に保存。 |
| Backend (CLI) | Node.js (TypeScript) | ファイル操作、監視(chokidar)、自動整理スクリプト。 |
| Frontend (Web) | Next.js + React | Markdownのリッチレンダリング、編集UI。 |
| Network | Tailscale | ポート開放不要で、スマホから安全に自宅サーバーへ接続。 |
| AI Integration | Local Files | Cursor/Claude等のエージェントは直接ファイルシステムを参照。 |
2. ディレクトリ構造と設定ファイル
「カスケード設定（継承）」を採用し、フォルダごとに振る舞いを変える。
~/my-notes/
├─ package.json # 依存関係、自作スクリプトのコマンド定義
├─ my-cli.ts # 自作CLIツールのエントリーポイント
├─ .render.js # 【Global】コンポーネントマッピングの定義
├─ docs/ # 知識ベースのルート
│ ├─ .style.json # 【Global】基本テーマ（ダークモード等）
│ ├─ 00_Inbox/ # とりあえずのメモ
│ ├─ 10_Projects/ # 進行中のタスク
│ │ ├─ .style.json # 【Folder】「開発モード」のスタイル定義
│ │ └─ [App開発.md](http://xn--app-0v2ho93k.md/)
│ └─ 99_Knowledge/ # 完了タスク・知見のアーカイブ
└─ web/ # Next.jsプロジェクト（UI）
3. コア機能要件
A. タスク & ナレッジ管理フロー (Automation)
Notionのプロパティ変更を、ファイル移動で再現する。

## 状態管理: MarkdownのFront Matter（YAML）で管理。

## id: "task-001"
type: "task"
status: "doing" # inbox -> doing -> done

- 自動化ロジック (CLI):
    - コマンド npm run organize (または mn fix) を実装。
    - Inbox処理: 00_Inbox 内のファイルを解析し、日付などを付与して配置。
    - アーカイブ処理: status: done になったファイルを 10_Projects から 99_Knowledge へ移動。
    - デイリー生成: 毎朝、未完了タスク（status: doing）へのリンクを集めた「今日のノート」を自動生成。
    B. リッチエディタ & UI (Frontend)
    スマホやブラウザからNotionライクに使うための機能。
- エディタエンジン:
    - Tiptap (または Novel) を採用。Notionのような「/コマンド」やブロック操作を実現。
    - 内部データをMarkdownとして保存・読み込みするParser/Serializerを実装。
- リアルタイム同期:
    - Web側で編集 → サーバー上のMarkdownファイルを即更新。
    - PC(VS Code)で編集 → Web側もホットリロードで反映。
    C. プログラマブル・レンダリング (Cascading View)
    フォルダやファイル単位で「見た目」と「機能」をコードで制御する。
- .style.json (CSS Variables):
    - ディレクトリ階層を遡ってJSONをマージし、CSS変数として注入。
    - 例: フォント、アクセントカラー、コンテンツ幅、背景パターン。
- .render.js (Component Mapping):
    - Markdownの構文を、任意のReactコンポーネントに差し替える機能。
    - 例:
        - code ブロック → 実行可能なサンドボックス (<LiveCode />)
        - 
            - [ ]  リスト → カンバンボード (<KanbanBoard />)
        - -- (区切り線) → 章ごとの進捗バー (<ProgressBar />)
1. 開発・運用ワークフロー
導入 (Setup)
- 自宅サーバー（常時起動PC）で npm run server。Next.jsとファイル監視が走る。
- TailscaleでVPN接続。スマホから [http://myserver:3000](http://myserver:3000/) にアクセス。
日々の操作 (Daily)
- PC: VS Codeを開く。mn new "設計" でファイル作成。Markdownをガリガリ書く。
- 移動中: スマホでWeb UIを開く。Inboxにアイデアを放り込む。タスクのチェックを入れる。
- 完了: 帰宅後、ターミナルで mn organize。完了タスクがアーカイブされ、ディレクトリが綺麗になる。
拡張 (Hacking)
- 「このフォルダ、プレゼンモードで表示したいな」
- そのフォルダに .style.json を作成。
- .render.js に <SlideView /> コンポーネントを追加し、Markdownのマッピングルールを書く。
- 即座に俺だけの最強ビューが完成。
1. 推奨技術スタック詳細
開発を始めるならこの構成が最短かつ最強だ。
- Runtime: Node.js (v20+)
- Framework: Next.js (App Router)
- Language: TypeScript
- Styling: Tailwind CSS (スタイリングの基本), Radix UI (ヘッドレスコンポーネント)
- Editor Core:
    - @tiptap/react
    - @tiptap/starter-kit
    - novel (Tiptapのラッパー。NotionライクなUIが最初からある)
- Markdown Utils:
    - gray-matter: Front Matterの解析
    - markdown-to-jsx or react-markdown: 表示専用モード時のレンダリング（Component Mapping用）
- File System:
    - chokidar: ファイル監視
    - fs-extra: ファイル操作の拡張
    今後の展望（Roadmap）
- Phase 1 (MVP): Next.jsでローカルMarkdownを読み書きできるエディタを作る。Tailscaleでアクセス確認。
- Phase 2 (CLI): organize コマンドを作り、YAMLステータスによるファイル移動を実装。
- Phase 3 (Programmable): .style.json とComponent Mappingの実装。ここが一番楽しい。
- Phase 4 (Agent): 保存されたMarkdownをVector DB化し、Web UIに「チャット機能」をつける。
