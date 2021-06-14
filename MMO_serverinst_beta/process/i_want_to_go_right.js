const { GdBuffer } = require('@gd-com/utils')
const packets = require("../packets")

module.exports = {
  packet: packets.I_WANT_TO_GO_RIGHT,
  process: (idForEachPlayer, ws, receive, players, wss) => {
    let data = new GdBuffer(Buffer.from(receive))
    let extra = data.getString()

    console.log(`[${idForEachPlayer}] >> Send packet code`, packets.OK_GO_RIGHT)

    let packet = new GdBuffer()
    packet.putU16(packets.OK_GO_RIGHT)

    ws.send(packet.getBuffer())
  }
}



