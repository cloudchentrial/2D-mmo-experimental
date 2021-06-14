
const { GdBuffer } = require('@gd-com/utils')
const packets = require("../packets")

module.exports = {
  packet: packets.I_WANT_TO_JOIN_AND_BC,
  process: (idForEachPlayer, ws, receive, players, wss) => {

    players.printPlayerPosition(idForEachPlayer)

    console.log(`[${idForEachPlayer}] >> Send BC packet code`, packets.OK_JOIN_AND_BC)

    //broadcast new player including yourself
    let _join_bc = new GdBuffer()
    _join_bc.putU16(packets.OK_JOIN_AND_BC)
    _join_bc.putString(idForEachPlayer)
    wss.broadcast(_join_bc.getBuffer())
  }
} 