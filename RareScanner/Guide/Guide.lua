-------------------------------------------------------------------------------
-- AddOn namespace.
-------------------------------------------------------------------------------
local LibStub = _G.LibStub
local FOLDER_NAME, private = ...

-- Locales
local AL = LibStub("AceLocale-3.0"):GetLocale("RareScanner");

-- RareScanner internal libraries
local RSConstants = private.ImportLib("RareScannerConstants")

---============================================================================
-- NPC guide
---============================================================================

private.NPC_GUIDE = {
	["4711429"] = { [RSConstants.ENTRANCE] = { x = 0.6179, y = 0.5414 } }; --Mother Fang
	["11371426"] = { [RSConstants.ENTRANCE] = { x = 0.4923, y = 0.5250 } }; --Edan the Howler
	["12601426"] = { [RSConstants.ENTRANCE] = { x = 0.3196, y = 0.4921 } }; --Great Father Arctikus
	["5991415"] = { [RSConstants.ENTRANCE] = { x = 0.4085, y = 0.8196 } }; --Marisa du'Paige
	["5961415"] = { [RSConstants.ENTRANCE] = { x = 0.4085, y = 0.8196 } }; --Dragonmaw Battlemaster
	["58221411"] = { [RSConstants.ENTRANCE] = { x = 0.5508, y = 0.0999 } }; --Felweaver Scornn
	["65821449"] = { [RSConstants.ENTRANCE] = { x = 0.4993, y = 0.8154 } }; --Clutchmother Zavas
	["82041446"] = { [RSConstants.ENTRANCE] = { x = 0.3413, y = 0.4766 } }; --Soriid the Devourer
	["82051446"] = { [RSConstants.ENTRANCE] = { x = 0.5553, y = 0.6828 } }; --Haarka the Ravenous
	["70571418"] = { [RSConstants.ENTRANCE] = { x = 0.4186, y = 0.1165 } }; --Digmaster Shovelphlange
	["89241427"] = { [RSConstants.ENTRANCE] = { x = 0.3474, y = 0.8382 } }; --The Behemoth
	["89241428"] = { [RSConstants.ENTRANCE] = { x = 0.4739, y = 0.6989 } }; --The Behemoth
	["116881414"] = { [RSConstants.ENTRANCE] = { x = 0.2986, y = 0.6245 } }; --Cursed Centaur
}

---============================================================================
-- Container guide
---============================================================================

private.CONTAINER_GUIDE = {
	
}

---============================================================================
-- Event guide
---============================================================================

private.EVENT_GUIDE = {
	
}