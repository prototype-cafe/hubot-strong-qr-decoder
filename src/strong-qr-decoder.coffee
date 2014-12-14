# Description
#   A hubot script that decode a QR code
#
# Configuration:
#   None
#
# Commands:
#   hubot sqrd - decode a QR code
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
  robot.respond /sqrd((.*\s*)+)/i, (msg) ->
    [args, code...] = msg.match[1].split('\n')
    cmd = 'echo "' + code.join('\n') + '" | python ' + path + '/sqrd.py ' + args

    exec cmd, (error, stdout, stderr) ->
      if error
        msg.reply stderr
        return
      msg.reply stdout
