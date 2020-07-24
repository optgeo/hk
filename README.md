# hk
国土数値情報（国有林野）のディゾルブとベクトルタイル生産のテスト

![screenshot](https://optgeo.github.io/hk/img/screenshot.jpg)
[test site](https://optgeo.github.io/hk)

# 使い方
```
rake dissolve
rake tiles
rake style
rake host # conf/style.conf で site_root を localhost にする必要がある
```

# どういうコマンドで処理しているか理解するためには
[Rakefile](https://github.com/optgeo/hk/blob/master/Rakefile) をご覧ください。

# 出典
出典：「国土数値情報（国有林野データ）」（国土交通省）（https://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-A45.html）（2020年7月21日取得）

「国土数値情報（国有林野データ）」（国土交通省）（https://nlftp.mlit.go.jp/ksj/gml/datalist/KsjTmplt-A45.html）を加工して作成
