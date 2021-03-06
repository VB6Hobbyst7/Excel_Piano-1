# Excel Piano

## 概要

この「Excel Piano」は、「誰でも使ったことがあるはずのExcelを使ってインストール不要のDAWを作ることができないか？」という思いつきのもと開発を始めたものです。そんな初期のころからバージョンアップを重ねてもうVersion 4.0.0までに。本バージョンではサンプリング音源を搭載しており、リアルな音を奏でることが可能です。機能性もパフォーマンスも共に従来より大幅に向上しており、安定した使い心地を体験できます。また、リアルタイム再生や打ち込みアシスト機能、サステイン機能も盛り込みました。出力は独自形式のEMD(Excel Music Data)形式ですが(MIDIファイル非対応はごめんなさい)、これを使うとマクロウイルスの心配なしに楽譜データをほかの人とやり取り可能です。


## 使い方

### プロジェクトの作り方

まず、Excel Pianoのフォルダを開いて、Start.exeを実行します。

プロジェクト名の入力を求められるので入力して[Enter]または作成ボタンをクリックしてプロジェクトを作成します。作成に成功すると自動的にフォルダが開くので、そこに入っているプロジェクト名と同じExcelファイルを開きます。

### 音の入力について

任意のセルをダブルクリックすると入力ツールが開きます。

「選択」「追加」「削除」「分割」「結合」モードを選べます。一度行った操作は元に戻せませんので気を付けてください。ノーツを入力する際には多くの労力がかかります。入力アシスト機能が便利です。モードを「追加」に設定したうえで、入力開始点において右クリックすると、入力アシストで設定されてる音符が入力されます。また、セルに直接音符の種類(4分音符なら4、付点2分音符なら2.5)のように数値を入力することで音符を入力することも可能です。ただし、数値入力の際はモードを必ず「選択」に設定してください。

連符も対応していて、一番上の緑の行に3連符であれば3、5連符は5と入力すれば、入力した列が連符となります。気を付けなければならないのは、連符を設定したいノーツの列すべてに入力しなければいけないということです。また、この機能は最小単位を変えずにもっと短い音を鳴らしたい時にも使えます。

次にサステインの設定についてですが、以下のような感じでサステイン開始点に「S」、サステイン終了点に「E」を入力します。その間はサステインが設定されていると認識され、書き出し時に反映されます。

### リアルタイム演奏について

リアルタイム演奏は結構雑に作りました。いわゆるベータ版みたいな感じですかね。曲の終わりを設定したうえで、選択したセルのところから赤色で囲んだ再生ボタンを押して再生します。リアルタイム演奏のクオリティは低いです。止める際は左隣の停止ボタンを押してください。途中で再生停止知る際に、このボタンを押して再生終了しなかった場合音がExcelから音が鳴らなくなることがあります。その場合はExcelファイルを閉じて開きなおしてください。再生中はフォーム等のドラッグは非推奨です。


### WAVファイル出力について

Excel Pianoの最も重要な機能である、WAVファイル書き出し機能についての説明です。音符の最小単位とテンポ(速度)と拍子を設定して楽器と曲名と入力ツールの「WAVファイル出力ボタン」を押して

WAVファイル出力専用フォームを開きます。出力先を設定したら書き出しボタンをクリックして書き出します。時間がかかります。Excelが固まることがありますが、処理が終わるまでお待ちください。

出力が完了したらファイルを開いて、作った曲を楽しんでください！



### その他

楽譜データの入出力はEMDファイルで行うことができます。入力ツールからインポートとエクスポートが可能です。仲間内や知り合いの方にとどまらず、Twitter等で打ち込みデータを共有したい時に使うとウイルス感染の心配が少なく、安全だと思われます。

ノーツの配置色は入力ツールより設定できます。入力された時点では変わらず、EMD形式で再読み込みさせれば色が変わります。この辺は私自身あまり使ってないので機能面でかなり劣っています。必要であればプログラムを書き足して使いやすいように設定してください。


## 仕組みについて

Excel Pianoでは、WAVファイルで構成されているサンプリング音源を読み込んで、必要な時間分だけ波形を抜き出して出力先のWAVファイルに書き込むことでリアルな音の出力を可能にしています。音源はフォルダ内に入れておけば自動で認識しますので、ご自身で音源を用意すればあなたの好きな音で曲を作ることが可能です。時間計算は1セルごとに時間を計算して足して出力時間を決めています。詳しくはプログラムをご覧ください。


## 免責

Excel Pianoの使用に伴って発生するいかなる損害にも作者は責任を負いません。

## 連絡先

Twitter:[@Kabura_net14831](https://twitter.com/Kabura_net14831)
