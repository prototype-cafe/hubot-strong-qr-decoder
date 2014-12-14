# hubot-strong-qr-decoder [![Build Status][travis-image]][travis-url]

A hubot script that decode a QR code.  
This script is a wrapper of [waidotto/strong-qr-decoder](https://github.com/waidotto/strong-qr-decoder).

See [`src/strong-qr-decoder.coffee`](src/strong-qr-decoder.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-strong-qr-decoder --save`

Then add **hubot-strong-qr-decoder** to your `external-scripts.json`:

```json
[
  "hubot-strong-qr-decoder"
]
```

## Sample Interaction

```
user1>> hubot sqrd -h
hubot>> usage: sqrd.py [-h] [-e ERROR_CORRECTION] [-m MASK] [-n] [-v] [FILE]

sqrd - Strong QR Decoder

positional arguments:
  FILE                  入力ファイル(デフォルトは標準入力)

optional arguments:
  -h, --help            show this help message and exit
  -e ERROR_CORRECTION, --error-correction ERROR_CORRECTION
                        エラー訂正レベル(1:L 0:M 3:Q 2:H)
  -m MASK, --mask MASK  マスクパターン(0〜7)
  -n, --no-correction   データブロックの誤り訂正をしない
  -v, --verbose         詳細な情報を表示

```
## Reference

[waidotto/strong-qr-decoder](https://github.com/waidotto/strong-qr-decoder)

[travis-url]: https://travis-ci.org/prototype-cafe/hubot-strong-qr-decoder
[travis-image]: https://travis-ci.org/prototype-cafe/hubot-strong-qr-decoder.svg?branch=master
