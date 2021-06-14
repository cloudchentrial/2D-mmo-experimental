const { GdBuffer } = require('@gd-com/utils')
const packets = require("../packets")

module.exports = {
  packet: packets.I_WANT_TO_GO_LEFT,
  process: (idForEachPlayer, ws, receive, players, wss) => {

    console.log(`[${idForEachPlayer}] >> Send packet code`, packets.OK_GO_LEFT)

    let packet = new GdBuffer()
    packet.putU16(packets.OK_GO_LEFT)

    ws.send(packet.getBuffer())
  }
}