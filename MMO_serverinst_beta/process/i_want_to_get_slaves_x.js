
const { GdBuffer } = require('@gd-com/utils')
const packets = require("../packets")

module.exports = {
  packet: packets.I_WANT_TO_GET_SLAVES_X,
  process: (idForEachPlayer, ws, receive, players, wss) => {

    console.log(`[${idForEachPlayer}] >> Send packet code`, packets.OK_GET_SLAVES_X)

    //get all slaves x
    for(var i = 0; i < players.datastore.length; i++) { // send (id, anyparam.) data pairs.
        if(players.datastore[i].playerID != idForEachPlayer){
          let dataStream_x = new GdBuffer()
          dataStream_x.putU16(packets.OK_GET_SLAVES_X)
          dataStream_x.putString(players.datastore[i].playerID)
          dataStream_x.putFloat(players.datastore[i].position_X)
          ws.send(dataStream_x.getBuffer())          
        }
    }
  }
}