# Massively-multiplayer-online-system-experimental-note
Author

Introduction<br>
====
README show the note of developement that is not yet ready for long-term managing.<br>
System of entertainment project.
Filing example of entire 2D MMO creation.<br>
Continuously establish common pattern and functions of MMOG developed by pass 50 years and future MMOG. i.e. Filing collective of fully mmo-featured.<br>

System note<br>
====
Client player status updating rate: 5 times/sec.<br>
Identical function call between slaves and player self.<br>

Respect<br> 
====
Computer Asus.<br>
Game producer Mr.John interview video.<br>
Publication of CEDEC Awards winner sincerely.<br>

Status since 2018 Q4<br>
====
A simple view (2018.12)


Runnable.<br>
Several bugs.<br>
Not-in-sure of patent conflict.<br>
Very beginning of prototyping.<br>
Bugs of UI/UX.<br>

Features<br>
====
Multi-platform supporting including linux, windows, android, iOS, and bsd.<br>
Real-time and static interaction simutaneously.<br>
Sub-system intergration solutions with GodotEngine.<br>
Intuitive IDE for similar creations.<br>
Data transfering cost control observation dashboard.<br>

Important Credits<br>
====
Tools and Repositories<br>
Godot Engine<br>
Node.js<br>
gd-com<br>
References<br>
中嶋謙互<<オンラインゲームを支える技術－－壮大なプレイ空の舞台裏>><br> 
@BriWho:<br>
 - Layer-mask usage.<br> 
 - Local-remote player structuring(for example, Acommodate several sub-node under one node).<br> 
 - Detailed usage of gd-com repo.<br>
 - Switch-case usage in networking part.<br>
 - Local-remote player structuring(for example, Acommodate several sub-node under one node).<br> 
 - Detailed usage of gd-com repository.<br>
 - Switch-case usage in networking part.<br>

gdquest's state pattern and youtube lists.<br>
Clean code by Robert C Martin.<br>
Artworks citation<br>
Kidscancode<<Dodge the Creeps!>><br>

In-game content note.<br>
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


Problems of beta<br>
====
1.Obvious network connection latency, will be solved.<br> 
2.Uncomplete sub-systems built, especially player's skill system.<br> 
3.No docker yet in use.<br> 
4.Uncertain moving maximum players simutaneously.<br> 
5.Redundancy of design speed down performance.<br>
6.Multi-instance operations of server and load balancer from Google Cloud and Alibabalcoud(Unsure).<br>
7.Deploying from local to cloud. Upgrade from beta to stable with templating and bug fix.<br>
8.Standardized development syntax.<br>
9.Own content creations.<br>
10.Operating-cost observation dashboard.<br>
11.Design around by enhancing uniqueness.<br>
12.Camera solutions.<br>
13.Not clean.<br>
14.Distributed Interactive Media design.<br>

TODO
====
1. State Stack implementation.<br>
2. Node "Playar" substitute GlobalDictionary.tscn/gd
3. Project MMOCustom.
4. Try P2P Topology, MMO is unaffordable.
