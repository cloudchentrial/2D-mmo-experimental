# (Massively) multiplayer online system experimental note
Author

完成預計: 西元

Introduction<br>
====
README shows the note of development that isn't yet ready for long-term managing.<br>
System of entertainment project.
Filing example of entire 2D MMO plain creation and its related.<br>
Continuously establish common pattern and functions of MMOG developed by pass 50 years and future MMOG. i.e. Filing collective of mmo-featured.<br>

System note<br>
====
Client actor status updating rate: 5 times/sec.<br>
2 times/sec 至 5 times/sec 動態降低資料傳送成本目的. <br>
Identical function call between slaves and player self.<br>
長短線信號分布. <br>
長-ws, 短-tcp. <br>

Respect<br> 
====
Asus NB.<br>
Publication of CEDEC Awards winner sincerely.<br>

Past Status<br>
====
A simple view (2018.12)
![2018_10_14](https://user-images.githubusercontent.com/31240078/137329400-551085fe-5256-42b7-85ed-5aacad4a14d1.jpg)
Runnable.<br>
Several bugs.<br>
Not-in-sure of patent conflict.<br>
Very beginning of prototyping.<br>
Bugs of UI/UX.<br>

Support and extensions<br>
====
Multi-platform support including linux, windows, android, iOS, and bsd.<br>
Real-time and static interaction simutaneously.<br>
Sub-system intergration solutions with GodotEngine.<br>
Intuitive IDE for similar creations.<br>
Data transfering cost control observation dashboard.<br>

Credits<br>
====
Tools and Repositories<br>
Godot Engine<br>
Node.js<br>
Gd-com<br>
References<br>
Operating Systems <br>
中嶋 作者, オンラインゲームを支える技術－－壮大なプレイ空の舞台裏 <br>
蔡 作者, 設計模式與遊戲開發的完美結合 <br>
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
Ex-roommate Mr. Lan c socket chat code documentation.<br>

In-game content note<br>
====
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

Artisitc
====
城市

Realistic tend visual enhancement and dynamic effects
====
Camera controlling shake 螢幕控制震盪 <br>
Camera Controlling stun <br>
Renderer <br>
Lighting <br>
Shadow <br>
Atmosphere <br>
Geometry <br>
Physics <br>
Particle Motions Lighting <br>
OpenXR detailed check <br>
OpenXR visual <br>

Clusters and worker thread 分布
====

Client threads 分布
====

Network topology
====


Unit tests, Stress testing
====

Metaverse powered by ethereum for implementing virtual social
====
虛擬社群元宇宙 <br>
(Cyber Physics Virutal System)虛擬世界採收現實農作物

Problems<br>
====
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

TODO
====
1. State Stack implementation.<br>
2. Node "Player" substitute GlobalDictionary.tscn/gd
3. Project MMOCustom.
4. Try P2P Topology, MMO is unaffordable.
5. 3 function in Start Scene, Start, Online World, Company.
6. Using TCP streaming instead of Websocket streaming. And, Compress data transfer.

3rd parties
====


IP
====

