expect = require('chai').expect

Robot = require('hubot/src/robot')
TextMessage = require('hubot/src/message').TextMessage

qr_test_msg = "hubot sqrd\n
XXXXXXX_XXXXX_XXXXXXX\n
X_____X__X_X__X_____X\n
X_XXX_X__XX___X_XXX_X\n
X_XXX_X__XXX__X_XXX_X\n
X_XXX_X___X_X_X_XXX_X\n
X_____X____XX_X_____X\n
XXXXXXX_X_X_X_XXXXXXX\n
________XXXXX________\n
XX_XX_X__XX_X_X_____X\n
X_X__X_XXX__X_X_XXX__\n
__XXXXX__XX__XX_X_XXX\n
_XXX_X__X_XX______X__\n
_____XXXXX____X_____X\n
________X_XXX__X__X__\n
XXXXXXX__XX_XXXXXX___\n
X_____X___XXXX_XXXX_X\n
X_XXX_X_X_XXX_XX___XX\n
X_XXX_X_XX_XX___X_X__\n
X_XXX_X_______X__XXXX\n
X_____X_XXX__XX_X_XXX\n
XXXXXXX_X__X______X__"

qr_test_result = "test\n"

qr_sample_data_msg = "hubot sqrd\n
XXXXXXX_X_XX_X____XXXXXXX\n
X_____X_XXX_XXX_X_X_____X\n
X_XXX_X_XX______X_X_XXX_X\n
X_XXX_X____X_X__X_X_XXX_X\n
X_XXX_X__X_XXXXX__X_XXX_X\n
X_____X_X__X_X_X__X_____X\n
XXXXXXX_X_X_X_X_X_XXXXXXX\n
________X__X_XX_X________\n
__XXX_X_X__XXX___XXX__XXX\n
XX_XX__X__X__X_XXX_X__X__\n
X___X_X_X_XX__X__XXX___XX\n
XX_X_X__X_XXX_____X____XX\n
_X_X__XXX__X_X_X_XX_X_X_X\n
X_X_______XXXX_XX__X_X___\n
X_XX__X_X_XXX_X___X__X_XX\n
X_X_____XX_XX___XXXX___X_\n
X_X_X_X_X_X___X_XXXXXXX_X\n
________XX_X_X__X___X_XX_\n
XXXXXXX____X__XXX_X_XX_XX\n
X_____X__X_X_X_XX___X__X_\n
X_XXX_X_X_XXXXXXXXXXXXX__\n
X_XXX_X_X__XXX____X_X___X\n
X_XXX_X_X__X_X_X__XX____X\n
X_____X___X_XX_X_X_XX___X\n
XXXXXXX____X__X_X__XX__XX"

qr_sample_data_result = "sample_data\n"

describe 'strong-qr-decoder', ->
  robot = null
  user = null
  adapter = null

  beforeEach (done) ->
    robot = new Robot(null, 'mock-adapter', false, 'hubot')

    robot.adapter.on 'connected', ->
      require('../src/strong-qr-decoder')(robot)
      user = robot.brain.userForId '1',
        name: 'mocha'
        room: '#mocha'
      adapter = robot.adapter
      done()
    robot.run()

  afterEach -> robot.shutdown()

  it 'responds decoded text (test)', (done) ->
    adapter.on 'reply', (envelope, strings) ->
      expect(envelope.user.name).to.equal('mocha')
      expect(strings[0]).to.equal(qr_test_result)
      done()

    adapter.receive(new TextMessage(user, qr_test_msg))

  it 'responds decoded text (sample_data)', (done) ->
    adapter.on 'reply', (envelope, strings) ->
      expect(envelope.user.name).to.equal('mocha')
      expect(strings[0]).to.equal(qr_sample_data_result)
      done()

    adapter.receive(new TextMessage(user, qr_sample_data_msg))
