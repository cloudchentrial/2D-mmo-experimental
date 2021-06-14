
const { GdBuffer } = require('@gd-com/utils')
const packets = require("../packets")

module.exports = {
  packet: packets.I_WANT_TO_CHAT_AND_BC,
  process: (idForEachPlayer, ws, receive, players, wss, Websocket) => {
    let data = new GdBuffer(Buffer.from(receive))
    let text = data.getString()

    console.log(`With i_want_to_chat_and_bc packet i recieve : "${text}"`)
    console.log(`[${idForEachPlayer}] >> Send CHAT AND BC packet code`, packets.OK_CHAT_AND_BC)

    //broadcast to slaves.
    let text_bc = new GdBuffer()
    text_bc.putU16(packets.OK_CHAT_AND_BC)
    let sendString = idForEachPlayer + "`" + text
    text_bc.putString(sendString)
    wss.broadcast(text_bc.getBuffer())
  }
} 