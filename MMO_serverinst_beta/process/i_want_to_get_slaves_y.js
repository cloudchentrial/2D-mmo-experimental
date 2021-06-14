const { GdBuffer } = require('@gd-com/utils')
const packets = require("../packets")

module.exports = {
  packet: packets.I_WANT_TO_GET_SLAVES_Y,
  process: (idForEachPlayer, ws, receive, players, wss) => {

    console.log(`[${idForEachPlayer}] >> Send packet code`, packets.OK_GET_SLAVES_Y)

    //get all slaves y
    for(var i = 0; i < players.datastore.length; i++) { // send (id, anyparam.) data pair.
      if(players.datastore[i].playerID != idForEachPlayer){
        let dataStream_y = new GdBuffer()
        dataStream_y.putU16(packets.OK_GET_SLAVES_Y)
        dataStream_y.putString(players.datastore[i].playerID)
        dataStream_y.putFloat(players.datastore[i].position_Y)
        console.log("Send one slave.")
        ws.send(dataStream_y.getBuffer())       
      }
  }
  }
}