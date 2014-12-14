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

Input text of QR code into hubot as below.

```
user1>> hubot sqrd
XXXXXXX_XXXXX_XXXXXXX
X_____X__X_X__X_____X
X_XXX_X__XX___X_XXX_X
X_XXX_X__XXX__X_XXX_X
X_XXX_X___X_X_X_XXX_X
X_____X____XX_X_____X
XXXXXXX_X_X_X_XXXXXXX
________XXXXX________
XX_XX_X__XX_X_X_____X
X_X__X_XXX__X_X_XXX__
__XXXXX__XX__XX_X_XXX
_XXX_X__X_XX______X__
_____XXXXX____X_____X
________X_XXX__X__X__
XXXXXXX__XX_XXXXXX___
X_____X___XXXX_XXXX_X
X_XXX_X_X_XXX_XX___XX
X_XXX_X_XX_XX___X_X__
X_XXX_X_______X__XXXX
X_____X_XXX__XX_X_XXX
XXXXXXX_X__X______X__
hubot>> test
```

You can also specify options as below.  
Of course, you can both specify options and text of QR code.
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
