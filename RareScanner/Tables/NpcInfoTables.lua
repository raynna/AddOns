-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

private.NPC_INFO = {
	[10201] = { zoneID = 0, displayID = 10925 }; --Lady Hederine
	[10203] = { zoneID = 0, displayID = 1687 }; --Berylgos
	[10236] = { zoneID = 0, displayID = 9529 }; --Wep
	[10237] = { zoneID = 0, displayID = 9530 }; --Yor
	[10238] = { zoneID = 0, displayID = 9531 }; --Staggon
	[10239] = { zoneID = 0, displayID = 9532 }; --Tepolar
	[10643] = { zoneID = 0, displayID = 11293 }; --Mugglefin
	[11580] = { zoneID = 0, displayID = 10701 }; --Kelemis the Lifeless
	[11676] = { zoneID = 0, displayID = 12815 }; --Fjordune the Greater
	[12432] = { zoneID = 0, displayID = 982 }; --Old Vicejaw
	[13977] = { zoneID = 0, displayID = 12249 }; --Gash'nak the Cannibal
	[14016] = { zoneID = 0, displayID = 14064 }; --Ushalac the Gloomdweller
	[14018] = { zoneID = 0, displayID = 14072 }; --Rezrelek <Winterax Hero>
	[14019] = { zoneID = 0, displayID = 13990 }; --Tatterhide
	[14341] = { zoneID = 0, displayID = 4943 }; --Felendor the Accuser
	[14346] = { zoneID = 0, displayID = 4426 }; --Captain Greshkil
	[14697] = { zoneID = 0, displayID = 12819 }; --Lumbering Horror
	[16379] = { zoneID = 0, displayID = 61322 }; --Spirit of the Damned
	[16380] = { zoneID = 0, displayID = 16167 }; --Bone Witch
	[17075] = { zoneID = 0, displayID = 17445 }; --Sandworm
	[18699] = { zoneID = 0, displayID = 17102 }; --Netherstorm Rare Chimaera UNUSED
	[1920] = { zoneID = 0, displayID = 3589 }; --Ambermill Spellscribe
	[2447] = { zoneID = 0, displayID = 6371 }; --Narillasanz
	[25323] = { zoneID = 0 }; --NPCs
	[25406] = { zoneID = 0 }; --NPCs
	[25411] = { zoneID = 0 }; --NPCs
	[26791] = { zoneID = 0 }; --NPCs
	[28280] = { zoneID = 0, displayID = 7550 }; --QA Test Dummy 83 High Damage <QA Punching Bag>
	[28282] = { zoneID = 0, displayID = 7550 }; --QA Test Dummy 82 High Damage <QA Punching Bag>
	[31086] = { zoneID = 0, displayID = 25680 }; --Quest - Wintergrasp - PvP Kill - Alliance
	[3718] = { zoneID = 0, displayID = 4973 }; --Wrathtail Tide Princess
	[39019] = { zoneID = 0, displayID = 25680 }; --Quest - Wintergrasp - PvP Kill - Horde
	[4030] = { zoneID = 0, displayID = 9591 }; --Vengeful Ancient
	[50091] = { zoneID = 0, displayID = 36722 }; --Julak-Doom <The Eye of Zor>
	[50327] = { zoneID = 0, displayID = 1062 }; --Bitey
	[50328] = { zoneID = 0, displayID = 46665 }; --Fangor
	[50329] = { zoneID = 0, displayID = 46999 }; --Rrakk
	[50330] = { zoneID = 0, displayID = 34130 }; --Kree
	[50331] = { zoneID = 0, displayID = 44162 }; --Go-Kan
	[50332] = { zoneID = 0, displayID = 44163 }; --Korda Torros
	[50333] = { zoneID = 0, displayID = 44164 }; --Lon the Bull
	[50334] = { zoneID = 0, displayID = 44166 }; --Dak the Breaker
	[50335] = { zoneID = 0, displayID = 26255 }; --Alitus
	[50336] = { zoneID = 0, displayID = 44159 }; --Yorik Sharpeye
	[50337] = { zoneID = 0, displayID = 46227 }; --Cackle
	[50338] = { zoneID = 0, displayID = 44274 }; --Kor'nas Nightsavage
	[50339] = { zoneID = 0, displayID = 44282 }; --Sulik'shor
	[50340] = { zoneID = 0, displayID = 44281 }; --Gaarn the Toxic
	[50341] = { zoneID = 0, displayID = 44283 }; --Borginn Darkfist
	[50342] = { zoneID = 0, displayID = 33004 }; --Heronis
	[50343] = { zoneID = 0, displayID = 46988 }; --Quall
	[50344] = { zoneID = 0, displayID = 44284 }; --Norlaxx
	[50345] = { zoneID = 0, displayID = 21133 }; --Alit
	[50346] = { zoneID = 0, displayID = 17093 }; --Ronak
	[50347] = { zoneID = 0, displayID = 44285 }; --Karr the Darkener
	[50348] = { zoneID = 0, displayID = 17092 }; --Norissis
	[50349] = { zoneID = 0, displayID = 44286 }; --Kang the Soul Thief
	[50350] = { zoneID = 0, displayID = 44346 }; --Morgrinn Crackfang
	[50351] = { zoneID = 0, displayID = 44347 }; --Jonn-Dar
	[50352] = { zoneID = 0, displayID = 44348 }; --Qu'nas
	[50353] = { zoneID = 0, displayID = 45200 }; --Manas
	[50354] = { zoneID = 0, displayID = 44349 }; --Havak
	[50355] = { zoneID = 0, displayID = 44350 }; --Kah'tir
	[50356] = { zoneID = 0, displayID = 44351 }; --Krol the Blade
	[50357] = { zoneID = 0, displayID = 45201 }; --Sunwing
	[50358] = { zoneID = 0, displayID = 47695 }; --Haywire Sunreaver Construct
	[50359] = { zoneID = 0, displayID = 44352 }; --Urgolax
	[50361] = { zoneID = 0, displayID = 20596 }; --Ornat
	[50362] = { zoneID = 0, displayID = 20596 }; --Blackbog the Fang
	[50363] = { zoneID = 0, displayID = 44394 }; --Krax'ik
	[50364] = { zoneID = 0, displayID = 44395 }; --Nal'lak the Ripper
	[50370] = { zoneID = 0, displayID = 20067 }; --Karapax
	[50388] = { zoneID = 0, displayID = 44396 }; --Torik-Ethis
	[50724] = { zoneID = 0, displayID = 20297 }; --Spinecrawl
	[50725] = { zoneID = 0, displayID = 20309 }; --Azelisk
	[50726] = { zoneID = 0, displayID = 46250 }; --Kalixx
	[50727] = { zoneID = 0, displayID = 20834 }; --Strix the Barbed
	[50728] = { zoneID = 0, displayID = 20308 }; --Deathstrike
	[50730] = { zoneID = 0, displayID = 20297 }; --Venomspine
	[50731] = { zoneID = 0, displayID = 17062 }; --Needlefang
	[50733] = { zoneID = 0, displayID = 44397 }; --Ski'thik
	[50734] = { zoneID = 0, displayID = 44398 }; --Lith'ik the Stalker
	[50735] = { zoneID = 0, displayID = 4435 }; --Blinkeye the Rattler
	[50736] = { zoneID = 0, displayID = 42488 }; --Acidous
	[50737] = { zoneID = 0, displayID = 46985 }; --Acroniss
	[50738] = { zoneID = 0, displayID = 25009 }; --Shimmerscale
	[50739] = { zoneID = 0, displayID = 44399 }; --Gar'lok
	[50741] = { zoneID = 0, displayID = 1561 }; --Kaxx
	[50742] = { zoneID = 0, displayID = 46982 }; --Qem
	[50743] = { zoneID = 0, displayID = 46983 }; --Manax
	[50744] = { zoneID = 0, displayID = 46981 }; --Qu'rik
	[50745] = { zoneID = 0, displayID = 15658 }; --Losaj
	[50746] = { zoneID = 0, displayID = 15656 }; --Bornix the Burrower
	[50747] = { zoneID = 0, displayID = 15334 }; --Tix
	[50748] = { zoneID = 0, displayID = 481 }; --Nyaj
	[50749] = { zoneID = 0, displayID = 44400 }; --Kal'tik the Blight
	[50750] = { zoneID = 0, displayID = 44203 }; --Aethis
	[50752] = { zoneID = 0, displayID = 2537 }; --Tarantis
	[50759] = { zoneID = 0, displayID = 42742 }; --Iriss the Widow
	[50763] = { zoneID = 0, displayID = 67596 }; --Shadowstalker
	[50764] = { zoneID = 0, displayID = 46518 }; --Paraliss
	[50765] = { zoneID = 0, displayID = 27683 }; --Miasmiss
	[50766] = { zoneID = 0, displayID = 44222 }; --Sele'na
	[50768] = { zoneID = 0, displayID = 44224 }; --Cournith Waterstrider
	[50769] = { zoneID = 0, displayID = 44226 }; --Zai the Outcast
	[50770] = { zoneID = 0, displayID = 46232 }; --Zorn
	[50772] = { zoneID = 0, displayID = 44228 }; --Eshelon
	[50775] = { zoneID = 0, displayID = 46518 }; --Likk the Hunter
	[50776] = { zoneID = 0, displayID = 44229 }; --Nalash Verdantis
	[50777] = { zoneID = 0, displayID = 18041 }; --Needle
	[50778] = { zoneID = 0, displayID = 42742 }; --Ironweb
	[50779] = { zoneID = 0, displayID = 18029 }; --Sporeggon
	[50780] = { zoneID = 0, displayID = 44230 }; --Sahn Tidehunter
	[50782] = { zoneID = 0, displayID = 44255 }; --Sarnak
	[50783] = { zoneID = 0, displayID = 44267 }; --Salyin Warscout
	[50784] = { zoneID = 0, displayID = 47124 }; --Anith
	[50785] = { zoneID = 0, displayID = 46995 }; --Skyshadow
	[50786] = { zoneID = 0, displayID = 46990 }; --Sparkwing
	[50787] = { zoneID = 0, displayID = 44268 }; --Arness the Scale
	[50788] = { zoneID = 0, displayID = 46996 }; --Quetzl
	[50789] = { zoneID = 0, displayID = 44269 }; --Nessos the Oracle
	[50790] = { zoneID = 0, displayID = 47120 }; --Ionis
	[50791] = { zoneID = 0, displayID = 44270 }; --Siltriss the Sharpener
	[50792] = { zoneID = 0, displayID = 46278 }; --Chiaa
	[50797] = { zoneID = 0, displayID = 47126 }; --Yukiko
	[50803] = { zoneID = 0, displayID = 37992 }; --Bonechewer
	[50804] = { zoneID = 0, displayID = 10827 }; --Ripwing
	[50805] = { zoneID = 0, displayID = 44271 }; --Omnis Grinlok
	[50806] = { zoneID = 0, displayID = 44272 }; --Moldo One-Eye
	[50807] = { zoneID = 0, displayID = 46277 }; --Catal
	[50808] = { zoneID = 0, displayID = 44362 }; --Urobi the Walker
	[50809] = { zoneID = 0, displayID = 46740 }; --Heress
	[50810] = { zoneID = 0, displayID = 20347 }; --Favored of Isiset
	[50811] = { zoneID = 0, displayID = 44370 }; --Nasra Spothide
	[50812] = { zoneID = 0, displayID = 46229 }; --Arae
	[50813] = { zoneID = 0, displayID = 46516 }; --Fene-mal
	[50814] = { zoneID = 0, displayID = 23481 }; --Corpsefeeder
	[50816] = { zoneID = 0, displayID = 44371 }; --Ruun Ghostpaw
	[50817] = { zoneID = 0, displayID = 44372 }; --Ahone the Wanderer
	[50818] = { zoneID = 0, displayID = 26618 }; --The Dark Prowler
	[50819] = { zoneID = 0, displayID = 9951 }; --Iceclaw
	[50820] = { zoneID = 0, displayID = 44373 }; --Yul Wildpaw
	[50821] = { zoneID = 0, displayID = 44374 }; --Ai-Li Skymirror
	[50822] = { zoneID = 0, displayID = 44375 }; --Ai-Ran the Shifting Cloud
	[50823] = { zoneID = 0, displayID = 44236 }; --Mister Ferocious
	[50825] = { zoneID = 0, displayID = 46987 }; --Feras
	[50828] = { zoneID = 0, displayID = 44242 }; --Bonobos <The Bananamancer>
	[50829] = { zoneID = 0, displayID = 28067 }; --Mr. Bonks
	[50830] = { zoneID = 0, displayID = 44243 }; --Spriggin
	[50831] = { zoneID = 0, displayID = 44246 }; --Scritch
	[50832] = { zoneID = 0, displayID = 44249 }; --The Yowler
	[50833] = { zoneID = 0, displayID = 38913 }; --Duskcoat
	[50836] = { zoneID = 0, displayID = 44250 }; --Ik-Ik the Nimble
	[50837] = { zoneID = 0, displayID = 46575 }; --Kash
	[50838] = { zoneID = 0, displayID = 46251 }; --Tabbs
	[50839] = { zoneID = 0, displayID = 29539 }; --Chromehound
	[50840] = { zoneID = 0, displayID = 44251 }; --Major Nanners
	[50842] = { zoneID = 0, displayID = 12168 }; --Magmagan
	[50843] = { zoneID = 0, displayID = 45427 }; --Portent
	[50844] = { zoneID = 0, displayID = 1062 }; --Tyranitar
	[50845] = { zoneID = 0, displayID = 1062 }; --Thousand-Tooth
	[50846] = { zoneID = 0, displayID = 5240 }; --Slavermaw
	[50847] = { zoneID = 0, displayID = 1062 }; --Proceratos
	[50849] = { zoneID = 0, displayID = 1062 }; --Blistermaw
	[50850] = { zoneID = 0, displayID = 40719 }; --Savage
	[50853] = { zoneID = 0, displayID = 1062 }; --Corpsegnaw the Feeder
	[50854] = { zoneID = 0, displayID = 45487 }; --Bloodtooth
	[50855] = { zoneID = 0, displayID = 79025 }; --Jaxx the Rabid
	[50856] = { zoneID = 0, displayID = 31352 }; --Snark
	[50858] = { zoneID = 0, displayID = 46551 }; --Dustwing
	[50859] = { zoneID = 0, displayID = 42271 }; --Glimmer
	[50860] = { zoneID = 0, displayID = 20216 }; --Great Sea Kraken
	[50861] = { zoneID = 0, displayID = 1062 }; --Nor-Nasam
	[50863] = { zoneID = 0, displayID = 1062 }; --Granulax
	[50864] = { zoneID = 0, displayID = 46831 }; --Thicket
	[50865] = { zoneID = 0, displayID = 21825 }; --Saurix
	[50867] = { zoneID = 0, displayID = 1062 }; --Bloodclaw
	[50868] = { zoneID = 0, displayID = 1062 }; --Skree
	[50870] = { zoneID = 0, displayID = 74039 }; --Baxter
	[50871] = { zoneID = 0, displayID = 1062 }; --Velocitus
	[50872] = { zoneID = 0, displayID = 1062 }; --Teryx
	[50874] = { zoneID = 0, displayID = 19733 }; --Tenok
	[50875] = { zoneID = 0, displayID = 46287 }; --Nychus
	[50876] = { zoneID = 0, displayID = 1746 }; --Avis
	[50877] = { zoneID = 0, displayID = 1062 }; --Halfclaw
	[50879] = { zoneID = 0, displayID = 1062 }; --Herdstalker
	[50882] = { zoneID = 0, displayID = 19743 }; --Chupacabros
	[50883] = { zoneID = 0, displayID = 61221 }; --Pathrunner
	[50884] = { zoneID = 0, displayID = 21268 }; --Dustflight the Cowardly
	[50885] = { zoneID = 0, displayID = 39729 }; --Patrannache
	[50886] = { zoneID = 0, displayID = 21268 }; --Seawing
	[50887] = { zoneID = 0, displayID = 1062 }; --Longstride
	[50889] = { zoneID = 0, displayID = 1062 }; --Limpwing the Swift
	[50890] = { zoneID = 0, displayID = 1062 }; --Deathsting
	[50891] = { zoneID = 0, displayID = 46235 }; --Boros
	[50892] = { zoneID = 0, displayID = 25857 }; --Cyn
	[50895] = { zoneID = 0, displayID = 46998 }; --Volux
	[50896] = { zoneID = 0, displayID = 1062 }; --Agani
	[50897] = { zoneID = 0, displayID = 46980 }; --Ffexk the Dunestalker
	[50899] = { zoneID = 0, displayID = 1062 }; --Pili
	[50900] = { zoneID = 0, displayID = 1062 }; --Pollix
	[50901] = { zoneID = 0, displayID = 46235 }; --Teromak
	[50903] = { zoneID = 0, displayID = 37856 }; --Orlix the Swamplord
	[50905] = { zoneID = 0, displayID = 46830 }; --Cida
	[50906] = { zoneID = 0, displayID = 37857 }; --Mutilax
	[50908] = { zoneID = 0, displayID = 46667 }; --Nighthowl
	[50909] = { zoneID = 0, displayID = 1062 }; --REUSE
	[50911] = { zoneID = 0, displayID = 1062 }; --REUSE
	[50912] = { zoneID = 0, displayID = 1062 }; --Keen-Ears the Tracker
	[50914] = { zoneID = 0, displayID = 1062 }; --Rendclaw <Slaughterer of Rabbits>
	[50915] = { zoneID = 0, displayID = 46520 }; --Snort
	[50916] = { zoneID = 0, displayID = 46543 }; --Lamepaw the Whimperer
	[50917] = { zoneID = 0, displayID = 1062 }; --Yip
	[50918] = { zoneID = 0, displayID = 71912 }; --Yelper
	[50919] = { zoneID = 0, displayID = 1062 }; --Moonwaker the Baying
	[50920] = { zoneID = 0, displayID = 100991 }; --Star Lantern
	[50921] = { zoneID = 0, displayID = 1062 }; --Lenois
	[50922] = { zoneID = 0, displayID = 35394 }; --Warg
	[50925] = { zoneID = 0, displayID = 9569 }; --Grovepaw
	[50926] = { zoneID = 0, displayID = 70199 }; --Grizzled Ben
	[50927] = { zoneID = 0, displayID = 87972 }; --Jasper
	[50928] = { zoneID = 0, displayID = 1062 }; --Kodir the Cave-Dweller
	[50929] = { zoneID = 0, displayID = 46552 }; --Little Bjorn
	[50930] = { zoneID = 0, displayID = 70192 }; --Hibernus the Sleeper
	[50931] = { zoneID = 0, displayID = 70191 }; --Mange
	[50932] = { zoneID = 0, displayID = 1062 }; --Timbercraw
	[50933] = { zoneID = 0, displayID = 87972 }; --Drake
	[50935] = { zoneID = 0, displayID = 1062 }; --Charger
	[50936] = { zoneID = 0, displayID = 1062 }; --Mudkin the Wallower
	[50937] = { zoneID = 0, displayID = 6122 }; --Hamhide
	[50938] = { zoneID = 0, displayID = 15345 }; --The Sungrass Stalker
	[50940] = { zoneID = 0, displayID = 20814 }; --Swee
	[50941] = { zoneID = 0, displayID = 29745 }; --Squealer
	[50942] = { zoneID = 0, displayID = 1208 }; --Snoot the Rooter
	[50943] = { zoneID = 0, displayID = 1062 }; --Tusky
	[50944] = { zoneID = 0, displayID = 41004 }; --Bristlespine
	[50945] = { zoneID = 0, displayID = 4714 }; --Scruff
	[50946] = { zoneID = 0, displayID = 2450 }; --Hogzilla
	[50947] = { zoneID = 0, displayID = 46532 }; --Varah
	[50948] = { zoneID = 0, displayID = 46566 }; --Crystalback
	[50949] = { zoneID = 0, displayID = 4714 }; --Finn's Gambit
	[50950] = { zoneID = 0, displayID = 1062 }; --Felspike
	[50951] = { zoneID = 0, displayID = 44916 }; --Carapin
	[50952] = { zoneID = 0, displayID = 46994 }; --Barnacle Jim
	[50953] = { zoneID = 0, displayID = 1062 }; --Dunge
	[50954] = { zoneID = 0, displayID = 1062 }; --Bisque
	[50955] = { zoneID = 0, displayID = 46558 }; --Carcinak
	[50956] = { zoneID = 0, displayID = 1062 }; --Pinner
	[50957] = { zoneID = 0, displayID = 46285 }; --Hugeclaw
	[50958] = { zoneID = 0, displayID = 44923 }; --Kalan'ii
	[50960] = { zoneID = 0, displayID = 20917 }; --Hexapos
	[50961] = { zoneID = 0, displayID = 1062 }; --Soft-Shell
	[50963] = { zoneID = 0, displayID = 1062 }; --Scalehide the Maw
	[50964] = { zoneID = 0, displayID = 46230 }; --Chops
	[50965] = { zoneID = 0, displayID = 1062 }; --Niles
	[50967] = { zoneID = 0, displayID = 32807 }; --Craw the Ravager
	[50968] = { zoneID = 0, displayID = 1062 }; --Gullet
	[50969] = { zoneID = 0, displayID = 1062 }; --Dampscale
	[50972] = { zoneID = 0, displayID = 1062 }; --Mugs
	[50976] = { zoneID = 0, displayID = 1062 }; --Saltwater Behemoth
	[50979] = { zoneID = 0, displayID = 1062 }; --The River Stalker
	[50981] = { zoneID = 0, displayID = 61220 }; --Luk'hok
	[50985] = { zoneID = 0, displayID = 61217 }; --Poundfist
	[50986] = { zoneID = 0, displayID = 5245 }; --Goldenback
	[50990] = { zoneID = 0, displayID = 61219 }; --Nakk the Thunderer
	[50992] = { zoneID = 0, displayID = 61218 }; --Gorok
	[50993] = { zoneID = 0, displayID = 26267 }; --Gal'dorak
	[50995] = { zoneID = 0, displayID = 28648 }; --Bruiser
	[50997] = { zoneID = 0, displayID = 26295 }; --Bornak the Gorer
	[50998] = { zoneID = 0, displayID = 40022 }; --Stompy
	[50999] = { zoneID = 0, displayID = 1062 }; --Thorix
	[51000] = { zoneID = 0, displayID = 46248 }; --Blackshell the Impenetrable
	[51001] = { zoneID = 0, displayID = 15423 }; --Venomclaw
	[51002] = { zoneID = 0, displayID = 15336 }; --Scorpoxx
	[51004] = { zoneID = 0, displayID = 46984 }; --Toxx
	[51007] = { zoneID = 0, displayID = 46252 }; --Serkett
	[51008] = { zoneID = 0, displayID = 20912 }; --The Barbed Horror
	[51010] = { zoneID = 0, displayID = 46248 }; --Snips
	[51012] = { zoneID = 0, displayID = 1062 }; --Shimmershell
	[51013] = { zoneID = 0, displayID = 45464 }; --Rockhide the Immovable
	[51014] = { zoneID = 0, displayID = 7837 }; --Terrapis
	[51015] = { zoneID = 0, displayID = 61216 }; --Silthide
	[51016] = { zoneID = 0, displayID = 1062 }; --Murr
	[51017] = { zoneID = 0, displayID = 20142 }; --Gezan
	[51018] = { zoneID = 0, displayID = 19996 }; --Zormus
	[51019] = { zoneID = 0, displayID = 1062 }; --Narakk
	[51020] = { zoneID = 0, displayID = 1062 }; --The Invisible Stalker
	[51021] = { zoneID = 0, displayID = 20910 }; --Vorticus
	[51022] = { zoneID = 0, displayID = 37540 }; --Chordix
	[51024] = { zoneID = 0, displayID = 1062 }; --Nematoss
	[51025] = { zoneID = 0, displayID = 12335 }; --Dilennaa
	[51026] = { zoneID = 0, displayID = 46569 }; --Gnath
	[51027] = { zoneID = 0, displayID = 46534 }; --Spirocula
	[51028] = { zoneID = 0, displayID = 37551 }; --The Deep Tunneler
	[51029] = { zoneID = 0, displayID = 23998 }; --Parasitus
	[51030] = { zoneID = 0, displayID = 1062 }; --Onych
	[51031] = { zoneID = 0, displayID = 46741 }; --Tracker
	[51032] = { zoneID = 0, displayID = 38484 }; --Muffin
	[51037] = { zoneID = 0, displayID = 33998 }; --Lost Gilnean Wardog
	[51040] = { zoneID = 0, displayID = 30222 }; --Snuffles
	[51042] = { zoneID = 0, displayID = 46517 }; --Bleakheart
	[51043] = { zoneID = 0, displayID = 1062 }; --B'lok the Shadow Mutt
	[51044] = { zoneID = 0, displayID = 46668 }; --Plague
	[51045] = { zoneID = 0, displayID = 24906 }; --Arcanus
	[51046] = { zoneID = 0, displayID = 46517 }; --Fidonis
	[51048] = { zoneID = 0, displayID = 35356 }; --Rexxus
	[51049] = { zoneID = 0, displayID = 1062 }; --Bongo
	[51050] = { zoneID = 0, displayID = 1062 }; --Bonobus
	[51051] = { zoneID = 0, displayID = 1062 }; --Jumpi the Swinger
	[51052] = { zoneID = 0, displayID = 46574 }; --Gib the Banana-Hoarder
	[51053] = { zoneID = 0, displayID = 37580 }; --Quirix
	[51054] = { zoneID = 0, displayID = 1062 }; --Dak the Hardened
	[51055] = { zoneID = 0, displayID = 1062 }; --Clattershell
	[51056] = { zoneID = 0, displayID = 1062 }; --Opterax
	[51057] = { zoneID = 0, displayID = 34898 }; --Weevil
	[51058] = { zoneID = 0, displayID = 34900 }; --Aphis
	[51059] = { zoneID = 0, displayID = 44161 }; --Blackhoof
	[51061] = { zoneID = 0, displayID = 15339 }; --Roth-Salam
	[51062] = { zoneID = 0, displayID = 46225 }; --Khep-Re
	[51063] = { zoneID = 0, displayID = 46226 }; --Phalanax
	[51064] = { zoneID = 0, displayID = 1062 }; --Glitterweb
	[51066] = { zoneID = 0, displayID = 33863 }; --Crystalfang
	[51067] = { zoneID = 0, displayID = 36634 }; --Glint
	[51069] = { zoneID = 0, displayID = 46290 }; --Scintillex
	[51072] = { zoneID = 0, displayID = 1062 }; --Vulpos
	[51074] = { zoneID = 0, displayID = 1062 }; --Alope
	[51076] = { zoneID = 0, displayID = 40191 }; --Lopex
	[51077] = { zoneID = 0, displayID = 30254 }; --Bushtail
	[51078] = { zoneID = 0, displayID = 43977 }; --Ferdinand
	[51267] = { zoneID = 0, displayID = 37149 }; --Aeonaxx <Mate of Aeosera>
	[5367] = { zoneID = 0, displayID = 10875 }; --Scillia Daggerquil
	[5399] = { zoneID = 0, displayID = 6695 }; --Veyzhak the Cannibal
	[5400] = { zoneID = 0, displayID = 6693 }; --Zekkis
	[56079] = { zoneID = 0, displayID = 37737 }; --Little Samras
	[5789] = { zoneID = 0, displayID = 4314 }; --Serra Mountainhome <Ironforge Surveyor>
	[5790] = { zoneID = 0, displayID = 4316 }; --Lizzle Sprysprocket <Ironforge Surveyor>
	[5793] = { zoneID = 0, displayID = 4433 }; --Captain Armistice <Alliance Peacekeeper>
	[5794] = { zoneID = 0, displayID = 4431 }; --Thurmonde the Devout <Alliance Peacekeeper>
	[5795] = { zoneID = 0, displayID = 4432 }; --Grash Thunderbrew <Alliance Peacekeeper>
	[5796] = { zoneID = 0, displayID = 1006 }; --Ben <Grash Thunderbrew's Pet>
	[5797] = { zoneID = 0, displayID = 4345 }; --Aean Swiftriver <Alliance Outrunner>
	[5798] = { zoneID = 0, displayID = 4346 }; --Thora Feathermoon <Alliance Outrunner>
	[5799] = { zoneID = 0, displayID = 4348 }; --Hannah Bladeleaf <Alliance Outrunner>
	[5800] = { zoneID = 0, displayID = 4347 }; --Marcus Bel <Alliance Outrunner>
	[5808] = { zoneID = 0, displayID = 9444 }; --Warlord Kolkanis
	[5827] = { zoneID = 0, displayID = 1308 }; --Brontus
	[5916] = { zoneID = 0, displayID = 11356 }; --Sentinel Amarassan
	[5931] = { zoneID = 0, displayID = 4600 }; --Foreman Rigger
	[5934] = { zoneID = 0, displayID = 11011 }; --Heartrazor
	[6646] = { zoneID = 0, displayID = 10042 }; --Monnos the Elder
	[6647] = { zoneID = 0, displayID = 21180 }; --Magister Hawkhelm
	[6652] = { zoneID = 0, displayID = 2687 }; --Master Feardred
	[7895] = { zoneID = 0, displayID = 7043 }; --Ambassador Bloodrage
	[8202] = { zoneID = 0, displayID = 11532 }; --Cyclok the Mad
	[8206] = { zoneID = 0, displayID = 2533 }; --Soul of Tanaris
	[8208] = { zoneID = 0, displayID = 1534 }; --Murderous Blisterpaw
	[9417] = { zoneID = 0, displayID = 8574 }; --Sleeping Dragon
	[32357] = { zoneID = 114, artID = { 119 }, x = 2560, y = 3460, overlay = { "2060-2780","2120-2980","2180-2700","2180-3460","2220-3580","2240-3340","2360-3580","2440-3440","2560-3460","2700-3560","2960-3320","3000-3200","3080-3060","3200-3140","3320-2440","3320-3400","3340-3100","3420-2360","3440-2540","3460-2740","3540-3000","3560-3160","3600-2820","3720-2900" }, displayID = 24960 }; --Old Crystalbark
	[32358] = { zoneID = 114, artID = { 119 }, x = 7100, y = 3620, overlay = { "5920-2180","5960-1940","5980-2620","6000-1700","6040-2360","6040-2840","6060-2500","6080-1520","6100-2160","6140-3000","6180-2000","6280-2900","6280-3460","6300-1940","6300-3240","6320-2540","6340-1640","6380-1760","6440-3240","6460-3500","6500-1720","6540-1920","6540-3360","6600-3640","6620-1800","6640-2060","6720-3500","6780-2340","6780-2640","6780-3680","6820-2860","6840-1920","6920-3800","6960-3200","7040-3460","7100-3620","7160-2840","7180-3440","7300-3420","7400-3020" }, displayID = 24103 }; --Fumblub Gearwind
	[32361] = { zoneID = 114, artID = { 119 }, x = 8020, y = 4580, overlay = { "8020-4580","8060-3180","8160-3080","8440-4680","8520-3420","8820-3920","8860-4060","8980-4340","9120-3220","9120-3380" }, displayID = 26286 }; --Icehorn
	[32400] = { zoneID = 115, artID = { 120 }, x = 6700, y = 5980, overlay = { "5300-5600","5380-5940","5420-5540","5420-5820","5480-5340","5600-5300","5700-5540","5720-4660","5720-4820","5720-5340","5720-5860","5740-5160","5780-4060","5780-4440","5800-5700","5840-4260","5880-5800","5880-5940","5900-3840","5960-3680","5980-6040","6000-2920","6000-4340","6040-3360","6080-4680","6100-5620","6140-6040","6160-4380","6180-5760","6200-3940","6220-4180","6220-5040","6240-5220","6240-5560","6300-3860","6320-5420","6360-3600","6540-3520","6620-3880","6640-3180","6660-3420","6660-3560","6700-4140","6700-4320","6700-4560","6700-5980","6720-3040","6780-5720","6800-4700","6820-2780","6920-3440","6920-4660","6940-2780","7060-2940","7060-3080" }, displayID = 27951 }; --Tukemuth
	[32409] = { zoneID = 115, artID = { 120 }, x = 3040, y = 5880, overlay = { "1440-4540","1460-5960","1520-5680","1540-5820","1560-4560","2020-5560","2040-5380","2380-5340","2640-5800","2840-6120","3040-5880","3320-5540","3320-5680" }, displayID = 28284 }; --Crazed Indu'le Survivor
	[32417] = { zoneID = 115, artID = { 120 }, x = 8780, y = 3640, overlay = { "6900-7460","7120-2200","7140-2520","7180-7380","7220-7040","7280-2580","7540-2640","7540-2760","8500-3620","8660-4140","8780-3640" }, displayID = 10294 }; --Scarlet Highlord Daion
	[32422] = { zoneID = 116, artID = { 121 }, x = 1860, y = 7240, overlay = { "0960-3900","1060-4060","1120-4220","1120-7060","1140-5400","1200-5700","1220-4440","1240-4980","1240-5300","1280-4560","1280-7080","1300-5460","1320-4840","1320-5140","1400-5240","1420-5360","1420-6940","1460-5000","1540-6980","1660-7020","1780-6920","1840-7220","1980-7220","2020-5600","2100-6080","2120-7180","2140-5720","2160-6780","2280-7240","2300-5740","2380-5620","2440-5480","2480-5860","2480-6160","2500-5640","2580-5520" }, displayID = 26663 }; --Grocklar
	[32429] = { zoneID = 116, artID = { 121 }, x = 3880, y = 4920, overlay = { "2660-4420","2800-4540","2880-4640","3420-4920","3840-4900","3960-5100","4020-4920" }, displayID = 18083 }; --Seething Hate
	[32438] = { zoneID = 116, artID = { 121 }, x = 7420, y = 4300, overlay = { "6120-3500","6300-3680","6420-3580","6480-2960","6520-3120","6540-3580","6560-3320","6560-3780","6600-2920","6620-4080","6660-4260","6680-3680","6680-3840","6700-2820","6760-2700","6860-3160","6880-3040","6900-3280","6920-2720","6940-2880","7040-3340","7140-3500","7240-3660","7340-3760","7420-4300","7440-3580","7460-3900","7500-4160","7560-3820" }, displayID = 27970 }; --Syreian the Bonecarver
	[38453] = { zoneID = 116, artID = { 121 }, x = 3100, y = 5540, overlay = { "3040-5500","3280-5520" }, displayID = 31094 }; --Arcturis
	[32377] = { zoneID = 117, artID = { 122 }, x = 5380, y = 1180, overlay = { "4780-0580","5000-0460","5240-1080","5320-1260","6000-1980","6060-2100","6820-1780","6940-1420","7120-1320","7120-1460" }, displayID = 28051 }; --Perobas the Bloodthirster
	[32386] = { zoneID = 117, artID = { 122 }, x = 6840, y = 4600, overlay = { "6840-4600","6840-5840","6860-4860","7000-5040","7000-5680","7040-4920","7100-5220","7120-5540","7160-4440","7160-4560","7180-4700","7220-4280","7220-4860","7220-5260","7240-5060","7260-6120","7280-3920","7280-4100","7280-4440","7360-4540","7380-4960","7380-6140","7400-5260","7420-4780","7420-5920","7440-5460","7460-5140","7480-4520","7480-5660","7620-4280" }, displayID = 27063 }; --Vigdis the War Maiden
	[32398] = { zoneID = 117, artID = { 122 }, x = 3160, y = 7740, overlay = { "2560-6920","2600-6380","3040-7140","3080-5640","3120-5760","3160-7740","3180-7540","3260-7880","3300-8020" }, displayID = 27950 }; --King Ping
	[32487] = { zoneID = 118, artID = { 123 }, x = 4860, y = 4420, overlay = { "4340-5360","4360-6020","4420-5620","4460-5160","4460-5320","4520-6040","4560-6340","4600-5380","4620-4980","4640-4860","4720-4720","4720-6640","4860-4120","4860-4420","4960-4280","4980-4120","5000-4440","5060-3980","5140-4140","5240-3980","5300-3860","5340-4120","5560-4040","5720-3800","5740-4080","5940-4080","6080-4480","6100-4080","6220-4280","6480-5040","6480-5180","6640-5120","6660-5360","6740-5740","6800-6360","6860-6180","6860-6780" }, displayID = 27979 }; --Putridus the Ancient
	[32495] = { zoneID = 118, artID = { 123 }, x = 5540, y = 5360, overlay = { "2800-4680","2840-4540","2900-2920","2940-2740","3020-3220","3020-3840","3020-4420","3040-2880","3040-3440","3060-2660","3060-3960","3100-3020","3140-4300","3160-2860","3180-4060","3260-2960","3320-2840","3520-2720","3640-2560","3740-2440","5240-5200","5260-5440","5260-5560","5320-5300","5400-5120","5540-5300","5620-5480","5740-5720","5760-5460","5800-6260","5860-5660","5880-5780","5900-5500","5940-5900","5940-6200" }, displayID = 27983 }; --Hildana Deathstealer
	[32501] = { zoneID = 118, artID = { 123 }, x = 7340, y = 3360, overlay = { "3120-6580","3120-6700","3120-6820","3140-6280","3240-7000","3380-6960","3440-7100","3540-7000","4720-8540","4740-7820","4740-8380","4840-7900","4840-8600","4860-7760","4880-8040","4920-8420","5020-8560","6740-3940","6780-3820","6920-4060","7100-3360","7160-3600","7160-3800","7240-3440","7340-3340","7440-3240","7460-3360" }, displayID = 27988 }; --High Thane Jorfus
	[32481] = { zoneID = 119, artID = { 124 }, x = 4480, y = 6920, overlay = { "4040-5920","4060-7400","4140-6860","4160-6660","4180-7020","4180-7400","4240-7560","4300-5260","4440-7000","4480-6820","4640-5560","5100-7240","5260-7200","5400-5120","5480-5260","5700-6540","5820-6420" }, displayID = 27975 }; --Aotona
	[32485] = { zoneID = 119, artID = { 124 }, x = 3740, y = 2780, overlay = { "2620-7340","2700-5140","2760-6820","2760-6940","2760-7280","2800-4480","2820-5860","2840-4600","2840-5080","2900-5360","2900-6440","2940-5180","2940-6800","2980-5060","3000-6300","3040-3800","3040-4900","3120-3680","3240-3580","3280-3300","3420-3180","3580-2800","3640-2920","3740-2780","4620-4060","4660-4260","4700-4460","4760-4340","4780-4200","4820-4580","4900-4420","4920-4300","5000-4580","5000-8160","5060-7920","5080-4820","5100-4400","5120-4280","5140-8240","5160-4580","5160-4920","5200-4760","5200-8520","5220-4120","5460-8340","5560-8260","5720-8080","5740-8300","5840-8140","5860-8380","5960-8240","6320-8320","6420-7980","6480-8140","6500-8300","6620-7760" }, displayID = 28052 }; --King Krush
	[32517] = { zoneID = 119, artID = { 124 }, x = 3060, y = 6740, overlay = { "2160-7000","2300-7140","3060-6740","3140-6580","3440-2900","3520-3080","3580-2920","3640-3180","5040-8160","5800-2140","5940-2260","6600-7940","6620-7820","7100-7060","7140-7180" }, displayID = 28010 }; --Loque'nahak <Mate of Har'koa>
	[32475] = { zoneID = {
				[120] = { x = 7200, y = 7500, artID = { 125 }, overlay = { "7200-7500" } };
				[121] = { x = 7160, y = 2300, artID = { 126 }, overlay = { "5240-3160","6060-3700","6140-3540","6160-3380","7080-2880","7120-2300","7120-2420","7140-2740","7180-2980","7340-6840","7360-6600","7440-6740","7640-4280","7660-6880","8140-3420" } };
			  }, displayID = 27973 }; --Terror Spinner
	[32491] = { zoneID = 120, artID = { 125 }, x = 2800, y = 6540, overlay = { "2800-6540","3000-6780","3660-6980","3940-8440","4120-6820","4180-8280" }, displayID = 26711 }; --Time-Lost Proto-Drake
	[32500] = { zoneID = 120, artID = { 125 }, x = 4260, y = 3820, overlay = { "3740-5840","3740-6040","3760-5700","4040-3960","4120-5140","4140-4100","4260-3820","6720-4760" }, displayID = 27986 }; --Dirkee
	[32630] = { zoneID = 120, artID = { 125 }, x = 3900, y = 5940, overlay = { "2620-4220","2620-4340","2620-7420","2640-5840","2720-5500","2720-6380","2720-7060","2740-4480","2740-6760","2780-3860","2780-6220","2840-5120","2840-6900","2900-6600","2900-6720","2980-3800","3020-6800","3100-6940","3140-6580","3160-6440","3320-3660","3340-3540","3380-6480","3380-6600","3500-6520","3520-6660","3560-7400","3580-7780","3600-6420","3640-6260","3640-6840","3640-7600","3660-7300","3680-7480","3700-6960","3820-6120","3820-7400","3840-7520","3900-5940","3920-7300","4000-6520","4020-2960","4040-6340","4040-7180","4080-5520","4080-8400","4120-3060","4120-6000","4280-3060","4460-5860","4560-8240","4600-6200","4620-3000","4640-3140","4740-6380","4740-6520","4780-3060","4840-6780","4860-6640","4900-2960","4900-7480","4920-3100","4920-4680","5000-6900","5100-7100","5180-3400","5200-3220" }, displayID = 28110 }; --Vyragosa
	[35189] = { zoneID = 120, artID = { 125 }, x = 3000, y = 6460, overlay = { "2780-4760","2780-5080","3000-6460","4620-6440","4620-6560","4800-6300" }, displayID = 29673 }; --Skoll
	[32447] = { zoneID = 121, artID = { 126 }, x = 4600, y = 6060, overlay = { "2120-8720","2220-8240","2240-8360","2360-8240","2420-8700","2520-8280","2640-8220","2800-8260","2860-7380","2880-7240","2900-7500","2900-7760","2900-8120","2940-7920","2960-8240","3960-6740","4000-5180","4000-5980","4040-5300","4040-5440","4040-5620","4040-5800","4040-6100","4040-6260","4140-5540","4140-6980","4280-7100","4320-5460","4360-7260","4440-7380","4460-6760","4520-5940","4520-7480","4600-6060","4600-6440","4600-6600","4640-7720","4720-7900","4740-6320","4840-7940","4900-8120","5060-8300" }, displayID = 26589 }; --Zul'drak Sentinel
	[32471] = { zoneID = 121, artID = { 126 }, x = 1720, y = 7100, overlay = { "1320-5620","1340-5480","1440-5600","1720-7100","2060-7120","2100-7880","2160-7020","2240-6080","2280-6200","2440-6200","2500-7540","2520-7720","2620-7100","2640-5380","2640-5520","2660-5660" }, displayID = 25926 }; --Griegen
	[33776] = { zoneID = 121, artID = { 126 }, x = 7760, y = 7000, overlay = { "6140-6140","6140-6300","6300-4320","6680-7780","6760-7920","6800-7740","6920-4800","7700-7040","7820-7120" }, displayID = 28871 }; --Gondria
	[32435] = { zoneID = 126, artID = { 131 }, x = 5560, y = 3440, overlay = { "5480-3420","5700-3700" }, displayID = 20763 }; --Vern
	[50053] = { zoneID = 198, artID = { 203,227 }, x = 5380, y = 2960, overlay = { "3440-2600","3640-2640","3960-2600","4140-3040","4260-3160","4420-3260","4560-3240","4680-3360","4780-3460","5020-3320","5140-3200","5200-3080","5300-3000","5420-2940","5540-2860","5620-3460","5660-3280","5700-3100","5720-2840","5740-3560","5760-2960","5860-3620","5920-3760" }, displayID = 36700 }; --Thartuk the Exile
	[50056] = { zoneID = 198, artID = { 203,227 }, x = 3720, y = 7240, overlay = { "3720-7240","3720-7440","3740-7560","3780-7820","3780-8360","3800-7700","3840-7980","3900-8200","4000-8080","4000-8380" }, displayID = 37307 }; --Garr
	[50057] = { zoneID = 198, artID = { 203,227 }, x = 6780, y = 5500, overlay = { "4500-6040","4980-5260","5600-5720","6580-5480","6780-5500" }, displayID = 36701 }; --Blazewing
	[50058] = { zoneID = 198, artID = { 203,227 }, x = 5280, y = 7320, overlay = { "5220-8320","5280-7320","5380-8200","5420-8000","5560-7620","5680-7540" }, displayID = 37282 }; --Terrorpene
	[54318] = { zoneID = 198, artID = { 203,227 }, x = 3060, y = 5140, overlay = { "2740-5120","2880-5220","3000-5140","3240-5140","3320-5260","3440-5320","3500-5460","3600-5380","3800-5420","3920-5480","4040-5340" }, displayID = 38748 }; --Ankha
	[54319] = { zoneID = 198, artID = { 203,227 }, x = 3960, y = 5380, overlay = { "2740-5140","2900-5240","3000-5160","3120-5120","3240-5140","3340-5260","3460-5300","3520-5460","3660-5460","3780-5420","3880-5500","3960-5380","4080-5400" }, displayID = 38749 }; --Magria
	[54320] = { zoneID = 198, artID = { 203,227 }, x = 2600, y = 6520, overlay = { "2580-6120","2600-6520","2620-6280","2640-6000","2720-6420","2760-6020","2780-6260" }, displayID = 38634 }; --Ban'thalos
	[3253] = { zoneID = 199, artID = { 204 }, x = 4120, y = 6700, overlay = { "4120-6700" }, displayID = 37581 }; --Silithid Harvester
	[5829] = { zoneID = 199, artID = { 204 }, x = 4560, y = 4360, overlay = { "4540-4340" }, displayID = 34324 }; --Snort the Heckler
	[5832] = { zoneID = 199, artID = { 204 }, x = 4820, y = 7440, overlay = { "4440-7740","4440-8000","4620-7900","4820-7440","4980-7920","4980-8060" }, displayID = 37778 }; --Thunderstomp
	[5834] = { zoneID = 199, artID = { 204 }, x = 4360, y = 5760, overlay = { "4220-5340","4240-5480","4300-5620","4360-5740","4380-5480","4420-5900","4460-5620","4580-5560","4600-5740" }, displayID = 2702 }; --Azzere the Skyblade
	[5837] = { zoneID = {
				[199] = { x = 4060, y = 0880, artID = { 204 }, overlay = { "4060-0880" } };
				[1413] = { x = 3180, y = 4840, artID = { 1202 }, overlay = { "3180-4840","3240-5240","4000-4560" } };
			  }, displayID = 4874 }; --Stonearm
	[5847] = { zoneID = 199, artID = { 204 }, x = 4720, y = 8840, overlay = { "4700-8860" }, displayID = 4595 }; --Heggin Stonewhisker <Bael'dun Chief Engineer>
	[5848] = { zoneID = 199, artID = { 204 }, x = 4740, y = 8580, overlay = { "4740-8580" }, displayID = 4597 }; --Malgin Barleybrew <Bael'dun Morale Officer>
	[5849] = { zoneID = 199, artID = { 204 }, x = 4780, y = 8820, overlay = { "4780-8820" }, displayID = 4596 }; --Digger Flameforge <Excavation Specialist>
	[5851] = { zoneID = 199, artID = { 204 }, x = 4980, y = 8960, overlay = { "4960-8940" }, displayID = 4598 }; --Captain Gerogg Hammertoe <Bael'dun Captain of the Guard>
	[5859] = { zoneID = 199, artID = { 204 }, x = 4040, y = 8300, overlay = { "4040-8300","4180-8440","4320-8440" }, displayID = 6114 }; --Hagg Taurenbane <Razormane Champion>
	[5863] = { zoneID = 199, artID = { 204 }, x = 4200, y = 4260, overlay = { "4200-3780","4200-4260","4420-4200" }, displayID = 6100 }; --Geopriest Gukk'rok
	[5864] = { zoneID = 199, artID = { 204 }, x = 3860, y = 3360, overlay = { "3860-3340" }, displayID = 6114 }; --Swinegart Spearhide
	[49913] = { zoneID = 201, artID = { 206 }, x = 6060, y = 7080, overlay = { "5620-7780","5720-8020","5940-7520","6000-7680","6020-7040","6040-6920","6100-7500" }, displayID = 36660 }; --Lady La-La <Siren of the Deeps>
	[51079] = { zoneID = 203, artID = { 208 }, x = 6680, y = 6960, overlay = { "6680-6940" }, friendly = { "H" }, displayID = 30103 }; --Captain Foulwind
	[50005] = { zoneID = {
				[204] = { x = 3940, y = 7160, artID = { 209 }, overlay = { "3940-7160","4040-7380","4100-7660","4180-7340","4220-7600" } };
				[205] = { x = 4620, y = 4860, artID = { 210 }, overlay = { "3780-6680","3820-6820","3940-6880","3980-6640","4440-4940","4480-5080","4620-4860","4660-5000","5640-8200","5720-8080","5740-8360","5820-8160","6500-4200","6580-4320","6680-4240" } };
			  }, displayID = 37308 }; --Poseidus
	[50009] = { zoneID = 204, artID = { 209 }, x = 7560, y = 3660, overlay = { "6280-2800","6300-3060","6340-2500","6340-3200","6420-2320","6420-3540","6460-2180","6520-3740","6580-2040","6660-1940","6720-3900","6840-1820","6940-3980","6980-1740","7100-4000","7180-1840","7220-3940","7320-2000","7340-3880","7460-3780","7480-2040","7560-2160","7560-3660","7640-3460","7660-2360","7700-2540","7700-3280","7720-2900","7740-2680" }, displayID = 37338 }; --Mobus <The Crushing Tide>
	[50050] = { zoneID = 204, artID = { 209 }, x = 4800, y = 2760, overlay = { "4180-3240","4620-2940","4800-2740","4800-3460","5100-3220" }, displayID = 37335 }; --Shok'sharak
	[50051] = { zoneID = 204, artID = { 209 }, x = 2200, y = 6500, overlay = { "1280-8260","1500-7740","1500-8740","1900-7740","2000-5800","2040-6840","2200-6500","2420-7180","2440-8040","2600-8140","2820-8220","3120-7800","3140-8060" }, displayID = 37396 }; --Ghostcrawler
	[50052] = { zoneID = 205, artID = { 210 }, x = 5700, y = 6960, overlay = { "5640-7000","5720-6900" }, displayID = 36699 }; --Burgy Blackheart <Dreaded Captain of Diane's Fancy>
	[51071] = { zoneID = 205, artID = { 210 }, x = 5520, y = 7320, overlay = { "5520-7320" }, displayID = 4693 }; --Captain Florence
	[49822] = { zoneID = 207, artID = { 212 }, x = 6120, y = 2240, overlay = { "6120-2240" }, displayID = 36636 }; --Jadefang
	[50059] = { zoneID = 207, artID = { 212 }, x = 3860, y = 8320, overlay = { "3240-7680","3720-7980","3720-8160","3860-8320","4280-8760","4540-8400" }, displayID = 37364 }; --Golgarok <The Crimson Shatterer>
	[50060] = { zoneID = 207, artID = { 212 }, x = 5420, y = 2540, overlay = { "5420-2540","5520-2440" }, displayID = 36703 }; --Terborus
	[50061] = { zoneID = 207, artID = { 212 }, x = 4380, y = 4020, overlay = { "4040-5280","4060-5580","4080-4740","4080-5700","4100-4580","4140-4440","4200-6000","4220-4280","4300-6140","4360-4060","4440-6320","4540-3900","4620-6440","4640-3800","4740-6500","4960-3800","5020-6560","5220-6460","5300-3880","5340-6400","5440-4000","5540-6180","5580-4320","5620-6040","5720-5840","5740-4420","5760-5640","5820-5100" }, displayID = 32229 }; --Xariona
	[50062] = { zoneID = 207, artID = { 212 }, x = 6600, y = 6440, overlay = { "3120-4260","3500-4200","3940-4880","4140-8240","4260-4680","4280-5840","4320-4840","4320-5060","4340-6040","4640-4480","4700-5740","4740-5900","4860-5560","5160-4280","5360-3940","5500-5400","6040-2620","6160-2700","6480-1920","6600-6440" }, displayID = 37149 }; --Aeonaxx <Mate of Aeosera>
	[14490] = { zoneID = 210, artID = { 215 }, x = 4140, y = 7140, overlay = { "4120-7180" }, displayID = 14528 }; --Rippa
	[14491] = { zoneID = 210, artID = { 215 }, x = 5280, y = 5320, overlay = { "4800-5800","4940-5660","5060-5560","5120-5380","5280-5320","5440-5220","5540-5120","5620-5020","5620-5280","5720-4920","5800-4780" }, displayID = 3188 }; --Kurmokk
	[14492] = { zoneID = 210, artID = { 215 }, x = 5300, y = 2760, overlay = { "5300-2760" }, displayID = 7232 }; --Verifonix <The Surveyor>
	[1552] = { zoneID = 210, artID = { 215 }, x = 6780, y = 2520, overlay = { "6780-2520" }, displayID = 45945 }; --Scale Belly
	[2541] = { zoneID = 210, artID = { 215 }, x = 4340, y = 4940, overlay = { "4320-4960" }, displayID = 21160 }; --Lord Sakrasis
	[10080] = { zoneID = 219, artID = { 230 }, x = 5200, y = 4100, overlay = { "5200-4100" }, displayID = 9291 }; --Sandarr Dunereaver
	[10081] = { zoneID = 219, artID = { 230 }, x = 3620, y = 1780, overlay = { "3620-1780" }, displayID = 9292 }; --Dustwraith
	[10082] = { zoneID = 219, artID = { 230 }, x = 5300, y = 4000, overlay = { "5300-4000" }, displayID = 9293 }; --Zerillis
	[12902] = { zoneID = {
				[221] = { x = 6126, y = 6261, artID = { 232 }, overlay = { "6126-6261","6686-6744" } };
				[222] = { x = 4414, y = 2538, artID = { 233 }, overlay = { "4414-2538","3889-2241","3591-4729","3272-7165" } };
			  }, displayID = 12822 }; --Lorgus Jett
	[6228] = { zoneID = 229, artID = { 240 }, x = 2800, y = 5200, overlay = { "2800-5200" }, displayID = 6669 }; --Dark Iron Ambassador
	[11467] = { zoneID = 237, artID = { 248 }, x = 3200, y = 2800, overlay = { "3200-2800" }, displayID = 11250 }; --Tsu'zee
	[14506] = { zoneID = 238, artID = { 249 }, x = 3800, y = 5900, overlay = { "3800-5900" }, friendly = { "A" }, displayID = 14556 }; --Lord Hel'nurath
	[50085] = { zoneID = 241, artID = { 338,252 }, x = 5800, y = 3380, overlay = { "5780-3340" }, displayID = 36711 }; --Overlord Sunderfury
	[50086] = { zoneID = 241, artID = { 338,252 }, x = 5100, y = 8240, overlay = { "5080-8260" }, displayID = 36714 }; --Tarvus the Vile
	[50089] = { zoneID = 241, artID = { 338,252 }, x = 5240, y = 0800, overlay = { "4960-0740","5020-0880","5100-0760","5220-1060","5240-0800","5240-0920","5320-1200","5360-1080","5500-1180","5640-0820","5660-1100","5700-0700","5800-0960","5880-0620","6000-0640" }, displayID = 24301 }; --Julak-Doom <The Eye of Zor>
	[50138] = { zoneID = 241, artID = { 338,252 }, x = 5920, y = 4340, overlay = { "4920-7420","4980-7540","5380-5320","5420-7620","5460-7500","5820-6360","5920-4340","6540-6020" }, displayID = 36726 }; --Karoma <The Wolf Spirit>
	[50159] = { zoneID = 241, artID = { 338,252 }, x = 3820, y = 5300, overlay = { "3820-5300","4260-3860","6880-2580" }, displayID = 37352 }; --Sambas
	[8923] = { zoneID = 243, artID = { 254 }, x = 5000, y = 3700, overlay = { "5000-3700" }, displayID = 8270 }; --Panzor the Invincible
	[50063] = { zoneID = 249, artID = { 260,289 }, x = 3800, y = 6020, overlay = { "3800-6020" }, displayID = 34573 }; --Akma'hat <Dirge of the Eternal Sands>
	[50064] = { zoneID = 249, artID = { 260,289 }, x = 6640, y = 6800, overlay = { "5800-8240","5820-6120","6640-6800","7080-7420" }, displayID = 36707 }; --Cyrus the Black
	[50065] = { zoneID = 249, artID = { 260,289 }, x = 4480, y = 4260, overlay = { "4440-4200","4480-4360" }, displayID = 37353 }; --Armagedillo
	[50154] = { zoneID = 249, artID = { 260,289 }, x = 4440, y = 1040, overlay = { "4440-1040","4440-2180","4700-1740","4740-1880","5000-2380","5020-1960","5040-2100","5340-1860" }, displayID = 36728 }; --Madexx
	[51401] = { zoneID = 249, artID = { 260,289 }, x = 5040, y = 2020, overlay = { "4420-1080","4460-2140","4740-1900","5020-2380","5040-2020","5320-1980" }, displayID = 37360 }; --Madexx
	[51402] = { zoneID = 249, artID = { 260,289 }, x = 5320, y = 1940, overlay = { "4440-1040","4440-2200","5080-2020","5320-1940" }, displayID = 37362 }; --Madexx
	[51403] = { zoneID = 249, artID = { 260,289 }, x = 4780, y = 1820, overlay = { "4780-1820","5020-2380","5100-2040","5340-1900","5380-2020" }, displayID = 37359 }; --Madexx
	[51404] = { zoneID = 249, artID = { 260,289 }, x = 5380, y = 1860, overlay = { "4440-1020","4440-2180","4740-1840","5000-2060","5000-2340","5000-2480","5100-1960","5340-1960" }, displayID = 37361 }; --Madexx
	[10263] = { zoneID = 251, artID = { 262 }, x = 6600, y = 4100, overlay = { "6600-4100" }, displayID = 5047 }; --Burning Felguard
	[10376] = { zoneID = 251, artID = { 262 }, x = 5700, y = 7800, overlay = { "5700-7800" }, displayID = 9755 }; --Crystal Fang
	[9596] = { zoneID = 251, artID = { 262 }, x = 4790, y = 6420, overlay = { "4790-6420" }, displayID = 9668 }; --Bannok Grimaxe <Firebrand Legion Champion>
	[9217] = { zoneID = 252, artID = { 263 }, x = 4100, y = 5800, overlay = { "4100-5800" }, displayID = 11578 }; --Spirestone Lord Magus
	[9218] = { zoneID = 252, artID = { 263 }, x = 3500, y = 5600, overlay = { "3500-5600" }, displayID = 11576 }; --Spirestone Battle Lord
	[9219] = { zoneID = 252, artID = { 263 }, x = 5120, y = 5670, overlay = { "5120-5670" }, displayID = 11574 }; --Spirestone Butcher
	[10509] = { zoneID = 255, artID = { 266 }, x = 3715, y = 2554, overlay = { "3715-2554" }, displayID = 9686 }; --Jed Runewatcher <Blackhand Legion>
	[9718] = { zoneID = 255, artID = { 266 }, x = 3500, y = 7400, displayID = 11809 }; --Ghok Bashguud <Bloodaxe Champion>
	[56080] = { zoneID = 274, artID = { 285 }, x = 6120, y = 4110, friendly = { "A","H" }, displayID = 39299 }; --Little Samras
	[56081] = { zoneID = 274, artID = { 285 }, x = 4800, y = 6430, friendly = { "A","H" }, displayID = 5027 }; --Optimistic Benj
	[5912] = { zoneID = 279, artID = { 290 }, x = 7200, y = 6600, overlay = { "7200-6600" }, displayID = 1267 }; --Deviate Faerie Dragon
	[12237] = { zoneID = 280, artID = { 291 }, x = 2500, y = 7900, overlay = { "2500-7900" }, displayID = 9014 }; --Meshlok the Harvester
	[4425] = { zoneID = 301, artID = { 313 }, x = 1050, y = 3000, overlay = { "1050-3000" }, displayID = 4735 }; --Blind Hunter
	[4842] = { zoneID = 301, artID = { 313 }, x = 4850, y = 4568, overlay = { "4850-4568" }, displayID = 6092 }; --Earthcaller Halmgar
	[6488] = { zoneID = 302, artID = { 314 }, x = 2801, y = 5633, overlay = { "2801-5633" }, displayID = 5230 }; --Fallen Champion
	[6489] = { zoneID = 302, artID = { 314 }, x = 4254, y = 6915, overlay = { "4254-6915" }, displayID = 5231 }; --Ironspine
	[6490] = { zoneID = 302, artID = { 314 }, x = 2577, y = 6957, overlay = { "2577-6957" }, displayID = 5534 }; --Azshir the Sleepless
	[3872] = { zoneID = 316, artID = { 328 }, x = 5286, y = 5020, overlay = { "5286-5020" }, displayID = 37296 }; --Deathsworn Captain
	[10393] = { zoneID = 317, artID = { 329 }, x = 5600, y = 6600, overlay = { "5600-6600" }, displayID = 2606 }; --Skul
	[10558] = { zoneID = 317, artID = { 329 }, x = 6050, y = 3130, overlay = { "6050-3130" }, displayID = 10482 }; --Hearthsinger Forresten
	[10809] = { zoneID = 318, artID = { 330 }, x = 6700, y = 3000, overlay = { "6700-3000" }, displayID = 7856 }; --Stonespine
	[50815] = { zoneID = 338, artID = { 350 }, x = 3740, y = 3559, overlay = { "3300-5220","3680-3480" }, displayID = 19607 }; --Skarr
	[50959] = { zoneID = 338, artID = { 350 }, x = 3300, y = 5220, overlay = { "3300-5220","3680-3480" }, displayID = 88834 }; --Karkin
	[54321] = { zoneID = 338, artID = { 350 }, x = 6060, y = 5960, overlay = { "6020-5860","6040-6020" }, displayID = 38780 }; --Solix
	[54322] = { zoneID = 338, artID = { 350 }, x = 6800, y = 7140, overlay = { "6800-7140","6940-6980","7300-5800","7320-5940" }, displayID = 38424 }; --Deth'tilac <The Smouldering Darkness>
	[54323] = { zoneID = 338, artID = { 350 }, x = 3040, y = 5680, overlay = { "2660-6640","2700-6200","2900-7300","2980-5520","3020-5800","3040-5680","3160-5680" }, displayID = 38453 }; --Kirix
	[54324] = { zoneID = 338, artID = { 350 }, x = 2000, y = 5080, overlay = { "1860-5260","1940-4740","1940-4880","2000-5080" }, displayID = 38779 }; --Skitterflame
	[54338] = { zoneID = 338, artID = { 350 }, x = 5480, y = 4100, overlay = { "5260-4120","5380-3960","5460-4180","5480-3840","5660-4140" }, displayID = 38426 }; --Anthriss
	[16179] = { zoneID = 350, artID = { 362 }, x = 5960, y = 2870, overlay = { "5960-2870" }, displayID = 15938 }; --Hyakiss the Lurker
	[16180] = { zoneID = 350, artID = { 362 }, x = 5960, y = 2870, overlay = { "5960-2870" }, displayID = 16053 }; --Shadikith the Glider
	[16181] = { zoneID = 350, artID = { 362 }, x = 5960, y = 2870, overlay = { "5960-2870" }, displayID = 16054 }; --Rokad the Ravager
	[5809] = { zoneID = 1411, artID = { 1194 }, x = 5920, y = 5820, overlay = { "5920-5820" }, displayID = 33165 }; --Sergeant Curtis
	[5822] = { zoneID = 1411, artID = { 1194 }, x = 5278, y = 0896, overlay = { "5278-0896" }, displayID = 4594 }; --Felweaver Scornn
	[5823] = { zoneID = 1411, artID = { 1194 }, x = 3820, y = 4420, overlay = { "3440-4460","3480-4340","3540-4600","3640-4440","3700-4800","3720-4580","3800-4460","3840-4680","3880-4860","3960-4520","3980-4400" }, displayID = 2491 }; --Death Flayer
	[5824] = { zoneID = 1411, artID = { 1194 }, x = 4300, y = 3840, overlay = { "3860-5380","4240-3860","4420-4980" }, displayID = 1343 }; --Captain Flat Tusk <Captain of the Battleguard>
	[5826] = { zoneID = 1411, artID = { 1194 }, x = 4360, y = 5020, overlay = { "4320-3940","4340-5020","4700-4940" }, displayID = 6093 }; --Geolord Mottle
	[3058] = { zoneID = 1412, artID = { 1200 }, x = 5680, y = 6340, overlay = { "4800-6860","5040-6660","5040-6840","5140-6520","5180-6840","5240-6380","5320-6220","5380-6900","5460-6800","5480-6240","5480-7000","5620-6320","5620-7000","5700-6580","5780-6760","5780-6900" }, displayID = 10916 }; --Arra'chea
	[3068] = { zoneID = 1412, artID = { 1200 }, x = 4680, y = 4680, overlay = { "4240-4540","4360-4100","4440-4740","4560-4720","4680-4680","4720-4060","4880-4340","4980-4100","5000-4260" }, displayID = 1961 }; --Mazzranache
	[43613] = { zoneID = 1412, artID = { 1200 }, x = 3380, y = 3700, overlay = { "3380-3700" }, displayID = 33430 }; --Doomsayer Wiserunner <Twilight's Hammer>
	[43720] = { zoneID = 1412, artID = { 1200 }, x = 4295, y = 8955, overlay = { "4295-8955" }, displayID = 52724 }; --"Pokey" Thornmantle
	[5785] = { zoneID = 1412, artID = { 1200 }, x = 3260, y = 2400, overlay = { "3200-2440","5240-1180","5340-1260" }, displayID = 2163 }; --Sister Hatelash
	[5786] = { zoneID = 1412, artID = { 1200 }, x = 4860, y = 7040, overlay = { "4840-7040","5320-7120" }, displayID = 488 }; --Snagglespear
	[5787] = { zoneID = 1412, artID = { 1200 }, x = 6060, y = 4740, overlay = { "6040-4740" }, displayID = 610 }; --Enforcer Emilgund
	[5807] = { zoneID = 1412, artID = { 1200 }, x = 5460, y = 2080, overlay = { "4960-2200","4980-2500","5040-2620","5080-2160","5100-2840","5260-2040","5340-1940","5340-2960","5440-2020","5540-2400","5580-2560" }, displayID = 1973 }; --The Rake
	[3270] = { zoneID = 1413, artID = { 1202 }, x = 5820, y = 4960, overlay = { "5640-5160","5820-4960","6080-5240" }, displayID = 6112 }; --Elder Mystic Razorsnout
	[3295] = { zoneID = 1413, artID = { 1202 }, x = 5760, y = 2060, overlay = { "5740-1920","5760-2040" }, displayID = 360 }; --Sludge Anomaly
	[3398] = { zoneID = 1413, artID = { 1202 }, x = 4060, y = 7460, overlay = { "4000-7460" }, displayID = 1397 }; --Gesharahan
	[3470] = { zoneID = 1413, artID = { 1202 }, x = 4140, y = 3840, overlay = { "4120-3920","4220-3840" }, displayID = 5047 }; --Rathorian
	[3652] = { zoneID = 1413, artID = { 1202 }, x = 6160, y = 4120, overlay = { "6040-3860","6040-4060","6160-4120","6200-3880","6240-3740" }, displayID = 1092 }; --Trigore the Lasher
	[3672] = { zoneID = 1413, artID = { 1202 }, x = 6820, y = 5900, overlay = { "6760-5740","6820-5900","7080-5780","7400-2560","7800-4000","7920-3920" }, displayID = 4212 }; --Boahn <Druid of the Fang>
	[5828] = { zoneID = 1413, artID = { 1202 }, x = 6720, y = 6400, overlay = { "6720-6400" }, displayID = 4424 }; --Humar the Pridelord
	[5830] = { zoneID = 1413, artID = { 1202 }, x = 2540, y = 3320, overlay = { "2540-3320" }, displayID = 10876 }; --Sister Rathtalon
	[5831] = { zoneID = 1413, artID = { 1202 }, x = 6320, y = 6340, overlay = { "6320-6340","6480-6040" }, displayID = 6084 }; --Swiftmane
	[5835] = { zoneID = 1413, artID = { 1202 }, x = 5760, y = 2040, overlay = { "5720-1940","5720-2060" }, displayID = 4593 }; --Foreman Grills
	[5836] = { zoneID = 1413, artID = { 1202 }, x = 5800, y = 2040, overlay = { "5800-2040" }, displayID = 7049 }; --Engineer Whirleygig
	[5838] = { zoneID = 1413, artID = { 1202 }, x = 5860, y = 7760, overlay = { "5140-8340","5180-7540","5380-8700","5780-8220","5840-7760" }, displayID = 9448 }; --Brokespear
	[5841] = { zoneID = 1413, artID = { 1202 }, x = 5920, y = 8020, overlay = { "5900-8060","5920-7940" }, displayID = 9533 }; --Rocklance
	[5842] = { zoneID = 1413, artID = { 1202 }, x = 6360, y = 3580, overlay = { "6340-3600" }, displayID = 1337 }; --Takk the Leaper
	[5865] = { zoneID = 1413, artID = { 1202 }, x = 4540, y = 3300, overlay = { "4520-5280","4540-3300","4880-5180" }, displayID = 1043 }; --Dishu
	[2598] = { zoneID = 1417, artID = { 1206 }, x = 1940, y = 6400, overlay = { "1920-6460" }, displayID = 4027 }; --Darbel Montrose
	[2600] = { zoneID = 1417, artID = { 1206 }, x = 2740, y = 2780, overlay = { "2740-2780" }, displayID = 4026 }; --Singer
	[2601] = { zoneID = 1417, artID = { 1206 }, x = 1440, y = 6780, overlay = { "1400-6740","1420-6940","1500-6840" }, displayID = 20018 }; --Foulbelly
	[2602] = { zoneID = 1417, artID = { 1206 }, x = 1860, y = 3040, overlay = { "1800-3120","1840-3000","1960-3060" }, displayID = 32547 }; --Ruul Onestone
	[2603] = { zoneID = 1417, artID = { 1206 }, x = 2460, y = 4480, overlay = { "2420-4440" }, displayID = 25189 }; --Kovork
	[2604] = { zoneID = 1417, artID = { 1206 }, x = 4700, y = 7580, overlay = { "4700-7500","4720-7660","4760-7780" }, displayID = 20017 }; --Molok the Crusher
	[2605] = { zoneID = 1417, artID = { 1206 }, x = 6280, y = 8100, overlay = { "6280-8100" }, displayID = 28239 }; --Zalas Witherbark <Warband Leader>
	[2606] = { zoneID = 1417, artID = { 1206 }, x = 6860, y = 6660, overlay = { "6840-6640" }, displayID = 28818 }; --Nimar the Slayer <Warband Leader>
	[2609] = { zoneID = 1417, artID = { 1206 }, x = 7960, y = 2940, overlay = { "7940-2940" }, displayID = 27190 }; --Geomancer Flintdagger
	[2779] = { zoneID = 1417, artID = { 1206 }, x = 1420, y = 9280, overlay = { "1400-8640","1420-9240","1540-8880","1620-8700","1620-9320","1640-9120" }, displayID = 6763 }; --Prince Nazjak
	[14224] = { zoneID = 1418, artID = { 1207 }, x = 7860, y = 3160, overlay = { "7800-3260","7840-3140" }, displayID = 6889 }; --7:XT <Long Distance Recovery Unit>
	[2744] = { zoneID = 1418, artID = { 1207 }, x = 3960, y = 2460, overlay = { "3940-2440" }, displayID = 4937 }; --Shadowforge Commander
	[2749] = { zoneID = 1418, artID = { 1207 }, x = 2720, y = 3740, overlay = { "0940-4880","2700-3780" }, displayID = 10802 }; --Barricade
	[2751] = { zoneID = 1418, artID = { 1207 }, x = 4840, y = 2580, overlay = { "4840-2580" }, displayID = 5747 }; --War Golem
	[2752] = { zoneID = 1418, artID = { 1207 }, x = 1580, y = 2980, overlay = { "1580-2980" }, displayID = 37714 }; --Rumbler
	[2753] = { zoneID = 1418, artID = { 1207 }, x = 4120, y = 5820, overlay = { "3940-5820","3940-5940","3980-6060","4080-5880" }, displayID = 9372 }; --Barnabus
	[2754] = { zoneID = 1418, artID = { 1207 }, x = 0800, y = 6660, overlay = { "0800-6640","0880-6520" }, displayID = 35463 }; --Anathemus
	[2850] = { zoneID = 1418, artID = { 1207 }, x = 2260, y = 6000, overlay = { "2240-6080" }, displayID = 21192 }; --Broken Tooth
	[2931] = { zoneID = 1418, artID = { 1207 }, x = 5540, y = 4460, overlay = { "5500-4320","5540-4440","5540-4580","5660-4340" }, displayID = 37577 }; --Zaricotl
	[45257] = { zoneID = 1419, artID = { 1209 }, x = 6040, y = 2920, overlay = { "6040-2920" }, displayID = 6786 }; --Mordak Nightbender
	[45258] = { zoneID = 1419, artID = { 1209 }, x = 6040, y = 7540, overlay = { "6040-7540" }, displayID = 5029 }; --Cassia the Slitherqueen
	[45260] = { zoneID = 1419, artID = { 1209 }, x = 3100, y = 7060, overlay = { "3100-6980" }, displayID = 12929 }; --Blackleaf
	[45262] = { zoneID = 1419, artID = { 1209 }, x = 3200, y = 4460, overlay = { "3200-4460" }, displayID = 19949 }; --Narixxus the Doombringer
	[7846] = { zoneID = 1419, artID = { 1209 }, x = 5720, y = 5220, overlay = { "5120-4820","5120-5040","5140-4620","5160-4460","5160-5200","5160-5380","5240-4920","5280-4580","5300-4420","5320-5400","5440-4340","5440-4500","5500-5420","5580-4380","5620-4540","5640-5340","5680-4680","5720-4840","5720-5220","5780-5000" }, displayID = 6378 }; --Teremus the Devourer
	[8296] = { zoneID = 1419, artID = { 1209 }, x = 4640, y = 2660, overlay = { "4640-2620" }, displayID = 11562 }; --Mojo the Twisted
	[8297] = { zoneID = 1419, artID = { 1209 }, x = 4640, y = 3920, overlay = { "4640-3920" }, displayID = 11564 }; --Magronos the Unyielding
	[8298] = { zoneID = 1419, artID = { 1209 }, x = 7360, y = 5520, overlay = { "7340-5500" }, displayID = 10920 }; --Akubar the Seer
	[8299] = { zoneID = 1419, artID = { 1209 }, x = 6460, y = 3940, overlay = { "5940-3540","5940-3660","5940-3820","6000-3420","6080-4000","6160-3260","6200-3660","6200-4020","6320-4020","6340-3300","6440-3800","6460-3360","6460-3600","6460-3940" }, displayID = 37536 }; --Spiteflayer
	[8300] = { zoneID = 1419, artID = { 1209 }, x = 4920, y = 3560, overlay = { "4900-3440","4920-3560" }, displayID = 34324 }; --Ravage
	[8301] = { zoneID = 1419, artID = { 1209 }, x = 4720, y = 1460, overlay = { "4720-1380" }, displayID = 15433 }; --Clack the Reaver
	[8302] = { zoneID = 1419, artID = { 1209 }, x = 5240, y = 2740, overlay = { "5120-2720","5160-2560","5240-2740","5240-2900","5340-2640" }, displayID = 46053 }; --Deatheye
	[8303] = { zoneID = 1419, artID = { 1209 }, x = 5560, y = 4000, overlay = { "5440-3940","5520-3840","5540-4020" }, displayID = 24741 }; --Grunter
	[8304] = { zoneID = 1419, artID = { 1209 }, x = 3700, y = 2960, overlay = { "3660-2820","3700-2940" }, displayID = 7844 }; --Dreadscorn
	[10356] = { zoneID = 1420, artID = { 1210 }, x = 4580, y = 4840, overlay = { "4540-4880","4660-5020" }, displayID = 37773 }; --Bayne
	[10357] = { zoneID = 1420, artID = { 1210 }, x = 5340, y = 5780, overlay = { "5220-5640","5340-5740","5360-5860" }, displayID = 16053 }; --Ressan the Needler
	[10358] = { zoneID = 1420, artID = { 1210 }, x = 7700, y = 5980, overlay = { "7700-5980" }, displayID = 16254 }; --Fellicent's Shade
	[10359] = { zoneID = 1420, artID = { 1210 }, x = 8440, y = 4920, overlay = { "8440-4920" }, displayID = 22185 }; --Sri'skulk
	[1531] = { zoneID = 1420, artID = { 1210 }, x = 5360, y = 4840, overlay = { "4500-3760","4860-3420","4900-3540","4920-3260","5320-4540","5320-4840" }, displayID = 985 }; --Lost Soul
	[1533] = { zoneID = 1420, artID = { 1210 }, x = 4740, y = 3260, overlay = { "4380-3140","4380-3380","4500-3160","4520-3560","4640-3040","4660-3160","4740-3260","4740-3500","4820-3360" }, displayID = 9534 }; --Tormented Spirit
	[1910] = { zoneID = 1420, artID = { 1210 }, x = 3580, y = 4300, overlay = { "3580-4300" }, displayID = 5243 }; --Muad
	[1911] = { zoneID = 1420, artID = { 1210 }, x = 7240, y = 2580, overlay = { "7240-2580" }, displayID = 5293 }; --Deeb
	[1936] = { zoneID = 1420, artID = { 1210 }, x = 3420, y = 5200, overlay = { "3420-5200","3720-4920","3800-5180" }, displayID = 3535 }; --Farmer Solliden
	[1944] = { zoneID = 1420, artID = { 1210 }, x = 5620, y = 4260, overlay = { "5600-4240" }, displayID = 10850 }; --Rot Hide Bruiser
	[12431] = { zoneID = 1421, artID = { 1211 }, x = 5780, y = 1620, overlay = { "5600-2300","5620-2520","5720-1600","5740-1740","5860-1500","6000-0900" }, displayID = 11413 }; --Gorefang
	[12433] = { zoneID = 1421, artID = { 1211 }, x = 3540, y = 1420, overlay = { "3460-1560","3460-1760","3540-1420","3620-1520","3660-1700","3780-1620","3840-1420" }, displayID = 22185 }; --Krethis the Shadowspinner
	[1948] = { zoneID = 1421, artID = { 1211 }, x = 6580, y = 2340, overlay = { "6580-2340" }, displayID = 965 }; --Snarlmane
	[2283] = { zoneID = 1421, artID = { 1211 }, x = 5740, y = 3020, overlay = { "5740-3020" }, displayID = 1019 }; --Ravenclaw Regent
	[46981] = { zoneID = 1421, artID = { 1211 }, x = 5280, y = 2600, overlay = { "5120-2600","5180-2780","5240-2520","5240-2640","5300-2800" }, displayID = 915 }; --Nightlash
	[46992] = { zoneID = 1421, artID = { 1211 }, x = 4320, y = 5080, overlay = { "4320-5080" }, displayID = 35373 }; --Berard the Moon-Crazed
	[47003] = { zoneID = 1421, artID = { 1211 }, x = 4860, y = 2420, overlay = { "4840-2420","4880-2540" }, displayID = 35381 }; --Bolgaff <The Mad Hunter>
	[47008] = { zoneID = 1421, artID = { 1211 }, x = 5940, y = 3340, overlay = { "5940-3340" }, displayID = 10834 }; --Fenwick Thatros
	[47009] = { zoneID = 1421, artID = { 1211 }, x = 5760, y = 6420, overlay = { "5700-6420","5740-6260","5800-6660","5900-6260","5900-6540","5980-6140","6080-6320","6120-6560","6120-6680","6180-6100","6180-6420","6200-6800","6260-6620" }, displayID = 35383 }; --Aquarius the Unbound
	[47012] = { zoneID = 1421, artID = { 1211 }, x = 4680, y = 6980, overlay = { "4680-6980" }, displayID = 26799 }; --Effritus
	[47015] = { zoneID = 1421, artID = { 1211 }, x = 5400, y = 4280, overlay = { "4580-3020","4640-2480","4640-2780","4680-2340","4840-2100","4840-2300","4840-3420","4940-3520","5020-2000","5280-1920","5400-4280","5420-4700","5420-5400","5440-2080","5440-6420","5460-4840","5460-5160","5500-2300","5500-3820","5500-4500","5500-7380","5520-3700","5520-7100","5520-7580","5540-3140","5560-6140","5580-3300","5580-4100","5620-2640","5620-2880","5620-3440","5620-7860","5660-3200" }, displayID = 563 }; --Lost Son of Arugal
	[47023] = { zoneID = 1421, artID = { 1211 }, x = 5020, y = 6000, overlay = { "5020-6000" }, displayID = 4430 }; --Thule Ravenclaw
	[1837] = { zoneID = 1422, artID = { 1212 }, x = 6900, y = 4940, overlay = { "6900-4940" }, displayID = 10355 }; --Scarlet Judge
	[1838] = { zoneID = 1422, artID = { 1212 }, x = 4500, y = 5200, overlay = { "4500-5200" }, displayID = 10343 }; --Scarlet Interrogator
	[1839] = { zoneID = 1422, artID = { 1212 }, x = 4140, y = 5300, overlay = { "4140-5300" }, displayID = 10342 }; --Scarlet High Clerist
	[1841] = { zoneID = 1422, artID = { 1212 }, x = 5080, y = 4040, overlay = { "5080-4040" }, displayID = 10344 }; --Scarlet Executioner
	[1847] = { zoneID = 1422, artID = { 1212 }, x = 5400, y = 8040, overlay = { "5400-8040" }, displayID = 30656 }; --Foulmane
	[1848] = { zoneID = 1422, artID = { 1212 }, x = 6560, y = 4760, overlay = { "6540-4740" }, displayID = 10356 }; --Lord Maldazzar
	[1849] = { zoneID = 1422, artID = { 1212 }, x = 6400, y = 5660, overlay = { "6380-5640" }, displayID = 30520 }; --Dreadwhisper
	[1850] = { zoneID = 1422, artID = { 1212 }, x = 6940, y = 7300, overlay = { "6940-7300" }, displayID = 10612 }; --Putridius
	[1851] = { zoneID = 1422, artID = { 1212 }, x = 6360, y = 8220, overlay = { "6300-8280","6400-8360" }, displayID = 9013 }; --The Husk
	[1885] = { zoneID = 1422, artID = { 1212 }, x = 5380, y = 4420, overlay = { "5380-4420" }, displayID = 10346 }; --Scarlet Smith
	[10817] = { zoneID = 1423, artID = { 1213 }, x = 3580, y = 6200, overlay = { "3580-6200" }, displayID = 10374 }; --Duggan Wildhammer
	[10818] = { zoneID = 1423, artID = { 1213 }, x = 6560, y = 2480, overlay = { "6540-2440" }, displayID = 6380 }; --Death Knight Soulbearer
	[10819] = { zoneID = 1423, artID = { 1213 }, x = 3560, y = 2120, overlay = { "3540-2120" }, displayID = 6380 }; --Baron Bloodbane
	[10820] = { zoneID = 1423, artID = { 1213 }, x = 2700, y = 1300, overlay = { "2640-1160","2700-1300","2780-1160" }, displayID = 6380 }; --Duke Ragereaver
	[10821] = { zoneID = 1423, artID = { 1213 }, x = 7900, y = 3900, overlay = { "7900-3900" }, displayID = 10709 }; --Hed'mush the Rotting
	[10823] = { zoneID = 1423, artID = { 1213 }, x = 6400, y = 1240, overlay = { "6400-1240" }, displayID = 10443 }; --Zul'Brin Warpbranch
	[10824] = { zoneID = 1423, artID = { 1213 }, x = 4720, y = 2140, overlay = { "4720-2140" }, displayID = 19824 }; --Death-Hunter Hawkspear
	[10825] = { zoneID = 1423, artID = { 1213 }, x = 2580, y = 6800, overlay = { "2580-6800" }, displayID = 7616 }; --Gish the Unmoving
	[10826] = { zoneID = 1423, artID = { 1213 }, x = 3620, y = 4360, overlay = { "3320-4740","3340-4880","3400-4620","3440-4480","3500-4880","3520-4720","3620-4340","3620-4800","3720-4540" }, displayID = 27984 }; --Lord Darkscythe
	[10827] = { zoneID = 1423, artID = { 1213 }, x = 1880, y = 7860, overlay = { "1700-7840","1800-7700","1880-7860" }, displayID = 37768 }; --Deathspeaker Selendre <Cult of the Damned>
	[10828] = { zoneID = 1423, artID = { 1213 }, x = 7740, y = 7260, overlay = { "7740-7260" }, displayID = 37769 }; --Lynnia Abbendis <The Fallen Hope>
	[16184] = { zoneID = 1423, artID = { 1213 }, x = 0420, y = 3640, overlay = { "0420-3640" }, displayID = 14698 }; --Nerubian Overseer
	[1843] = { zoneID = 1423, artID = { 1213 }, x = 5520, y = 6860, overlay = { "5520-6860" }, displayID = 37598 }; --Foreman Jerris
	[1844] = { zoneID = 1423, artID = { 1213 }, x = 5400, y = 6860, overlay = { "5380-6840" }, displayID = 37600 }; --Foreman Marcrid
	[14221] = { zoneID = 1424, artID = { 1214 }, x = 5760, y = 2480, overlay = { "5540-2380","5620-2500","5660-2360","5740-2500" }, displayID = 3729 }; --Gravis Slipknot
	[14222] = { zoneID = 1424, artID = { 1214 }, x = 4420, y = 5400, overlay = { "4420-5400" }, displayID = 37735 }; --Araga
	[14223] = { zoneID = 1424, artID = { 1214 }, x = 6080, y = 5400, overlay = { "5660-6160","5740-6000","5920-5860","6020-5700","6040-5520","6060-4740","6080-5080","6080-5200","6080-5400","6120-4540","6140-4160","6140-4300","6220-4040","6280-3920","6400-3860","6460-3720","6540-3600","6720-3480","6840-3060","6860-3260" }, displayID = 21240 }; --Cranky Benj
	[14275] = { zoneID = 1424, artID = { 1214 }, x = 6320, y = 8580, overlay = { "6320-8580" }, displayID = 37740 }; --Tamra Stormpike
	[14276] = { zoneID = 1424, artID = { 1214 }, x = 3260, y = 7980, overlay = { "3220-7940" }, displayID = 5243 }; --Scargil
	[14277] = { zoneID = 1424, artID = { 1214 }, x = 5460, y = 7640, overlay = { "5440-7660" }, displayID = 11260 }; --Lady Zephris
	[14278] = { zoneID = 1424, artID = { 1214 }, x = 5900, y = 7580, overlay = { "5700-7460","5740-7320","5740-7620","5800-7200","5840-7500","5920-7320" }, displayID = 37623 }; --Ro'Bark
	[14279] = { zoneID = 1424, artID = { 1214 }, x = 4380, y = 7440, overlay = { "4340-7520" }, displayID = 37738 }; --Creepthess
	[14280] = { zoneID = 1424, artID = { 1214 }, x = 6360, y = 5240, overlay = { "6340-5260" }, displayID = 70189 }; --Big Samras
	[14281] = { zoneID = 1424, artID = { 1214 }, x = 4980, y = 5020, overlay = { "4980-5020" }, displayID = 3616 }; --Jimmy the Bleeder
	[2258] = { zoneID = 1424, artID = { 1214 }, x = 6020, y = 2880, overlay = { "6020-2880" }, displayID = 36325 }; --Maggarrak <The Mountain Lord>
	[2452] = { zoneID = 1424, artID = { 1214 }, x = 4360, y = 3780, overlay = { "4340-3780" }, displayID = 7336 }; --Skhowl
	[2453] = { zoneID = 1424, artID = { 1214 }, x = 4940, y = 1840, overlay = { "4940-1840" }, displayID = 32547 }; --Lo'Grosh
	[47010] = { zoneID = 1424, artID = { 1214 }, x = 3140, y = 3980, overlay = { "3140-3980" }, displayID = 9995 }; --Indigos
	[8210] = { zoneID = 1425, artID = { 1215 }, x = 6620, y = 5360, overlay = { "6600-5300" }, displayID = 37771 }; --Razortalon
	[8211] = { zoneID = 1425, artID = { 1215 }, x = 1320, y = 5380, overlay = { "1320-5380" }, displayID = 11414 }; --Old Cliff Jumper
	[8212] = { zoneID = 1425, artID = { 1215 }, x = 5760, y = 4240, overlay = { "5740-4300" }, displayID = 37772 }; --The Reak
	[8213] = { zoneID = 1425, artID = { 1215 }, x = 8100, y = 5740, overlay = { "7940-5660","8020-5820","8060-5620" }, displayID = 37770 }; --Ironback
	[8214] = { zoneID = 1425, artID = { 1215 }, x = 3460, y = 5520, overlay = { "3440-5500" }, displayID = 19816 }; --Jalinde Summerdrake
	[8215] = { zoneID = 1425, artID = { 1215 }, x = 7660, y = 5480, overlay = { "7140-6100","7160-6260","7200-5980","7260-5860","7280-5700","7380-5580","7460-5260","7480-5420","7500-5540","7600-5440","7620-5260","7660-5560","7740-5020","7860-5080" }, displayID = 12816 }; --Grimungous
	[8216] = { zoneID = 1425, artID = { 1215 }, x = 4740, y = 6640, overlay = { "4740-6640","4820-6740" }, displayID = 28248 }; --Retherokk the Berserker
	[8217] = { zoneID = 1425, artID = { 1215 }, x = 6480, y = 8140, overlay = { "6480-8140" }, displayID = 28256 }; --Mith'rethis the Enchanter
	[8218] = { zoneID = 1425, artID = { 1215 }, x = 3980, y = 6640, overlay = { "3980-6640" }, displayID = 28230 }; --Witherheart the Stalker
	[8219] = { zoneID = 1425, artID = { 1215 }, x = 2480, y = 6560, overlay = { "2460-6540" }, displayID = 28230 }; --Zul'arek Hatefowler
	[1119] = { zoneID = 1426, artID = { 1216 }, x = 5700, y = 3960, overlay = { "5240-3220","5540-3640","5620-3840","5620-3980","5660-3720" }, displayID = 11165 }; --Hammerspine
	[1130] = { zoneID = 1426, artID = { 1216 }, x = 6720, y = 5800, overlay = { "6620-5980","6720-5800","6920-5580","6980-5860" }, displayID = 70185 }; --Bjarn
	[1132] = { zoneID = 1426, artID = { 1216 }, x = 4465, y = 3745, overlay = { "4465-3745" }, displayID = 10278 }; --Timber
	[1137] = { zoneID = 1426, artID = { 1216 }, x = 4630, y = 4746, overlay = { "4630-4746" }, displayID = 13990 }; --Edan the Howler
	[1260] = { zoneID = 1426, artID = { 1216 }, x = 3029, y = 4954, overlay = { "3029-4954" }, displayID = 27504 }; --Great Father Arctikus
	[8503] = { zoneID = 1426, artID = { 1216 }, x = 3455, y = 4111, overlay = { "3455-4111" }, displayID = 7807 }; --Gibblewilt
	[8277] = { zoneID = 1427, artID = { 1220 }, x = 3060, y = 6980, overlay = { "2920-6780","3020-6860","3040-7020","3040-7180","3160-7200","3180-7320" }, displayID = 37685 }; --Rekk'tilac
	[8278] = { zoneID = 1427, artID = { 1220 }, x = 4960, y = 3720, overlay = { "4800-3840","4920-3700","4920-3940" }, displayID = 33498 }; --Smoldar
	[8279] = { zoneID = 1427, artID = { 1220 }, x = 6200, y = 6100, overlay = { "5800-5640","6200-6100","6220-5960","6300-6300" }, displayID = 10800 }; --Faulty War Golem
	[8280] = { zoneID = 1427, artID = { 1220 }, x = 5760, y = 4520, overlay = { "5580-4520","5660-4660","5720-4480","5740-4340","5840-4440" }, displayID = 2346 }; --Shleipnarr
	[8281] = { zoneID = 1427, artID = { 1220 }, x = 4060, y = 5760, overlay = { "4020-5860","4040-5740" }, displayID = 12231 }; --Scald
	[8282] = { zoneID = 1427, artID = { 1220 }, x = 2960, y = 2600, overlay = { "2940-2540","3100-2640" }, displayID = 7835 }; --Highlord Mastrogonde
	[8283] = { zoneID = 1427, artID = { 1220 }, x = 3820, y = 4440, overlay = { "3740-4420" }, displayID = 7819 }; --Slave Master Blackheart
	[8924] = { zoneID = {
				[1427] = { x = 3031, y = 8861, artID = { 1220 }, overlay = { "3031-8861" } };
				[1428] = { x = 1677, y = 2069, artID = { 1224 }, overlay = { "1677-2069" } };
			  }, displayID = 8390 }; --The Behemoth
	[10077] = { zoneID = 1428, artID = { 1224 }, x = 7020, y = 5680, overlay = { "6280-3140","6340-3260","6740-5460","6960-5560","7020-5680","7060-3120","7080-2980","7220-5900","7300-5160" }, displayID = 37671 }; --Deathmaw
	[10078] = { zoneID = 1428, artID = { 1224 }, x = 5760, y = 3240, overlay = { "5620-3300","5700-3140","5700-3460","5780-3320","6000-3020" }, displayID = 37683 }; --Terrorspark
	[10119] = { zoneID = 1428, artID = { 1224 }, x = 2120, y = 4140, overlay = { "1880-4340","1940-4120","2120-4140","2260-4180" }, displayID = 12232 }; --Volchan
	[8976] = { zoneID = 1428, artID = { 1224 }, x = 2640, y = 5820, overlay = { "2640-5820","2740-5900" }, displayID = 6369 }; --Hematos
	[8978] = { zoneID = 1428, artID = { 1224 }, x = 4380, y = 3980, overlay = { "4380-3980" }, displayID = 11511 }; --Thauris Balgarr
	[8979] = { zoneID = 1428, artID = { 1224 }, x = 3360, y = 3700, overlay = { "3340-3680","3480-3660" }, displayID = 11510 }; --Gruklash
	[8981] = { zoneID = 1428, artID = { 1224 }, x = 5100, y = 3680, overlay = { "5100-3640","5260-3840","5340-3600","5500-4360" }, displayID = 23822 }; --Malfunctioning Reaver
	[9602] = { zoneID = 1428, artID = { 1224 }, x = 6860, y = 4040, overlay = { "6840-4040" }, displayID = 11564 }; --Hahk'Zor
	[9604] = { zoneID = 1428, artID = { 1224 }, x = 6340, y = 4740, overlay = { "6340-4740","6440-4660" }, displayID = 11562 }; --Gorgon'och
	[100] = { zoneID = 1429, artID = { 1228 }, x = 2760, y = 8880, overlay = { "2520-9320","2540-9100","2680-8680","2680-9080","2740-8840" }, displayID = 603 }; --Gruff Swiftbite
	[471] = { zoneID = 1429, artID = { 1228 }, x = 6214, y = 4806, overlay = { "6214-4806" }, displayID = 36505 }; --Mother Fang
	[472] = { zoneID = 1429, artID = { 1228 }, x = 6780, y = 3960, overlay = { "6640-4040","6700-3920","6780-4700","6800-4440","6920-3860","7020-4000" }, displayID = 543 }; --Fedfennel
	[61] = { zoneID = 1429, artID = { 1228 }, x = 5040, y = 8440, overlay = { "4920-8200","5040-8320","5040-8440","5060-8160" }, displayID = 3341 }; --Thuros Lightfingers
	[62] = { zoneID = 1429, artID = { 1228 }, x = 4772, y = 3234, overlay = { "4772-3234" }, displayID = 511 }; --Gug Fatcandle
	[79] = { zoneID = 1429, artID = { 1228 }, x = 3720, y = 8340, overlay = { "3720-8340","3800-8140","3840-8340" }, displayID = 774 }; --Narg the Taskmaster
	[99] = { zoneID = 1429, artID = { 1228 }, x = 3080, y = 6500, overlay = { "3080-6500" }, displayID = 3320 }; --Morgaine the Sly
	[45739] = { zoneID = 1431, artID = { 1235 }, x = 9060, y = 3060, overlay = { "8960-3060" }, displayID = 34648 }; --The Unknown Soldier
	[45740] = { zoneID = 1431, artID = { 1235 }, x = 8180, y = 5920, overlay = { "7940-6960","7940-7080","7960-6740","8060-6960","8080-6240","8080-6540","8080-6820","8120-5960" }, displayID = 34649 }; --Watcher Eva <The Restless Dead>
	[45771] = { zoneID = 1431, artID = { 1235 }, x = 6500, y = 6860, overlay = { "5800-7720","5860-8000","6040-7560","6120-7300","6140-7040","6140-7180","6200-7460","6300-7300","6320-6820","6320-8340","6360-7000","6500-6860","6520-7040" }, displayID = 34669 }; --Marus <The Pack Leader>
	[45785] = { zoneID = 1431, artID = { 1235 }, x = 4900, y = 7040, overlay = { "4680-7440","4720-7220","4740-7080","4780-7640","4820-7400","4860-7100","4940-7560","4960-7200","5020-7400","5080-7180","5120-7480" }, displayID = 34671 }; --Carved One
	[45801] = { zoneID = 1431, artID = { 1235 }, x = 2780, y = 3160, overlay = { "2760-3360","2780-3140" }, displayID = 34682 }; --Eliza <Bride of the Embalmer>
	[45811] = { zoneID = 1431, artID = { 1235 }, x = 0760, y = 3340, overlay = { "0740-3280","0740-3540" }, displayID = 4277 }; --Marina DeSirrus <Thief of the Dead>
	[503] = { zoneID = 1431, artID = { 1235 }, x = 2040, y = 2640, overlay = { "2040-2640","2400-3480" }, displayID = 10626 }; --Lord Malathrom
	[507] = { zoneID = 1431, artID = { 1235 }, x = 6120, y = 4000, overlay = { "5900-3000","6120-4000","6140-4160","6240-4340","6320-4180","6380-4500","6380-4880","6400-5120" }, displayID = 34650 }; --Fenros
	[521] = { zoneID = 1431, artID = { 1235 }, x = 6940, y = 2280, overlay = { "5880-1860","5900-2000","5980-2100","6020-1880","6020-2280","6380-1940","6440-2180","6480-2060","6520-1820","6540-1940","6600-2160","6660-1900","6900-2420","6920-2560","6940-2280","7040-2560","7080-2220","7080-2380" }, displayID = 10278 }; --Lupos
	[534] = { zoneID = 1431, artID = { 1235 }, x = 7420, y = 7800, overlay = { "7400-7860" }, displayID = 34651 }; --Nefaru <The Den Mother>
	[574] = { zoneID = 1431, artID = { 1235 }, x = 8640, y = 4800, overlay = { "8640-4800" }, displayID = 963 }; --Naraxis
	[771] = { zoneID = 1431, artID = { 1235 }, x = 2360, y = 3320, overlay = { "1820-4420","1900-4260","1940-4460","1940-4620","2020-4320","2100-3740","2120-3480","2120-4420","2140-4140","2220-3580","2220-3980","2240-3340","2240-3840","2300-4460","2340-3620","2340-4020","2360-3320","2360-4340","2400-3860","2400-4200","2440-3420","2440-3540","2480-3660","2580-3880" }, displayID = 7848 }; --Commander Felstrom
	[1398] = { zoneID = 1432, artID = { 1236 }, x = 7020, y = 6140, overlay = { "6680-6900","6800-6600","6880-6840","6900-5960","6920-6660","7000-6240","7040-6360","7040-6760","7060-6540","7120-6060" }, displayID = 5945 }; --Boss Galgosh <Stonesplinter Chieftain>
	[1399] = { zoneID = 1432, artID = { 1236 }, x = 3100, y = 7560, overlay = { "3080-7500" }, displayID = 6528 }; --Magosh <Stonesplinter Tribal Shaman>
	[1425] = { zoneID = 1432, artID = { 1236 }, x = 2540, y = 2940, overlay = { "2440-3000","2480-2800","2560-2940","2560-3080","2600-2700" }, displayID = 774 }; --Kubb <Master of Meats and Fishes>
	[14266] = { zoneID = 1432, artID = { 1236 }, x = 6140, y = 7360, overlay = { "6140-7340","6160-7460" }, displayID = 34437 }; --Shanda the Spinner
	[14267] = { zoneID = 1432, artID = { 1236 }, x = 6860, y = 2580, overlay = { "6600-2140","6720-2220","6800-2720","6820-2140","6840-2380","6840-2900","6860-2580","6940-2700","6980-2240","6980-2580","7000-2360","7040-2080","7120-2280","7120-2420","7160-2060","7240-2180","7240-2540" }, displayID = 25191 }; --Emogg the Crusher
	[14268] = { zoneID = 1432, artID = { 1236 }, x = 7620, y = 6200, overlay = { "6620-7120","6620-7320","6740-7600","6880-7500","6900-7380","7080-7340","7080-7500","7100-7220","7200-7100","7220-7240","7360-7120","7420-6580","7420-6860","7440-6300","7440-7000","7480-6720","7480-7360","7500-7120","7580-6300","7600-7380","7720-7340","7780-6460","7800-6760","7800-7020","7800-7600","7820-6880","7820-7180","7820-7460","7900-6300","7920-6600" }, displayID = 25868 }; --Lord Condar
	[2476] = { zoneID = 1432, artID = { 1236 }, x = 5400, y = 5340, overlay = { "5280-5780","5300-5580","5340-5440","5400-5660","5520-5420","5540-5300","5560-5580","5640-5180" }, displayID = 32813 }; --Gosh-Haldir <The Clutch Mother>
	[45369] = { zoneID = 1432, artID = { 1236 }, x = 3780, y = 6260, overlay = { "3740-6220","3880-6200","4000-6120","4040-6500","4080-6240" }, displayID = 3452 }; --Morick Darkbrew <Dark Iron Courier>
	[45380] = { zoneID = 1432, artID = { 1236 }, x = 6660, y = 4000, overlay = { "6660-4000","6760-4140","6760-4280","6840-3780","6880-3600","6960-4200","7000-3740","7040-3560","7100-4280","7220-3700","7240-4220","7300-3540","7300-4340","7320-4460","7360-3660","7400-3400","7460-4380","7520-4260","7620-4380","7640-3840","7640-4240","7660-3500","7700-3680","7760-4160" }, displayID = 30239 }; --Ashtail
	[45384] = { zoneID = 1432, artID = { 1236 }, x = 2560, y = 4480, overlay = { "2540-4320","2560-4480" }, displayID = 10796 }; --Sagepaw <Mosshide Chieftain>
	[45398] = { zoneID = 1432, artID = { 1236 }, x = 3540, y = 1540, overlay = { "3540-1540" }, displayID = 27195 }; --Grizlak <Associate Troggwhacker>
	[45399] = { zoneID = 1432, artID = { 1236 }, x = 7160, y = 7700, overlay = { "7140-7640","7220-7800","7340-7800","7480-7640","7520-7860","7620-8040","7640-8180","7700-8320","7740-8000","7760-7880","7800-7700" }, displayID = 10664 }; --Optimo
	[45401] = { zoneID = 1432, artID = { 1236 }, x = 4320, y = 4160, overlay = { "4220-4660","4240-4160","4280-4320","4280-4540","4340-4040","4340-4780","4400-3900","4420-4980","4440-5140","4480-3800","4480-4860","4480-5260","4500-5380","4520-4740","4560-5160","4600-5480","4720-5100","4740-5540","4820-5640","4920-5760" }, displayID = 5286 }; --Whitefin
	[45402] = { zoneID = 1432, artID = { 1236 }, x = 5240, y = 3480, overlay = { "5040-3780","5080-3600","5120-4060","5220-3600","5220-4160","5240-3480","5380-3520","5380-4100","5380-4320","5540-3460","5540-3580","5540-4020","5540-4200","5580-3900","5600-3700","5680-3820","5680-4160","5720-3420","5740-3580","5740-4000","5760-4260","5840-3860","5880-3980","5880-4160" }, displayID = 18723 }; --Nix
	[45404] = { zoneID = 1432, artID = { 1236 }, x = 5000, y = 2400, overlay = { "5000-2400" }, displayID = 34187 }; --Geoshaper Maren
	[14269] = { zoneID = 1433, artID = { 1237 }, x = 7100, y = 5500, overlay = { "6980-5520","7020-5380","7100-5500","7160-5660" }, displayID = 5564 }; --Seeker Aqualon
	[14270] = { zoneID = 1433, artID = { 1237 }, x = 3760, y = 4140, overlay = { "3620-4260","3680-4140","3740-4260" }, displayID = 5243 }; --Squiddic
	[14271] = { zoneID = 1433, artID = { 1237 }, x = 3080, y = 6140, overlay = { "2880-5960","2900-6220","2940-6100","3000-5760","3000-6300","3080-6140" }, displayID = 501 }; --Ribchaser
	[14272] = { zoneID = 1433, artID = { 1237 }, x = 3560, y = 6040, overlay = { "3400-5700","3440-6000","3540-6160","3560-6040" }, displayID = 6378 }; --Snarlflare
	[14273] = { zoneID = 1433, artID = { 1237 }, x = 5660, y = 5140, overlay = { "5640-5140" }, displayID = 5229 }; --Boulderheart
	[52146] = { zoneID = 1433, artID = { 1237 }, x = 6360, y = 6600, overlay = { "6320-6660","6340-6520" }, displayID = 909 }; --Chitter
	[584] = { zoneID = 1433, artID = { 1237 }, x = 3380, y = 1040, overlay = { "3340-1020","3420-1200" }, displayID = 6041 }; --Kazon
	[616] = { zoneID = 1433, artID = { 1237 }, x = 3780, y = 3440, overlay = { "3640-3380","3680-3620","3780-3440","3820-3580" }, displayID = 37620 }; --Chatter
	[947] = { zoneID = 1433, artID = { 1237 }, x = 6800, y = 3540, overlay = { "6800-3540" }, displayID = 37623 }; --Rohh the Silent
	[11383] = { zoneID = 1434, artID = { 1238 }, x = 6700, y = 3400, overlay = { "6700-3160","6700-3400" }, displayID = 11295 }; --High Priestess Hai'watna
	[14487] = { zoneID = 1434, artID = { 1238 }, x = 4120, y = 3960, overlay = { "4000-3880","4120-3960","4200-4120","4200-4240","4320-4340" }, displayID = 22530 }; --Gluggl
	[14488] = { zoneID = 1434, artID = { 1238 }, x = 4680, y = 4800, overlay = { "4480-5320","4520-5440","4540-5100","4540-5560","4580-4680","4580-4820","4600-4500","4640-5420","4680-5580","4720-4560" }, displayID = 37382 }; --Roloch
	[51658] = { zoneID = 1434, artID = { 1238 }, x = 6260, y = 7420, overlay = { "6220-7300","6240-7420" }, displayID = 37596 }; --Mogh the Dead <Skullsplitter Clan Witchdoctor>
	[51661] = { zoneID = 1434, artID = { 1238 }, x = 4760, y = 3140, overlay = { "4700-3200","4760-3320" }, displayID = 10133 }; --Tsul'Kalu <The Earth Spirit>
	[51662] = { zoneID = 1434, artID = { 1238 }, x = 5400, y = 3100, overlay = { "5340-3020","5420-3160","5440-2920" }, displayID = 37613 }; --Mahamba <The Water Spirit>
	[51663] = { zoneID = 1434, artID = { 1238 }, x = 3660, y = 2920, overlay = { "3620-2920" }, displayID = 37615 }; --Pogeyan <The Fire Spirit>
	[1063] = { zoneID = 1435, artID = { 1239 }, x = 3000, y = 4540, overlay = { "3000-4540","3000-4800","3080-4680","3220-4640" }, displayID = 7975 }; --Jade <Victim of the Nightmare>
	[1106] = { zoneID = 1435, artID = { 1239 }, x = 6360, y = 2620, overlay = { "6160-2760","6240-2520","6240-2640","6300-2760","6360-2620" }, displayID = 18349 }; --Lost One Cook
	[14445] = { zoneID = 1435, artID = { 1239 }, x = 7380, y = 4440, overlay = { "7380-4440","7480-4540" }, displayID = 7976 }; --Captain Wyrmak <Victim of the Nightmare>
	[14446] = { zoneID = 1435, artID = { 1239 }, x = 7700, y = 8480, overlay = { "7700-8480","7720-8200","7760-8360","7840-8580" }, displayID = 5286 }; --Fingat
	[14447] = { zoneID = 1435, artID = { 1239 }, x = 8920, y = 6660, overlay = { "8900-6820","8920-6660","8960-6540","9020-6760" }, displayID = 37634 }; --Gilmorian
	[14448] = { zoneID = 1435, artID = { 1239 }, x = 5060, y = 4180, overlay = { "4820-4080","4920-4260","4980-4140" }, displayID = 14497 }; --Molt Thorn
	[5348] = { zoneID = 1435, artID = { 1239 }, x = 1800, y = 6980, overlay = { "1800-6980" }, displayID = 625 }; --Dreamwatcher Forktongue <Victim of the Nightmare>
	[763] = { zoneID = 1435, artID = { 1239 }, x = 6320, y = 2580, overlay = { "5960-2640","6120-2560","6140-2340","6140-2760","6280-2480","6380-1900","6380-2360","6460-2260","6560-2340" }, displayID = 18620 }; --Lost One Chieftain
	[1424] = { zoneID = 1436, artID = { 1240 }, x = 4620, y = 1860, overlay = { "4600-1840" }, displayID = 774 }; --Master Digger
	[462] = { zoneID = 1436, artID = { 1240 }, x = 5540, y = 2360, overlay = { "4840-3300","4900-2800","4900-3520","4940-2640","4980-3240","5020-2820","5400-2460","5440-2580","5520-3500","5540-2360","5620-3340","5640-2080","5640-3520","5720-1940","5780-2060","5800-1800" }, displayID = 507 }; --Vultros
	[506] = { zoneID = 1436, artID = { 1240 }, x = 5960, y = 7440, overlay = { "5960-7440","6000-7300","6080-7420","6300-7240","6320-7380","6340-7580","6460-7500" }, displayID = 383 }; --Sergeant Brashclaw
	[519] = { zoneID = 1436, artID = { 1240 }, x = 5360, y = 0980, overlay = { "4980-1040","5200-1060","5340-0980","5400-1180","5460-1040","5560-0900","5620-1120" }, displayID = 540 }; --Slark
	[520] = { zoneID = 1436, artID = { 1240 }, x = 2880, y = 7280, overlay = { "2880-7280" }, displayID = 652 }; --Brack
	[572] = { zoneID = 1436, artID = { 1240 }, x = 4240, y = 2960, overlay = { "4140-2920" }, displayID = 1065 }; --Leprithus
	[573] = { zoneID = 1436, artID = { 1240 }, x = 5500, y = 3180, overlay = { "3840-5040","3840-5160","4400-3600","5400-3300","5500-3180","6240-6120","6360-6100" }, displayID = 548 }; --Foe Reaper 4000
	[596] = { zoneID = 1436, artID = { 1240 }, x = 4280, y = 7900, overlay = { "4100-7660","4240-7660","4280-7900" }, displayID = 3267 }; --Brainwashed Noble
	[599] = { zoneID = 1436, artID = { 1240 }, x = 4060, y = 8251, overlay = { "4060-8251" }, displayID = 2355 }; --Marisa du'Paige
	[1037] = { zoneID = 1437, artID = { 1243 }, x = 4540, y = 4460, overlay = { "4220-4080","4220-4460","4240-4280","4360-4220","4420-4400","4540-4460","4700-4300","4700-4420","4700-4600","4820-4520","4840-4660","4840-4880","4920-4200","5000-4820","5000-4940","5020-5220","5100-5100","5140-5260","5160-4880","5240-5360" }, displayID = 4912 }; --Dragonmaw Battlemaster
	[1112] = { zoneID = 1437, artID = { 1243 }, x = 4680, y = 6360, overlay = { "4680-6340" }, displayID = 283 }; --Leech Widow
	[1140] = { zoneID = 1437, artID = { 1243 }, x = 6980, y = 2920, overlay = { "6980-2920" }, displayID = 11316 }; --Razormaw Matriarch
	[14424] = { zoneID = 1437, artID = { 1243 }, x = 5500, y = 3040, overlay = { "5040-3020","5060-3240","5140-2880","5140-3380","5220-3540","5220-3680","5240-2760","5280-3420","5380-2720","5380-2840","5400-3340","5460-3200","5500-3040","5520-2740","5560-2900","5620-3060" }, displayID = 697 }; --Mirelow
	[14425] = { zoneID = 1437, artID = { 1243 }, x = 3120, y = 3360, overlay = { "3040-3300","3140-2900","3160-3240","3160-3360","3440-2720","3500-2860" }, displayID = 501 }; --Gnawbone
	[14433] = { zoneID = 1437, artID = { 1243 }, x = 4440, y = 2480, overlay = { "4440-2480" }, displayID = 15463 }; --Sludginn
	[2090] = { zoneID = 1437, artID = { 1243 }, x = 4800, y = 7460, overlay = { "4800-7420" }, displayID = 4914 }; --Ma'ruk Wyrmscale <Dragonmaw Warlord>
	[2108] = { zoneID = 1437, artID = { 1243 }, x = 3860, y = 4620, overlay = { "3820-4580" }, displayID = 4913 }; --Garneg Charskull
	[44224] = { zoneID = 1437, artID = { 1243 }, x = 1360, y = 3820, overlay = { "1320-3780","1340-3900","1340-4140","1340-4260","1500-3840","1520-3720","1520-3980" }, displayID = 1763 }; --Two-Toes
	[44225] = { zoneID = 1437, artID = { 1243 }, x = 4280, y = 3260, overlay = { "4260-3220" }, displayID = 32448 }; --Rufus Darkshot
	[44226] = { zoneID = 1437, artID = { 1243 }, x = 3360, y = 5100, overlay = { "3240-5080","3360-5100" }, displayID = 33737 }; --Sarltooth
	[44227] = { zoneID = 1437, artID = { 1243 }, x = 6160, y = 5780, overlay = { "6140-5740" }, displayID = 3199 }; --Gazz the Loch-Hunter
	[14428] = { zoneID = 1438, artID = { 1244 }, x = 6520, y = 5000, overlay = { "6520-5000","6520-5120" }, displayID = 6818 }; --Uruson
	[14429] = { zoneID = 1438, artID = { 1244 }, x = 5160, y = 3860, overlay = { "5160-3840" }, displayID = 1011 }; --Grimmaw
	[14430] = { zoneID = 1438, artID = { 1244 }, x = 5760, y = 6680, overlay = { "5220-6740","5400-6660","5700-6640","5940-6540" }, displayID = 37558 }; --Duskstalker
	[14431] = { zoneID = 1438, artID = { 1244 }, x = 3740, y = 3080, overlay = { "3700-3040","3740-3160","3820-3340","3920-3660","3940-3540" }, displayID = 2296 }; --Fury Shelda
	[14432] = { zoneID = 1438, artID = { 1244 }, x = 5300, y = 4420, overlay = { "5300-4420" }, displayID = 904 }; --Threggil
	[2162] = { zoneID = 1438, artID = { 1244 }, x = 4720, y = 4480, overlay = { "4720-4480" }, displayID = 936 }; --Agal
	[3535] = { zoneID = 1438, artID = { 1244 }, x = 5200, y = 6340, overlay = { "5200-6340" }, displayID = 1549 }; --Blackmoss the Fetid
	[2172] = { zoneID = 1439, artID = { 1247 }, x = 4080, y = 4840, overlay = { "4080-4840" }, displayID = 38 }; --Strider Clutchmother
	[2175] = { zoneID = 1439, artID = { 1247 }, x = 4160, y = 3600, overlay = { "4120-3640" }, displayID = 37555 }; --Shadowclaw
	[2184] = { zoneID = 1439, artID = { 1247 }, x = 4480, y = 5660, overlay = { "4480-5660" }, displayID = 5774 }; --Lady Moongazer
	[2186] = { zoneID = 1439, artID = { 1247 }, x = 4420, y = 8240, overlay = { "4420-8240" }, displayID = 5773 }; --Carnivous the Breaker
	[2191] = { zoneID = 1439, artID = { 1247 }, x = 5720, y = 3280, overlay = { "5720-3280" }, displayID = 37531 }; --Licillin
	[2192] = { zoneID = 1439, artID = { 1247 }, x = 4000, y = 8300, overlay = { "4000-8300" }, displayID = 5772 }; --Firecaller Radison
	[7015] = { zoneID = 1439, artID = { 1247 }, x = 5740, y = 1520, overlay = { "5740-1520","5800-1180","5840-0980" }, displayID = 1305 }; --Flagglemurk the Cruel
	[7016] = { zoneID = 1439, artID = { 1247 }, x = 4860, y = 3900, overlay = { "4640-4140","4840-4120","4860-3900" }, displayID = 4982 }; --Lady Vespira
	[7017] = { zoneID = 1439, artID = { 1247 }, x = 3420, y = 8360, overlay = { "3400-8340" }, displayID = 31547 }; --Lord Sinslayer
	[10559] = { zoneID = 1440, artID = { 1248 }, x = 1200, y = 1500, overlay = { "1200-1500","1240-2920","1500-2420" }, displayID = 4979 }; --Lady Vespia
	[10639] = { zoneID = 1440, artID = { 1248 }, x = 3700, y = 3360, overlay = { "3660-3620","3700-3360" }, displayID = 6800 }; --Rorgish Jowl
	[10640] = { zoneID = 1440, artID = { 1248 }, x = 5700, y = 6460, overlay = { "5400-6220","5580-6260","5700-6440" }, displayID = 5773 }; --Oakpaw
	[10641] = { zoneID = 1440, artID = { 1248 }, x = 4540, y = 4700, overlay = { "4240-4620","4320-4740","4340-4860","4360-5040","4380-5220","4400-4540","4400-5360","4540-4620","4640-4820","4660-5160" }, displayID = 8389 }; --Branch Snapper
	[10642] = { zoneID = 1440, artID = { 1248 }, x = 4720, y = 6840, overlay = { "4640-6940","4640-7060","4700-7180","4720-6840","4860-6840","4920-7160","4980-6900","4980-7040","5100-7080" }, displayID = 33846 }; --Eck'alom
	[10644] = { zoneID = 1440, artID = { 1248 }, x = 2520, y = 2680, overlay = { "2520-2680","2620-1540" }, displayID = 165 }; --Mist Howler
	[10647] = { zoneID = 1440, artID = { 1248 }, x = 7840, y = 4520, overlay = { "6660-5680","7840-4520","8100-4920" }, displayID = 11331 }; --Prince Raze
	[12037] = { zoneID = 1440, artID = { 1248 }, x = 9280, y = 4560, overlay = { "8940-4640","9280-4540" }, displayID = 70188 }; --Ursol'lok
	[3735] = { zoneID = 1440, artID = { 1248 }, x = 3140, y = 2240, overlay = { "3140-2240" }, displayID = 4156 }; --Apothecary Falthis
	[3736] = { zoneID = 1440, artID = { 1248 }, x = 7520, y = 7100, overlay = { "7240-7100","7360-7360","7520-7100" }, displayID = 4155 }; --Darkslayer Mordenthal
	[3773] = { zoneID = 1440, artID = { 1248 }, x = 2520, y = 6040, overlay = { "2520-6040" }, displayID = 1912 }; --Akkrilus
	[3792] = { zoneID = 1440, artID = { 1248 }, x = 5300, y = 3740, overlay = { "5300-3740" }, displayID = 522 }; --Terrowulf Packlord
	[14426] = { zoneID = 1441, artID = { 1249 }, x = 3840, y = 2720, overlay = { "3840-2720" }, displayID = 3898 }; --Harb Foulmountain
	[14427] = { zoneID = 1441, artID = { 1249 }, x = 4000, y = 3240, overlay = { "3980-3260" }, displayID = 511 }; --Gibblesnik
	[4132] = { zoneID = 1441, artID = { 1249 }, x = 7000, y = 8540, overlay = { "6980-8560" }, displayID = 37583 }; --Krkk'kx
	[5933] = { zoneID = 1441, artID = { 1249 }, x = 6960, y = 4940, overlay = { "6960-4940","7020-5060","7100-4900","7200-5000" }, displayID = 9418 }; --Achellios the Banished
	[5935] = { zoneID = 1441, artID = { 1249 }, x = 6120, y = 6700, overlay = { "6120-6700" }, displayID = 46055 }; --Ironeye the Invincible
	[5937] = { zoneID = 1441, artID = { 1249 }, x = 0560, y = 4260, overlay = { "0540-4200" }, displayID = 10988 }; --Vile Sting
	[4015] = { zoneID = 1442, artID = { 1250 }, x = 5560, y = 4440, overlay = { "5500-4500","5540-4640" }, displayID = 35655 }; --Pridewing Patriarch
	[4066] = { zoneID = 1442, artID = { 1250 }, x = 4860, y = 7360, overlay = { "4840-7340" }, displayID = 8471 }; --Nal'taszar
	[5915] = { zoneID = 1442, artID = { 1250 }, x = 4180, y = 1900, overlay = { "4180-1900" }, displayID = 4599 }; --Brother Ravenoak
	[5928] = { zoneID = 1442, artID = { 1250 }, x = 5020, y = 4120, overlay = { "5020-4120" }, displayID = 11012 }; --Sorrow Wing
	[5930] = { zoneID = 1442, artID = { 1250 }, x = 4040, y = 7080, overlay = { "4040-7080" }, displayID = 10875 }; --Sister Riven
	[5932] = { zoneID = 1442, artID = { 1250 }, x = 6440, y = 4560, overlay = { "6440-4540" }, displayID = 487 }; --Taskmaster Whipfang
	[11688] = { zoneID = 1443, artID = { 1251 }, x = 2836, y = 6249, overlay = { "2836-6249" }, displayID = 11640 }; --Cursed Centaur
	[14225] = { zoneID = 1443, artID = { 1251 }, x = 7440, y = 1240, overlay = { "7440-1240","7540-1880","7740-2380" }, displayID = 2879 }; --Prince Kellen
	[14226] = { zoneID = 1443, artID = { 1251 }, x = 5100, y = 7620, overlay = { "5000-7200","5040-8120","5100-7520","5100-7660","5120-8480","5520-7640","5680-7440" }, displayID = 14255 }; --Kaskk
	[14227] = { zoneID = 1443, artID = { 1251 }, x = 4300, y = 6180, overlay = { "4180-4720","4240-4580","4300-4260","4300-6120","4620-5300","5140-4760","5140-4880" }, displayID = 45445 }; --Hissperak
	[14228] = { zoneID = 1443, artID = { 1251 }, x = 6080, y = 2460, overlay = { "5740-0840","5740-1000","5860-1840","5900-1720","6000-2540","6020-2400","6300-3420","6380-1960","6420-3360","6600-2420","6640-2580" }, displayID = 2714 }; --Giggler
	[14229] = { zoneID = 1443, artID = { 1251 }, x = 3320, y = 0520, overlay = { "2900-1340","2900-1460","3040-1880","3160-1340","3220-0580","3260-1500","3420-0940" }, displayID = 9135 }; --Accursed Slitherblade
	[18241] = { zoneID = 1443, artID = { 1251 }, x = 3960, y = 1800, overlay = { "3440-2160","3440-2340","3500-2000","3520-2540","3580-2400","3620-2240","3700-1980","3800-2080","3840-1900","3960-1800","4120-1880" }, displayID = 27692 }; --Crusty
	[11447] = { zoneID = 1444, artID = { 1252 }, x = 6960, y = 6140, overlay = { "6920-6140","6940-5980","6960-5820","6980-6260","7120-6340","7140-5780","7160-6140","7200-6020","7260-6280" }, displayID = 14382 }; --Mushgog
	[11497] = { zoneID = 1444, artID = { 1252 }, x = 8450, y = 4970, overlay = { "8450-4970" }, displayID = 37571 }; --The Razza
	[11498] = { zoneID = 1444, artID = { 1252 }, x = 8420, y = 3700, overlay = { "8420-3700" }, displayID = 10169 }; --Skarr the Broken
	[43488] = { zoneID = 1444, artID = { 1252 }, x = 4960, y = 3020, overlay = { "4920-3020" }, displayID = 21120 }; --Mordei the Earthrender
	[5343] = { zoneID = 1444, artID = { 1252 }, x = 3240, y = 4380, overlay = { "3040-4580","3100-4260","3180-4520","3240-4380" }, displayID = 11262 }; --Lady Szallah
	[5345] = { zoneID = 1444, artID = { 1252 }, x = 4900, y = 2080, overlay = { "4900-2080" }, displayID = 1817 }; --Diamond Head
	[5346] = { zoneID = 1444, artID = { 1252 }, x = 5180, y = 6060, overlay = { "5180-6060","5280-5940" }, displayID = 7336 }; --Bloodroar the Stalker
	[5347] = { zoneID = 1444, artID = { 1252 }, x = 5560, y = 6940, overlay = { "5340-6880","5360-7080","5380-6760","5400-6640","5440-6520","5460-7360","5480-6900","5520-6660","5520-7080","5580-7360" }, displayID = 10889 }; --Antilus the Soarer
	[5349] = { zoneID = 1444, artID = { 1252 }, x = 3780, y = 2340, overlay = { "3740-2200","3780-2340","3880-2420","3900-2040","4000-2440","4040-2240","4140-2400" }, displayID = 7569 }; --Arash-ethis
	[5350] = { zoneID = 1444, artID = { 1252 }, x = 7360, y = 6400, overlay = { "7340-6400","7640-6120" }, displayID = 11142 }; --Qirot
	[5352] = { zoneID = 1444, artID = { 1252 }, x = 5700, y = 6220, overlay = { "5540-6120","5580-5980","5580-6240","5600-5760","5700-6220","5740-5820","5860-6240","5880-5900","5920-6100","6000-5940","6080-6040","6080-6200" }, displayID = 706 }; --Old Grizzlegut
	[5354] = { zoneID = 1444, artID = { 1252 }, x = 7120, y = 4040, overlay = { "6940-4220","6940-4420","7000-4100","7060-4600","7120-4040","7140-3920","7180-4200","7180-4540","7200-4340","7240-4080","7260-3940" }, displayID = 2168 }; --Gnarl Leafbrother
	[5356] = { zoneID = 1444, artID = { 1252 }, x = 7560, y = 3740, overlay = { "7520-3640","7600-3860","7780-3780","7940-3920","8060-3940","8200-3940","8340-3880","8480-3760" }, displayID = 780 }; --Snarler
	[54533] = { zoneID = {
				[1444] = { x = 4800, y = 7840, artID = { 1252 }, overlay = { "4760-7460","4800-7660","4800-7840" } };
				[1451] = { x = 2060, y = 0840, artID = { 1264 }, overlay = { "2060-0840","2140-0640" } };
			  }, displayID = 39009 }; --Prince Lakma <The Last Chimaerok>
	[14230] = { zoneID = 1445, artID = { 1253 }, x = 5920, y = 0920, overlay = { "5740-1660","5920-0920","6240-0820" }, displayID = 391 }; --Burgle Eye
	[14231] = { zoneID = 1445, artID = { 1253 }, x = 3900, y = 1820, overlay = { "3760-1840","3900-1820","3940-1960" }, displayID = 18313 }; --Drogoth the Roamer
	[14232] = { zoneID = 1445, artID = { 1253 }, x = 4720, y = 1560, overlay = { "4680-1740","4720-1560","4720-1860","4740-2000","4820-1420","4840-1580","4860-1700","4900-1880" }, displayID = 788 }; --Dart
	[14233] = { zoneID = 1445, artID = { 1253 }, x = 4760, y = 5440, overlay = { "3760-4920","3760-5060","4180-5520","4360-5080","4740-5440","4740-5560","4900-5760" }, displayID = 37748 }; --Ripscale
	[14234] = { zoneID = 1445, artID = { 1253 }, x = 4840, y = 6100, overlay = { "4740-6140","4780-6320","4840-5980","4860-6160" }, displayID = 2703 }; --Hayoc
	[14235] = { zoneID = 1445, artID = { 1253 }, x = 5180, y = 6060, overlay = { "5140-6060","5300-5880" }, displayID = 46282 }; --The Rot
	[14236] = { zoneID = 1445, artID = { 1253 }, x = 5580, y = 6500, overlay = { "5520-6320","5580-6500","5660-6240" }, displayID = 14257 }; --Lord Angler
	[14237] = { zoneID = 1445, artID = { 1253 }, x = 3640, y = 6240, overlay = { "3640-6240" }, displayID = 12336 }; --Oozeworm
	[4339] = { zoneID = 1445, artID = { 1253 }, x = 5000, y = 7540, overlay = { "5000-7540" }, displayID = 6369 }; --Brimgore
	[4380] = { zoneID = 1445, artID = { 1253 }, x = 3360, y = 2280, overlay = { "3340-2280" }, displayID = 17814 }; --Darkmist Widow
	[39183] = { zoneID = 1446, artID = { 1254 }, x = 4940, y = 5860, overlay = { "4940-5840" }, displayID = 31351 }; --Scorpitar
	[39185] = { zoneID = 1446, artID = { 1254 }, x = 4020, y = 6740, overlay = { "4000-6780" }, displayID = 31352 }; --Slaverjaw
	[39186] = { zoneID = 1446, artID = { 1254 }, x = 4080, y = 4120, overlay = { "4080-4120" }, displayID = 45946 }; --Hellgazer
	[44714] = { zoneID = 1446, artID = { 1254 }, x = 5700, y = 8980, overlay = { "5700-8980" }, displayID = 34030 }; --Fronkle the Disturbed
	[44722] = { zoneID = 1446, artID = { 1254 }, x = 6460, y = 1980, overlay = { "6440-2000" }, displayID = 11757 }; --Twisted Reflection of Narain
	[44750] = { zoneID = 1446, artID = { 1254 }, x = 4700, y = 6520, overlay = { "4700-6520" }, displayID = 9169 }; --Caliph Scorpidsting
	[44759] = { zoneID = 1446, artID = { 1254 }, x = 6940, y = 5700, overlay = { "6940-5700" }, displayID = 9073 }; --Andre Firebeard
	[44761] = { zoneID = 1446, artID = { 1254 }, x = 6940, y = 5000, overlay = { "6940-5000" }, displayID = 5564 }; --Aquementas the Unchained
	[44767] = { zoneID = 1446, artID = { 1254 }, x = 6100, y = 5040, overlay = { "6100-5040" }, displayID = 19060 }; --Occulus the Corrupted
	[47386] = { zoneID = 1446, artID = { 1254 }, x = 3400, y = 4540, overlay = { "3240-4860","3400-4540","3500-4460","3640-4240","3680-4380","3680-4660" }, displayID = 37549 }; --Ainamiss the Hive Queen
	[47387] = { zoneID = 1446, artID = { 1254 }, x = 5240, y = 6580, overlay = { "5040-7240","5240-6540","5280-7060","5560-6440","5620-6880" }, displayID = 15657 }; --Harakiss the Infestor
	[8199] = { zoneID = 1446, artID = { 1254 }, x = 4080, y = 2920, overlay = { "4080-2920" }, displayID = 9023 }; --Warleader Krazzilak
	[8200] = { zoneID = 1446, artID = { 1254 }, x = 3740, y = 2600, overlay = { "3740-2600","4080-3020" }, displayID = 9024 }; --Jin'Zallah the Sandbringer
	[8201] = { zoneID = 1446, artID = { 1254 }, x = 4040, y = 5860, overlay = { "3780-5680","3840-5340","3840-5460","3860-5200","3880-5820","3960-5060","4040-5860","4120-4980","4120-5140","4220-5480","4240-5280","4300-5580" }, displayID = 20017 }; --Omgorn the Lost
	[8203] = { zoneID = 1446, artID = { 1254 }, x = 7360, y = 4760, overlay = { "7120-4680","7340-4740","7500-4540" }, displayID = 7509 }; --Kregg Keelhaul
	[8204] = { zoneID = 1446, artID = { 1254 }, x = 3492, y = 4610, overlay = { "3492-4610" }, displayID = 14521 }; --Soriid the Devourer
	[8205] = { zoneID = 1446, artID = { 1254 }, x = 5665, y = 6838, overlay = { "5665-6838" }, displayID = 15439 }; --Haarka the Ravenous
	[8207] = { zoneID = 1446, artID = { 1254 }, x = 4440, y = 4040, overlay = { "4440-4040","4820-4540" }, displayID = 34048 }; --Emberwing
	[13896] = { zoneID = 1447, artID = { 1259 }, x = 4260, y = 4840, overlay = { "4220-5020","4240-4840","4260-4640","4300-5160","4300-5280" }, displayID = 7046 }; --Scalebeard
	[6118] = { zoneID = 1447, artID = { 1259 }, x = 3760, y = 7340, overlay = { "3240-7720","3300-7500","3340-7640","3400-7340","3420-7160","3500-7720","3580-7120","3740-7440","3760-7560" }, displayID = 21587 }; --Varo'then's Ghost
	[6648] = { zoneID = 1447, artID = { 1259 }, x = 4440, y = 2760, overlay = { "4440-2640","4440-2760" }, displayID = 3212 }; --Antilos
	[6649] = { zoneID = 1447, artID = { 1259 }, x = 4400, y = 5980, overlay = { "4400-5980" }, displayID = 11261 }; --Lady Sesspira
	[6650] = { zoneID = 1447, artID = { 1259 }, x = 6160, y = 7880, overlay = { "5880-7700","6040-7760","6160-7880","6180-7720","6300-7940","6300-8120","6300-8240" }, displayID = 11257 }; --General Fangferror
	[6651] = { zoneID = 1447, artID = { 1259 }, x = 3300, y = 3260, overlay = { "3300-3240" }, displayID = 1012 }; --Gatekeeper Rageroar
	[8660] = { zoneID = 1447, artID = { 1259 }, x = 1460, y = 5760, overlay = { "1380-5060","1440-5740" }, displayID = 37569 }; --The Evalcharr
	[14339] = { zoneID = 1448, artID = { 1260 }, x = 4820, y = 7440, overlay = { "4820-7440","5380-8480" }, displayID = 36341 }; --Death Howl
	[14340] = { zoneID = 1448, artID = { 1260 }, x = 4040, y = 8280, overlay = { "3920-8000","4000-8220","4080-8380","4240-8460","4320-8560" }, displayID = 2879 }; --Alshirr Banebreath
	[14342] = { zoneID = 1448, artID = { 1260 }, x = 4900, y = 8840, overlay = { "4860-8900" }, displayID = 1012 }; --Ragepaw
	[14343] = { zoneID = 1448, artID = { 1260 }, x = 5440, y = 2640, overlay = { "5440-2640","5480-2320","5620-2360","5700-1840","5740-1960" }, displayID = 37568 }; --Olm the Wise
	[14344] = { zoneID = 1448, artID = { 1260 }, x = 4340, y = 7580, overlay = { "4340-7580","4680-8200" }, displayID = 70186 }; --Mongress
	[14345] = { zoneID = 1448, artID = { 1260 }, x = 4200, y = 4580, overlay = { "4200-4580" }, displayID = 682 }; --The Ongar
	[7104] = { zoneID = 1448, artID = { 1260 }, x = 5780, y = 1940, overlay = { "5780-1940" }, displayID = 9013 }; --Dessecus
	[7137] = { zoneID = 1448, artID = { 1260 }, x = 4140, y = 4200, overlay = { "4060-4340","4140-4200","4180-3860" } }; --Immolatus
	[6581] = { zoneID = 1449, artID = { 1261 }, x = 6660, y = 6700, overlay = { "6080-7280","6640-6700" }, displayID = 11319 }; --Ravasaur Matriarch
	[6582] = { zoneID = 1449, artID = { 1261 }, x = 4875, y = 8515, overlay = { "4875-8515" }, displayID = 11084 }; --Clutchmother Zavas
	[6583] = { zoneID = 1449, artID = { 1261 }, x = 3180, y = 7820, overlay = { "3180-7820" }, displayID = 37587 }; --Gruff
	[6584] = { zoneID = 1449, artID = { 1261 }, x = 3440, y = 3800, overlay = { "2900-3640","2920-4740","2940-4600","3000-3560","3000-4440","3080-3180","3120-2940","3140-3660","3200-3040","3340-2840","3420-3720","3520-3580","3520-3900","3620-3700","3640-3060","3640-3540","3680-3220","3700-3380" }, displayID = 5305 }; --King Mosh
	[6585] = { zoneID = 1449, artID = { 1261 }, x = 6300, y = 1860, overlay = { "6280-1840" }, displayID = 8129 }; --Uhk'loc
	[14471] = { zoneID = 1451, artID = { 1264 }, x = 3600, y = 8280, overlay = { "3600-8220" }, displayID = 5965 }; --Setis
	[14472] = { zoneID = 1451, artID = { 1264 }, x = 6460, y = 5800, overlay = { "3560-3800","3580-3960","3640-4200","4440-5100","4460-4900","4560-5040","5160-5620","5300-5460","5300-5580","6400-5760" }, displayID = 1104 }; --Gretheer
	[14473] = { zoneID = 1451, artID = { 1264 }, x = 6560, y = 7520, overlay = { "5540-7100","5600-7440","5720-7500","5860-6680","6080-6880","6160-6600","6300-7340","6360-8200","6560-7520" }, displayID = 37593 }; --Lapress
	[14474] = { zoneID = 1451, artID = { 1264 }, x = 3200, y = 5580, overlay = { "2700-6200","3200-5580","3380-5340" }, displayID = 37548 }; --Zora
	[14475] = { zoneID = 1451, artID = { 1264 }, x = 5180, y = 2560, overlay = { "5100-2300","5140-2660","5200-2480" }, displayID = 37579 }; --Rex Ashil
	[14476] = { zoneID = 1451, artID = { 1264 }, x = 6480, y = 3940, overlay = { "6240-1840","6440-3900","6720-2920","6920-3680" }, displayID = 6068 }; --Krellack
	[14477] = { zoneID = 1451, artID = { 1264 }, x = 3420, y = 7240, overlay = { "3400-7320","3440-7100","4100-6580","4120-6440","4880-7140","4920-7260","4940-6380","5020-6140","5080-6260" }, displayID = 14523 }; --Grubthor
	[14478] = { zoneID = 1451, artID = { 1264 }, x = 3220, y = 2660, overlay = { "2920-1920","3020-1660","3020-2420","3080-2620","3200-1560","3220-2660","3320-1480","3420-2600","3520-1620","3620-1780","3660-2200","3680-2360" }, displayID = 14525 }; --Huricanian
	[14479] = { zoneID = 1451, artID = { 1264 }, x = 4420, y = 4020, overlay = { "2540-7720","2620-7500","2640-7640","3300-3000","3440-3180","3500-3040","4420-4020","4520-4260","4660-4120" }, displayID = 14526 }; --Twilight Lord Everun <Twilight's Hammer>
	[10196] = { zoneID = 1452, artID = { 1266 }, x = 5860, y = 6560, overlay = { "5560-6420","5640-6560","5780-6560","5900-6540","6060-6400","6240-6420" }, displayID = 9489 }; --General Colbatann
	[10197] = { zoneID = 1452, artID = { 1266 }, x = 2420, y = 5160, overlay = { "2400-5040","2420-5160" }, displayID = 3208 }; --Mezzir the Howler
	[10198] = { zoneID = 1452, artID = { 1266 }, x = 6120, y = 8380, overlay = { "6120-8380" }, displayID = 10317 }; --Kashoch the Reaver
	[10199] = { zoneID = 1452, artID = { 1266 }, x = 6840, y = 5020, overlay = { "6840-5020" }, displayID = 9491 }; --Grizzle Snowpaw
	[10200] = { zoneID = 1452, artID = { 1266 }, x = 4780, y = 1880, overlay = { "4680-1900","4780-1820" }, displayID = 10054 }; --Rak'shiri
	[10202] = { zoneID = 1452, artID = { 1266 }, x = 6560, y = 6760, overlay = { "5240-5900","5260-6180","5680-5700","5800-5600","6080-5380","6180-5460","6300-5480","6420-5600","6560-6640","6560-6760","6580-5860","6580-6100","6580-6240","6580-6440" }, displayID = 6373 }; --Azurous
	[10741] = { zoneID = 1452, artID = { 1266 }, x = 4580, y = 1760, overlay = { "4580-1740" }, displayID = 10114 }; --Sian-Rotam
	[3581] = { zoneID = 1453, artID = { 1267 }, x = 6660, y = 5840, overlay = { "4840-6180","5220-6420","5400-6820","5420-6480","5440-7080","5480-6940","5560-6500","5600-7280","5620-7420","5620-7660","5760-4280","5760-7340","5780-7760","5800-4120","5840-7920","5900-4240","5940-4520","6020-4300","6040-7220","6120-4640","6140-4760","6180-4880","6200-5100","6360-4900","6440-6040","6500-6540","6560-5080","6600-6120","6640-6420","6660-5840","6700-5500","6740-5300","6740-6200","6780-6400","6780-6600","6860-5340","6880-5040","6900-6540","6940-5160","6940-6340","6960-4920","7020-6580","7060-6800","7100-4880" }, displayID = 2850 }; --Sewer Beast
	[16854] = { zoneID = 1941, artID = { 1628 }, x = 6940, y = 4940, overlay = { "6820-4500","6860-4620","6900-4840","6980-4640","6980-4960" }, displayID = 14272 }; --Eldinarcus
	[16855] = { zoneID = 1941, artID = { 1628 }, x = 6800, y = 7940, overlay = { "6280-7960","6320-7820","6460-7800","6480-6720","6600-6900","6620-7900","6800-7940","6860-7180","6900-8120","6920-7320","6940-7460","6940-7840","7020-7240","7080-7540" }, displayID = 16406 }; --Tregla
	[22062] = { zoneID = 1942, artID = { 1629 }, x = 3420, y = 4860, overlay = { "2940-8840","3420-4860","3440-4720","3540-8860","4000-5000" }, displayID = 16176 }; --Dr. Whitherlimb
	[18677] = { zoneID = 1944, artID = { 1633 }, x = 4540, y = 4440, overlay = { "4100-7100","4160-6900","4180-6760","4220-6540","4280-6420","4380-6240","4460-5960","4480-3960","4500-4280","4540-4440","4560-4100","4600-5960","4660-4440","4680-4620","4700-5840","4820-5020","4860-5360","4960-5240","5020-5080","5180-5120","5320-5060","5560-5040","6480-7240","6520-7100","6740-6840","6760-7340","6780-7680","6880-7020","6960-6900" }, displayID = 20761 }; --Mekthorg the Wild
	[18678] = { zoneID = 1944, artID = { 1633 }, x = 3080, y = 3700, overlay = { "2360-5680","2360-5820","2360-5960","2360-6100","2420-6360","2480-4800","2480-4960","2580-4580","2620-4380","2740-4240","2860-6580","2900-4080","3000-6480","3080-3700","3080-6240","3140-6120","3360-6120","3540-5700","3720-5280","4040-5180","4240-7220","4360-5040","4380-7100","4500-4880","4640-6980","4840-7000","5080-7020","5340-7160","5460-7180","5660-7180" }, displayID = 17445 }; --Fulgorge
	[18679] = { zoneID = 1944, artID = { 1633 }, x = 7400, y = 3780, overlay = { "7140-5600","7400-3780","3880-3200","3920-3020","4020-3120","4040-3240","4080-3420","4100-2900","4200-3320","4240-2940","4240-3140","5280-2840","5300-2700","5360-2940","5400-2800","5460-3040","5460-3160","5520-2900","5620-3000","5660-3140","5780-3020","5880-2880","5940-3080","6060-3040","6200-2960","6260-3080","6340-2860","6360-3260","6420-3060","6500-2920","6580-3100","6960-4500","7000-5740","7040-4600","7060-4380","7080-5440","7120-4720","7120-6240","7140-5920","7140-6040","7200-4480","7220-5440","7220-5740","7240-3980","7260-4360","7260-5600","7300-5880","7320-4200","7380-5600","7400-4060","7500-3880","7600-4100" }, displayID = 20044 }; --Vorakem Doomspeaker <Herald of Doom Lord Kazzak>
	[18680] = { zoneID = 1946, artID = { 1635 }, x = 4700, y = 3200, overlay = { "0980-5220","1080-4720","1100-5040","1480-4440","1500-4040","1600-3820","3780-3840","3880-3380","4040-3360","4220-3360","4300-3460","4460-3420","4700-3200","4740-3060","5000-3080","5240-3240","5400-3300","7020-3980","7040-3740","7580-4840","7700-5140","7880-5360","1000-5380","1100-4560","1100-5580","1120-4860","1240-4660","1360-4480","1460-4220","1640-3580","1740-3480","1800-3240","1820-3020","3740-3640","3940-3240","4080-3240","4500-2960","4580-3560","4640-3340","4860-3020","5080-3280","5460-3420","5620-3420","6940-3860","7080-4100","7100-4220","7180-3540","7240-3680","7300-4620","7360-4320","7400-3660","7400-4480","7420-4700","7580-5000","7720-5260" }, displayID = 20770 }; --Marticar
	[18681] = { zoneID = 1946, artID = { 1635 }, x = 7480, y = 7700, overlay = { "2540-3740","2580-4240","2620-4660","5980-3640","6200-6920","6300-3800","6340-4380","6380-6500","6440-6940","6480-4140","7040-7280","7220-7600","7340-8240","7480-7700" }, displayID = 20768 }; --Coilfang Emissary
	[18682] = { zoneID = 1946, artID = { 1635 }, x = 8600, y = 8420, overlay = { "2300-2140","2440-2060","2820-2320","4020-6180","4480-5900","4920-5820","8480-7960","8600-8420","8600-8960","8600-9120","2160-2100","2200-2240","2200-2360","2260-2480","2260-2600","2280-2760","2340-2920","2480-2760","2500-2920","2600-2020","2620-2700","2640-2820","2660-2420","2760-2680","2780-2140","2940-2220","3960-6460","4120-6080","4220-5940","4280-6060","4640-5860","4820-5900","4920-6680","5000-6480","5040-5980","5040-6700","5080-6260","5180-5980","5180-6160","8200-7840","8260-7720","8300-7960","8440-7820","8520-8720","8580-8540","8620-8080","8620-8280","8640-8840" }, displayID = 20769 }; --Bog Lurker
	[18694] = { zoneID = 1948, artID = { 1637 }, x = 4020, y = 4300, overlay = { "3660-4500","3760-4320","3940-4280","5500-7120","5880-7040","6660-2620","6720-2320","7060-2880","7300-3020","7360-2900","4080-4640","4280-4740","4300-4920","4440-4980","4440-5240","4560-5240","4600-5380","5540-7280","5660-7420","5780-2400","5800-7320","5840-7180","5900-2280","5960-7140","6020-2140","6100-6740","6140-2120","6220-6400","6260-2140","6320-2280","6440-6660","6440-6800","6460-2260","6580-2300","6640-6840","6660-2500","6660-2740","6660-6960","6720-2140","6760-2880","6800-6820","6900-2960","6940-6640","6940-6760","7040-2760","7040-3020","7080-6680","7220-2860" }, displayID = 20590 }; --Collidus the Warp-Watcher
	[18695] = { zoneID = 1948, artID = { 1637 }, x = 2800, y = 4840, overlay = { "2800-4840","2900-5500","2920-5040","2960-5260","3060-5820","4500-2880","4500-3060","4620-2880","4640-6600","4640-6940","4660-2620","4660-2760","4660-7100","4780-6720","5580-3800","5620-3560","5700-3860","5740-3500","5740-3700","5860-3640","6800-6120","6880-5980","7100-6220" }, displayID = 11347 }; --Ambassador Jerrikar <Servant of Illidan>
	[18696] = { zoneID = 1948, artID = { 1637 }, x = 4540, y = 1240, overlay = { "3100-4520","4180-4060","4200-3940","4200-6880","4540-1240","5940-4640" }, displayID = 20810 }; --Kraator
	[18690] = { zoneID = 1949, artID = { 1638 }, x = 6800, y = 6700, overlay = { "6040-2480","6340-5160","6720-4780","6800-6700","6840-6940","6880-4660","7100-2920","5920-2440","5940-2020","5940-2240","6040-2120","6080-2300","6140-1880","6140-5460","6180-2100","6260-5320","6320-5040","6500-4920","6500-5340","6520-4720","6520-5040","6700-4900","6720-6820","6740-6540","6740-7020","6780-7340","6800-3360","6820-7560","6840-3060","6840-3240","6840-7120","6860-6440","6860-6580","6920-4500","6940-3380","7060-4300","7060-4420","7080-4180","7160-3340","7220-2840","7300-3260","7320-2980","7360-2460","7400-2620","7420-2740","7440-2340","7680-2380","7780-2880","7780-3000","7840-2680" }, displayID = 20862 }; --Morcrush
	[18692] = { zoneID = 1949, artID = { 1638 }, x = 2900, y = 6940, overlay = { "2800-6620","2840-6440","2840-6760","2900-6940","2940-4940","2980-4740","2980-6440","2980-7120","3000-4540","3020-6600","3020-6740","3040-5140","3100-6900","3140-5700","3180-5300","3180-5560" }, displayID = 8574 }; --Hemathion
	[18693] = { zoneID = 1949, artID = { 1638 }, x = 4080, y = 4800, overlay = { "3920-5640","4040-5540","4080-4800","4080-4960","4140-5120","4140-5420","4180-5260","4180-5600","4240-5000","4240-8200","4340-8000","4380-7860","4520-7640","4640-7800","4660-7960","4680-7640","4720-7520","5580-3560","5600-2580","5620-3420","5640-2440","5640-2700","5740-2900","5740-3340","5760-3020","5780-3220","6440-1920","6520-2060","6560-2240","6620-2400","6620-2520","6640-2660" }, displayID = 20762 }; --Speaker Mar'grom
	[22060] = { zoneID = 1950, artID = { 1639 }, x = 1480, y = 5460, overlay = { "1480-5460" }, displayID = 20771 }; --Fenissa the Assassin
	[17144] = { zoneID = 1951, artID = { 1640 }, x = 4140, y = 4140, overlay = { "4140-4140","4400-4700","4480-4040","5820-2780","7460-7600","7580-7560","7600-7960","7600-8080","7620-7800","3120-5040","3140-5240","3180-4920","3320-5100","3320-5280","3340-4980","3420-4780","3480-4980","3480-5140","3580-4620","3640-4480","3740-4700","4000-4380","4020-4220","4040-4620","4240-4760","4340-3920","4440-4200","4520-4360","4520-4640","5540-2960","5600-2720","5640-2500","5660-2920","5780-2980","5800-2280","5800-3260","5860-3080","5900-2600","6000-2900","6000-3300","6020-2760","6140-2920","6140-3220","6180-3060","7500-7460","7620-7680","7660-8220","7760-8120","7780-7960" }, displayID = 20763 }; --Goretooth
	[18683] = { zoneID = 1951, artID = { 1640 }, x = 3900, y = 7440, overlay = { "3220-7040","3220-7160","3240-7320","3280-6880","3300-7460","3340-6740","3360-7580","3420-6620","3480-7680","3580-6560","3620-7700","3720-6580","3820-7600","3880-6740","3900-7440","3940-6880","3940-7320","3960-7080","3960-7200" }, displayID = 19681 }; --Voidhunter Yar
	[18684] = { zoneID = 1951, artID = { 1640 }, x = 2560, y = 5180, overlay = { "2560-5180","2700-4200","5000-5220","6000-7520","6020-7160","6040-7660","6080-7280","6480-7700","6760-7380","6920-7160","6980-7040","2480-5380","2540-5060","2600-4900","2600-5400","2660-4620","2720-3880","2720-4420","2720-4740","2800-4060","2860-3780","2880-3640","2920-3460","3000-3300","3100-3200","3120-2080","3140-3040","3260-3120","3280-2780","3280-2920","3300-2240","3320-1940","3320-2360","3320-2540","4400-5580","4440-5460","4460-5740","4580-5860","4800-6180","4940-6080","4940-6280","5120-5140","5120-6060","5220-5940","5280-5200","5280-5800","5300-5620","5340-5460","5900-7180","5920-8020","6040-7840","6200-7400","6340-7600","6620-7620","6760-7520","6840-7260","6980-6920","7100-7040" }, displayID = 18070 }; --Bro'Gaz the Clanless
	[18685] = { zoneID = 1952, artID = { 1641 }, x = 5700, y = 6580, overlay = { "3040-4340","3180-4220","4900-1740","4980-1880","5600-7040","5620-6920","5660-6780","5680-7140","5700-6580","5780-2320","5920-2420" }, displayID = 20766 }; --Okrek
	[18686] = { zoneID = 1952, artID = { 1641 }, x = 6060, y = 3520, overlay = { "3560-3780","3580-3440","3580-3580","3580-3920","3640-4060","3640-4220","4100-2560","4240-2660","4380-2640","4500-2640","4660-2640","4840-2560","4960-2520","5080-2500","5240-2380","5300-2220","5420-2060","5540-1980","5540-3240","5660-3260","5800-3360","5900-3440","6060-3520","6200-3640","6360-3840","6440-3940","6540-4120","6640-4420","6720-4520","6880-4740","7040-4880" }, displayID = 20767 }; --Doomsayer Jurim
	[18689] = { zoneID = 1952, artID = { 1641 }, x = 3200, y = 5520, overlay = { "3040-6380","3200-5520","3240-5200","3820-6500","3820-6640","3920-6820","3960-4860","4000-5040","4000-6240","4120-6540","4140-6340","4480-5620","4520-7400","4520-7920","4580-5960","4760-6260","4820-7460","4840-5540","4840-5740","4940-7100","2880-5580","2880-6340","2960-5820","3060-5520","3140-5940","3160-6060","3160-6320","3180-6440","3220-6180","3260-5040","3320-5600","3380-5220","3380-5720","3500-5480","3520-5660","3580-6720","3620-5580","3700-6400","3760-6820","3840-4840","3840-5160","3840-7020","3920-5400","3920-6420","4000-5280","4160-5420","4200-5580","4280-5420","4280-5700","4540-5820","4540-6220","4560-5320","4560-5520","4560-7620","4620-6340","4640-5420","4640-7880","4680-7040","4700-7620","4720-5900","4760-5420","4800-7040","4820-7620","4880-6220","4900-7240","4960-7540","5000-6200","5020-7420","5080-6900","5100-6680" }, displayID = 12073 }; --Crippler
	[21724] = { zoneID = 1952, artID = { 1641 }, x = 7620, y = 8120, overlay = { "7620-8120" }, displayID = 20425 }; --Hawkbane
	[18697] = { zoneID = 1953, artID = { 1642 }, x = 4820, y = 8160, overlay = { "2620-4040","2640-4240","2680-3600","2700-3720","2720-3840","2800-4000","4620-8000","4640-8220","4720-8080","4740-8460","4820-8160","5860-6400","5880-6260","5920-6720","6080-6560" }, displayID = 20765 }; --Chief Engineer Lorthander
	[18698] = { zoneID = 1953, artID = { 1642 }, x = 2680, y = 6500, overlay = { "2060-6820","2120-7640","2280-6440","2400-7560","2440-4140","2600-4220","2680-6500","2680-7280","2700-6980","2720-4260","2800-4120","2920-4000","2960-4140","3080-4180","5760-3900","5760-4260","5960-3340","5980-3520","6100-4660","6120-3220","6500-3260","1940-7180","1980-6940","2040-7340","2060-6660","2100-7520","2160-6540","2340-3920","2400-3720","2440-6460","2740-6680","2800-7240","2820-6520","2840-7120","2880-4420","2920-4300","3040-4300","5740-4020","5760-4400","5840-3740","5880-4520","6180-4760","6340-3200","6420-4820","6560-3380","6580-4660","6640-4520","6680-3480","6680-3720","6740-3860","6780-4480","6800-4040","6800-4160","6840-4300" }, displayID = 20764 }; --Ever-Core the Punisher
	[20932] = { zoneID = 1953, artID = { 1642 }, x = 4420, y = 7180, overlay = { "2320-7880","2480-8020","2680-8140","3280-3040","3300-3200","3420-2080","3440-2500","3440-2760","3480-3020","3520-1960","3560-2440","3560-7800","3840-7840","4040-7720","4420-7180","5420-5980","5640-5880","5720-6020","6360-5880","6560-5820","6760-6040","2260-8000","2400-8180","2660-8360","2780-8040","2860-8240","2980-8240","3000-8080","3040-7960","3120-7840","3200-8180","3280-2880","3340-3360","3420-7740","3440-2220","3440-2900","3460-3340","3500-2620","3540-3180","3600-2120","3620-3480","3640-2280","3680-2400","3920-7740","4040-8020","4220-7600","4240-6840","4260-6960","4380-6940","4380-7440","4380-7800","4400-7060","4440-7660","4540-7080","4580-7320","5220-5620","5260-5960","5380-5680","5440-6100","5560-6100","5740-5740","5840-6000","5980-5820","6000-6060","6100-5860","6140-6000","6220-6100","6400-6160","6520-6120","6540-6240","6660-6180","6680-5920" }, displayID = 19913 }; --Nuramoc
}