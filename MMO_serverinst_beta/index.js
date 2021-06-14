
const WebSocket = require('ws')
const { GdBuffer } = require('@gd-com/utils')
const { v4 } = require('uuid')
const uniqid = require('uniqid')
const process = require('./process')
const players = require('./players')

const wss = new WebSocket.Server({ port: 8080 })

//broadcast to global.
wss.broadcast = function broadcast(bc_data) {
  wss.clients.forEach(function each(client) {
    if(client.readyState === WebSocket.OPEN){
      client.send(bc_data);
    }
  });
};

//broadcast within certain 

wss.on('connection', ws => {
  let uuid = v4()
  let idForEachPlayer = uniqid()
  console.log(`[${uuid}] Connected`)

  // send is uuid
  let uuidPacket = new GdBuffer()
  uuidPacket.putU16(1)
  uuidPacket.putString(uuid)
  ws.send(uuidPacket.getBuffer())

  //unique id for each player.
  let playeridPacket = new GdBuffer()
  playeridPacket.putU16(1011)
  playeridPacket.putString(idForEachPlayer)
  ws.send(playeridPacket.getBuffer())
  players._add_new_player(idForEachPlayer, 100.0, 100.0)
  //connection complete
  //action
  ws.on('message', (message) => {
    let receive = new GdBuffer(Buffer.from(message))
  
    const action = receive.getU16()
    console.log(`[${idForEachPlayer}] << Receive packet code`, action)
    if (process.hasOwnProperty(action)) {
      process[`${action}`](idForEachPlayer, ws, receive.getBuffer(), players, wss, WebSocket)
    } else {
      console.log(`[${idForEachPlayer}] << Unknown packet code`, action)
    }
  })
  ws.on('close', function () {
    console.log("Player Id: " + idForEachPlayer + " disconnected")
    players.removePlayer(idForEachPlayer)
    //tell all the clients someone has disconnected
    let disconPkt = new GdBuffer()
    disconPkt.putU16(2000)
    disconPkt.putString(idForEachPlayer)
    //broadcast to everyone
    wss.clients.forEach(function each(client) {
      if (client !== ws && client.readyState === WebSocket.OPEN) {
        client.send(disconPkt.getBuffer());
      }
    });
  })
})
