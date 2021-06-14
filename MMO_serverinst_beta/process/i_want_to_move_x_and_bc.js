
const { GdBuffer } = require('@gd-com/utils')
const packets = require("../packets")

module.exports = {
  packet: packets.I_WANT_TO_MOVE_X_AND_BC,
  process: (idForEachPlayer, ws, receive, players, wss, WebSocket) => {
    let data = new GdBuffer(Buffer.from(receive))
    let pos_x = data.getFloat()
    let vel_x = data.get8()

    players.printPlayerPosition(idForEachPlayer)
    
    console.log(`With I_WANT_TO_MOVE_X_AND_BC packet i recieve : "${pos_x}" with vel: "${vel_x}"`)

    console.log(`[${idForEachPlayer}] >> Send packet code`, packets.OK_MOVE_X_AND_BC)

    players._update_position_x(idForEachPlayer, pos_x)

    //broadcast updated position
    let _updated_pos_x_sendPkt = new GdBuffer()
    _updated_pos_x_sendPkt.putU16(packets.OK_MOVE_X_AND_BC)
    _updated_pos_x_sendPkt.putString(idForEachPlayer)
    _updated_pos_x_sendPkt.putFloat(pos_x)
    _updated_pos_x_sendPkt.put8(vel_x)
    wss.broadcast(_updated_pos_x_sendPkt.getBuffer())
  }
} 
