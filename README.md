# 🧠Brainfuxk-D
D言語で書かれた[Brainfuxk](https://ja.wikipedia.org/wiki/Brainfuck)の処理系です。   
処理系作成のチュートリアルでお馴染みですが、なんだかんだ作ったことがなかったので作ってみました。   

## ✅特徴
* D言語で書かれている
* \"[\",\"]\"のブロックネストをチェックし、不正の場合エラーを吐いてくれます
* 不正な文字があった場合、エラーを吐いてくれます

## 🏗ビルド

```
dub build
```
## 📃テスト
```
rdmd test/test.d
```

[Correct-Cases](test/Correct-Cases) ,[Incorrect-Cases](test/Incorrect-Cases)のテストケースでテストが行われます。


## 🎫LICENSE

[MIT](./LICENSE)

## ✍Author

[PenguinCabinet](https://github.com/PenguinCabinet)