
const { GdBuffer } = require('@gd-com/utils')
const packets = require("../packets")

module.exports = {
  packet: packets.I_WANT_TO_SPAWN_BULLET,
  process: (idForEachPlayer, ws, receive, players, wss, WebSocket) => {
    let data = new GdBuffer(Buffer.from(receive))
    let bullet_dir_x = data.get8()
    let bullet_dir_y = data.get16()
    
    
    console.log(`With I_WANT_TO_SPAWN_BULLET packet i recieve : x: "${bullet_dir_x}" y: "${bullet_dir_y}"`)

    console.log(`[${idForEachPlayer}] >> Send packet code`, packets.OK_SPAWN_BULLET)

    //broadcast player spawn direction
    let _spawn_bullet = new GdBuffer()
    _spawn_bullet.putU16(packets.OK_SPAWN_BULLET)
    _spawn_bullet.putString(idForEachPlayer)
    _spawn_bullet.put8(bullet_dir_x)
    _spawn_bullet.put16(bullet_dir_y)
    wss.broadcast(_spawn_bullet.getBuffer())
  }
} 