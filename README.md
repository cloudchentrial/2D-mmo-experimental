## Massively multiplayer online experimental
Author

### Application Layer  

Upon Godot Engine

### Start server, exporting .exe file

Open file "mmo_serverinst/index.js". <br>
"npm start" at terminal. <br>


### Introduction<br>

README shows the note of development that isn't yet ready for long-term managing.<br>
System of entertainment project.
Filing example of entire 2D MMO plain creation and its related.<br>
Continuously establish common pattern and functions of MMOG developed by pass 50 years and future MMOG. i.e. Filing collective of mmo-featured.<br>


### Main system and overall structures <br>

Client actor status updating rate: 5 times/sec. <br>
2 times/sec ~ 5 times/sec <br>
動態降低資料傳送成本目的. <br><br>
長短線信號分布. <br>
長-ws, 短-tcp, 大文檔串流 udp, pop3, quic <br><br>
Identical function call between slaves and player self.<br>

### Protocol files <br>

### Security <br>
SSL/TLS connections:  
AES encryption:  


### Level design <br>


### Status of development timeline<br>

2018.12.01
![2018_10_14](https://user-images.githubusercontent.com/31240078/137329400-551085fe-5256-42b7-85ed-5aacad4a14d1.jpg)
Status and issues<br>
 - Runnable.<br>
 - Several bugs.<br>
 - Not-in-sure of patent conflict.<br>
 - Very beginning of prototyping.<br>
 - Bugs of UI/UX.<br>
 - Collide detection deny<br>
 - Potential less of initial structure<br>
 - In-game player data unlocalized<br> 
 - Flicker issues.<br>
 - Matching queue.<br>
 - Readme note incomplete.<br>

Available<br>
 - Online player move constantly.<br>
 - Zh, Eng chat online subsystem in global.<br>
 - Timer built.<br>
 - Shoot and online collide detection.<br>

### Support and extensions<br>
====
Multi-platform support including linux, windows, android, iOS, and bsd.<br>
Real-time and static interaction simutaneously.<br>
Sub-system intergration solutions with GodotEngine.<br>
Intuitive IDE for similar creations.<br>
Data transfering cost control observation dashboard.<br>

### Credits<br>

Tools and Repositories<br>
Godot Engine<br>
Node.js<br>
Gd-com<br>
References<br>
Books<br>
-オンラインゲームを支える技術　　－－壮大なプレイ空間の舞台 <br>
-設計模式與遊戲開發的完美結合 <br>
-Operating systems <br>
Github<br>
@BriWho:<br>
 - Layer-mask usage.<br> 
 - Local-remote player structuring(for example, Acommodate several sub-node under one node).<br> 
 - Detailed usage of gd-com repo.<br>
 - Switch-case usage in networking part.<br>
 - Detailed usage of gd-com repository.<br>
 - Switch-case usage in networking part.<br>

Gdquest's state pattern and youtube lists.<br>
Clean code by Robert C Martin.<br>
Artworks citation<br>
Kidscancode <Dodge the Creeps!> <br>
Ex-roommate c socket chat code documentation.<br>

### In-game content <br>

Completeness of in-game functions<br>
Complete<br>
 - Shoots.<br>

Unstable-complete<br>
 - Move.<br>
 - P-2-P Collide.<br>
 - P-2-Non-player Collide.<br>

Uncomplete<br>
 - In-game purchase.<br>
 - Getting_invisible.<br>
 - Draw_a_line.<br>
 - Series of VFX_call.<br>

Completeness of in-game scene.<br>
 - Uncomplete<br>
 - Lobby<br>
 - Character<br>
 - Skills<br>

### Technical Art (include shader programming, etc.)

Deep models in 3D, 3D reconstruction from few real-world object photo.
Photorealistic and lighting process
Camera controlling shake 螢幕控制震盪 <br>
Camera Controlling stun <br>
Renderer <br>
Lighting <br>
Shadow <br>
Atmosphere <br>
Geometry <br>
Physics <br>
Particle Motions <br>

### Backend clusters compute distribution 分布


### Backend worker thread compute distribution 分布


### Client thread compute distribution 分布


### Network topology (WAN, Dedicated server)

### Unit tests and stress testing


### Database


### Sound engineering


### Cheat detection
Dealing with Bot Users


### Problems<br>

1.Obvious network connection latency => will be solved.<br> 
2.Uncomplete sub-systems built, especially player's skill system.<br> 
3.No docker yet in use.<br> 
4.Uncertain moving maximum players simutaneously.<br> 
5.Redundancy of design speed down performance.<br>
6.Multi-instance operations of server and load balancer from Google Cloud and Alibabacloud(Unsure).<br>
7.Deploying from local to cloud. Upgrade from beta to stable with templating and bug fix.<br>
8.Standardized development syntax.<br>
9.Own content creations.<br>
10.Operating-cost observation dashboard.<br>
11.Design around by enhancing uniqueness.<br>
12.Camera solutions.<br>
13.Not clean.<br>
14.Distributed Interactive Media design.<br>
15.Too much data transfer manitude of websoceket.
16.Double mode, "Play Levels", "Host", "Find Game" and "Online world".
17.Distributed systems figuring.

### Respect<br> 


### TODO

1. State Stack implementation.<br>
2. Node "Player" substitute GlobalDictionary.tscn/gd
3. Project MMOCustom.
4. Try P2P Topology, MMO is unaffordable.
5. 3 function in Start Scene, Start, Online World, Company.

### 3rd parties


