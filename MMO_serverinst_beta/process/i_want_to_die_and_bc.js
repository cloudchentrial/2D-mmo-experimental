const { GdBuffer } = require('@gd-com/utils')
const packets = require("../packets")

module.exports = {
  packet: packets.I_WANT_TO_DIE,
  process: (idForEachPlayer, ws, receive, players, wss) => {
    let data = new GdBuffer(Buffer.from(receive))
    let extra = data.getString()

    console.log(`[${idForEachPlayer}] >> Send packet code`, packets.OK_DIE_AND_BC)

    let packet = new GdBuffer()
    packet.putU16(packets.OK_DIE_AND_BC)
    packet.putString('thanks !') 

    ws.send(packet.getBuffer())
  }
}