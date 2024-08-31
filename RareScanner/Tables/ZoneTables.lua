-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local FOLDER_NAME, private = ...

private.CONTINENT_ZONE_IDS = {
	[1414] = { zonefilter = true, npcfilter = true, id = 1, zones = {198,199,249,338,1411,1412,1413,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1450,1451,1452,1456,1943,1950}, current = { "all" } }; --Kalimdor
	[1415] = { zonefilter = true, npcfilter = true, id = 2, zones = {201,204,205,210,217,241,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1437,1453,1942,1941}, current = { "all" } }; --Eastern Kingdoms
	[1945] = { zonefilter = true, npcfilter = true, id = 3, zones = {1944,1946,1948,1949,1951,1952,1953} }; --Outland
	[113] = { zonefilter = true, npcfilter = true, id = 4, zones = {114,115,116,117,118,119,120,121,123,126} }; --Northrend
	[948] = { zonefilter = true, npcfilter = true, id = 5, zones = {174,194,207}, current = { "all" } }; --The Maelstrom
	[9998] = { zonefilter = true, npcfilter = true, zones = {407}, current = { "all" } }; --Darkmoon Island
	[9997] = { zonefilter = true, npcfilter = true, zones = {220,221,226,234,242,250,274,279,280,301,302,310,317} }; --Dungeons or scenarios
	[9996] = { zonefilter = true, npcfilter = true, zones = {350} }; --Raids
	[9995] = { zonefilter = false, npcfilter = true, zones = {0} }; --Unknown
}

private.SUBZONES_IDS = {
	[350] = {351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366}; --Karazhan (Outland raid)
	[310] = {311,312,313,314,315,316}; --Shadowfang Keep
	[226] = {227,228,229}; --Gnomeregan
	[302] = {303,304,305}; --Scarlet Monastery
	[242] = {243}; --Blackrock Depths
	[250] = {251,252,253,254,255}; --Blackrock Spire
	[317] = {318}; --Stratholme
	[234] = {235,236,237,238,239,240}; --Dire Maul
	[280] = {281}; --Maraudon
	[221] = {222,223}; --Blackfathom Deeps
}