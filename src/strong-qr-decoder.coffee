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

exec = require('child_process').exec

module.exports = (robot) ->
  robot.respond /sqrd ((.*\s*)+)/i, (msg) ->
    exec 'python src/sqrd.py ' + msg.match[1], (error, stdout, stderr) ->
      if error
        msg.reply stderr
        return
      msg.reply stdout
