

function Players() {
        this.datastore = [];
        this._add_new_player = (id, pos_x, pos_y) => {
            if (id || pos_x || pos_y) {
                this.datastore.push(new player(id, pos_x, pos_y));
                return this.datastore;
            }
        };
        this._update_position_x = (id, pos_x) => {
            if (id || pos_x) {
                for (var i = 0; i < this.datastore.length; i++) {
                    if (this.datastore[i].playerID === id) {
                        this.datastore[i].position_X = pos_x;
                    }
                }
                return this.datastore;
            }
        };
        this._update_position_y = (id, pos_y) => {
            if (id || pos_y) {
                for (var i = 0; i < this.datastore.length; i++) {
                    if (this.datastore[i].playerID === id) {
                        this.datastore[i].position_Y = pos_y;
                    }
                }
                return this.datastore;
            }
        };
        this.getPlayerPosX = (id) => {
            for (var i = 0; i < this.datastore.length; i++) {
                if (this.datastore[i].playerID === id) {
                    return this.datastore[i].pos_x
                }
            }
        }
        this.getPlayerPoxY = (id) => {
            for (var i = 0; i < this.datastore.length; i++) {
                if (this.datastore[i].playerID === id) {
                    return this.datastore[i].pos_y
                }
            }
        }
        this.removePlayer = (id) => {
            for (var i = 0; i < this.datastore.length; i++) {
                if (this.datastore[i].playerID === id) {
                    this.datastore.splice(i, 1);
                }
            }
            return this.datastore;
        };
        this.printPlayerId = function (id) {
            for (var i = 0; i < this.datastore.length; i++) {
                if (this.datastore[i].playerID === id) {
                    console.log("PlayerID : " + this.datastore[i].playerID);
                }
            }
        };
        this.printPlayerPosition = function (id) {
            console.log(this.datastore)
            for (var i = 0; i < this.datastore.length; i++) {
                if (this.datastore[i].playerID === id) {
                    console.log("X: " + this.datastore[i].position_X + ",Y: " + this.datastore[i].position_Y);
                }
            }
        };
        this.size = function () { return this.datastore.length; };
}

function player(id, x, y){
    this.playerID = id;
    this.position_X = x;
    this.position_Y = y;
}

module.exports = new Players();