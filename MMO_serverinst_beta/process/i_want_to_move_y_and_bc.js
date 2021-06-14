
const { GdBuffer } = require('@gd-com/utils')
const packets = require("../packets")

module.exports = {
  packet: packets.I_WANT_TO_MOVE_Y_AND_BC,
  process: (idForEachPlayer, ws, receive, players, wss, WebSocket) => {
    let data = new GdBuffer(Buffer.from(receive))
    let pos_y = data.getFloat()
    let vel_y = data.get8()
    
    console.log(`With I_WANT_TO_MOVE_Y_AND_BC packet i recieve : "${pos_y}" with vel: "${vel_y}"`)

    console.log(`[${idForEachPlayer}] >> Send packet code`, packets.OK_MOVE_Y_AND_BC)

    players.printPlayerPosition(idForEachPlayer)

    players._update_position_y(idForEachPlayer, pos_y)

    //broadcast updated position
    let _updated_pos_y_sendPkt = new GdBuffer()
    _updated_pos_y_sendPkt.putU16(packets.OK_MOVE_Y_AND_BC)
    _updated_pos_y_sendPkt.putString(idForEachPlayer)
    _updated_pos_y_sendPkt.putFloat(pos_y)
    _updated_pos_y_sendPkt.put8(vel_y)
    wss.broadcast(_updated_pos_y_sendPkt.getBuffer())
  }
} 
