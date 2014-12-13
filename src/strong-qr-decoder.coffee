# Description
#   A hubot script that decode a QR code
#
# Configuration:
#   None
#
# Commands:
#   hubot sqrd - <what the respond trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   knjcode <knjcode@gmail.com>

Path = require 'path'
exec = require('child_process').exec

module.exports = (robot) ->
  path = Path.resolve __dirname
  robot.respond /sqrd ((.*\s*)+)/i, (msg) ->
    exec 'python ' + path + '/sqrd.py ' + msg.match[1], (error, stdout, stderr) ->
      if error
        msg.reply stderr
        return
      msg.reply stdout
