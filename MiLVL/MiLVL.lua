local MiLVL = LibStub("AceAddon-3.0"):NewAddon("MiLVL", "AceEvent-3.0")
local AceGUI = LibStub("AceGUI-3.0")
local addOnName = "MiLVL"
local MiLVL_ClassSupport = false
local MiLVL_ItemScore = 0
local MiLVL_GearScore = 0
local MiLVL_ItemStats = nil
--local MiLVL_numSockets = 0
local MiLVL_numMeta = 0
local MiLVL_GemPreference = ""

local MiLVL_MetaGemPreference = ""

local MiLVL_UpgradeAnswer = "Yes"
local MiLVL_ClassUpgradeAnswer = "Yes"
local MiLVL_iEquipLoc = ""
local MiLVL_ItemBeingCompared = 0
local MiLVL_IsEquippable = 0
local MiLVL_ReforgeSuggestion = ""
local MiLVL_ReforgeScore = 0
local prevItem = nil

local MiLVL_Item_Armor_Value = 0

local MiLVL_PlayerRole = ""

local equippedItemLink = nil
local equippedItemLinks = {}

local equipScores = {
	MiLVL_Score_HeadEquip		= 0,
	MiLVL_Score_NeckEquip 		= 0,
	MiLVL_Score_ShoulderEquip	= 0,
	MiLVL_Score_ChestEquip		= 0,
	MiLVL_Score_WaistEquip 		= 0,
	MiLVL_Score_LegsEquip 		= 0,
	MiLVL_Score_FeetEquip 		= 0,
	MiLVL_Score_WristEquip 		= 0,
	MiLVL_Score_HandsEquip 		= 0,
	MiLVL_Score_Finger1Equip 	= 0,
	MiLVL_Score_Finger2Equip 	= 0,
	MiLVL_Score_Trinket1Equip 	= 0,
	MiLVL_Score_Trinket2Equip 	= 0,
	MiLVL_Score_BackEquip     	= 0,
	MiLVL_Score_MainhandEquip 	= 0,
	MiLVL_Score_OffhandEquip	= 0,
	MiLVL_Score_RangedEquip 	= 0
}

local milvl_ilvl = {
	HeadEquip		= 0,
	NeckEquip 		= 0,
	ShoulderEquip	= 0,
	ChestEquip		= 0,
	WaistEquip 		= 0,
	LegsEquip 		= 0,
	FeetEquip 		= 0,
	WristEquip 		= 0,
	HandsEquip 		= 0,
	Finger1Equip 	= 0,
	Finger2Equip 	= 0,
	Trinket1Equip 	= 0,
	Trinket2Equip 	= 0,
	BackEquip     	= 0,
	MainhandEquip 	= 0,
	OffhandEquip		= 0,
	RangedEquip 		= 0
}


local NumberOfInvSlots = 0

local equipLinks = {

	headEquipLink		= nil,
	neckEquipLink	    = nil,
	shoulderEquipLink	= nil,
	chestEquipLink	    = nil,
	waistEquipLink 	    = nil,
	legsEquipLink 	    = nil,
	feetEquipLink 	    = nil,
	wristEquipLink 	    = nil,
	handsEquipLink 	    = nil,
	finger1EquipLink 	= nil,
	finger2EquipLink 	= nil,
	trinket1EquipLink   = nil,
	trinket2EquipLink   = nil,
	backEquipLink       = nil,
	mainhandEquipLink   = nil,
	offhandEquipLink	= nil,
	rangedEquipLink 	= nil
}

local MiLVL_ActiveTab = 0

--This area is ONLY for raid-wide buffs and debuffs
--These are the Global object that can used to turn on or off the presence of the buff.

local MiLVL_BuffIcons = {

--Death Knight Buffs and Debuffs
HornofWinter 				= nil,
AbominationsMight 			= nil ,
ImprovedIcyTalons 			= nil ,
IcyTouch 					= nil ,
ImprovedIcyTouch 			= nil ,
EbonPlaguebringer 			= nil ,
b_HornofWinter 				= false,
b_AbominationsMight 		= false,
b_ImprovedIcyTalons 		= false,
b_IcyTouch 					= false,
b_ImprovedIcyTouch 			= false,
b_EbonPlaguebringer 		= false,



--Druid Buffs and Debuffs
MarkoftheWild 				= nil,
ImprovedMarkoftheWild 		= nil,
MoonkinForm 				= nil,
ImprovedMoonkinForm 		= nil,
TreeofLife 					= nil,
LeaderofthePack 			= nil,
FaerieFire 					= nil,
DemoralizingRoar 			= nil,
FeralAggression 			= nil,
InfectedWounds 				= nil,
Mangle 						= nil,
InsectSwarm 				= nil,
ImprovedFaerieFire	 		= nil,
EarthandMoon 				= nil,
ImprovedLeaderofthePack 	= nil,
b_MarkoftheWild 			= false,
b_ImprovedMarkoftheWild 	= false,
b_MoonkinForm 				= false,
b_ImprovedMoonkinForm 		= false,
b_TreeofLife 				= false,
b_LeaderofthePack			= false,
b_FaerieFire 				= false,
b_DemoralizingRoar 			= false,
b_FeralAggression 			= false,
b_InfectedWounds 			= false,
b_Mangle 					= false,
b_InsectSwarm 				= false,
b_ImprovedFaerieFire 		= false,
b_EarthandMoon 				= false,
b_ImprovedLeaderofthePack 	= false,

--HUNTER Buffs and Debuffs
HuntingParty 				= nil,
TrueshotAura 				= nil,
FerociousInspiration 		= nil,
AcidSpit 					= nil,
Sting 						= nil,
Stampede 					= nil,
LavaBreath 					= nil,
AimedShot 					= nil,
ScorpidSting 				= nil,
b_HuntingParty 				= false,
b_TrueshotAura 				= false,
b_FerociousInspiration 		= false,
b_AcidSpit 					= false,
b_Sting 					= false,
b_Stampede 					= false,
b_LavaBreath 				= false,
b_AimedShot 				= false,
b_ScorpidSting 				= false,

--MAGE Buffs and Debuffs
EnduringWinter 				= false,
ArcaneEmpowerment 			= false,
ArcaneIntellect 			= false,
Slow 						= false,
ImprovedScorch 				= false,
WintersChill 				= false,
b_EnduringWinter 			= false,
b_ArcaneEmpowerment 		= false,
b_ArcaneIntellect 			= false,
b_Slow 						= false,
b_ImprovedScorch	 		= false,
b_WintersChill 				= false,
b_GlyphofMoltenArmor		= false,

i_MindMastery				= 0,

--PALADIN Buffs and Debuffs
BlessingofKings 			= nil,
BlessingofSanctuary 		= nil,
JudgementsoftheWise 		= nil,
ImprovedBlessingofMight 	= nil,
BlessingofMight 			= nil,
SanctifiedRetribution 		= nil,
SwiftRetribution 			= nil,
ImprovedDevotionAura 		= nil,
BlessingofWisdom 			= nil,
ImprovedBlessingofWisdom 	= nil,
Vindication 				= nil,
JudgementsoftheJust	 		= nil,
HeartoftheCrusader 			= nil,
JudgementofLight 			= nil,
JudgementofWisdom 			= nil,

b_BlessingofKings 			= false,
b_BlessingofSanctuary 		= false,
b_JudgementsoftheWise 		= false,
b_ImprovedBlessingofMight 	= false,
b_BlessingofMight 			= false,
b_SanctifiedRetribution 	= false,
b_SwiftRetribution 			= false,
b_ImprovedDevotionAura 		= false,
b_BlessingofWisdom 			= false,
b_ImprovedBlessingofWisdom 	= false,
b_Vindication 				= false,
b_JudgementsoftheJust 		= false,
b_HeartoftheCrusader 		= false,
b_JudgementofLight 			= false,
b_JudgementofWisdom 		= false,

--PRIEST Buffs and Debuffs
PowerWordFortitude 			= nil,
ImprovedPowerWordFortitude 	= nil,
DivineSpirit 				= nil,
VampiricTouch 				= nil,
Inspiration 				= nil,
RenewedHope 				= nil,
Misery 						= nil,

b_PowerWordFortitude 		= false,
b_ImprovedPowerWordFortitude= false,
b_DivineSpirit 				= false,
b_VampiricTouch 			= false,
b_Inspiration 				= false,
b_RenewedHope 				= false,
b_Misery 					= false,
b_GlyphofShadow				= false,

i_TwistedFaith				= 0,

--ROGUE Buffs and Debuffs
ExposeArmor 				= nil,
WoundPoison	 				= nil,
MindnumbingPoison 			= nil,
MasterPoisoner 				= nil,
SavageCombat 				= nil,
ImprovedExposeArmor 		= nil,

b_ExposeArmor 				= false,
b_WoundPoison	 			= false,
b_MindnumbingPoison 		= false,
b_MasterPoisoner 			= false,
b_SavageCombat 				= false,
b_ImprovedExposeArmor 		= false,

--SHAMAN Buffs and Debuffs
StrengthofEarthTotem 		= nil,
EnhancingTotems 			= nil,
ElementalOath 				= nil,
TotemofWrath 				= nil,
FlametongueTotem 			= nil,
WrathofAirTotem  			= nil,
AncestralHealing 			= nil,
UnleashedRage 				= nil,
ManaSpringTotem 			= nil,
RestorativeTotems	 		= nil,
WindfuryTotem 				= nil,
ImprovedWindfuryTotem 		= nil,

b_StrengthofEarthTotem 		= false,
b_EnhancingTotems 			= false,
b_ElementalOath 			= false,
b_TotemofWrath 				= false,
b_FlametongueTotem 			= false,
b_WrathofAirTotem  			= false,
b_AncestralHealing 			= false,
b_UnleashedRage 			= false,
b_ManaSpringTotem 			= false,
b_RestorativeTotems	 		= false,
b_WindfuryTotem 			= false,
b_ImprovedWindfuryTotem 	= false,

--WARLOCK Buffs and Debuffs
FelIntelligence 			= nil,
DemonicPact 				= nil,
ImprovedSoulLeech 			= nil,
ImprovedImp 				= nil,
CurseofWeakness 			= nil,
ImprovedCurseofWeakness 	= nil,
CurseofTongues 				= nil,
ImprovedShadowBolt			= nil,
CurseoftheElements 			= nil,

b_FelIntelligence 			= false,
b_DemonicPact 				= false,
b_ImprovedSoulLeech 		= false,
b_ImprovedImp 				= false,
b_CurseofWeakness 			= false,
b_ImprovedCurseofWeakness 	= false,
b_CurseofTongues 			= false,
b_ImprovedShadowBolt 		= false,
b_CurseoftheElements 		= false,
b_GlyphofLifeTap			= false,
i_DemonicAegis 				= 0,

--WARRIOR Buffs and Debuffs
CommandingPresence 			= nil,
BattleShout 				= nil,
CommandingShout 			= nil,
Rampage 					= nil,
SunderArmor 				= nil,
DemoralizingShout 			= nil,
ImprovedDemoralizingShout 	= nil,
ThunderClap 				= nil,
ImprovedThunderClap 		= nil,
Trauma 						= nil,
FuriousAttacks 				= nil,
MortalStrike 				= nil,
BloodFrenzy 				= nil,

b_CommandingPresence 		= false,
b_BattleShout 				= false,
b_CommandingShout 			= false,
b_Rampage 					= false,
b_SunderArmor 				= false,
b_DemoralizingShout 		= false,
b_ImprovedDemoralizingShout	= false,
b_ThunderClap 				= false,
b_ImprovedThunderClap 		= false,
b_Trauma	 				= false,
b_FuriousAttacks 			= false,
b_MortalStrike 				= false,
b_BloodFrenzy		 		= false,


}


local localizedClass = ""
local class = ""
local classIndex = 0 

local spec = ""
local playerLevel = 0
local playerRace = ""

--These values can change
local Stats = {

Strength 		= 0.0,
Agility 		= 0.0,
Stamina 		= 0.0,
Intellect 		= 0.0,
Spirit 			= 0.0,
Armor 			= 0.0,
BonusArmor 		= 0.0,
AttackPower 	= 0.0,
Expertise 		= 0.0,
FeralAtkPower 	= 0.0,
WeaponDPS 		= 0.0,
MainHandWeaponSpeed 		= 0.0,
OffHandWeaponSpeed 		= 0.0,
HitRating 		= 0.0,
CritRating 		= 0.0,
HasteRating 	= 0.0,
MasteryRating	= 0.0,
SpellPower 		= 0.0,
Mp5 			= 0.0,
SpellPen 		= 0.0,
DefenseRating 	= 0.0,
DodgeRating 	= 0.0,
ParryRating 	= 0.0,
BlockRating 	= 0.0,
Resilience 		= 0.0

}

--These are the defaults that calcs should fall back to
local StatWeightsUI = {

Strength 		= 0.0,
Agility 		= 0.0,
Stamina 		= 0.0,
Intellect 		= 0.0,
Spirit 			= 0.0,
Armor 			= 0.0,
AttackPower 	= 0.0,
Expertise 		= 0.0,
BonusArmor 		= 0.0,
FeralAtkPower 	= 0.0,
WeaponDPS 		= 0.0,
MainHandWeaponSpeed 		= 0.0,
OffHandWeaponSpeed 		= 0.0,
HitRating 		= 0.0,
CritRating 		= 0.0,
HasteRating 	= 0.0,
MasteryRating	= 0.0,
SpellPower 		= 0.0,
Mp5 			= 0.0,
SpellPen 		= 0.0,
DefenseRating 	= 0.0,
DodgeRating 	= 0.0,
ParryRating 	= 0.0,
BlockRating 	= 0.0,
Resilience 		= 0.0

}


--Caps and other important values
local HasteRatingCap =  2745 
local HasteRatingSoftCap =  1494 
local HasteRatingFromTalents = 0
local PlayerHasteRequired = 0
local HitRatingCap = 1742
local HitHardRatingCap = 3243							 
local HitRatingFromTalents = 0
local HitRatingFromBuffs = 0
local PlayerHitRequired = 1742
local CritRatingCap = 0
local PlayerCritRequired = 0
local DefenseRatingCap = 0
local PlayerDefRequired = 0
local ExpertiseRatingCap = 780.8
local ExpertiseHardRatingCap = 1682
local ClassUsesHardExpertiseCap = false
local ClassUsesHardHitCap = false								 
local PlayerExpertiseRequired = 780.8
local ExpertiseFromTalents = 0
local DefenseRatingFromTalents = 0
local poisonHitRatingCap = 1742
local autoAttackHitRatingCap = 3243							   

local HitCapped = false
local HitSoftCapped = false
local poisonHitCapped = false							 
local HasteCapped = false
local CritCapped = false
local ExpertiseCapped = false
local ExpertiseSoftCapped = false
local DefenseCapped = false

local DualWieldClass = false
local comparingDualWield = false								
local ClassUsesHitCap = false
local ClassUsesHasteCap = false
local ClassUsesCritCap = false
local ClassUsesDefCap = false
local ClassUsesExpertiseCap = false

local ClassConvertsSpiritToHit = false

--local hitNeededToCap = 0
local UseTankWeights = false

local useRareGems = false
local displaySpellpowerConversion = false
local displayCritRatingConversion = false
local displayItemLevel = true
local displayItemLevelUpgrade = true
local displayClassUpgrade = true
local displayMiLVLScore = true
local displayMiLVLReforgeScore = true
local hideMiLVLReforgeInfoWhenCorrect = false
local displayGemPreference = true
local displayHitCapInfo = true

local groupScanningEnabled = true

local assumeThreePercentHitDebuff = true

local AddonInitialized = false

local UnitToInspect = nil
local MiLVL_GroupUnits = {}
local UnitsToInspect = {}
local MiLVL_InspectPending = false
local MiLVL_StatusText = ""
--**Frame Variables
local milvllocal_frame = nil --AceGUI:Create("Frame", "MiLVLFrame")
local milvllocal_buffframe = nil 
local milvllocal_debuffframe = nil 
local MiLVL_UnitsInspected = {}

local MiLVL_InspectWaitTime = 0
local milvl_options = nil;
local UI_useRareGems = nil;
local UI_displaySpellpowerConversion = nil;
local UI_displayCritRatingConversion = nil;
local UI_displayItemLevel = nil;
local UI_displayItemLevelUpgrade = nil;
local UI_displayClassUpgrade = nil;
local UI_displayMiLVLReforgeScore = nil;
local UI_hideMiLVLReforgeInfoWhenCorrect = nil;
local UI_displayMiLVLScore = nil;
local UI_displayGemPreference = nil;
local UI_displayHitCapInfo = nil;
local UI_groupScanningEnabled = nil;
local UI_assumeThreePercentHitDebuff = nil;

local MiLVL_RosterControls = nil;
local MiLVL_RosterList = {};

local selfComparison = false
local itemIsReforged = false

local defaults = {
	DB_Strength 					= 0.0,
	DB_Agility 						= 0.0,
	DB_Stamina 						= 0,
	DB_Intellect 					= 0,
	DB_Spirit 						= 0,
	DB_Armor 						= 0.0,
	DB_AttackPower 					= 0.0,
	DB_Expertise 					= 0.0,
	DB_BonusArmor 					= 0.0,
	DB_HitRating 					= 0.1,
	DB_CritRating 					= 0.1,
	DB_HasteRating 					= 0,
	DB_MasteryRating 				= 0,
	DB_SpellPower 					= 0,
	DB_Mp5 							= 0,
	DB_SpellPen 					= 0.0,	
	DB_DefenseRating				= 0.0,
	DB_DodgeRating 					= 0.0,
	DB_ParryRating 					= 0.0,
	DB_BlockRating 					= 0.0,
	DB_Resilience 					= 0.0,
	DB_FeralAtkPower				= 0,
	DB_WeaponDPS 					= 0,
	DB_MainHandWeaponSpeed			= 0.0,
	DB_OffHandWeaponSpeed 			= 0.0,							  
	DB_UseTankWeights 				= false,
	height 							= 1010,
	width 							= 450,
	DB_useRareGems 					= true,
	DB_displaySpellpowerConversion 	= true,
	DB_displayCritRatingConversion 	= true,
	DB_displayItemLevel 			= true,
	DB_displayItemLevelUpgrade 		= true,
	DB_displayMiLVLReforgeScore		= true,
	DB_hideMiLVLReforgeInfoWhenCorrect = true,
	DB_displayClassUpgrade 			= true,
	DB_displayMiLVLScore 			= true,
	DB_displayGemPreference 		= true,
	DB_displayHitCapInfo 			= true,
	DB_groupScanningEnabled 		= true,
	DB_assumeThreePercentHitDebuff 	= true
}

local itemSlotTable = {
  ["INVTYPE_AMMO"] =           { 0 },
  ["INVTYPE_HEAD"] =           { 1 },
  ["INVTYPE_NECK"] =           { 2 },
  ["INVTYPE_SHOULDER"] =       { 3 },
  ["INVTYPE_BODY"] =           { 4 },
  ["INVTYPE_CHEST"] =          { 5 },
  ["INVTYPE_ROBE"] =           { 5 },
  ["INVTYPE_WAIST"] =          { 6 },
  ["INVTYPE_LEGS"] =           { 7 },
  ["INVTYPE_FEET"] =           { 8 },
  ["INVTYPE_WRIST"] =          { 9 },
  ["INVTYPE_HAND"] =           { 10 },
  ["INVTYPE_FINGER"] =         { 11, 12 },
  ["INVTYPE_TRINKET"] =        { 13, 14 },
  ["INVTYPE_CLOAK"] =          { 15 },
  ["INVTYPE_WEAPON"] =         { 16, 17 },
  ["INVTYPE_SHIELD"] =         { 17 },
  ["INVTYPE_2HWEAPON"] =       { 16 },
  ["INVTYPE_WEAPONMAINHAND"] = { 16 },
  ["INVTYPE_WEAPONOFFHAND"] =  { 17 },
  ["INVTYPE_HOLDABLE"] =       { 17 },
  ["INVTYPE_RANGED"] =         { 18 },
  ["INVTYPE_THROWN"] =         { 18 },
  ["INVTYPE_RANGEDRIGHT"] =    { 18 },
  ["INVTYPE_RELIC"] =          { 18 }
};

local function usableSlotID ( itemEquipLoc )
	return itemSlotTable[itemEquipLoc] or nil
end

local function SetBaseStatWeights(str, agi, sta, int, spi)
	Stats.Strength = str
	Stats.Agility = agi
	Stats.Stamina = sta
	Stats.Intellect = int
	Stats.Spirit = spi
end

local function SetCommonStatWeights(hit, crit, haste)
	Stats.HitRating = hit
	Stats.CritRating = crit
	Stats.HasteRating = haste
end

local function SetDefensiveStatWeights(def, dod, par, blk, res)
	Stats.DefenseRating = def
	Stats.DodgeRating = dod
	Stats.ParryRating = par
	Stats.BlockRating = blk
	Stats.Resilience = res
end

local function SetMeleeStatWeights(arm, bonusArm, ap, expert, feralAP, wdps, mhs, ohs)
	Stats.Armor = arm
	Stats.BonusArmor = bonusArm
	Stats.AttackPower = ap
	Stats.Expertise = expert
	Stats.FeralAtkPower = feralAP
	Stats.WeaponDPS = wdps	
	Stats.MainHandWeaponSpeed	= mhs
	Stats.OffHandWeaponSpeed	= ohs								
end

local function SetSpellStatWeights(sp, mp5, spellPen)
	Stats.SpellPower = sp
	Stats.Mp5 = mp5
	Stats.SpellPen = spellPen
end

--local sourceStat = ""
--local sourceAmount = 0
--Not sure if this stuff should be removed or not 7-28-2024 local destinationStat = ""
local reforgeStrings = {"Equip: Improves ", " Spirit", " Mastery"}
local reforgeStats = {"Spirit", "Mastery", "Expertise Rating", "Critical Strike Rating", "Haste Rating", "Hit Rating", "Dodge Rating", "Parry Rating"}
local statAlias = {
Spirit = "Spirit",
MasteryRating = "Mastery",
Expertise = "Expertise Rating",
CritRating = "Critical Strike Rating",
HasteRating = "Haste Rating",
HitRating = "Hit Rating",
DodgeRating = "Dodge Rating",
ParryRating = "Parry Rating"
}
statAlias["Expertise Rating"] = "Expertise"
statAlias["Hit Rating"] = "HitRating"
local reforgedCorrectly = false 

local function SetMiLVLCurrentBase()
	--if IsEquippedItemType("Off-Hand Weapon") or IsEquippedItemType("Off Hand") or IsEquippedItemType("Held In Off-hand")  then
	--	NumberOfInvSlots = 17
	--else
	--	NumberOfInvSlots = 16
	--end

	if IsEquippedItemType("One-Handed Swords") or IsEquippedItemType("One-Handed Maces") or IsEquippedItemType("One-Handed Axes") or IsEquippedItemType("Daggers") or IsEquippedItemType("Fist Weapons") then
		NumberOfInvSlots = 17
	else
		NumberOfInvSlots = 16
	end
end

local function GetNumbersFromTrinketEffect(txt, stat)
	if txt == nil then
		return 0
	end
	--Use: Increases 'stat' by X for Y sec. (Z Min Cooldown)
	--Use: Increases 'stat' rating by X for Y sec. (Z Min Cooldown)
	--Equip: Chance to increase your 'stat' by X for Y sec. 
	--Equip: You gain X 'stat' for the next Y sec, stacking up to M times
	--Equip: Chance on melee and ranged critical strike to increase your 'stat' by X for Y secs. (Proc chance: 10%, 50s cooldown)
	--Equip: Your harmful spells have a chance to increase your spell power by 959 for 10 sec. (Proc chance: 10%, 45s cooldown)
	--Equip: Each time you cast a spell, there is a chance you will gain up to 272 mana per 5 for 15 sec. (Proc chance: 10%, 50s cooldown)
	--Equip: Each time you cast a damaging or healing spell you gain 20 spell power for the next 10 sec, stacking up to 10 times.
	--9/22/2023
	--Equip: Increases your 'stat' by X.
	--Equip: Improves your 'stat' by X.
	--11/19/2023
	--Equip: When you deal damage you have a chance to gain Paragon
	local amount 		= "" 	--X
	local length 		= "" 	--Y
	local cooldown 		= "" 	--Z
	local multiplier	= ""	--M
	
	if string.match(txt, "Use: Consumes") then
		--stat amount X
		string.gsub(txt, stat.." by %d+",function(e)
			string.gsub(e,"%d+",function(n)
				amount = n
				end)
		end)
		if tonumber(amount) ~= nil and tonumber(amount) > 0 then
			--length Y
			string.gsub(txt, "Lasts %d+ sec",function(e)
				string.gsub(e,"%d+",function(n)
					length = n
					end)
			end)
			if tonumber(length) > 0 then
				--Cooldown Z
				string.gsub(txt, "%d+ Min Cooldown",function(e)
					string.gsub(e,"%d+",function(n)
						cooldown = n
						end)
				end)
				if cooldown == nil or cooldown == "" then
					local seconds = ""
					string.gsub(txt, "%d+ Sec Cooldown",function(e)
						string.gsub(e,"%d+",function(n)
							seconds = n
							end)
					end)
					local minutes = "" 
					string.gsub(txt, "%d+ Min ",function(e)
						string.gsub(e,"%d+",function(n)
							minutes = n
							end)
					end)
					if minutes ~= nil and seconds ~= nil then
						cooldown = tonumber(minutes) + (tonumber(seconds)/60)
					end
				end	
				if cooldown ~= nil then
					if tonumber(cooldown) > 0 then 
						--MiLVL.Print("On Use Trinket Found "..amount.." "..stat.." for "..length.." every "..cooldown.." minutes")
						return stat, amount, length, cooldown, multiplier;
					end
				end
			end
		end
	elseif string.match(txt, "Use: ") then
		--stat amount X
		local mtxt = string.gsub(txt, ",", "")
		string.gsub(mtxt, stat.." by %d+",function(e)
			string.gsub(e,"%d+",function(n)
				amount = n
				end)
		end)
		if tonumber(amount) ~= nil and tonumber(amount) > 0 then
			--length Y
			string.gsub(txt, "for %d+ sec",function(e)
				string.gsub(e,"%d+",function(n)
					length = n
					end)
			end)
			if tonumber(length) > 0 then
				--Cooldown Z
				string.gsub(txt, "%d+ Min Cooldown",function(e)
					string.gsub(e,"%d+",function(n)
						cooldown = n
						end)
				end)
				if cooldown == nil or cooldown == "" then
					local seconds = ""
					string.gsub(txt, "%d+ Sec Cooldown",function(e)
						string.gsub(e,"%d+",function(n)
							seconds = n
							end)
					end)
					local minutes = "" 
					string.gsub(txt, "%d+ Min ",function(e)
						string.gsub(e,"%d+",function(n)
							minutes = n
							end)
					end)
					if minutes ~= nil and seconds ~= nil then
						cooldown = tonumber(minutes) + (tonumber(seconds)/60)
					end
				end	
				if cooldown ~= nil then
					if tonumber(cooldown) > 0 then 
						--MiLVL.Print("On Use Trinket Found "..amount.." for "..length.." every "..cooldown.." minutes")
						return stat, amount, length, cooldown, multiplier;
					end
				end
			end
		end
	
	elseif string.match(txt, "Equip: Your healing") then
		local mtxt = string.gsub(txt, ",", "")
		--MiLVL.Print(stat.." "..amount)
		string.gsub(string.lower(mtxt), "%d+ "..stat.." for ",function(e)
			string.gsub(e,"%d+",function(n)
				amount = n
				--MiLVL.Print(stat.." "..amount)
				end)
		end)
		if tonumber(amount) ~= nil and tonumber(amount) > 0 then
			--length Y
			string.gsub(txt, "for %d+ sec",function(e)
				string.gsub(e,"%d+",function(n)
					length = n
					--MiLVL.Print(stat.." "..amount.." for "..length.." seconds") 
					end)
			end)
			---
			if length ~= "" and tonumber(length) > 0 then
				--multiplier M
				string.gsub(txt, "up to %d+ times",function(e)
					string.gsub(e,"%d+",function(n)
						multiplier = multiplier .. n
						end)
				end)
				--MiLVL.Print(stat.." "..amount.." for "..length.." seconds")
				return stat, amount, length, cooldown, multiplier;
			else
				--length Y
				string.gsub(txt, " for %d+",function(e)
					string.gsub(e,"%d+",function(n)
						length = length .. n
						end)
				end)
				--MiLVL.Print(stat.." "..amount.." for "..length.." seconds")
				return stat, amount, length, cooldown, multiplier;
			end
			---
			if tonumber(length) > 0 then
				--MiLVL.Print("Proc trinket found")
				return stat, amount, length, cooldown, multiplier;
			end
		end
	elseif string.match(txt, "Equip: Your") then
		--MiLVL.Print("On Equip trinket found")
		local mtxt = string.gsub(txt, ",", "")
		string.gsub(mtxt, stat.." by %d+",function(e)
			string.gsub(e,"%d+",function(n)
				amount = n
				end)
		end)
		if tonumber(amount) == nil then
			string.gsub(string.lower(mtxt), "%d+ "..stat.." for ",function(e)
				string.gsub(e,"%d+",function(n)
					amount = n
					end)
			end)
		end
		if tonumber(amount) ~= nil and tonumber(amount) > 0 then
			--length Y
			string.gsub(txt, "for %d+ sec",function(e)
				string.gsub(e,"%d+",function(n)
					length = n
					--MiLVL.Print(stat.." "..amount.." for "..length.." seconds") 
					end)
			end)
			---
			if length ~= "" and tonumber(length) > 0 then
				--multiplier M
				string.gsub(txt, "up to %d+ times",function(e)
					string.gsub(e,"%d+",function(n)
						multiplier = multiplier .. n
						end)
				end)
				--MiLVL.Print(stat.." "..amount.." for "..length.." seconds")
				return stat, amount, length, cooldown, multiplier;
			else
				--length Y
				string.gsub(txt, " for %d+",function(e)
					string.gsub(e,"%d+",function(n)
						length = length .. n
						end)
				end)
				--MiLVL.Print(stat.." "..amount.." for "..length.." seconds")
				return stat, amount, length, cooldown, multiplier;
			end
			---
			if tonumber(length) > 0 then
				--MiLVL.Print("Proc trinket found")
				return stat, amount, length, cooldown, multiplier;
			end
		end
	elseif string.match(txt, "Equip: Each time you") then
		--gain X 'stat' for the next Y sec, stacking up to M times
		--Equip: Each time you cast a spell, there is a chance you will gain up to 272 mana per 5 for 15 sec. (Proc chance: 10%, 50s cooldown)
		--MiLVL.Print("Equip: Each time you...")
		string.gsub(txt, " %d+ "..stat,function(e)
			string.gsub(e,"%d+",function(n)
				amount = n
				end)
		end)
		if tonumber(amount) ~= nil and tonumber(amount) > 0 then
			--length Y
			string.gsub(txt, "for the next %d+ sec",function(e)
				string.gsub(e,"%d+",function(n)
					length = n
					end)
			end)
			if length ~= "" and tonumber(length) > 0 then
				--multiplier M
				string.gsub(txt, "up to %d+ times",function(e)
					string.gsub(e,"%d+",function(n)
						multiplier = multiplier .. n
						end)
				end)
				--MiLVL.Print(stat.." "..amount.." for "..length.." seconds")
				return stat, amount, length, cooldown, multiplier;
			else
				--length Y
				string.gsub(txt, " for %d+",function(e)
					string.gsub(e,"%d+",function(n)
						length = length .. n
						end)
				end)
				--MiLVL.Print(stat.." "..amount.." for "..length.." seconds")
				return stat, amount, length, cooldown, multiplier;
			end
		end
				
	elseif string.match(txt, "Equip: Chance") then
		--increase your 'stat' by X for Y secs.
		string.gsub(txt, stat.." by %d+ ",function(e)
			string.gsub(e,"%d+",function(n)
				amount = amount .. n
				end)
		end)
		if amount ~= "" and tonumber(amount) > 0 then
			--length Y
			string.gsub(txt, "for %d+ secs",function(e)
				string.gsub(e,"%d+",function(n)
					length = length .. n
					end)
			end)
		end
		return stat, amount, length, cooldown, multiplier;
---
	elseif string.match(txt, "Equip: Melee attacks which reduce you") then
		--cause you to gain X 'stat' for Y sec. Cannot occur more than once every Z sec.
		--Equip: Melee attacks which reduce you below 35% health cause you to gain 3,420 bonus armor for 10 sec.   Cannot occur more than once every 30 sec.		
		local mtxt = string.gsub(txt, ",", "")		
		string.gsub(mtxt, " gain %d+ "..stat,function(e)
			string.gsub(e,"%d+",function(n)
				amount = amount .. n
				end)
		end)
		if amount ~= "" and tonumber(amount) > 0 then
			--length Y
			string.gsub(mtxt, " for %d+ sec",function(e)
				string.gsub(e,"%d+",function(n)
					length = length .. n
					end)
			end)
		end
		if length ~= "" and tonumber(length) > 0 then
			--Cooldown Z
			string.gsub(mtxt, "every %d+ sec.",function(e)
				string.gsub(e,"%d+",function(n)
					cooldown = n
					end)
			end)
			
		end

		if cooldown ~= nil then
			cooldown = tonumber(cooldown)/60
			if tonumber(cooldown) > 0 then 
				return stat, amount, length, cooldown, multiplier;
			end
		end
---	
	elseif string.match(txt, "Equip: When you heal or deal damage you have a chance to gain Greatness") then
		if stat == "strength" or stat == "agility" or stat == "intellect" or stat == "spirit" then
			--For Greatness, the Primary Stat is already being picked up, just score Tooltip.
			--Get highest character stat
			-- local cs_int = 0 --4
			-- local cs_spi = 0 --5
			-- local cs_agi = 0 --2
			-- local cs_str = 0 --1
			local cs_HighStat = 0
			local cs_StatName = ""
			
			-- local greatness_Trinket = {}
			-- greatness_Trinket["Strength"] 	= Stats.Strength
			-- greatness_Trinket["Agility"] 	= Stats.Agility
			-- greatness_Trinket["Intellect"] 	= Stats.Intellect
			-- greatness_Trinket["Spirit"] 		= Stats.Spirit
			
			--local heaviestStatWeight, heaviestStatName = GetHighestStatWeight()
			--Get highest character stat, since this is what will be buffed by trinket effect.
			for t=1, 5 do
				if t ~= 3 then
					local _, stat = UnitStat("player", t);
					if stat > cs_HighStat then
						cs_HighStat = stat
						if t ==1 then
							cs_StatName = "Strength"
							if Stats.Strength > Stats.Agility and Stats.Strength > Stats.Intellect and Stats.Strength > Stats.Spirit then
								break
							end
						elseif t ==2 then
							cs_StatName = "Agility"
							if Stats.Agility > Stats.Strength and Stats.Agility > Stats.Intellect and Stats.Agility > Stats.Spirit then
								break
							end
						elseif t ==4 then
							cs_StatName = "Intellect"
							if Stats.Intellect > Stats.Agility and Stats.Intellect > Stats.Strength and Stats.Intellect > Stats.Spirit then
								break
							end
						elseif t ==5 then
							cs_StatName = "Spirit"
							if Stats.Spirit > Stats.Agility and Stats.Spirit > Stats.Intellect and Stats.Spirit > Stats.Strength then
								break
							end
						end
					end
				end
			end
			amount 		= 300 	--X
			length 		= 15 	--Y
			cooldown 	= 0.75 	--Z
			stat		= cs_StatName:lower()
			return stat, amount, length, cooldown, multiplier;
		end
	elseif string.match(txt, "Equip: When you deal damage you have a chance to gain Paragon") then
		--MiLVL.Print("Paragon Detected")
		if stat == "strength" or stat == "agility" then
			local cs_HighStat = 0
			local cs_StatName = ""
			
			--Get highest character stat, since this is what will be buffed by trinket effect.
			local _, paragon_str = UnitStat("player", 1);
			local _, paragon_agi = UnitStat("player", 2);
			if paragon_str > paragon_agi then
				cs_StatName = "Strength"
			elseif paragon_agi > paragon_str then
				cs_StatName = "Agility"
			end

			amount 		= 450 	--X
			length 		= 15 	--Y
			cooldown 	= 0.75 	--Z
			stat		= cs_StatName:lower()
			
			return stat, amount, length, cooldown, multiplier;
		end
	end
	
	--MiLVL.Print("Checking Trinket...")
	--if string.match(txt, "Equip:Your damage spells grant") then
	--gain X 'stat' for the next Y sec, stacking up to M times
	--Equip: Each time you cast a spell, there is a chance you will gain up to 272 mana per 5 for 15 sec. (Proc chance: 10%, 50s cooldown)
	--MiLVL.Print("Heart's Revelation...")
	
	
	--string.gsub(txt, " %d+ "..stat,function(e)
	--	string.gsub(e,"%d+",function(n)
	--		amount = n
	--		end)
	--end)
	--if tonumber(amount) ~= nil and tonumber(amount) > 0 then
	--	--length Y
	--	string.gsub(txt, "for the next %d+ sec",function(e)
	--		string.gsub(e,"%d+",function(n)
	--			length = n
	--			end)
	--	end)
	--	if length ~= "" and tonumber(length) > 0 then
	--		--multiplier M
	--		string.gsub(txt, "up to %d+ times",function(e)
	--			string.gsub(e,"%d+",function(n)
	--				multiplier = multiplier .. n
	--				end)
	--		end)
	--		--MiLVL.Print(stat.." "..amount.." for "..length.." seconds")
	--		return stat, amount, length, cooldown, multiplier;
	--	else
	--		--length Y
	--		string.gsub(txt, " for %d+",function(e)
	--			string.gsub(e,"%d+",function(n)
	--				length = length .. n
	--				end)
	--		end)
	--		--MiLVL.Print(stat.." "..amount.." for "..length.." seconds")
	--		return stat, amount, length, cooldown, multiplier;
	--	end
	--end
end

local function setContains(set, key)
    return set[key] ~= nil
end

local function GetBagPosition(itemLink)
    for bag = 0, NUM_BAG_SLOTS do
        for slot = 1, C_Container.GetContainerNumSlots(bag) do
            if(C_Container.GetContainerItemLink(bag, slot) == itemLink) then
                return bag, slot
            end
        end
    end
end

local function IsItemReforged(itemLink)
	if itemLink ~= nil then
			local _, _, _, _, _, _,_, _, itemEquipLoc = C_Item.GetItemInfo(itemLink)
			local invSlot = usableSlotID(itemEquipLoc)
			--print("itemLink is not nil")
			MiLVL_Hidden_Tooltip:Show()
			MiLVL_Hidden_Tooltip:SetOwner(milvllocal_frame.frame, nil)
			--MiLVL_Hidden_Tooltip:SetHyperlink(itemLink)
			MiLVL_Hidden_Tooltip:SetInventoryItem("player", invSlot[1])
			--print(itemLink)
			for i=2,MiLVL_Hidden_Tooltip:NumLines() do 
				local ttline = getglobal("MiLVL_Hidden_TooltipTextLeft" .. i) 	
				local text = ttline:GetText()
				--print(text)
				if text ~= nil then
					if string.match(text, "Reforged") then
						MiLVL_Hidden_Tooltip:ClearLines();
						MiLVL_Hidden_Tooltip:Hide()
						--print("Reforge Found")
						return true
					end
				end
			end
			MiLVL_Hidden_Tooltip:ClearLines();
			MiLVL_Hidden_Tooltip:Hide();
	else
		for i=3,GameTooltip:NumLines() do 
			local ttline = getglobal("GameTooltipTextLeft" .. i) 	
			local text = ttline:GetText()
			if text ~= nil then
				if string.match(text, "Reforged") then
					return true
				end
			end
		end
	end
	return false
end

local function GetWeaponSpeed(itemLink)
	if itemLink ~= nil then
		MiLVL_Hidden_Tooltip:Show()
		MiLVL_Hidden_Tooltip:SetOwner(milvllocal_frame.frame, nil)
		MiLVL_Hidden_Tooltip:SetHyperlink(itemLink)
		for i=1,MiLVL_Hidden_Tooltip:NumLines() do 
			local ttline = getglobal("MiLVL_Hidden_TooltipTextRight" .. i) 
			if ttline ~= nil then
				local text = ttline:GetText()
				if text ~= nil then
					if string.match(text, "Speed") then
						local speed = string.gsub(text, "Speed","")
						MiLVL_Hidden_Tooltip:ClearLines();
						MiLVL_Hidden_Tooltip:Hide()
						return tonumber(speed)
					end
				end
			end
		end
		MiLVL_Hidden_Tooltip:ClearLines();
		MiLVL_Hidden_Tooltip:Hide()
	end
	return 0
end

local function ScoreWeaponSpeed(speed, isOffhand)
	local dmgCalc = 0
	local goal = 2
	if isOffhand then
		--when faster is better
		--((goal-speed) / goal)*100 = x		
		dmgCalc = ((goal-speed) / goal)*100
		--local ohScore = (Stats.OffHandWeaponSpeed or 0)* dmgCalc
		local ohScore = (Stats.OffHandWeaponSpeed or 0) * dmgCalc
		return ohScore
	else
		--when slower is better
		--((speed-goal) / goal)*100 = X
		dmgCalc = ((speed-goal) / goal)*100
		--local mhScore = (Stats.MainHandWeaponSpeed or 0)* dmgCalc
		local mhScore = (Stats.MainHandWeaponSpeed or 0) * dmgCalc
		return mhScore
	end
	return 0
end
			   
local function GetHighestStatWeight(isReforge, lowestStat, statsOnItem)
	if isReforge == nil then
		isReforge = false
	end
	
	local statWeights = {}
	statWeights["Spirit"] 		= Stats.Spirit	
	statWeights["Expertise"] 	= Stats.Expertise	
	statWeights["HitRating"] 	= Stats.HitRating
	statWeights["CritRating"] 	= Stats.CritRating
	statWeights["HasteRating"] 	= Stats.HasteRating
	statWeights["MasteryRating"]= Stats.MasteryRating
	statWeights["DodgeRating"] 	= Stats.DodgeRating
	statWeights["ParryRating"] 	= Stats.ParryRating
	
	if isReforge == false then
		statWeights["Strength"] 	= Stats.Strength
		statWeights["Agility"] 		= Stats.Agility
		statWeights["Stamina"] 		= Stats.Stamina
		statWeights["Intellect"] 	= Stats.Intellect
		statWeights["Resilience"] 	= Stats.Resilience
		--statWeights["AttackPower"] 	= Stats.AttackPower
	end
	if statsOnItem ~= nil then
		for k,v in pairs(statWeights) do
			if setContains(statsOnItem, k) then
				statWeights[k] = nil
			end
		end	
	end
	if lowestStat ~= nil or lowestStat ~= "" then
		if statWeights[lowestStat] ~= nil then
			statWeights[lowestStat] = nil
		end
		if ClassConvertsSpiritToHit then
			--If we request to remove hit rating, and the ClassConvertsSpiritToHit then we also need to remove Spirit.
			if lowestStat == "HitRating" then
				if statWeights["Spirit"] ~= nil then
					statWeights["Spirit"] = nil
				end			
			end
			if lowestStat == "Spirit" then
				if statWeights["HitRating"] ~= nil then
					statWeights["HitRating"] = nil
				end			
			end
		end
	end

	local m={0,""}
	for k,v in pairs(statWeights) do
		--print("Comparing "..m[2].." value of "..m[1].." to the key: "..k.." with a value of "..v)
		if m[1]<v then
			 m[1]=v
			 m[2]=k
		end
	end
	local heaviest = m[1]
	local heaviestName = m[2]
	
	
	return heaviest, heaviestName
end

local function GetLowestStatWeight(statWeights)

	--local statWeights = {}

	local m={100,""}
	for k,v in pairs(statWeights) do
	--print("key: "..k.." value: "..v)
		if v<m[1] and v ~= 0 then
			--print("key: "..k.." value: "..v)
			 m[1]=v
			 m[2]=k
		end
	end
	local lowest = m[1]
	local lowestName = m[2]
	
	return lowest, lowestName
end

local function IsPlayerCasterOrMelee()
	--Strength
		local str, _, _, _ = UnitStat("player", 1);
	--Agility
		local agi, _, _, _ = UnitStat("player", 2);
	--Intellect
		local int, _, _, _ = UnitStat("player", 4);
		
		local res = 0
		if str > int or agi > int then
			res = "MELEE"
		else
			res = "CASTER"
		end
	return res
end

local switch = function (choice)
	-- accepts both number as well as string
	choice = choice and tonumber(choice) or choice     -- returns a number if the choice is a number or string. 
	local rareGemStats = 0 							  -- Rare Gem Value
	local epicGemStats = 0
	local gemStats = 0
  -- Define your cases
  local case =
   {
     ["Stamina"] = function ( )                              -- case 3 :
			rareGemStats = 60 							  -- Rare Gem Value
			epicGemStats = 75 							  -- Epic Gem Value
			if useRareGems then --useRareGems needs to be added to options
				gemStats = rareGemStats 
			else
				gemStats = epicGemStats
			end
             --MiLVL.Print("your choice is Stamina ")       -- code block
     end,                                            -- break statement
     default = function ( )                          -- default case
			rareGemStats = 40 							  -- Rare Gem Value
			epicGemStats = 50 							  -- Epic Gem Value
			if useRareGems then --useRareGems needs to be added to options
				gemStats = rareGemStats 
			else
				gemStats = epicGemStats
			end 
     end,  
   }

	-- execution section
	if case[choice] then
		case[choice]()
	else
		case["default"]()
	end
	
	return gemStats
end

local function CalculateMetaMana(IntOnGem)
	local mana = (20 + (19.987*((UnitStat("player", 4)-20))))
	--local mana = UnitPowerMax("player", 0)/UnitStat("player", 4)
	local manaBuff = mana *0.02
	--print(mana)
	--print(UnitPowerMax("player", 0))
	--Since this is only the value of mana from intellect, and not intellect, we do not want to provide full value.
	local int = (manaBuff/19.987)*(Stats.Intellect*0.926)
	
	return (Stats.Intellect * IntOnGem) + (Stats.Intellect * int)
end

local function CalculateMetaHaste()

	local cooldown = 0.67
	local length = 6
	local effectiveStat = 0
	--Stats.HasteRating
	for i = 1, 60*cooldown do	
		if i <= length then
			effectiveStat = effectiveStat + 480
		end
	end
	effectiveStat = effectiveStat/(60*cooldown)
	return (effectiveStat * Stats.HasteRating)
end

local MetaGemIds = {}
MetaGemIds["Burning Shadowspirit Diamond"]		 	 = 68780
MetaGemIds["Reverberating Shadowspirit Diamond"] 	 = 68779
MetaGemIds["Agile Shadowspirit Diamond"]         	 = 68778
MetaGemIds["Ember Shadowspirit Diamond"]         	 = 52296
MetaGemIds["Austere Shadowspirit Diamond"]       	 = 52294
MetaGemIds["Eternal Shadowspirit Diamond"]       	 = 52293
MetaGemIds["Forlorn Shadowspirit Diamond"]       	 = 52302
MetaGemIds["Effulgent Shadowspirit Diamond"]     	 = 52295
MetaGemIds["Fleet Shadowspirit Diamond"]         	 = 52289
MetaGemIds["Chaotic Shadowspirit Diamond"]       	 = 52291
MetaGemIds["Bracing Shadowspirit Diamond"]       	 = 52292
MetaGemIds["Powerful Shadowspirit Diamond"]      	 = 52299
MetaGemIds["Impassive Shadowspirit Diamond"]     	 = 52301
MetaGemIds["Revitalizing Shadowspirit Diamond"]  	 = 52297
MetaGemIds["Destructive Shadowspirit Diamond"]   	 = 52298
MetaGemIds["Enigmatic Shadowspirit Diamond"]     	 = 52300
MetaGemIds["Chaotic Skyflare Diamond"]			   	 = 41285
MetaGemIds["Ember Skyflare Diamond"]			   	 = 41333
MetaGemIds["Forlorn Skyflare Diamond"]			   	 = 41378
MetaGemIds["Impassive Skyflare Diamond"]		   	 = 41379
MetaGemIds["Destructive Skyflare Diamond"]		   	 = 41307
MetaGemIds["Enigmatic Skyflare Diamond"]		   	 = 41335
MetaGemIds["Shielded Skyflare Diamond"]			   	 = 41377
MetaGemIds["Swift Skyflare Diamond"]			   	 = 41339
MetaGemIds["Thundering Skyflare Diamond"]		   	 = 41400
MetaGemIds["Tireless Skyflare Diamond"]			   	 = 41375
MetaGemIds["Bracing Earthsiege Diamond"]		   	 = 41395
MetaGemIds["Persistent Earthsiege Diamond"] 	   	 = 41381
MetaGemIds["Powerful Earthsiege Diamond"]   	   	 = 41397
MetaGemIds["Beaming Earthsiege Diamond"]    	   	 = 41389
MetaGemIds["Austere Earthsiege Diamond"]    	   	 = 41380
MetaGemIds["Insightful Earthsiege Diamond"] 	   	 = 41401
MetaGemIds["Relentless Earthsiege Diamond"] 	   	 = 41398
MetaGemIds["Eternal Earthsiege Diamond"]    	   	 = 41396

local function GetSocketValue(socket_ilvl, compareSelf)
	local socketValue = 0
	MiLVL_GemPreference = ""
	local MiLVL_numSockets = (MiLVL_ItemStats["EMPTY_SOCKET_RED"] or 0) +(MiLVL_ItemStats["EMPTY_SOCKET_YELLOW"] or 0)+(MiLVL_ItemStats["EMPTY_SOCKET_BLUE"] or 0)+(MiLVL_ItemStats["EMPTY_SOCKET_NO_COLOR"] or 0) + (MiLVL_ItemStats["EMPTY_SOCKET_PRISMATIC"] or 0)
	local MiLVL_numCogSockets = (MiLVL_ItemStats["EMPTY_SOCKET_COGWHEEL"] or 0) 


	MiLVL_numMeta = (MiLVL_ItemStats["EMPTY_SOCKET_META"] or 0)
	
	if MiLVL_numSockets == 0 and MiLVL_numCogSockets == 0 then
		return 0
	end

	--local bonus = true
	local gemStats = 0
	local heaviestStatWeight, heaviestStatName = GetHighestStatWeight(false)

	--Certain valuable stats cannot be gemmed for...
	--It SEEMS like in each scenario, Strength is the next most valuable stat
	if heaviestStatName == "WeaponDPS" or heaviestStatName == "OffHandWeaponSpeed" or heaviestStatName == "MainHandWeaponSpeed" or heaviestStatName == "FeralAtkPower" then
		heaviestStatName = "Strength"
	end

	MiLVL_GemPreference = "Gem "..heaviestStatName
	gemStats = switch(heaviestStatName)

	if socket_ilvl < 285 then
		gemStats = gemStats * 0.5
	end

	local ratingtotal = 0
	if heaviestStatName == "HitRating" or heaviestStatName == "Expertise" then
		--Maybe this should be if the player uses HitCap?
		if heaviestStatName == "HitRating"  then	
			if MiLVL_PlayerRole == "" then
				MiLVL_PlayerRole = IsPlayerCasterOrMelee()
			end
			if MiLVL_PlayerRole == "CASTER" then
				ratingtotal = GetCombatRating(CR_HIT_SPELL)
			else
				ratingtotal = GetCombatRating(CR_HIT_MELEE)
			end	

			--If positive, above cap, negative if below
			local toCap = ratingtotal - HitRatingCap
			if toCap >= 0 then
				gemStats = gemStats - toCap
			else
				--gemStats = gemStats -(toCap + gemStats)			
				gemStats = gemStats - math.max((toCap + gemStats), 0)	
			end

			local socketHitValue = MiLVL_numSockets * heaviestStatWeight * gemStats

			heaviestStatWeight, heaviestStatName = GetHighestStatWeight(false, heaviestStatName, nil)
			if ExpertiseCapped and heaviestStatName == "Expertise" then
				heaviestStatWeight, heaviestStatName = GetHighestStatWeight(false, heaviestStatName, nil)
			end

			gemStats = switch(heaviestStatName)
			if socket_ilvl < 285 then
				gemStats = gemStats * 0.5
			end
			
			local tempGemValue = MiLVL_numSockets * heaviestStatWeight * gemStats
			
			if tempGemValue > socketHitValue then
				socketValue = tempGemValue
				MiLVL_GemPreference = "Gem "..heaviestStatName
			else
				--socketValue = socketValue + socketHitValue
				socketValue = socketHitValue
			end
			
		end

		if heaviestStatName == "Expertise" and socketValue == 0 then
			ratingtotal = GetCombatRating(CR_EXPERTISE)
			
			--If positive, above cap, negative if below
			local toCap = ratingtotal - ExpertiseRatingCap
			if toCap >= 0 then
				gemStats = gemStats - toCap
			else
				--gemStats = gemStats -(toCap + gemStats)
				gemStats = gemStats - math.max((toCap + gemStats), 0)	
			end
			
			local socketExpertiseValue = MiLVL_numSockets * heaviestStatWeight * gemStats
			heaviestStatWeight, heaviestStatName = GetHighestStatWeight(false, heaviestStatName, nil)
			if HitCapped and heaviestStatName == "HitRating" then
				heaviestStatWeight, heaviestStatName = GetHighestStatWeight(false, heaviestStatName, nil)
			end

			gemStats = switch(heaviestStatName)
			if socket_ilvl < 285 then
				gemStats = gemStats * 0.5
			end
			
			local tempGemValue = MiLVL_numSockets * heaviestStatWeight * gemStats
			
			if tempGemValue > socketExpertiseValue then
				socketValue = tempGemValue
				MiLVL_GemPreference = "Gem "..heaviestStatName
			else
				socketValue = socketExpertiseValue
			end
		end
	else
		socketValue = MiLVL_numSockets * heaviestStatWeight * gemStats
	end

	if MiLVL_numCogSockets > 0 then
		heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, nil, nil)
		--print("first weight is: ".. heaviestStatName)
		socketValue = socketValue + (heaviestStatWeight * 208)
		heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, heaviestStatName, nil)
		--print("second weight is: ".. heaviestStatName)
		socketValue = socketValue + (heaviestStatWeight * 208)
	end
	

	if MiLVL_numMeta > 0 then 
		--This is determining score based on what they are using, but not what is correct.
		--Correct would be scoring what they are using, scoring the other possibilities and suggesting the best one.
		--If equipped and selfcomparison is true, the socketValue should reflect what the player has equipped, and suggest an improvement if one exists.
		--If not selfcomparison, then score the socket according to the suggestion.

		local MetaGemScores = {}
		--if socket_ilvl < 285 then
			--WotLK
			MetaGemScores["Chaotic Skyflare Diamond"]		= (Stats.CritRating * 21) + (Stats.SpellPower * 72.6957) 	
			MetaGemScores["Ember Skyflare Diamond"]			=  CalculateMetaMana(21)
			MetaGemScores["Forlorn Skyflare Diamond"]		= (Stats.Intellect * 21) + 5
			MetaGemScores["Impassive Skyflare Diamond"]		= (Stats.CritRating * 21) + 5
			MetaGemScores["Destructive Skyflare Diamond"]	= (Stats.CritRating * 25) +((Stats.Armor*2) +10)
			MetaGemScores["Egnigmatic Skyflare Diamond"]	= (Stats.CritRating * 21) + 3
			MetaGemScores["Effulgent Skyflare Diamond"]		= (Stats.Stamina * 32) +((Stats.Armor*1.2) +10)
			MetaGemScores["Swift Skyflare Diamond"]			= (Stats.CritRating * 21)*1.02
			MetaGemScores["Thundering Skyflare Diamond"]	=  CalculateMetaHaste()
			MetaGemScores["Tireless Skyflare Diamond"]		= (Stats.Intellect * 21)*1.02
			MetaGemScores["Bracing Earthsiege Diamond"]		= (Stats.Intellect * 21) + 4
			MetaGemScores["Persistent Earthsiege Diamond"] 	= (Stats.CritRating * 21) + 3
			MetaGemScores["Powerful Earthsiege Diamond"]   	= (Stats.Stamina * 32) +10
			MetaGemScores["Beaming Earthsiege Diamond"]    	= (Stats.CritRating * 21) + CalculateMetaMana(0)
			MetaGemScores["Austere Earthsiege Diamond"]    	= (Stats.Stamina * 32) + (Stats.Armor * (UnitArmor("player")*0.02))
			MetaGemScores["Insightful Earthsiege Diamond"] 	= (Stats.Intellect * 21) + (Stats.Spirit*70)
			MetaGemScores["Relentless Earthsiege Diamond"] 	= (Stats.Agility * 21) + (Stats.AttackPower * 70) 
			MetaGemScores["Eternal Earthsiege Diamond"]    	= (Stats.Stamina * 32) + (Stats.BlockRating * 22.62) 
		--else
			--local CataMetaGemScores = {}
			MetaGemScores["Burning Shadowspirit Diamond"]		= (Stats.Intellect * 54) + (Stats.SpellPower * 97.981)				
			MetaGemScores["Reverberating Shadowspirit Diamond"] = (Stats.Strength * 54) + (Stats.AttackPower * 97.981)              
			MetaGemScores["Agile Shadowspirit Diamond"]         = (Stats.Agility * 54) + (Stats.AttackPower * 97.981)               
			MetaGemScores["Ember Shadowspirit Diamond"]         = CalculateMetaMana(54)                                               
			MetaGemScores["Austere Shadowspirit Diamond"]       = (Stats.Stamina * 81) + (Stats.Armor * (UnitArmor("player")*0.02)) 
			MetaGemScores["Eternal Shadowspirit Diamond"]       = (Stats.Stamina * 81) + (Stats.BlockRating * 88.35)                
			MetaGemScores["Forlorn Shadowspirit Diamond"]       = (Stats.Intellect * 54) + 5                                        
			MetaGemScores["Effulgent Shadowspirit Diamond"]     = (Stats.Stamina * 81) + ((Stats.Resilience * 79.12)*0.5)           
			MetaGemScores["Fleet Shadowspirit Diamond"]         = (Stats.MasteryRating * 54) + 12                                   
			MetaGemScores["Chaotic Shadowspirit Diamond"]       = (Stats.CritRating * 54) + (Stats.SpellPower * 97.981)             
			MetaGemScores["Bracing Shadowspirit Diamond"]       = (Stats.Intellect * 54) + 4                                        
			MetaGemScores["Powerful Shadowspirit Diamond"]      = (Stats.Stamina * 81) + 5                                          
			MetaGemScores["Impassive Shadowspirit Diamond"]     = (Stats.CritRating * 54) + 5                                       
			MetaGemScores["Revitalizing Shadowspirit Diamond"]  = (Stats.Spirit * 54) + (Stats.SpellPower * 97.981)                 
			MetaGemScores["Destructive Shadowspirit Diamond"]   = (Stats.CritRating * 54) + (Stats.Resilience * 79.12)              
			MetaGemScores["Enigmatic Shadowspirit Diamond"]     = (Stats.CritRating * 54) + 3   
		--end        

		local bestMetaName = ""
		local bestMetaScore = 0
		for k,v in pairs(MetaGemScores) do
			--print("Comparing "..bestMetaName.." "..bestMetaScore.." to the key: "..k.."  "..v)
			if bestMetaScore<v then
				 bestMetaName=k
				 bestMetaScore=v
			end
		end

		
		if bestMetaName ~= "" then
			--print(bestMetaName.." has a score of "..bestMetaScore)
			local _, gLink= C_Item.GetItemInfo(MetaGemIds[bestMetaName])
			
			--Does player have a meta gem equipped?
			local equippedMetaName, equippedMetaLink = GetItemGem(equippedItemLink, 1)		
			if equippedMetaName ~= nil then
				--Get the score
				socketValue = socketValue + MetaGemScores[equippedMetaName]
				--Does the equipped Meta Gem Match?
				if equippedMetaName ~= bestMetaName or not compareSelf then 
					if gLink ~= nil then
						MiLVL_MetaGemPreference = "Meta: "..gLink
					end
				end
			else
				--No Meta Gem Equipped
				if gLink ~= nil then
					MiLVL_MetaGemPreference = "Meta: "..gLink
				end
				socketValue = socketValue + bestMetaScore
			end
		end
	end

	return socketValue or 0
end

local function GetNumbersFromText(txt, stat)
	local str = ""
	string.gsub(txt,"%d+ "..stat,function(e)
		string.gsub(e,"%d+",function(n)
			str = str .. n
			end)
	end)
	if str == "" then
		string.gsub(txt,stat.." by %d+",function(e)
			string.gsub(e,"%d+",function(n)
				str = str .. n
				end)
		end)	
	end
	return str;
end

local function GetKeyByValue(t , value)
  for k,v in pairs(t) do
    if v==value then return k end
  end
  return nil
end

local function UpdateItemScore(itemLink, newScore, replacingLink)
	local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(itemLink)
	--1 = head INVTYPE_HEAD
	if iEquipLoc == "INVTYPE_HEAD" then 
		equipLinks.headEquipLink = itemLink
		equipScores.MiLVL_Score_HeadEquip = newScore;					 											
	elseif iEquipLoc =="INVTYPE_NECK" then 
		equipLinks.neckEquipLink = itemLink
		equipScores.MiLVL_Score_NeckEquip = newScore;
	elseif iEquipLoc =="INVTYPE_SHOULDER" then 
		equipLinks.shoulderEquipLink = itemLink
		equipScores.MiLVL_Score_ShoulderEquip = newScore;
	elseif iEquipLoc =="INVTYPE_CHEST" or iEquipLoc =="INVTYPE_ROBE" then 
		equipLinks.chestEquipLink = itemLink
		equipScores.MiLVL_Score_ChestEquip = newScore;
	elseif iEquipLoc ==("INVTYPE_WAIST") then 
		equipLinks.waistEquipLink = itemLink
		equipScores.MiLVL_Score_WaistEquip = newScore;
	elseif iEquipLoc ==("INVTYPE_LEGS") then 
		equipLinks.legsEquipLink = itemLink
		equipScores.MiLVL_Score_LegsEquip = newScore;
	elseif iEquipLoc ==("INVTYPE_FEET") then 
		equipLinks.feetEquipLink = itemLink
		equipScores.MiLVL_Score_FeetEquip = newScore;
	elseif iEquipLoc ==("INVTYPE_WRIST") then 
		equipLinks.wristEquipLink = itemLink
		equipScores.MiLVL_Score_WristEquip = newScore;
	elseif iEquipLoc ==("INVTYPE_HAND") then 
		equipLinks.handsEquipLink = itemLink
		equipScores.MiLVL_Score_HandsEquip = newScore;
	elseif iEquipLoc ==("INVTYPE_FINGER") then 
		if replacingLink ~= nil then
			if replacingLink == equipLinks.finger1EquipLink then
				equipLinks.finger1EquipLink = itemLink
				equipScores.MiLVL_Score_Finger1Equip = newScore;
			elseif replacingLink == equipLinks.finger2EquipLink then
				equipLinks.finger2EquipLink = itemLink
				equipScores.MiLVL_Score_Finger2Equip = newScore;
			end
		end
	elseif iEquipLoc ==("INVTYPE_TRINKET") then 
		if replacingLink ~= nil then
			if replacingLink == equipLinks.trinket1EquipLink then
				equipLinks.trinket1EquipLink = itemLink
				equipScores.MiLVL_Score_Trinket1Equip = newScore;
			elseif replacingLink == equipLinks.trinket2EquipLink then
				equipLinks.trinket2EquipLink = itemLink
				equipScores.MiLVL_Score_Trinket2Equip = newScore;
			end
		end
	elseif iEquipLoc ==("INVTYPE_CLOAK") then 
		equipLinks.backEquipLink = itemLink
		equipScores.MiLVL_Score_BackEquip = newScore;
	elseif iEquipLoc ==("INVTYPE_2HWEAPON") or iEquipLoc ==("INVTYPE_WEAPONMAINHAND")  then 
		equipLinks.mainhandEquipLink = itemLink
		equipScores.MiLVL_Score_MainhandEquip = newScore
	elseif iEquipLoc ==("Off-Hand Weapon") or iEquipLoc ==("Off Hand") or iEquipLoc ==("Held In Off-hand") then
		equipLinks.offhandEquipLink = itemLink
		equipScores.MiLVL_Score_OffhandEquip = newScore;
	elseif iEquipLoc ==("INVTYPE_WEAPON") then
		if itemLink ~= nil then
			if itemLink == equipLinks.mainhandEquipLink then
				equipLinks.mainhandEquipLink = itemLink
				equipScores.MiLVL_Score_MainhandEquip = newScore;
			elseif itemLink == equipLinks.offhandEquipLink then
				equipLinks.offhandEquipLink = itemLink
				equipScores.MiLVL_Score_OffhandEquip = newScore;
			end
		end
	elseif iEquipLoc ==("INVTYPE_RANGED") or iEquipLoc ==("INVTYPE_RELIC") or iEquipLoc ==("INVTYPE_THROWN") or iEquipLoc ==("INVTYPE_RANGEDRIGHT") then 
		equipLinks.rangedEquipLink = itemLink
		equipScores.MiLVL_Score_RangedEquip = newScore;
	end

	--This is adding up RAW iLVL
	--MiLVL_Current_iLVL = EquipInfo.headEquip + EquipInfo.neckEquip + EquipInfo.shoulderEquip + EquipInfo.chestEquip + EquipInfo.waistEquip + EquipInfo.legsEquip + EquipInfo.feetEquip + EquipInfo.wristEquip + EquipInfo.handsEquip + EquipInfo.finger1Equip + EquipInfo.finger2Equip + EquipInfo.trinket1Equip + EquipInfo.trinket2Equip + EquipInfo.backEquip + EquipInfo.mainhandEquip + EquipInfo.rangedEquip + EquipInfo.offhandEquip

	SetMiLVLCurrentBase() --This is setting the NumberOfInvSlots variable

	MiLVL_GearScore = (equipScores.MiLVL_Score_HeadEquip + equipScores.MiLVL_Score_NeckEquip + equipScores.MiLVL_Score_ShoulderEquip + equipScores.MiLVL_Score_ChestEquip + equipScores.MiLVL_Score_WaistEquip + equipScores.MiLVL_Score_LegsEquip + equipScores.MiLVL_Score_FeetEquip + equipScores.MiLVL_Score_WristEquip +  equipScores.MiLVL_Score_HandsEquip + equipScores.MiLVL_Score_Finger1Equip + equipScores.MiLVL_Score_Finger2Equip + equipScores.MiLVL_Score_Trinket1Equip + equipScores.MiLVL_Score_Trinket2Equip + equipScores.MiLVL_Score_BackEquip + equipScores.MiLVL_Score_MainhandEquip + equipScores.MiLVL_Score_OffhandEquip + equipScores.MiLVL_Score_RangedEquip) / NumberOfInvSlots
	
	local s_mls = tostring(MiLVL_GearScore)
	--MiLVL Score when equipped
	--MiLVL_GearScore = (headEquipIlvl + neckEquipIlvl + shoulderEquipIlvl + chestEquipIlvl + waistEquipIlvl + legsEquipIlvl + feetEquipIlvl + wristEquipIlvl + handsEquipIlvl + finger1EquipIlvl + finger2EquipIlvl + trinket1EquipIlvl + trinket2EquipIlvl + backEquipIlvl + mainhandEquipIlvl + rangedEquipIlvl + offhandEquipIlvl) / NumberOfInvSlots
	local truncated = tonumber(string.format("%.1f", s_mls))
	CharacterSheet_MiLVL:SetText("MiLVL: "..truncated)
end

local function GetReforgeInfo(itemLink)
	local itemStats = GetItemStats(itemLink)
	local sourceStat = ""
	local destinationStat = ""
	local sourceAmount = 0
	local statsInTooltip = {}
	local destAmount = 0 
	
	local itemName, _, _, _, _, _,_, _, itemEquipLoc = C_Item.GetItemInfo(itemLink)
	local invSlots = usableSlotID(itemEquipLoc)
	local slotNumber = -1
	
	local bag, slot = GetBagPosition(itemLink)
	local inBags = false
	if bag ~= nil then
		itemLoc = ItemLocation:CreateFromBagAndSlot(bag, slot)
		inBags = true
	end
	
	
	local reforgeAmounts = {}
	reforgeAmounts["Spirit"] = 0
	reforgeAmounts["Mastery"] = 0
	reforgeAmounts["Expertise Rating"] = 0
	reforgeAmounts["Critical Strike Rating"] = 0
	reforgeAmounts["Haste Rating"] = 0
	reforgeAmounts["Hit Rating"] = 0
	reforgeAmounts["Dodge Rating"] = 0
	reforgeAmounts["Parry Rating"] = 0
	
	if itemStats["ITEM_MOD_SPIRIT_SHORT"] ~= nil then
		reforgeAmounts["Spirit"] = itemStats["ITEM_MOD_SPIRIT_SHORT"]	
	end
	if itemStats["ITEM_MOD_EXPERTISE_RATING"]  ~= nil  then
		reforgeAmounts["Expertise Rating"] = itemStats["ITEM_MOD_EXPERTISE_RATING"]
	end
	if itemStats["ITEM_MOD_CRIT_RATING"]  ~= nil then
		reforgeAmounts["Critical Strike Rating"] = itemStats["ITEM_MOD_CRIT_RATING"]
	end
	if itemStats["ITEM_MOD_HASTE_RATING"]  ~= nil then
		reforgeAmounts["Haste Rating"] = itemStats["ITEM_MOD_HASTE_RATING"]
	end
	if itemStats["ITEM_MOD_MASTERY_RATING_SHORT"]  ~= nil then
		reforgeAmounts["Mastery"] = itemStats["ITEM_MOD_MASTERY_RATING_SHORT"]
	end
	if itemStats["ITEM_MOD_HIT_RATING"]  ~= nil then
		reforgeAmounts["Hit Rating"] = itemStats["ITEM_MOD_HIT_RATING"]     	
	end
	if itemStats["ITEM_MOD_DODGE_RATING"]  ~= nil then
		reforgeAmounts["Dodge Rating"] = itemStats["ITEM_MOD_DODGE_RATING"]
	end
	if itemStats["ITEM_MOD_PARRY_RATING"]  ~= nil then
		reforgeAmounts["Parry Rating"] = itemStats["ITEM_MOD_PARRY_RATING"]
	end
	--Figure out if the player owns the item. If they do not own the item, do not attempt to gather info about the current reforge
	--Proceed as though the item is not reforged and provide a suggestion.
	--To do that, we need to figure out the equipped slot OR INVENTORY SLOT
	if equippedItemLinks ~= nil and invSlots ~= nil and tonumber(invSlots) == nil then
		for i=1, 2 do
			local eil = GetInventoryItemLink("player", invSlots[i]);
			if eil == itemLink then
				slotNumber = invSlots[i]				
				break
			end			
		end
		
	else
		slotNumber = invSlots[1]	
	end

	--if IsItemReforged(itemLink) then
	if itemIsReforged then
		MiLVL_Hidden_Tooltip:Show()
		MiLVL_Hidden_Tooltip:SetOwner(milvllocal_frame.frame, nil)
		--MiLVL_Hidden_Tooltip:SetHyperlink(itemLink)
		if inBags then
			MiLVL_Hidden_Tooltip:SetBagItem(bag,slot);
		else
			MiLVL_Hidden_Tooltip:SetInventoryItem("player", slotNumber);--SetHyperlink(itemLink)
			--print(slotNumber)
		end
		
		
		for i=1,MiLVL_Hidden_Tooltip:NumLines() do 
			local ttline = getglobal("MiLVL_Hidden_TooltipTextLeft" .. i) 	
			local text = ttline:GetText()			 
			--Testing
			if text ~= nil then
				for s=1, #reforgeStats do
					if string.match(text:lower(), reforgeStats[s]:lower()) and not string.match(text:lower(), "rating required") and not string.match(text, " and +") and not string.match(text, "Socket ") and not string.match(text, "Set: ") then
						statsInTooltip[reforgeStats[s]] = GetNumbersFromText(text:lower(), reforgeStats[s]:lower())
					end
				end			
			end
			--for s=1, #reforgeStats do
			--	if string.match(text:lower(), reforgeStats[s]:lower()) and not string.match(text:lower(), "rating required") and not string.match(text, " and +") and not string.match(text, "Socket ") and not string.match(text, "Set: ") then
			--		statsInTooltip[reforgeStats[s]] = GetNumbersFromText(text:lower(), reforgeStats[s]:lower())
			--	end
			--end

		end
		MiLVL_Hidden_Tooltip:ClearLines();
		MiLVL_Hidden_Tooltip:Hide();
		local candidates = {}
		for k,v in pairs(statsInTooltip) do		
			if sourceStat == "" and reforgeAmounts[k] ~= nil and statsInTooltip[k] ~= nil and statsInTooltip[k] ~= "" then
				if tonumber(statsInTooltip[k]) < reforgeAmounts[k] then
					sourceStat = k
					sourceAmount = reforgeAmounts[k]		
				end
			end
		
			--if destinationStat == "" and reforgeAmounts[k] ~= nil then
			if reforgeAmounts[k] ~= nil then
				--print(k.." "..statsInTooltip[k])
				--if the reforgeAmount is 0, the stat does not natuarally occur on the item.
				if reforgeAmounts[k] == 0 and statsInTooltip[k] ~= "" and statsInTooltip[k] ~= nil then
					--Do the math to make sure we are not detecting an enchant.
					candidates[k] = tonumber(statsInTooltip[k])
				end
			end
			for x,y in pairs(candidates) do
				if y == math.floor(sourceAmount*0.4) then
					destinationStat = x
					destAmount = tonumber(statsInTooltip[x])
				end

			end
			if sourceStat ~= "" and destinationStat ~= "" then
				--print("This item has reforged "..sourceStat.." to "..destinationStat)
				break
			end
		end	
	
		return sourceStat, destinationStat, tonumber(sourceAmount), tonumber(destAmount), reforgeAmounts
	end
	MiLVL_Hidden_Tooltip:ClearLines();
	MiLVL_Hidden_Tooltip:Hide();
	--print("Failed to find values")
	return "", "", 0, 0, reforgeAmounts
end

local function DoesReforgeBreakCap(sourceStat, sourceAmount)
	--if we reduce the sourceStat by to 60% of its value, do we fall below cap?
	local fallsBelowCap = false
	local reducedValue = sourceAmount*0.4
	local ratingtotal = 0
	if MiLVL_PlayerRole == "CASTER" and (sourceStat == "HitRating" or (ClassConvertsSpiritToHit and sourceStat == "Spirit"))  then
		ratingtotal = GetCombatRating(CR_HIT_SPELL)
	else
		ratingtotal = GetCombatRating(CR_HIT_MELEE)
	end	
	
	
	if sourceStat == "Expertise" then
		ratingtotal = GetCombatRating(CR_EXPERTISE)
		if (ratingtotal-reducedValue) < ExpertiseRatingCap then
			--print("Reforging this item would break the Expertise Cap")
			fallsBelowCap = true
		end
		
	elseif sourceStat == "HitRating" then
		--ratingtotal = GetCombatRating(CR_HIT_MELEE)
		if (ratingtotal-reducedValue) < HitRatingCap then
			--print("Reforging this item would break the Hit Cap")
			fallsBelowCap = true
		end
	elseif sourceStat == "Spirit" then
		--ratingtotal = GetCombatRating(CR_HIT_MELEE)
		if (ratingtotal-reducedValue) < HitRatingCap then
			--print("Reforging this item would break the Hit Cap")
			fallsBelowCap = true
		end
	end
	
	return fallsBelowCap
end

local function DoesChangingReforgeBreakCap(destinationS, destA)
	--if we reduce the sourceStat by to 60% of its value, do we fall below cap?
	local fallsBelowCap = false
	local ratingtotal = 0


	if MiLVL_PlayerRole == "CASTER" and (destinationS == "HitRating" or destinationS == "Hit Rating" or destinationS == "Spirit") then
		ratingtotal = GetCombatRating(CR_HIT_SPELL)
	else
		ratingtotal = GetCombatRating(CR_HIT_MELEE)
	end	
	
	if itemIsReforged then
		if destinationS == "HitRating" or destinationS == "Hit Rating" or destinationS == "Spirit" then
											  
			if (ratingtotal-destA) < HitRatingCap then
				--print("Changing the reforge of this item would break the Hit Cap")
				fallsBelowCap = true
			end
		elseif destinationS == "Expertise" then
			ratingtotal = GetCombatRating(CR_EXPERTISE)
			if (ratingtotal-destA) < ExpertiseRatingCap then
				--print("Reforging this item differently would break the Expertise Cap")
				fallsBelowCap = true
			end		
		end
	end
	
	return fallsBelowCap
end

local function GetDualWieldScore(itemLink, itemScore)
	local score = 0
	local offhand = false
	if comparingDualWield and MiLVL_iEquipLoc == "INVTYPE_WEAPON" then
		--print("In dual wield")		
		--ComparedItem
		local comparedItemSpeed = GetWeaponSpeed(itemLink)
		local comparedItemMhScore = ScoreWeaponSpeed(comparedItemSpeed, false) + itemScore
		local comparedItemOhScore = ScoreWeaponSpeed(comparedItemSpeed, true) + itemScore

		--mainHand
		local mainHandSpeed = GetWeaponSpeed(equipLinks.mainhandEquipLink)
		local mainHandSpeedScore = ScoreWeaponSpeed(mainHandSpeed, false) + equipScores.MiLVL_Score_MainhandEquip 
		--equipScores.MiLVL_Score_MainhandEquip = mainHandSpeedScore + equipScores.MiLVL_Score_MainhandEquip 
		
		--offHand
		local offHandSpeed = GetWeaponSpeed(equipLinks.offhandEquipLink)
		local offHandSpeedScore = ScoreWeaponSpeed(offHandSpeed, true)	+ equipScores.MiLVL_Score_OffhandEquip
		--equipScores.MiLVL_Score_OffhandEquip = offHandSpeedScore + equipScores.MiLVL_Score_OffhandEquip
		
		--print("comparedItemMhScore "..comparedItemMhScore)
		--print("comparedItemOhScore "..comparedItemOhScore)
		--print("MainhandEquip "..equipScores.MiLVL_Score_MainhandEquip)
		--print("OffhandEquip "..equipScores.MiLVL_Score_OffhandEquip)
		
		if selfComparison then
			if itemLink == equipLinks.mainhandEquipLink then
				mainHandSpeedScore = ScoreWeaponSpeed(mainHandSpeed, false) + itemScore 
				equipScores.MiLVL_Score_MainhandEquip = mainHandSpeedScore
				score = mainHandSpeedScore
				offhand = false
			elseif itemLink == equipLinks.offhandEquipLink then
				offHandSpeedScore = ScoreWeaponSpeed(offHandSpeed, true)	+ itemScore 
				equipScores.MiLVL_Score_OffhandEquip = offHandSpeedScore
				score = offHandSpeedScore
				offhand = true
			end
			return score, offhand
		end
		
		if comparedItemMhScore > comparedItemOhScore then
			--print("Compared Item is better as Mainhand")			
			--Score as a Main-Hand
			score = comparedItemMhScore
			
			
			--This should not be figured out here, --Compare to Main-Hand
			--if comparedItemMhScore > mainHandSpeedScore then
			--	print("Compared Item is better than Main-Hand")
			--end
		elseif comparedItemMhScore < comparedItemOhScore then
			--print("Compared Item is better as Offhand")
			--if comparedItemOhScore >  offHandSpeedScore  then
			--	print("Compared Item is better than Off-Hand")
			--end
			score = comparedItemOhScore
			offhand = true
		end
		--if itemScore > equipScores.MiLVL_Score_MainhandEquip and itemScore > equipScores.MiLVL_Score_OffhandEquip then
		--	answer = "|cff00FF00Better than both|r"
		--elseif itemScore > equipScores.MiLVL_Score_MainhandEquip and itemScore < equipScores.MiLVL_Score_OffhandEquip then
		--	answer = "|cff00FF00Better than Offhand|r"
		--elseif itemScore < equipScores.MiLVL_Score_MainhandEquip and itemScore > equipScores.MiLVL_Score_OffhandEquip then
		--	answer = "|cff00FF00Better than Mainhand|r"
		--end
	end
	return score, offhand
end

local function GetClassUpgradeAnswer(itemScore, currentClassValue)
	local answer = "No Opinion"
	if itemScore == currentClassValue then
		answer = "|cFFFFFFFFSide-Grade|r"
	elseif itemScore < currentClassValue then 
		answer = "|cffFF0000No|r"
	elseif itemScore > currentClassValue then 
		answer = "|cff00FF00Yes|r"
	end
	if MiLVL_ReforgeScore > 0 then
		if itemScore < currentClassValue and MiLVL_ReforgeScore > currentClassValue then 
			answer = "|cffFF7E40Requires Reforge|r"
		end
	end
	--if comparingDualWield and MiLVL_iEquipLoc == "INVTYPE_WEAPON" then
	--	--print("In dual wield")
	--	local speed = GetWeaponSpeed(itemLink)
	--	local mhScore = ScoreWeaponSpeed(speed, false)
	--	local ohScore = ScoreWeaponSpeed(speed, true)
	--	if mhScore > ohScore then
	--		print("Item is better as Mainhand")
	--		print(mhScore.." vs "..ohScore)
	--	else
	--		print("Item is better as Offhand")
	--		print(mhScore.." vs "..ohScore)
	--	end
	--	if itemScore > equipScores.MiLVL_Score_MainhandEquip and itemScore > equipScores.MiLVL_Score_OffhandEquip then
	--		answer = "|cff00FF00Better than both|r"
	--	elseif itemScore > equipScores.MiLVL_Score_MainhandEquip and itemScore < equipScores.MiLVL_Score_OffhandEquip then
	--		answer = "|cff00FF00Better than Offhand|r"
	--	elseif itemScore < equipScores.MiLVL_Score_MainhandEquip and itemScore > equipScores.MiLVL_Score_OffhandEquip then
	--		answer = "|cff00FF00Better than Mainhand|r"
	--	end
	--
	--end
	return answer
end


local function ScoreHitOnItem(itemLink) 
	local itemStats = GetItemStats(itemLink)
	--Get +hit from item hovered
	
	local hitOnItemHovered = 0
	local hitOnItemEquipped = 0
	local equippedItemStats = nil
	local hitThatHasValue = 0
	local hitScore = 0
	local achievesCap = false
	
	if itemIsReforged then
	--if IsItemReforged(itemLink) then
		local sourceStat, destinationStat, sourceAmount, destAmount, _ = GetReforgeInfo(itemLink)
		if sourceStat == "Hit Rating" then
			local intH, decH = math.modf(tonumber(sourceAmount*0.6))
			hitOnItemHovered = hitOnItemHovered + intH
			--hitOnItemEquipped = int
		end
		if destinationStat == "Hit Rating" then
			local intH, decH = math.modf(tonumber(destAmount))
			hitOnItemHovered = hitOnItemHovered + intH
			--hitOnItemEquipped = int
		end
		if ClassConvertsSpiritToHit then
			if sourceStat == "Spirit"  then
				local intS, decS = math.modf(sourceAmount*0.6)
				hitOnItemHovered = hitOnItemHovered + intS
			end
			if destinationStat == "Spirit" then
				local intS, decS = math.modf(destAmount)
				hitOnItemHovered = hitOnItemHovered + intS
			end			
		end
		--hitOnItemHovered = hitOnItemHovered + (MiLVL_ItemStats["ITEM_MOD_HIT_RATING"] or 0)
	else
		hitOnItemHovered = (MiLVL_ItemStats["ITEM_MOD_HIT_RATING"] or 0)
	end
	
	if ClassConvertsSpiritToHit then 
		hitOnItemHovered = hitOnItemHovered + (MiLVL_ItemStats["ITEM_MOD_SPIRIT_SHORT"] or 0)
	end

	if equippedItemLink ~= nil then
		equippedItemStats = GetItemStats(equippedItemLink) 
	end
	
	--Get +hit from the item equipped
	if selfComparison then
		hitOnItemEquipped = hitOnItemHovered
	elseif equippedItemStats ~= nil then
		hitOnItemEquipped = hitOnItemEquipped + (equippedItemStats["ITEM_MOD_HIT_RATING"] or 0)
		if ClassConvertsSpiritToHit then 
			hitOnItemEquipped = hitOnItemEquipped + (equippedItemStats["ITEM_MOD_SPIRIT_SHORT"] or 0)
		end	
		if IsItemReforged(equippedItemLink) then
			local sourceStat, destinationStat, sourceAmount, destAmount, _ = GetReforgeInfo(equippedItemLink)
			if sourceStat ~= nil and sourceStat ~= "" then
				if sourceStat == "Hit Rating" then
					local intH, decH = math.modf(tonumber(sourceAmount*0.6))
					hitOnItemEquipped = hitOnItemEquipped + intH
				end
			end
			if destinationStat ~= nil and destinationStat ~= "" then
				if destinationStat == "Hit Rating" then
					hitOnItemEquipped = hitOnItemEquipped + destAmount
				end
			end
			if ClassConvertsSpiritToHit then 	
				if sourceStat ~= nil and sourceStat ~= "" then
					if sourceStat == "Spirit" then
						local intS, decS = math.modf(tonumber(sourceAmount*0.6))
						hitOnItemEquipped = hitOnItemEquipped + intS
					end
				end
				if destinationStat ~= nil and destinationStat ~= "" then
					if destinationStat == "Spirit" then
						hitOnItemEquipped = hitOnItemEquipped + destAmount
					end
				end
			end		
		end
	end

--Strength
	local str, _, _, _ = UnitStat("player", 1);
--Agility
	local agi, _, _, _ = UnitStat("player", 2);
--Intellect
	local int, _, _, _ = UnitStat("player", 4);
	
	local mhr = 0
	if str > int or agi > int then
		--Get the total +hit rating for the Player
		mhr = GetCombatRating(CR_HIT_MELEE)
	else
		mhr = GetCombatRating(CR_HIT_SPELL)
	end

	--Subtract the +hit on the equipped item from the total player hit rating, then add the +hit from item hovered to guess how much hit we will have.
	local hitGuess = (mhr - hitOnItemEquipped) + hitOnItemHovered


	--hitDiff is set to the amount of hit OVER or UNDER the required amount
	local hitDiff = hitGuess - HitRatingCap

	if hitDiff >= 0 then --we are at or over cap
		--Subtract the amount of excess +Hit from the item stats
		if hitDiff >= hitOnItemHovered then
			hitThatHasValue = 0
			--print("Over cap by enough that the hit on this item doesnt matter")
		else
			hitThatHasValue = (hitDiff - hitOnItemHovered)
			--print("Hit on this item matters: "..math.abs(hitThatHasValue))
		end
		hitThatHasValue = math.abs(hitThatHasValue)
		if hitThatHasValue > 0  then
			achievesCap = true
			hitScore = hitScore + (StatWeightsUI.HitRating * hitThatHasValue)
		elseif hitThatHasValue <= 0 then
			achievesCap = false
			hitScore = 0		
		end		
	elseif hitDiff < 0 then --we are under cap
		--the value of hit on the item hovered will not exceed hit cap, so use all the +hit on the item.
		hitThatHasValue = hitOnItemHovered
		hitScore = hitScore + (StatWeightsUI.HitRating * hitOnItemHovered)
		achievesCap = false
	end

	return hitThatHasValue, hitScore, achievesCap
end

local function ScoreExpertiseOnItem(itemLink) 
	local itemStats = GetItemStats(itemLink)
	--Get +expertise from item hovered
	local expertiseOnItemHovered = 0
	local expertiseOnItemEquipped = 0
	local equippedItemStats = nil
	local expertiseThatHasValue = 0
	local expertiseScore = 0
	local achievesCap = false
	
	if itemIsReforged then
	--if IsItemReforged(itemLink) then
		local sourceStat, destinationStat, sourceAmount, destAmount, _ = GetReforgeInfo(itemLink)

		--print(math.floor((sourceAmount*0.6)+0.5))

		if sourceStat == "Expertise Rating" then
			--local intE, decE = math.modf(tonumber(sourceAmount*0.6))
			local intE = math.floor((sourceAmount*0.6)+0.5)
			expertiseOnItemHovered = intE
		else
			expertiseOnItemHovered = (itemStats["ITEM_MOD_EXPERTISE_RATING"] or 0)
		end
		
		if destinationStat == "Expertise Rating" then
			local intE, decE = math.modf(tonumber(destAmount))
			expertiseOnItemHovered = intE
		end
	else
		expertiseOnItemHovered = (itemStats["ITEM_MOD_EXPERTISE_RATING"] or 0)
	end

	if equippedItemLink ~= nil then
		equippedItemStats = GetItemStats(equippedItemLink) 
	end
	--Get +expertise from the item equipped
	--equippedItemLink == itemLink
	if selfComparison then
		expertiseOnItemEquipped = expertiseOnItemHovered
	elseif equippedItemStats ~= nil then
		expertiseOnItemEquipped = (equippedItemStats["ITEM_MOD_EXPERTISE_RATING"] or 0)
	end
	
	--Get the total +expertise rating for the Player
	local mer = GetCombatRating(CR_EXPERTISE)
	
	--Subtract the +expertise on the equipped item from the total player expertise rating, then add the +expertise from item hovered to guess how much expertise we will have.
	local expGuess = (mer - expertiseOnItemEquipped) + expertiseOnItemHovered

	--expDiff is set to the amount of expertise OVER or UNDER the required amount
	--local expDiff = expGuess - PlayerExpertiseRequired
	local expDiff = expGuess - ExpertiseRatingCap

	if expDiff >= 0 then --we are over cap
		--Subtract the amount of excess +expertise from the item stats
		if expDiff >= expertiseOnItemHovered then
			expertiseThatHasValue = 0
		else
			expertiseThatHasValue = (expDiff - expertiseOnItemHovered)
		end
		expertiseThatHasValue = math.abs(expertiseThatHasValue)

		if expertiseThatHasValue > 0  then
			achievesCap = true
			expertiseScore = expertiseScore + (StatWeightsUI.Expertise * expertiseThatHasValue)
		elseif expertiseThatHasValue <= 0 then
			achievesCap = false
			expertiseScore = 0
		end	
		
	elseif expDiff < 0 then --we are under cap
		--the value of hit on the item hovered will not exceed hit cap, so use all the +hit on the item.
		expertiseThatHasValue = expertiseOnItemHovered
		expertiseScore = expertiseScore + (StatWeightsUI.Expertise * expertiseOnItemHovered)
		achievesCap = false
	end
	
	return expertiseThatHasValue, expertiseScore, achievesCap
end

local function CalculateReforge()
	local reforgedStatValue = 0
	local reforgedScore = 0
	local originalStatValue = 0
	
	local lowestStatWeight, lowestStatName = GetLowestStatWeight(statWeights)
	--print("lowestStatName "..lowestStatName)
	local heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, lowestStatName, statWeights)
	
	originalStatValue = Stats[lowestStatName] * reforgeAmounts[sourceStat]				
	reforgedStatValue = (reforgeAmounts[sourceStat] * 0.4)*Stats[heaviestStatName]
	reforgedScore = (score - (originalStatValue* 0.4)) + reforgedStatValue

end

--If the item is reforged, get the current value, if the item is not reforged, return the best value.																									 
local function GetReforgeValue(itemLink, score)
	local itemStats = GetItemStats(itemLink)
	local reforgeCorrect = false
	local reforgedStatValue = 0
	local reforgedScore = 0
	local originalStatValue = 0
	local statWeights = {}

	local reforgeAmounts = {}
	--reforgeAmounts["Spirit"] = 0
	--reforgeAmounts["Mastery"] = 0
	--reforgeAmounts["Expertise Rating"] = 0
	--reforgeAmounts["Critical Strike Rating"] = 0
	--reforgeAmounts["Haste Rating"] = 0
	--reforgeAmounts["Hit Rating"] = 0
	--reforgeAmounts["Dodge Rating"] = 0
	--reforgeAmounts["Parry Rating"] = 0
	
	local breaksHitCap = false
	local breaksExpertiseCap = false
	--Get information about caps
	local expertiseThatHasValue, expertiseScore, achievesExpertiseCap = ScoreExpertiseOnItem(itemLink)
	--local hitThatHasValue, hitScore, achievesHitCap = ScoreHitOnItem(itemStats)
	local hitThatHasValue, hitScore, achievesHitCap = ScoreHitOnItem(itemLink)

	--If the stat is already present on the item, then it is available to be reforged
	if itemStats["ITEM_MOD_SPIRIT_SHORT"] ~= nil then
		statWeights["Spirit"] 		= Stats.Spirit
		if ClassConvertsSpiritToHit then
			breaksHitCap = DoesReforgeBreakCap("HitRating", itemStats["ITEM_MOD_SPIRIT_SHORT"])		
		end
	else
		if ClassConvertsSpiritToHit then
			if hitThatHasValue > 0 then
				--print("hit Has Value")
				breaksHitCap = DoesChangingReforgeBreakCap("HitRating", hitThatHasValue)
				--achievesHitCap is false if under cap, breaksHitCap is true if reforging this item you will still be under cap.
				if achievesHitCap and breaksHitCap then
					reforgeCorrect = true
				end
			end
		end	
	end
	if itemStats["ITEM_MOD_EXPERTISE_RATING"]  ~= nil  then
		breaksExpertiseCap = DoesReforgeBreakCap("Expertise", itemStats["ITEM_MOD_EXPERTISE_RATING"])	
		if not breaksExpertiseCap then			
			statWeights["Expertise"] 	= Stats.Expertise
		else
			statWeights["Expertise"] 	= StatWeightsUI.Expertise
		end
	else
		if expertiseThatHasValue > 0 then
			breaksExpertiseCap = DoesChangingReforgeBreakCap("Expertise", expertiseThatHasValue)
			--print(breaksExpertiseCap)
			if achievesExpertiseCap and breaksExpertiseCap then
				--print("Expertise Shortcut")
				reforgeCorrect = true
			end
		end	
	end
	if itemStats["ITEM_MOD_CRIT_RATING"]  ~= nil then
		statWeights["CritRating"] 	= Stats.CritRating
	end
	if itemStats["ITEM_MOD_HASTE_RATING"]  ~= nil then
		statWeights["HasteRating"] 	= Stats.HasteRating
	end
	if itemStats["ITEM_MOD_MASTERY_RATING_SHORT"]  ~= nil then
		statWeights["MasteryRating"]= Stats.MasteryRating
	end
	if itemStats["ITEM_MOD_HIT_RATING"]  ~= nil then
		breaksHitCap = DoesReforgeBreakCap("HitRating", itemStats["ITEM_MOD_HIT_RATING"])	
		if not breaksHitCap then			
			statWeights["HitRating"] 	= Stats.HitRating
		else
			statWeights["HitRating"] 	= StatWeightsUI.HitRating
		end			
	else
		--print("Checking hitThatHasValue "..hitThatHasValue.." does this item achieve cap?: "..tostring(achievesHitCap))
		if hitThatHasValue > 0 then
			breaksHitCap = DoesChangingReforgeBreakCap("HitRating", hitThatHasValue)

			if achievesHitCap and breaksHitCap then
				--print("Shortcut where the item doesnt have hit")
				reforgeCorrect = true
			end
		end      	
	end
	if itemStats["ITEM_MOD_DODGE_RATING"]  ~= nil then
		statWeights["DodgeRating"] 	= Stats.DodgeRating
	end
	if itemStats["ITEM_MOD_PARRY_RATING"]  ~= nil then
		statWeights["ParryRating"] 	= Stats.ParryRating
	end
	
	local count = 0
    for _, _ in pairs(statWeights) do
        count = count + 1
    end
	
	if count == 0 then
		MiLVL_Hidden_Tooltip:ClearLines();
		MiLVL_Hidden_Tooltip:Hide()
		MiLVL_ReforgeSuggestion = "Cannot be reforged"
		MiLVL_Reforge = false
		return 0, false
	end
	local lowestStatWeight, lowestStatName = GetLowestStatWeight(statWeights)
	local heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, lowestStatName, statWeights)
	
	
	local sourceStat = ""
	local destinationStat = ""
	local destAmount = 0
	local sourceAmount = 0
	
	if lowestStatName ~= "" then
		sourceStat, destinationStat, sourceAmount, destAmount, reforgeAmounts = GetReforgeInfo(itemLink)
		
		local sStat = false
		local dStat = false
		--If the item is reforged, we need to get its current score, and whether or not the reforge is correct.
		--DO NOT USE IsItemReforged(itemLink) here: this is intentional
		if itemIsReforged and sourceStat ~= "" then
			--is it correctly reforged?
			if sourceStat == statAlias[lowestStatName] or sourceStat == lowestStatName then
				sStat = true
			else
				if ClassUsesHitCap then	
					if lowestStatName == "HitRating" then
						if hitThatHasValue > 0 then
							breaksHitCap = DoesChangingReforgeBreakCap("HitRating", reforgeAmounts[statAlias["HitRating"]])
							if achievesHitCap and breaksHitCap then
								sStat = true
							end
						end						
					end
					if ClassConvertsSpiritToHit then
						if lowestStatName == "Spirit" then
							if hitThatHasValue > 0 then
								breaksHitCap = DoesChangingReforgeBreakCap("HitRating", hitThatHasValue)
								if achievesHitCap and breaksHitCap then
									sStat = true
								end
							end						
						end
						if (lowestStatName == "HitRating" and sourceStat == "Spirit") or (sourceAmount == hitThatHasValue) then
							sStat = true
						end
						--if lowestStatName == "Spirit" and destinationStat == "Hit Rating" then
						if lowestStatName == "Spirit" then
							sStat = true
						end
					end
				end				
				if ClassUsesExpertiseCap then	
					if lowestStatName == "Expertise" then
						if expertiseThatHasValue > 0 then
							breaksExpertiseCap = DoesChangingReforgeBreakCap("Expertise", reforgeAmounts[statAlias["Expertise"]])
							if achievesExpertiseCap and breaksExpertiseCap then
								sStat = true
							end
						end						
					end
				end				
			end


			if destinationStat == statAlias[heaviestStatName] or destinationStat == heaviestStatName then				
				dStat = true
			else
				local reforgedHitValue = 0
				local reforgedHitScore = 0			
				if ClassUsesHitCap then	
					--The item is reforged, but it doesnt match the heaviest stat, this happens when close to caps.
					--Ensure that the item does not +Hit on it, and it can be reforged to +Hit
					if reforgeAmounts[statAlias["HitRating"]] == nil or reforgeAmounts[statAlias["HitRating"]] == 0 then
						--Are we being told to reforge to +Hit?
						if heaviestStatName == "HitRating" then
							--Get the correct type of +Hit Rating so we can determine the value of +Hit on the item.
							if MiLVL_PlayerRole == "CASTER" then
								reforgedHitValue =(Stats["HitRating"] * math.min(destAmount, (HitRatingCap - GetCombatRating(CR_HIT_SPELL))))
							else
								reforgedHitValue =(Stats["HitRating"] * math.min(destAmount, (HitRatingCap - GetCombatRating(CR_HIT_MELEE))))
							end
							--Recalc the score using the value of effective +Hit (and reduce the value of original stat)
							reforgedHitScore = (score - (originalStatValue* 0.4)) + reforgedHitValue
							
							--Get a record of what the heavy is now...
							local originalHeavyStatName = heaviestStatName
							local originalHeavyStatWeight = heaviestStatWeight
							
							--remove it from the list
							statWeights[heaviestStatName] = nil
							heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, heaviestStatName, statWeights)

							--Get the new value
							reforgedStatValue = (reforgeAmounts[statAlias[lowestStatName]] * 0.4)* (Stats[heaviestStatName]	or 0 )			
							reforgedScore = (score - (originalStatValue* 0.4)) + reforgedStatValue
							
							--If +Hit is more valuable, reset the values we changed above.
							if reforgedHitScore > reforgedScore then
								--heaviestStatName = originalHeavyStatName
								heaviestStatName = "HitRating"
								reforgedStatValue = reforgedHitValue
								--print("resetting to Hit because it was more valuable")
							elseif destinationStat == statAlias[heaviestStatName] or destinationStat == heaviestStatName then				
								dStat = true
							end
						--else
						--	print(destinationStat)
						--	if destinationStat == "Hit Rating" or (ClassConvertsSpiritToHit and destinationStat == "Spirit") then
						--		breaksHitCap = DoesChangingReforgeBreakCap(destinationStat, destAmount)
						--		print(breaksHitCap)
						--	end

						end
					end					
					if destAmount == hitThatHasValue then
						dStat = true
						--print("dStat is overridden")
					end
					--if not dStat and achievesHitCap or breaksHitCap then
					--	dStat = true
					--	print("Overload")
					--end
					
					--Does changing the reforge break the cap (and a cap stat is being altered)?
					
					breaksHitCap = DoesChangingReforgeBreakCap(destinationStat, destAmount)
					if breaksHitCap and sourceStat ~= "HitRating" then
						if sStat and heaviestStatName ~= "HitRating" then
							--print("Source is correct and reforging from hit or to something besides Hit will break the hit cap.")
							dStat = true
						end
					end
					if ClassConvertsSpiritToHit then
						if breaksHitCap and sourceStat ~= "Spirit" and sourceStat ~= "HitRating" then
							if sStat and not dStat and heaviestStatName ~= "Spirit" and heaviestStatName ~= "HitRating" then
								--print("Source is correct and reforging from Hit or Spirit to something besides Hit or Spirit will break the hit cap.")
								dStat = true
							end
						end
						if (heaviestStatName == "HitRating" and destinationStat == "Spirit") or (destAmount == hitThatHasValue) then
							dStat = true
						end
						if heaviestStatName == "Spirit" and destinationStat == "Hit Rating" then
							dStat = true
						end
					end
				end
				if ClassUsesExpertiseCap then
					--Ensure that the item does not +Expertise on it, and it can be reforged to +Expertise
					if reforgeAmounts[statAlias["Expertise"]] == nil or reforgeAmounts[statAlias["Expertise"]] == 0 then
						--Are we being told to reforge to +Expertise?
						if playerLevel <= 83 then					
							ExpertiseRatingCap = 468
						end						
						--Get the value of effective +Expertise 
						--local reforgedExpertiseValue =(Stats["Expertise"] * (ExpertiseRatingCap - GetCombatRating(CR_EXPERTISE)))
						local reforgedExpertiseValue =(Stats["Expertise"] * math.min(destAmount, (ExpertiseRatingCap - GetCombatRating(CR_EXPERTISE))))	--Recalc the score using the value of effective +Expertise (and reduce the value of original stat)
						local reforgedExpertiseScore = (score - (originalStatValue* 0.4)) + reforgedExpertiseValue
						if heaviestStatName == "Expertise" then
							
							--Get a record of what the heavy is now...
							local originalHeavyStatName = heaviestStatName
							local originalHeavyStatWeight = heaviestStatWeight
							
							--remove it from the list
							statWeights[heaviestStatName] = nil
							heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, heaviestStatName, statWeights)
							if heaviestStatName == "HitRating" then
								if reforgedExpertiseScore > reforgedHitScore then
									statWeights[heaviestStatName] = nil
									heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, heaviestStatName, statWeights)
								end
							end
							--Get the new value
							reforgedStatValue = (reforgeAmounts[statAlias[lowestStatName]] * 0.4)* (Stats[heaviestStatName]	or 0 )			
							reforgedScore = (score - (originalStatValue* 0.4)) + reforgedStatValue

							if reforgedExpertiseScore > reforgedScore then
								--heaviestStatName = originalHeavyStatName
								heaviestStatName = "Expertise"
								reforgedStatValue = reforgedExpertiseValue
							else			
								dStat = true
							end
						else
							if destinationStat == "Expertise Rating" then
								breaksExpertiseCap = DoesChangingReforgeBreakCap("Expertise", destAmount)
								if achievesExpertiseCap and breaksExpertiseCap then
									dStat = true
								end
							end
						end
					end
				end
			end
			
			if sStat and dStat then
				reforgeCorrect = true
			elseif not sStat and dStat then
				reforgeCorrect = false

				MiLVL_ReforgeSuggestion = "|cffFF0000Wrong Source Stat|r"
				MiLVL_Reforge = true

			elseif sStat and not dStat then
				reforgeCorrect = false

				MiLVL_ReforgeSuggestion = "|cffFF0000Destination Stat should be |r "..heaviestStatName
				MiLVL_Reforge = true
	
			elseif not sStat and not dStat then
				reforgeCorrect = false
				if ClassConvertsSpiritToHit and heaviestStatName == "HitRating" then
					heaviestStatName = "Spirit"
				end
				MiLVL_ReforgeSuggestion = lowestStatName.." to "..heaviestStatName
				MiLVL_Reforge = true	
				
			end	
			--
			originalStatValue = Stats[lowestStatName] * reforgeAmounts[sourceStat]
			reforgedStatValue = (reforgeAmounts[sourceStat] * 0.4)*Stats[heaviestStatName]
			reforgedScore = (score - (originalStatValue* 0.4)) + reforgedStatValue
			
			if reforgeCorrect then
				MiLVL_ReforgeSuggestion = "|cff00FF00Reforged Correctly|r"
				MiLVL_Reforge = true				
			end
			return reforgedScore, reforgeCorrect
		--elseif sourceStat == "" then
		--	print("sourceStat is empty")
		else
			--should it be reforged?
			local originalStatValue = Stats[lowestStatName] * reforgeAmounts[statAlias[lowestStatName]]
			reforgedStatValue = (reforgeAmounts[statAlias[lowestStatName]] * 0.4)*Stats[heaviestStatName]
			
			local reforgedHitValue = 0
			local reforgedHitScore = 0
			
			if ClassUsesHitCap then
				if reforgeAmounts[statAlias["HitRating"]] == nil or reforgeAmounts[statAlias["HitRating"]] == 0 then
					if heaviestStatName == "HitRating" then
						--if MiLVL_PlayerRole == "CASTER" then
						--	reforgedHitValue =(Stats["HitRating"] * (HitRatingCap - GetCombatRating(CR_HIT_SPELL)))
						--else
						--	reforgedHitValue =(Stats["HitRating"] * (HitRatingCap - GetCombatRating(CR_HIT_MELEE)))
						--end

						if MiLVL_PlayerRole == "CASTER" then
							reforgedHitValue =(Stats["HitRating"] * math.min((reforgeAmounts[statAlias[lowestStatName]] * 0.4), (HitRatingCap - GetCombatRating(CR_HIT_SPELL))))
						else
							reforgedHitValue =(Stats["HitRating"] * math.min((reforgeAmounts[statAlias[lowestStatName]] * 0.4), (HitRatingCap - GetCombatRating(CR_HIT_MELEE))))
						end						
						reforgedHitScore = (score - (originalStatValue* 0.4)) + reforgedHitValue
						
						--Get a record of what it is now...
						local originalHeavyStatName = heaviestStatName
						local originalHeavyStatWeight = heaviestStatWeight
						
						--remove it from the list
						statWeights[heaviestStatName] = nil
						heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, heaviestStatName, statWeights)

						--Get the new value
						reforgedStatValue = (reforgeAmounts[statAlias[lowestStatName]] * 0.4)* (Stats[heaviestStatName]	or 0 )			
						reforgedScore = (score - (originalStatValue* 0.4)) + reforgedStatValue

						if reforgedHitScore > reforgedScore then
							heaviestStatName = "HitRating"
							reforgedStatValue = reforgedHitValue
						end
					end
				end	
				if lowestStatName == "HitRating" or (ClassConvertsSpiritToHit and lowestStatName == "Spirit")then
					breaksHitCap = DoesReforgeBreakCap(lowestStatName, reforgeAmounts[statAlias[lowestStatName]])				
					if breaksHitCap then
						statWeights[lowestStatName] = nil
						lowestStatWeight, lowestStatName = GetLowestStatWeight(statWeights)
						heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, lowestStatName, statWeights)
						
						if lowestStatName == "" or lowestStatWeight >= heaviestStatWeight then
							--print("there is no lowest stat")
							lowestStatName = heaviestStatName
						end
					end
				end				
			end	
			if ClassUsesExpertiseCap then
				if reforgeAmounts[statAlias["Expertise"]] == nil or reforgeAmounts[statAlias["Expertise"]] == 0 then
				if playerLevel == 83 then					
					ExpertiseRatingCap = 468
				end
					--local reforgedExpertiseValue =(Stats["Expertise"] * (ExpertiseRatingCap - GetCombatRating(CR_EXPERTISE)))	
					local reforgedExpertiseValue =(Stats["Expertise"] * math.min((reforgeAmounts[statAlias[lowestStatName]] * 0.4), (ExpertiseRatingCap - GetCombatRating(CR_EXPERTISE))))
					local reforgedExpertiseScore = (score - (originalStatValue* 0.4)) + reforgedExpertiseValue		
						
					if heaviestStatName == "Expertise" then
					
						--Get a record of what it is now...
						local originalHeavyStatName = heaviestStatName
						local originalHeavyStatWeight = heaviestStatWeight
						
						--remove it from the list
						statWeights[heaviestStatName] = nil
						heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, heaviestStatName, statWeights)
						if heaviestStatName == "HitRating" then
							if reforgedExpertiseScore > reforgedHitScore then
								statWeights[heaviestStatName] = nil
								heaviestStatWeight, heaviestStatName = GetHighestStatWeight(true, heaviestStatName, statWeights)
							end
						end

						--Get the new value
						reforgedStatValue = (reforgeAmounts[statAlias[lowestStatName]] * 0.4)* (Stats[heaviestStatName]	or 0 )			
						reforgedScore = (score - (originalStatValue* 0.4)) + reforgedStatValue
							if reforgedExpertiseScore > reforgedScore or breaksExpertiseCap then
								heaviestStatName = "Expertise"
								reforgedStatValue = reforgedExpertiseValue
								statWeights[heaviestStatName] = StatWeightsUI.Expertise
							else						
						end
					else
						if reforgedExpertiseValue > reforgedHitValue then
							--print("Expertise is more valuable than hit")
							heaviestStatName = "Expertise"
							reforgedStatValue = reforgedExpertiseValue
							statWeights[heaviestStatName] = StatWeightsUI.Expertise
						end
						--We are being told to reforge to heaviestStatName and it is NOT expertise. 
						--If the Expertise on the item is required for cap, then achievesExpertiseCap will be true.
						--If 
						if achievesExpertiseCap and breaksExpertiseCap then
							dStat = true
						end					
					end
				end	
				if lowestStatName == "Expertise" then
					breaksExpertiseCap = DoesReforgeBreakCap("Expertise", reforgeAmounts[statAlias[lowestStatName]])
					if breaksExpertiseCap then
						--print("does hit work like this?")
						statWeights[lowestStatName] = nil
						lowestStatWeight, lowestStatName = GetLowestStatWeight(statWeights)
						if lowestStatName == "" then
							--print("there is no lowest stat")
							lowestStatName = heaviestStatName
						end
					end
				end
			end	
			
			--print("3--"..heaviestStatName.." Expertise being heavy ")

			reforgedScore = (score - (originalStatValue* 0.4)) + reforgedStatValue

			--if heaviestStatName == lowestStatName or breaksHitCap or breaksExpertiseCap then
			if heaviestStatName == lowestStatName then
				MiLVL_ReforgeSuggestion = "Do not Reforge"
				MiLVL_Reforge = false
				reforgeCorrect = true					
			elseif reforgedScore >= score then
				reforgeCorrect = false
				if ClassConvertsSpiritToHit and heaviestStatName == "HitRating" then
					heaviestStatName = "Spirit"
				end
				MiLVL_ReforgeSuggestion = lowestStatName.." to "..heaviestStatName
				MiLVL_Reforge = true
			elseif reforgedScore < score then
				MiLVL_ReforgeSuggestion = "Do not Reforge"
				MiLVL_Reforge = false
				reforgeCorrect = true
				--print("Do not Reforge")
				--print("reforging "..lowestStatName.." to "..heaviestStatName.." is worth "..reforgedStatValue.." vs "..originalStatValue.." Should it be reforged: "..tostring(MiLVL_Reforge) )
			end	
		end
	end

	return reforgedScore, reforgeCorrect
end

local function SetEquippedItemLink(equipLocation)
			--equipLocation is the item being hovered...
			local equippedLink = nil
			local currentClassValue = 0
			local equippedIlvl = 0
			local comparingRing = false
			local comparingTrinket = false
			local compareOffhand = false
			
			if equipLocation == "INVTYPE_HEAD" then
				equippedLink = equipLinks.headEquipLink
				currentClassValue = equipScores.MiLVL_Score_HeadEquip
				equippedIlvl = milvl_ilvl.HeadEquip
			elseif equipLocation == "INVTYPE_NECK" then
				equippedLink = equipLinks.neckEquipLink
				currentClassValue = equipScores.MiLVL_Score_NeckEquip
				equippedIlvl = milvl_ilvl.NeckEquip
			elseif equipLocation == "INVTYPE_CHEST" or equipLocation == "INVTYPE_ROBE" then
				equippedLink = equipLinks.chestEquipLink
				currentClassValue = equipScores.MiLVL_Score_ChestEquip
				equippedIlvl = milvl_ilvl.ChestEquip
			elseif equipLocation == "INVTYPE_SHOULDER" then
				equippedLink = equipLinks.shoulderEquipLink
				currentClassValue = equipScores.MiLVL_Score_ShoulderEquip
				equippedIlvl = milvl_ilvl.ShoulderEquip
			elseif equipLocation == "INVTYPE_WAIST" then
				equippedLink = equipLinks.waistEquipLink
				currentClassValue = equipScores.MiLVL_Score_WaistEquip
				equippedIlvl = milvl_ilvl.WaistEquip
			elseif equipLocation == "INVTYPE_LEGS" then
				equippedLink = equipLinks.legsEquipLink
				currentClassValue = equipScores.MiLVL_Score_LegsEquip
				equippedIlvl = milvl_ilvl.LegsEquip
			elseif equipLocation == "INVTYPE_FEET" then
				equippedLink = equipLinks.feetEquipLink
				currentClassValue = equipScores.MiLVL_Score_FeetEquip
				equippedIlvl = milvl_ilvl.FeetEquip
			elseif equipLocation == "INVTYPE_WRIST" then
				equippedLink = equipLinks.wristEquipLink
				currentClassValue = equipScores.MiLVL_Score_WristEquip
				equippedIlvl = milvl_ilvl.WristEquip
			elseif equipLocation == "INVTYPE_HAND" then
				equippedLink = equipLinks.handsEquipLink
				currentClassValue = equipScores.MiLVL_Score_HandsEquip
				equippedIlvl = milvl_ilvl.HandsEquip
			elseif equipLocation == "INVTYPE_FINGER" then
				equippedLink = nil
				comparingRing = true
				equippedItemLinks = {equipLinks.finger1EquipLink, equipLinks.finger2EquipLink}
				currentClassValue = math.min(equipScores.MiLVL_Score_Finger1Equip, equipScores.MiLVL_Score_Finger2Equip)
				equippedIlvl = math.min(milvl_ilvl.Finger1Equip, milvl_ilvl.Finger2Equip)				
			elseif equipLocation == "INVTYPE_TRINKET" then
				equippedLink = nil
				comparingTrinket = true
				equippedItemLinks = {equipLinks.trinket1EquipLink, equipLinks.trinket2EquipLink}
				currentClassValue = math.min(equipScores.MiLVL_Score_Trinket1Equip, equipScores.MiLVL_Score_Trinket2Equip)
				equippedIlvl = math.min(milvl_ilvl.Trinket1Equip, milvl_ilvl.Trinket2Equip)
			elseif equipLocation == "INVTYPE_CLOAK" then
				equippedLink = equipLinks.backEquipLink
				currentClassValue = equipScores.MiLVL_Score_BackEquip
				equippedIlvl = milvl_ilvl.BackEquip
			elseif equipLocation == "INVTYPE_2HWEAPON" or equipLocation == "INVTYPE_WEAPONMAINHAND" then
				--Here we get items that only go in Mainhand
				equippedLink = equipLinks.mainhandEquipLink
				currentClassValue = equipScores.MiLVL_Score_MainhandEquip
				equippedIlvl = milvl_ilvl.MainhandEquip
			elseif equipLocation == "INVTYPE_WEAPONOFFHAND" or equipLocation == "INVTYPE_HOLDABLE" or equipLocation == "INVTYPE_SHIELD" then
				if IsEquippedItemType("INVTYPE_2HWEAPON") then
					equippedLink = equipLinks.mainhandEquipLink
					currentClassValue = equipScores.MiLVL_Score_MainhandEquip
				else		
					equippedLink = equipLinks.offhandEquipLink
					currentClassValue = equipScores.MiLVL_Score_OffhandEquip
					equippedIlvl = milvl_ilvl.OffhandEquip
				end	
			elseif equipLocation == "INVTYPE_WEAPON" then
				equippedLink = nil
				equippedItemLinks = {equipLinks.mainhandEquipLink, equipLinks.offhandEquipLink}
				currentClassValue = math.min(equipScores.MiLVL_Score_MainhandEquip, equipScores.MiLVL_Score_OffhandEquip)
				equippedIlvl = math.min(milvl_ilvl.Finger1Equip, milvl_ilvl.Finger2Equip)			

			elseif equipLocation == "INVTYPE_QUIVER" or equipLocation == "INVTYPE_RELIC" or equipLocation == "INVTYPE_RANGED" or equipLocation == "INVTYPE_THROWN" or equipLocation == "INVTYPE_RANGEDRIGHT"  then
				equippedLink = equipLinks.rangedEquipLink
				currentClassValue = equipScores.MiLVL_Score_RangedEquip
				equippedIlvl = milvl_ilvl.RangedEquip
			end
			return equippedLink, currentClassValue, equippedIlvl, comparingRing, comparingTrinket, compareOffhand
end


--Retrieve Armor Value from Item
local function ExtractArmorValueFromTooltip(asd)

	local armorValue = 0
	MiLVL_Hidden_Tooltip:Show()
	MiLVL_Hidden_Tooltip:SetOwner(milvllocal_frame.frame, "ANCHOR_CURSOR")
	MiLVL_Hidden_Tooltip:SetHyperlink(asd)

	for i=1,MiLVL_Hidden_Tooltip:NumLines() do 
		local ttline = getglobal("MiLVL_Hidden_TooltipTextLeft" .. i) 	
		local text = ttline:GetText()
		if string.match(text, "(%d+) Armor") then
			armorValue = tonumber(GetNumbersFromText(text, "Armor"))
			break
		end	
	end
	MiLVL_Hidden_Tooltip:ClearLines();
	MiLVL_Hidden_Tooltip:Hide()
	return armorValue
end

--One of the core functions, scoring the item you are hovering over
local function ScoreItem(itemLink)

	if itemLink == nil then
		return
	end
	--print(itemLink)
	MiLVL_ItemStats = GetItemStats(itemLink)
	
	if MiLVL_ItemStats == nil then
		return 0
	end
	local tempScore = 0

	
	local hitOnItemEquipped = 0
	local hitOnItemHovered = 0
	local hitWithValue = 0
	local iType = ""
	local iSubType = ""
	local _, _, _, ilvl, _, iType,iSubType, _, itemLoc = GetItemInfo(itemLink)
	local equippedItemStats = nil
	
	
	--local itemIsReforged = IsItemReforged()

	--Check there is an item equipped in that slot, and its link has been set.
	if equippedItemLink ~= nil then
		equippedItemStats = GetItemStats(equippedItemLink) 
		if equippedItemLink == itemLink then
			selfComparison = true
		else
			selfComparison = false
		end
	elseif equippedItemLinks ~= nil then
		--If the item being compared matches an item being worn, set the tooltip to that item.
		local match = false
		for i = 1, #equippedItemLinks do
			if itemLink == equippedItemLinks[i] then
				equippedItemStats = GetItemStats(equippedItemLinks[i])
				equippedItemLink = equippedItemLinks[i]
				match = true
				selfComparison = true
				break
			end
		end
		--if a match isnt found, set it to the lower of the two values
		if not match then
			local lowestScoreItem = 0
			if itemLoc == "INVTYPE_TRINKET" then
				lowestScoreItem = math.min(equipScores.MiLVL_Score_Trinket1Equip, equipScores.MiLVL_Score_Trinket2Equip)
				if lowestScoreItem == equipScores.MiLVL_Score_Trinket1Equip then
					if equippedItemLinks[1] ~= nil then
						equippedItemStats = GetItemStats(equippedItemLinks[1])
						equippedItemLink = equippedItemLinks[1]
					end
				else
					if equippedItemLinks[2] ~= nil then
						equippedItemStats = GetItemStats(equippedItemLinks[2])
						equippedItemLink = equippedItemLinks[2]
					end
				end
			elseif itemLoc == "INVTYPE_FINGER" then
				lowestScoreItem = math.min(equipScores.MiLVL_Score_Finger1Equip, equipScores.MiLVL_Score_Finger2Equip)
				if lowestScoreItem == equipScores.MiLVL_Score_Finger1Equip then
					if equippedItemLinks[1] ~= nil then
						equippedItemStats = GetItemStats(equippedItemLinks[1])
						equippedItemLink = equippedItemLinks[1]
					end
				else
					if equippedItemLinks[2] ~= nil then
						equippedItemStats = GetItemStats(equippedItemLinks[2])
						equippedItemLink = equippedItemLinks[2]
					end
				end
			elseif itemLoc == "INVTYPE_WEAPONMAINHAND" or itemLoc == "INVTYPE_WEAPONOFFHAND" or itemLoc =="INVTYPE_WEAPON" then
				--print("need to assign weapon logic here.")
				weaponSpeed = GetWeaponSpeed(itemLink)
				lowestScoreItem = math.min(equipScores.MiLVL_Score_MainhandEquip, equipScores.MiLVL_Score_OffhandEquip)
				if lowestScoreItem == equipScores.MiLVL_Score_MainhandEquip then
					if equippedItemLinks[1] ~= nil then
						equippedItemStats = GetItemStats(equippedItemLinks[1])
						equippedItemLink = equippedItemLinks[1]
					end
				else
					if equippedItemLinks[2] ~= nil then
						equippedItemStats = GetItemStats(equippedItemLinks[2])
						equippedItemLink = equippedItemLinks[2]
					end
				end
			end
			selfComparison = false
		end
	else
		equippedItemStats = nil
	end
	
	if ClassUsesHitCap then 
		--Get +hit from item hovered
		--hitThatHasValue, hitScore, achievesHitCap
		local hitThatHasValue, hitScore, achievesHitCap = ScoreHitOnItem(itemLink)
		tempScore = tempScore + hitScore
		--print("hitThatHasValue: "..hitThatHasValue)
		--print("hitScore: "..hitScore)
		--print("achievesCap: "..tostring(achievesHitCap))
	else
		tempScore = tempScore + (Stats.HitRating     or 0)* (MiLVL_ItemStats["ITEM_MOD_HIT_RATING"] or 0)
	end
	
	if ClassUsesExpertiseCap then
		--expertiseThatHasValue, expertiseScore, achievesExpertiseCap
		local expertiseThatHasValue, expertiseScore, achievesExpertiseCap = ScoreExpertiseOnItem(itemLink)
		tempScore = tempScore + expertiseScore	
	end
	
	--If Armor is being scored...
	--If a Cloth/Leather/Mail/Plate armor piece has armor on it, score it as ARMOR
	if Stats.Armor > 0 and iType == "Armor" then	
		MiLVL_Item_Armor_Value = ExtractArmorValueFromTooltip(itemLink)
		if MiLVL_Item_Armor_Value > 0 then
			--MiLVL.Print("Has Armor Value")
			if iSubType ~= "Miscellaneous" and iSubType ~= "Idols" and iSubType ~= "Totems" and iSubType ~= "Librams" and iSubType ~= "Sigils" then 
				tempScore = tempScore + ((Stats.Armor)         or 0)* (MiLVL_ItemStats["ARMOR_TEMPLATE"] or MiLVL_Item_Armor_Value)
				--MiLVL.Print(tempScore)
			else
				tempScore = tempScore + ((Stats.BonusArmor)         or 0)* (MiLVL_ItemStats["ARMOR_TEMPLATE"] or MiLVL_Item_Armor_Value)
			end
		end
		MiLVL_Item_Armor_Value = 0
	end

	
	tempScore = tempScore + (Stats.Strength      or 0)* (MiLVL_ItemStats["ITEM_MOD_STRENGTH_SHORT"] or 0)
	tempScore = tempScore + (Stats.Agility       or 0)* (MiLVL_ItemStats["ITEM_MOD_AGILITY_SHORT"] or 0)
	tempScore = tempScore + (Stats.Stamina       or 0)* (MiLVL_ItemStats["ITEM_MOD_STAMINA_SHORT"] or 0)
	tempScore = tempScore + (Stats.Intellect     or 0)* (MiLVL_ItemStats["ITEM_MOD_INTELLECT_SHORT"] or 0)
	tempScore = tempScore + (Stats.Spirit        or 0)* (MiLVL_ItemStats["ITEM_MOD_SPIRIT_SHORT"] or 0)	
	tempScore = tempScore + (Stats.AttackPower   or 0)* (MiLVL_ItemStats["ITEM_MOD_ATTACK_POWER_SHORT"] or (MiLVL_ItemStats["ITEM_MOD_ATTACK_POWER"] or 0))
	--tempScore = tempScore + (Stats.Expertise     or 0)* (MiLVL_ItemStats["ITEM_MOD_EXPERTISE_RATING"] or 0)
	tempScore = tempScore + (Stats.CritRating	 or 0)* (MiLVL_ItemStats["ITEM_MOD_CRIT_RATING"] or 0)
	tempScore = tempScore + (Stats.HasteRating   or 0)* (MiLVL_ItemStats["ITEM_MOD_HASTE_RATING"] or 0)
	tempScore = tempScore + (Stats.MasteryRating or 0)* (MiLVL_ItemStats["ITEM_MOD_MASTERY_RATING_SHORT"] or 0)
	tempScore = tempScore + (Stats.SpellPower    or 0)* (MiLVL_ItemStats["ITEM_MOD_SPELL_POWER"] or 0)
	tempScore = tempScore + (Stats.Mp5           or 0)* (MiLVL_ItemStats["ITEM_MOD_POWER_REGEN0_SHORT"] or (MiLVL_ItemStats["ITEM_MOD_MANA_REGENERATION"] or 0)) 
	tempScore = tempScore + (Stats.SpellPen      or 0)* (MiLVL_ItemStats["ITEM_MOD_SPELL_PENETRATION"] or 0)
	tempScore = tempScore + (Stats.DefenseRating or 0)* (MiLVL_ItemStats["ITEM_MOD_DEFENSE_SKILL_RATING"] or 0)
	tempScore = tempScore + (Stats.DodgeRating   or 0)* (MiLVL_ItemStats["ITEM_MOD_DODGE_RATING"] or 0)
	tempScore = tempScore + (Stats.ParryRating   or 0)* (MiLVL_ItemStats["ITEM_MOD_PARRY_RATING"] or 0)
	tempScore = tempScore + (Stats.BlockRating   or 0)* (MiLVL_ItemStats["ITEM_MOD_BLOCK_RATING"] or 0)
	tempScore = tempScore + (Stats.Resilience    or 0)* (MiLVL_ItemStats["ITEM_MOD_RESILIENCE_RATING"] or 0)

	if localizedClass == "Hunter" then
		if itemLoc == "INVTYPE_RANGED" then
			tempScore = tempScore + (Stats.WeaponDPS     or 0)* (MiLVL_ItemStats["ITEM_MOD_DAMAGE_PER_SECOND_SHORT"] or 0)
		end
	else
		tempScore = tempScore + (Stats.WeaponDPS     or 0)* (MiLVL_ItemStats["ITEM_MOD_DAMAGE_PER_SECOND_SHORT"] or 0)
	end
	
	tempScore = tempScore + (Stats.FeralAtkPower or 0)* (MiLVL_ItemStats["ITEM_MOD_FERAL_ATTACK_POWER_SHORT"] or 0)

	--local stat, amount, length, cooldown = ""
	if itemLoc == "INVTYPE_TRINKET" then
		local effectiveStat = 0
		
		--Test with GameTooltip to account for scoring trinkets and marking them as scored.
		--Once this is good to go and most or all trinkets are getting scored, revert to MiLVL_Hidden_Tooltip 
		MiLVL_Hidden_Tooltip:ClearLines();
		MiLVL_Hidden_Tooltip:SetOwner(milvllocal_frame.frame, nil) 
		MiLVL_Hidden_Tooltip:SetHyperlink(itemLink)
		--GameTooltip:SetHyperlink(itemLink)
		local statSearch = {}
		statSearch["Critical Strike Rating"] 		= Stats.CritRating
		statSearch["Haste Rating"] 					= Stats.HasteRating
		statSearch["Spell Power"] 					= Stats.SpellPower
		statSearch["Strength"] 						= Stats.Strength
		statSearch["Agility"] 						= Stats.Agility
		statSearch["Stamina"] 						= Stats.Stamina
		statSearch["Intellect"] 					= Stats.Intellect
		statSearch["Spirit"] 						= Stats.Spirit
		statSearch["Attack Power"] 					= Stats.AttackPower
		statSearch["Expertise"] 					= Stats.Expertise
		statSearch["Hit Rating"] 					= Stats.HitRating
		statSearch["Mana per"] 						= Stats.Mp5
		statSearch["Defense Rating"]				= Stats.DefenseRating
		statSearch["Dodge Rating"] 					= Stats.DodgeRating
		statSearch["Dodge"] 						= Stats.DodgeRating
		statSearch["Parry Rating"] 					= Stats.ParryRating
		statSearch["Resilience"] 					= Stats.Resilience
		statSearch["Bonus Armor"]		 			= Stats.BonusArmor
		statSearch["Mastery Rating"]		 		= Stats.MasteryRating
		
		--for i=1,MiLVL_Hidden_Tooltip:NumLines() do 
		for i=4,MiLVL_Hidden_Tooltip:NumLines() do 
		
			local ttline = getglobal("MiLVL_Hidden_TooltipTextLeft" .. i) 	
			local text = ttline:GetText()
			local pattern1 = "^Use: "
			local pattern2 = "^Equip: "
			local pattern3 = "^Equip: I"
			local pattern4 = "^Equip: Y"

			--if text:find(pattern1 ) ~= nil then
			--	print("On Use Trinket found.")
			--end

			if text:find(pattern3 ) == nil and (text:find(pattern2 ) ~= nil or text:find(pattern1 ) ~= nil or text:find(pattern4) ~= nil) then
				--if not string.match(text, "*") then
					for k,v in pairs(statSearch) do
						if v > 0 then
							--MiLVL.Print(k:lower())
							--if text:find(k:lower() ) ~= nil then
							if text:find(k:lower() ) ~= nil or text:find(k ) ~= nil then
								local stat, amount, length, cooldown, multiplier = GetNumbersFromTrinketEffect(text, k:lower())
								--MiLVL.Print(text.." "..stat.." "..amount.." "..length.." "..cooldown.." "..multiplier)
								if amount ~= "" and amount ~= nil and tonumber(amount) > 0 then
									if length ~= "" and length ~= nil and tonumber(length) > 0 then					
										if cooldown ~= "" and cooldown ~= nil and tonumber(cooldown) > 0 then	
											length = tonumber(length)
											for t = 1, 60*cooldown do	
												if t <= length then
													effectiveStat = effectiveStat + amount
												end
											end
											effectiveStat = effectiveStat/(60*cooldown)
											tempScore = tempScore + (v or 0)* effectiveStat
											--text = text.." |cffFF0000*"
											local gttline = getglobal("GameTooltipTextLeft" .. i)											
											if gttline ~= nil then
												local gtText = gttline:GetText()
												if text == gtText then
													text = text.." |cffFF0000*"
													gttline:SetText(text)
												elseif itemIsReforged then
													gttline = getglobal("GameTooltipTextLeft" .. i+2)
													if gttline ~= nil then
														gtText = gttline:GetText()
														if text == gtText then
															text = text.." |cffFF0000*"
															gttline:SetText(text)
														end	
													end
													--break
												end
											end
											text =""
											--break
										else
											if tonumber(multiplier) ~= nil and tonumber(multiplier) > 0 then
												multiplier = tonumber(multiplier)
												--Start with 60 seconds...
												effectiveStat = 0
												for t = 1, 60 do
													if t < multiplier then
														effectiveStat = effectiveStat + (amount * i)
													else
														effectiveStat = effectiveStat + (amount * multiplier)
													end
												end
												effectiveStat = effectiveStat/60
												tempScore = tempScore + (v or 0)* effectiveStat
												--text = text.."  |cffFF0000*"
												local gttline = getglobal("GameTooltipTextLeft" .. i)
												if gttline ~= nil then
													local gtText = gttline:GetText()
													if gtText == text then
														text = text.."  |cffFF0000*"
														gttline:SetText(text)
													elseif itemIsReforged then
														gttline = getglobal("GameTooltipTextLeft" .. i+2)
														gtText = gttline:GetText()
														if text == gtText then
															text = text.." |cffFF0000*"
															gttline:SetText(text)
														end	
													end
												end
												text =""
												--break
											else 
											--stat, amount, length, cooldown, multiplier
												--print("This trinket has "..amount.." "..stat.." for "..length.." seconds")
												length = tonumber(length)
												for t = 1, 60 do	
													if t <= length then
														effectiveStat = effectiveStat + amount
													end
												end
												effectiveStat = effectiveStat/(60*0.75)
												tempScore = tempScore + (v or 0)* effectiveStat	
												local gttline = getglobal("GameTooltipTextLeft" .. i)
												if gttline ~= nil then
													local gtText = gttline:GetText()
													if gtText == text then
														--print(gtText)
														text = text.."  |cffFF0000*"
														gttline:SetText(text)
													elseif itemIsReforged then
														gttline = getglobal("GameTooltipTextLeft" .. i+2)
														gtText = gttline:GetText()
														if text == gtText then
															text = text.." |cffFF0000*"
															gttline:SetText(text)
														end															
													end

												end
												text =""
												
												--break
											end
										end
									end
								end
							end
						end
					end
				--end
			end
			
			text = ""
		end
		--GameTooltip:ClearLines();
		MiLVL_Hidden_Tooltip:ClearLines();
		MiLVL_Hidden_Tooltip:Hide();
	end
	
	--Sockets
	tempScore = tempScore + GetSocketValue(ilvl, selfComparison)
	
	--
	local offhand = nil
	local speedScore = 0
	if DualWieldClass and MiLVL_iEquipLoc == "INVTYPE_WEAPON" then		
		speedScore, offhand = GetDualWieldScore(itemLink, tempScore)
		--tempScore = tempScore + speedScore
	end
	return tempScore, speedScore, offhand
end


local rescan = false
--Analyze players gear scores it, and sets the value on character sheet.
local function MiLVL_Refresh()

	comparingDualWield = false

	--1 = head INVTYPE_HEAD
	if IsEquippedItemType("INVTYPE_HEAD") then 
		equippedItemLink = GetInventoryItemLink("player", 1);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.HeadEquip = ilvl
			equipLinks.headEquipLink = equippedItemLink
			equipScores.MiLVL_Score_HeadEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_HeadEquip)
				if rfScore > equipScores.MiLVL_Score_HeadEquip then
					equipScores.MiLVL_Score_HeadEquip = rfScore
				end
			end 
		else
			milvl_ilvl.HeadEquip = 0
			equipScores.MiLVL_Score_HeadEquip = 0
			equipLinks.headEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_HeadEquip = 0
		equipLinks.headEquipLink = nil
	end

	--2 = neck INVTYPE_NECK	
	if IsEquippedItemType("INVTYPE_NECK") then 
		equippedItemLink = GetInventoryItemLink("player", 2);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.NeckEquip = ilvl
			equipLinks.neckEquipLink = equippedItemLink
			equipScores.MiLVL_Score_NeckEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_NeckEquip)
				if rfScore > equipScores.MiLVL_Score_NeckEquip then
					equipScores.MiLVL_Score_NeckEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_NeckEquip = 0
			equipLinks.neckEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_NeckEquip = 0
		equipLinks.neckEquipLink = nil
	end

	--3 = shoulder INVTYPE_SHOULDER
	if IsEquippedItemType("INVTYPE_SHOULDER") then 
		equippedItemLink = GetInventoryItemLink("player", 3);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.ShoulderEquip = ilvl
			equipLinks.shoulderEquipLink = equippedItemLink
			equipScores.MiLVL_Score_ShoulderEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_ShoulderEquip)
				if rfScore > equipScores.MiLVL_Score_ShoulderEquip then
					equipScores.MiLVL_Score_ShoulderEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_ShoulderEquip = 0
			equipLinks.shoulderEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_ShoulderEquip = 0
		equipLinks.shoulderEquipLink = nil
	end
	
	--4 = shirt
	--5 = chest INVTYPE_CHEST INVTYPE_ROBE
	if IsEquippedItemType("INVTYPE_CHEST") or IsEquippedItemType("INVTYPE_ROBE") then 
		equippedItemLink = GetInventoryItemLink("player", 5);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.ChestEquip = ilvl
			equipLinks.chestEquipLink = equippedItemLink
			equipScores.MiLVL_Score_ChestEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_ChestEquip)
				if rfScore > equipScores.MiLVL_Score_ChestEquip then
					equipScores.MiLVL_Score_ChestEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_ChestEquip = 0
			equipLinks.chestEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_ChestEquip = 0
		equipLinks.chestEquipLink = nil
	end
	
	
	--6 = waist INVTYPE_WAIST
	if IsEquippedItemType("INVTYPE_WAIST") then 
		equippedItemLink = GetInventoryItemLink("player", 6);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.WaistEquip = ilvl
			equipLinks.waistEquipLink = equippedItemLink
			equipScores.MiLVL_Score_WaistEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_WaistEquip)
				if rfScore > equipScores.MiLVL_Score_WaistEquip then
					equipScores.MiLVL_Score_WaistEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_WaistEquip = 0
			equipLinks.waistEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_WaistEquip = 0
		equipLinks.waistEquipLink = nil
	end
	
	--7 = legs INVTYPE_LEGS
	if IsEquippedItemType("INVTYPE_LEGS") then 
		equippedItemLink = GetInventoryItemLink("player", 7);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.LegsEquip = ilvl
			equipLinks.legsEquipLink = equippedItemLink
			equipScores.MiLVL_Score_LegsEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_LegsEquip)
				if rfScore > equipScores.MiLVL_Score_LegsEquip then
					equipScores.MiLVL_Score_LegsEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_LegsEquip = 0
			equipLinks.legsEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_LegsEquip = 0
		equipLinks.legsEquipLink = nil
	end
 
	--8 = feet INVTYPE_FEET
	if IsEquippedItemType("INVTYPE_FEET") then 
		equippedItemLink = GetInventoryItemLink("player", 8);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.FeetEquip = ilvl
			equipLinks.feetEquipLink = equippedItemLink
			equipScores.MiLVL_Score_FeetEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_FeetEquip)
				if rfScore > equipScores.MiLVL_Score_FeetEquip then
					equipScores.MiLVL_Score_FeetEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_FeetEquip =0
			equipLinks.feetEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_FeetEquip =0
		equipLinks.feetEquipLink = nil
	end
	 
	 
	--9 = wrist INVTYPE_WRIST
	if IsEquippedItemType("INVTYPE_WRIST") then 
		equippedItemLink = GetInventoryItemLink("player", 9);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.WristEquip = ilvl
			equipLinks.wristEquipLink = equippedItemLink
			equipScores.MiLVL_Score_WristEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_WristEquip)
				if rfScore > equipScores.MiLVL_Score_WristEquip then
					equipScores.MiLVL_Score_WristEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_WristEquip = 0
			equipLinks.wristEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_WristEquip = 0
		equipLinks.wristEquipLink = nil
	end
	 
	 
	--10 = hands INVTYPE_HAND
	if IsEquippedItemType("INVTYPE_HAND") then 
		equippedItemLink = GetInventoryItemLink("player", 10);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.HandsEquip = ilvl
			equipLinks.handsEquipLink = equippedItemLink
			equipScores.MiLVL_Score_HandsEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_HandsEquip)
				if rfScore > equipScores.MiLVL_Score_HandsEquip then
					equipScores.MiLVL_Score_HandsEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_HandsEquip = 0
			equipLinks.handsEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_HandsEquip = 0
		equipLinks.handsEquipLink = nil
	end
	 
	 
	--11 = finger 1 INVTYPE_FINGER
	if IsEquippedItemType("INVTYPE_FINGER") then 
		equippedItemLink = GetInventoryItemLink("player", 11);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			--print(e)
			milvl_ilvl.Finger1Equip = ilvl
			equipLinks.finger1EquipLink = equippedItemLink
			equipScores.MiLVL_Score_Finger1Equip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_Finger1Equip)
				if rfScore > equipScores.MiLVL_Score_Finger1Equip then
					equipScores.MiLVL_Score_Finger1Equip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_Finger1Equip = 0
			equipLinks.finger1EquipLink = nil
		end
		
		equippedItemLink = GetInventoryItemLink("player", 12);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			--print(e)
			milvl_ilvl.Finger2Equip = ilvl
			equipLinks.finger2EquipLink = equippedItemLink
			equipScores.MiLVL_Score_Finger2Equip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_Finger2Equip)
				if rfScore > equipScores.MiLVL_Score_Finger2Equip then
					equipScores.MiLVL_Score_Finger2Equip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_Finger2Equip = 0
			equipLinks.finger2EquipLink = nil
		end
	else
		equipScores.MiLVL_Score_Finger1Equip = 0
		equipLinks.finger1EquipLink = nil
		equipScores.MiLVL_Score_Finger2Equip = 0
		equipLinks.finger2EquipLink = nil
	end
	 
	 
	--12 = finger 2
	--if IsEquippedItemType("INVTYPE_FINGER") then 
	--	equippedItemLink = GetInventoryItemLink("player", 12);
	--	if equippedItemLink ~= nil then
	--		local _, e, _, ilvl = GetItemInfo(equippedItemLink);
	--		milvl_ilvl.Finger2Equip = ilvl
	--		equipLinks.finger2EquipLink = e
	--		print(e)
	--		equipScores.MiLVL_Score_Finger2Equip = ScoreItem(equippedItemLink);
	--	else
	--		equipScores.MiLVL_Score_Finger2Equip = 0
	--		equipLinks.finger2EquipLink = nil
	--	end
	--else
	--	equipScores.MiLVL_Score_Finger2Equip = 0
	--	equipLinks.finger2EquipLink = nil
	--end
	 
	 
	--13 = trinket 1 INVTYPE_TRINKET
	if IsEquippedItemType("INVTYPE_TRINKET") then 
		equippedItemLink = GetInventoryItemLink("player", 13);
		if equippedItemLink ~= nil then
			--MiLVL.Print("Trinket Slot 1 Equipped")
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.Trinket1Equip = ilvl
			equipLinks.trinket1EquipLink = equippedItemLink
			equipScores.MiLVL_Score_Trinket1Equip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_Trinket1Equip)
				if rfScore > equipScores.MiLVL_Score_Trinket1Equip then
					equipScores.MiLVL_Score_Trinket1Equip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_Trinket1Equip = 0
			equipLinks.trinket1EquipLink = nil
		end

		equippedItemLink = GetInventoryItemLink("player", 14);
		if equippedItemLink ~= nil then
			--MiLVL.Print("Trinket Slot 2 Equipped")
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.Trinket2Equip = ilvl
			equipLinks.trinket2EquipLink = equippedItemLink
			equipScores.MiLVL_Score_Trinket2Equip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_Trinket2Equip)
				if rfScore > equipScores.MiLVL_Score_Trinket2Equip then
					equipScores.MiLVL_Score_Trinket2Equip = rfScore
				end
			end			
		else
			equipScores.MiLVL_Score_Trinket2Equip = 0
			equipLinks.trinket2EquipLink = nil
		end
		
	else
		--MiLVL.Print("No Trinkets Equipped")
		equipScores.MiLVL_Score_Trinket1Equip = 0
		equipLinks.trinket1EquipLink = nil
		equipScores.MiLVL_Score_Trinket2Equip = 0
		equipLinks.trinket2EquipLink = nil
	end
	 
	 
	-- --14 = trinket 2
	-- if IsEquippedItemType("INVTYPE_TRINKET") then 
		-- equippedItemLink = GetInventoryItemLink("player", 14);
		-- if equippedItemLink ~= nil then
			-- local _, e = GetItemInfo(equippedItemLink);
			-- equipLinks.trinket2EquipLink = e
			-- MiLVL_Score_Trinket2Equip = ScoreItem(equippedItemLink);
		-- else
			-- MiLVL_Score_Trinket2Equip = 0
			-- equipLinks.trinket2EquipLink = nil
		-- end
	-- else
		-- MiLVL_Score_Trinket2Equip = 0
		-- equipLinks.trinket2EquipLink = nil
	-- end
	 
	 
	--15 = back INVTYPE_CLOAK
	if IsEquippedItemType("INVTYPE_CLOAK") then 
		equippedItemLink = GetInventoryItemLink("player", 15);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.BackEquip = ilvl
			equipLinks.backEquipLink = e
			equipScores.MiLVL_Score_BackEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_BackEquip)
				if rfScore > equipScores.MiLVL_Score_BackEquip then
					equipScores.MiLVL_Score_BackEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_BackEquip = 0
			equipLinks.backEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_BackEquip = 0
		equipLinks.backEquipLink = nil
	end
	 
	 
	--16 = main hand INVTYPE_2HWEAPON 
	if IsEquippedItemType("INVTYPE_2HWEAPON") or IsEquippedItemType("INVTYPE_WEAPONMAINHAND") or IsEquippedItemType("INVTYPE_WEAPON") then 
		equippedItemLink = GetInventoryItemLink("player", 16);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.MainhandEquip = ilvl
			equipLinks.mainhandEquipLink = e
			equipScores.MiLVL_Score_MainhandEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_MainhandEquip)
				if rfScore > equipScores.MiLVL_Score_MainhandEquip then
					equipScores.MiLVL_Score_MainhandEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_MainhandEquip = 0
			equipLinks.mainhandEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_MainhandEquip = 0
		equipLinks.mainhandEquipLink = nil
	end
	 
	 
	
	if IsEquippedItemType("Off-Hand Weapon") or IsEquippedItemType("Off Hand") or IsEquippedItemType("Held In Off-hand") or IsEquippedItemType("INVTYPE_WEAPON") then
		--17 = off hand INVTYPE_WEAPONOFFHAND INVTYPE_SHIELD
		equippedItemLink = GetInventoryItemLink("player", 17);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl,_,iT = GetItemInfo(equippedItemLink);
			if iT == "Weapon" then
				comparingDualWield = true
			end
			milvl_ilvl.OffhandEquip = ilvl
			equipLinks.offhandEquipLink = e
			equipScores.MiLVL_Score_OffhandEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_OffhandEquip)
				if rfScore > equipScores.MiLVL_Score_OffhandEquip then
					equipScores.MiLVL_Score_OffhandEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_OffhandEquip = 0;
			equipLinks.offhandEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_OffhandEquip = 0;
		equipLinks.offhandEquipLink = nil
	end
	
	--18 = ranged/relic/idol
	if IsEquippedItemType("INVTYPE_RANGED") or IsEquippedItemType("INVTYPE_RELIC") or IsEquippedItemType("INVTYPE_THROWN") or IsEquippedItemType("INVTYPE_RANGEDRIGHT") then 
		equippedItemLink = GetInventoryItemLink("player", 18);
		if equippedItemLink ~= nil then
			local _, e, _, ilvl = GetItemInfo(equippedItemLink);
			milvl_ilvl.RangedEquip = ilvl
			equipLinks.rangedEquipLink = e
			equipScores.MiLVL_Score_RangedEquip = ScoreItem(equippedItemLink);
			if IsItemReforged(equippedItemLink) then
				local rfScore = GetReforgeValue(equippedItemLink, equipScores.MiLVL_Score_RangedEquip)
				if rfScore > equipScores.MiLVL_Score_RangedEquip then
					equipScores.MiLVL_Score_RangedEquip = rfScore
				end
			end
		else
			equipScores.MiLVL_Score_RangedEquip = 0
			equipLinks.rangedEquipLink = nil
		end
	else
		equipScores.MiLVL_Score_RangedEquip = 0
		equipLinks.rangedEquipLink = nil
	end
	
	--This is adding up RAW iLVL
	--MiLVL_Current_iLVL = EquipInfo.headEquip + EquipInfo.neckEquip + EquipInfo.shoulderEquip + EquipInfo.chestEquip + EquipInfo.waistEquip + EquipInfo.legsEquip + EquipInfo.feetEquip + EquipInfo.wristEquip + EquipInfo.handsEquip + EquipInfo.finger1Equip + EquipInfo.finger2Equip + EquipInfo.trinket1Equip + EquipInfo.trinket2Equip + EquipInfo.backEquip + EquipInfo.mainhandEquip + EquipInfo.rangedEquip + EquipInfo.offhandEquip

	SetMiLVLCurrentBase() --This is setting the NumberOfInvSlots variable
	--Current MiLVL Score
	--MiLVL_GearScore = (MiLVL_Score_HeadEquip + MiLVL_Score_NeckEquip + MiLVL_Score_ShoulderEquip + MiLVL_Score_ChestEquip + MiLVL_Score_WaistEquip + MiLVL_Score_LegsEquip + MiLVL_Score_FeetEquip + MiLVL_Score_WristEquip +  MiLVL_Score_HandsEquip + MiLVL_Score_Finger1Equip + MiLVL_Score_Finger2Equip + MiLVL_Score_Trinket1Equip + MiLVL_Score_Trinket2Equip + MiLVL_Score_BackEquip + MiLVL_Score_MainhandEquip + MiLVL_Score_OffhandEquip + MiLVL_Score_RangedEquip) / NumberOfInvSlots
	
	--If the player uses hit cap, scores may be wrong, so rescan
	if MiLVL_GearScore == 0 then
		rescan = ClassUsesHitCap
	end
	MiLVL_PlayerRole = IsPlayerCasterOrMelee()

	MiLVL_GearScore = (equipScores.MiLVL_Score_HeadEquip + equipScores.MiLVL_Score_NeckEquip + equipScores.MiLVL_Score_ShoulderEquip + equipScores.MiLVL_Score_ChestEquip + equipScores.MiLVL_Score_WaistEquip + equipScores.MiLVL_Score_LegsEquip + equipScores.MiLVL_Score_FeetEquip + equipScores.MiLVL_Score_WristEquip +  equipScores.MiLVL_Score_HandsEquip + equipScores.MiLVL_Score_Finger1Equip + equipScores.MiLVL_Score_Finger2Equip + equipScores.MiLVL_Score_Trinket1Equip + equipScores.MiLVL_Score_Trinket2Equip + equipScores.MiLVL_Score_BackEquip + equipScores.MiLVL_Score_MainhandEquip + equipScores.MiLVL_Score_OffhandEquip + equipScores.MiLVL_Score_RangedEquip) / NumberOfInvSlots

	--MiLVL_GearScore = (MiLVL_Score_HeadEquip + MiLVL_Score_NeckEquip + MiLVL_Score_ShoulderEquip + MiLVL_Score_ChestEquip + MiLVL_Score_WaistEquip + MiLVL_Score_LegsEquip + MiLVL_Score_FeetEquip + MiLVL_Score_WristEquip +  MiLVL_Score_HandsEquip + MiLVL_Score_Finger1Equip + MiLVL_Score_Finger2Equip + MiLVL_Score_BackEquip + MiLVL_Score_MainhandEquip + MiLVL_Score_OffhandEquip + MiLVL_Score_RangedEquip) / (NumberOfInvSlots - 2)
	local s_mls = tostring(MiLVL_GearScore)
	--MiLVL Score when equipped
	--MiLVL_GearScore = (headEquipIlvl + neckEquipIlvl + shoulderEquipIlvl + chestEquipIlvl + waistEquipIlvl + legsEquipIlvl + feetEquipIlvl + wristEquipIlvl + handsEquipIlvl + finger1EquipIlvl + finger2EquipIlvl + trinket1EquipIlvl + trinket2EquipIlvl + backEquipIlvl + mainhandEquipIlvl + rangedEquipIlvl + offhandEquipIlvl) / NumberOfInvSlots
	local truncated = tonumber(string.format("%.1f", s_mls))
	CharacterSheet_MiLVL:SetText("MiLVL: "..truncated)
	--if rescan then
		--return 
		--MiLVL_Refresh()
	--end
end

--For Death Knights --Frost is a capable tanking spec, but no talents really hint whether they are tank or DPS, so there is a button on the character sheet.
local function UseAltSpec()
	if UseTankWeights == true then
		UseTankWeights = false
		MiLVLDB.DB_UseTankWeights = false
		milvl_options.args.tab1.args.SpecButton2.func()
		--specButton:SetText("DPS")
		--MiLVLDB
		MiLVL.Print("DPS")
		MiLVL_Refresh()
	else
		UseTankWeights = true
		MiLVLDB.DB_UseTankWeights = true
		milvl_options.args.tab1.args.SpecButton3.func()
		--specButton:SetText("Tank")
		MiLVL.Print("Tank")
		MiLVL_Refresh()
	end
end

--Table to store the best score of items per slot
local bestGearTable = {	
INVTYPE_HEAD			= 0,
INVTYPE_NECK			= 0,
INVTYPE_SHOULDER		= 0,
INVTYPE_BODY			= 0,
INVTYPE_CHEST			= 0,
INVTYPE_WAIST			= 0,
INVTYPE_LEGS			= 0,
INVTYPE_FEET			= 0,
INVTYPE_WRIST			= 0,
INVTYPE_HAND			= 0,
INVTYPE_FINGER			= 0,
INVTYPE_TRINKET			= 0,
INVTYPE_WEAPON			= 0,
INVTYPE_SHIELD			= 0,
INVTYPE_RANGED			= 0,
INVTYPE_CLOAK			= 0,
INVTYPE_2HWEAPON		= 0,
INVTYPE_BAG			    = 0,
INVTYPE_TABARD			= 0,
INVTYPE_ROBE			= 0,
INVTYPE_WEAPONMAINHAND	= 0,
INVTYPE_WEAPONOFFHAND	= 0,
INVTYPE_HOLDABLE		= 0,
INVTYPE_AMMO			= 0,
INVTYPE_THROWN			= 0,
INVTYPE_RANGEDRIGHT		= 0,
INVTYPE_QUIVER			= 0,
INVTYPE_TRINKET2		= 0,
INVTYPE_FINGER2			= 0
}
--Table to store the LINK to the best scored items per slot
local bestLinkTable	= {	
INVTYPE_HEAD			= nil,
INVTYPE_NECK			= nil,
INVTYPE_SHOULDER		= nil,
INVTYPE_BODY			= nil,
INVTYPE_CHEST			= nil,
INVTYPE_WAIST			= nil,
INVTYPE_LEGS			= nil,
INVTYPE_FEET			= nil,
INVTYPE_WRIST			= nil,
INVTYPE_HAND			= nil,
INVTYPE_FINGER			= nil,
INVTYPE_TRINKET			= nil,
INVTYPE_WEAPON			= nil,
INVTYPE_SHIELD			= nil,
INVTYPE_RANGED			= nil,
INVTYPE_CLOAK			= nil,
INVTYPE_2HWEAPON		= nil,
INVTYPE_BAG			    = nil,
INVTYPE_TABARD			= nil,
INVTYPE_ROBE			= nil,
INVTYPE_WEAPONMAINHAND	= nil,
INVTYPE_WEAPONOFFHAND	= nil,
INVTYPE_HOLDABLE		= nil,
INVTYPE_AMMO			= nil,
INVTYPE_THROWN			= nil,
INVTYPE_RANGEDRIGHT		= nil,
INVTYPE_QUIVER			= nil


}

local MiLVL_UI_ListOfMemberFrames = {}

-- /milvl best attempts to equip the best scored gear you have in your bags
local function EquipBest()
	for k, v in pairs(bestLinkTable) do
		if bestLinkTable[k] ~= nil and bestLinkTable[k] ~= "" then
			local toEquip = bestLinkTable[k]
			if k == "INVTYPE_TRINKET" then
				if bestGearTable["INVTYPE_TRINKET"] > bestGearTable[k] then
					if IsEquippableItem(bestGearTable["INVTYPE_TRINKET"]) then
						EquipItemByName(bestGearTable["INVTYPE_TRINKET"])
					end
				elseif bestGearTable["INVTYPE_TRINKET2"] > bestGearTable[k] then
					if IsEquippableItem(bestGearTable["INVTYPE_TRINKET2"]) then
						EquipItemByName(bestGearTable["INVTYPE_TRINKET2"])
					end
				else
					if IsEquippableItem(bestGearTable[k]) then
						EquipItemByName(bestGearTable[k])
					end
				end
			elseif k == "INVTYPE_FINGER" then
				if bestGearTable["INVTYPE_FINGER"] > bestGearTable[k] then
					if IsEquippableItem(bestGearTable["INVTYPE_FINGER"]) then
						EquipItemByName(bestGearTable["INVTYPE_FINGER"])
					end
				elseif bestGearTable["INVTYPE_FINGER2"] > bestGearTable[k] then
					if IsEquippableItem(bestGearTable["INVTYPE_FINGER2"]) then
						EquipItemByName(bestGearTable["INVTYPE_FINGER2"])
					end
				else
					if IsEquippableItem(bestGearTable[k]) then
						EquipItemByName(bestGearTable[k])
					end
				end
			elseif k == "INVTYPE_2HWEAPON" then
				local combo = bestGearTable["INVTYPE_WEAPONMAINHAND"] + bestGearTable["INVTYPE_WEAPONOFFHAND"]
				if combo > bestGearTable[k] then
					EquipItemByName(bestGearTable["INVTYPE_WEAPONMAINHAND"])
					EquipItemByName(bestGearTable["INVTYPE_WEAPONOFFHAND"])
				else
					EquipItemByName(bestGearTable["INVTYPE_2HWEAPON"])
				end
			else
				if IsEquippableItem(toEquip) then
					EquipItemByName(toEquip)
				end
			end
		end
	end
end

local function ScoreBest()
	local gearChanged = false
	for i = 1, 19 do
		local ilink = GetInventoryItemLink("player", i);
		local _, iL, _, _, _, itemType, itemSubType, _, itemEquipLoc = GetItemInfo(tostring(ilink))
		if bestGearTable[itemEquipLoc] ~= nil and bestGearTable[itemEquipLoc] ~= "" then
			local buildScore = ScoreItem(iL)
			if buildScore > bestGearTable[itemEquipLoc] then
				--if its a trinket or ring, when replacing, write to second spot 
				--rings 11, 12
				--trinkets 13, 14
				if 1 == 12 then
					bestGearTable["INVTYPE_FINGER2"] = buildScore
					bestLinkTable["INVTYPE_FINGER2"] = iL
				elseif 1 == 14 then
					bestGearTable["INVTYPE_TRINKET2"] = buildScore
					bestLinkTable["INVTYPE_TRINKET2"] = iL
				else
					bestGearTable[itemEquipLoc] = buildScore
					bestLinkTable[itemEquipLoc] = iL
					--MiLVL.Print(itemEquipLoc)
				end
			end
		end
	end    


	for i=0,NUM_BAG_SLOTS do
		for j=1,C_Container.GetContainerNumSlots(i) do
			local ilink = C_Container.GetContainerItemLink(i,j)
			local _, iL, _, _, _, itemType, itemSubType, _, itemEquipLoc = GetItemInfo(tostring(ilink))
			if bestGearTable[itemEquipLoc] ~= nil and bestGearTable[itemEquipLoc] ~= "" then
				local buildScore = ScoreItem(iL)
				if itemEquipLoc == "INVTYPE_FINGER" then
					if buildScore > bestGearTable["INVTYPE_FINGER"] then
						bestGearTable["INVTYPE_FINGER"] = buildScore
						bestLinkTable["INVTYPE_FINGER"] = iL
						gearChanged = true
					elseif buildScore > bestGearTable["INVTYPE_FINGER2"] then
						bestGearTable["INVTYPE_FINGER2"] = buildScore
						bestLinkTable["INVTYPE_FINGER2"] = iL
						gearChanged = true
					end
				elseif itemEquipLoc == "INVTYPE_TRINKET" then
					if buildScore > bestGearTable["INVTYPE_TRINKET"] then
						bestGearTable["INVTYPE_TRINKET"] = buildScore
						bestLinkTable["INVTYPE_TRINKET"] = iL
						gearChanged = true
					elseif buildScore > bestGearTable["INVTYPE_TRINKET2"] then
						bestGearTable["INVTYPE_TRINKET2"] = buildScore
						bestLinkTable["INVTYPE_TRINKET2"] = iL
						gearChanged = true
					end
				else
					if buildScore > bestGearTable[itemEquipLoc] then
						bestGearTable[itemEquipLoc] = buildScore
						bestLinkTable[itemEquipLoc] = iL
						gearChanged = true
					end				
				end
			end
		end
	end
	
	EquipBest()
	return gearChanged
end

local function ScoreAndEquipBest()
   local gc = nil
   repeat
      gc = ScoreBest()
    until gc == false
    MiLVL.Print("Gear Changed = "..tostring(gc))
end

--local specButton = CreateFrame("CheckButton", "MiLVL_spec_Button", PaperDollFrame)
--specButton:SetPoint("BOTTOMRIGHT", PaperDollFrame, "BOTTOMRIGHT", -40, 80);
--specButton:SetWidth(90)
--specButton:SetHeight(30)
--
--specButton:SetText("DPS")
--specButton:SetNormalFontObject("GameFontNormal")
--specButton:Raise()
--
--local ntex = specButton:CreateTexture()
--ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
--ntex:SetTexCoord(0, 0.625, 0, 0.6875)
--ntex:SetAllPoints()	
--specButton:SetNormalTexture(ntex)
--
--local htex = specButton:CreateTexture()
--htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
--htex:SetTexCoord(0, 0.625, 0, 0.6875)
--htex:SetAllPoints()
--specButton:SetHighlightTexture(htex)
--
--local ptex = specButton:CreateTexture()
--ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
--ptex:SetTexCoord(0, 0.625, 0, 0.6875)
--ptex:SetAllPoints()
--specButton:SetPushedTexture(ptex)
--specButton.tooltip = "This is where you place MouseOver Text."
--specButton:SetScript("OnClick", function() 
--			if UseTankWeights == true then
--				specButton:SetText("DPS")
--			else
--				specButton:SetText("Tank")
--			end
--			UseAltSpec()
--		end)
--specButton:Hide()

local function loadSavedVariables()
	if addOnName == "MiLVL" then -- name as used in the folder name and TOC file name
		MiLVLDB = MiLVLDB or {} -- initialize it to a table if this is the first time
		--self.db = MiLVLDB -- makes it more readable and generally a good practice
		for k, v in pairs(defaults) do -- copy the defaults table and possibly any new options
			if MiLVLDB[k] == nil then -- avoids resetting any false values
				MiLVLDB[k] = v
			end
		end
		
		SetBaseStatWeights(MiLVLDB.DB_Strength , MiLVLDB.DB_Agility, MiLVLDB.DB_Stamina, MiLVLDB.DB_Intellect, MiLVLDB.DB_Spirit)

		SetSpellStatWeights(MiLVLDB.DB_SpellPower, MiLVLDB.DB_Mp5, MiLVLDB.DB_SpellPen) --sp, mp5, spellPen 

		SetCommonStatWeights(MiLVLDB.DB_HitRating, MiLVLDB.DB_CritRating, MiLVLDB.DB_HasteRating) --hit, crit, haste

		SetDefensiveStatWeights(MiLVLDB.DB_DefenseRating, MiLVLDB.DB_DodgeRating, MiLVLDB.DB_ParryRating, MiLVLDB.DB_BlockRating, MiLVLDB.DB_Resilience) --def, dod, par, blk, res

		SetMeleeStatWeights(MiLVLDB.DB_Armor, MiLVLDB.DB_BonusArmor, MiLVLDB.DB_AttackPower, MiLVLDB.DB_Expertise, MiLVLDB.DB_FeralAtkPower, MiLVLDB.DB_WeaponDPS, MiLVLDB.DB_MainHandWeaponSpeed, MiLVLDB.DB_OffHandWeaponSpeed) --arm, ap, expert
		
		--UseTankWeights = MiLVLDB.DB_UseTankWeights
		--if UseTankWeights == true then 
		--	specButton:SetText("Tank")
		--end
		
		--Options
		useRareGems 				= MiLVLDB.DB_useRareGems
		displaySpellpowerConversion = MiLVLDB.DB_displaySpellpowerConversion
		displayCritRatingConversion = MiLVLDB.DB_displayCritRatingConversion
		displayItemLevel 			= MiLVLDB.DB_displayItemLevel
		displayItemLevelUpgrade 	= MiLVLDB.DB_displayItemLevelUpgrade
		displayMiLVLReforgeScore	= MiLVLDB.DB_displayMiLVLReforgeScore
		displayClassUpgrade		 	= MiLVLDB.DB_displayClassUpgrade
		displayMiLVLScore 			= MiLVLDB.DB_displayMiLVLScore
		hideMiLVLReforgeInfoWhenCorrect = MiLVLDB.DB_hideMiLVLReforgeInfoWhenCorrect
		displayGemPreference 		= MiLVLDB.DB_displayGemPreference
		displayHitCapInfo 			= MiLVLDB.DB_displayHitCapInfo
		groupScanningEnabled		= MiLVLDB.DB_groupScanningEnabled
		assumeThreePercentHitDebuff = MiLVLDB.DB_assumeThreePercentHitDebuff
	end
end

local function loadDefaultStatWeights(str, agi, sta, int, spi, hit, crit, haste, mastery, def, dod, par, blk, res, arm, armBonus, ap, expert, sp, mp5, spellPen, feralAP, wdps, mhs, ohs)
	milvl_options.args.tab1.args.StatWeightUI_Strength:set(str)			
	milvl_options.args.tab1.args.StatWeightUI_Agility:set(agi)			
	milvl_options.args.tab1.args.StatWeightUI_Stamina:set(sta)			
	milvl_options.args.tab1.args.StatWeightUI_Intellect:set(int)		
	milvl_options.args.tab1.args.StatWeightUI_Spirit:set(spi)			
	milvl_options.args.tab1.args.StatWeightUI_SpellPower:set(sp)		
	milvl_options.args.tab1.args.StatWeightUI_Mp5:set(mp5)						 
	milvl_options.args.tab1.args.StatWeightUI_SpellPen:set(spellPen)	
	milvl_options.args.tab1.args.StatWeightUI_HitRating:set(hit)		
	milvl_options.args.tab1.args.StatWeightUI_CritRating:set(crit)		
	milvl_options.args.tab1.args.StatWeightUI_HasteRating:set(haste)
	milvl_options.args.tab1.args.StatWeightUI_MasteryRating:set(mastery)
	milvl_options.args.tab1.args.StatWeightUI_DefenseRating:set(def)	
	milvl_options.args.tab1.args.StatWeightUI_DodgeRating:set(dod)		
	milvl_options.args.tab1.args.StatWeightUI_ParryRating:set(par)		
	milvl_options.args.tab1.args.StatWeightUI_BlockRating:set(blk)		
	milvl_options.args.tab1.args.StatWeightUI_Resilience:set(res)		
	milvl_options.args.tab1.args.StatWeightUI_Armor:set(arm)			
	milvl_options.args.tab1.args.StatWeightUI_BonusArmor:set(armBonus)	
	milvl_options.args.tab1.args.StatWeightUI_AttackPower:set(ap)		
	milvl_options.args.tab1.args.StatWeightUI_Expertise:set(expert)			
	milvl_options.args.tab1.args.StatWeightUI_FeralAtkPower:set(feralAP)
	milvl_options.args.tab1.args.StatWeightUI_WeaponDPS:set(wdps)		
	milvl_options.args.tab1.args.StatWeightUI_MainHandWeaponSpeed:set(mhs)
	milvl_options.args.tab1.args.StatWeightUI_OffHandWeaponSpeed:set(ohs)																	   
	
	MiLVLDB.DB_Strength			= str 		 
	MiLVLDB.DB_Agility		    = agi 		 
	MiLVLDB.DB_Stamina		    = sta 		 
	MiLVLDB.DB_Intellect	    = int 		 
	MiLVLDB.DB_Spirit		    = spi 		 
	MiLVLDB.DB_SpellPower	    = sp 		 
	MiLVLDB.DB_Mp5 			    = mp5 		 
	MiLVLDB.DB_SpellPen 	    = spellPen 	 
	MiLVLDB.DB_HitRating 	    = hit 		 
	MiLVLDB.DB_CritRating 	    = crit 		 
	MiLVLDB.DB_HasteRating 	    = haste	 
	MiLVLDB.DB_MasteryRating 	= mastery	
	MiLVLDB.DB_DefenseRating    = def 		 
	MiLVLDB.DB_DodgeRating 	    = dod 		 
	MiLVLDB.DB_ParryRating 	    = par 		 
	MiLVLDB.DB_BlockRating 	    = blk 		 
	MiLVLDB.DB_Resilience 	    = res 		 
	MiLVLDB.DB_Armor 		    = arm 
	MiLVLDB.DB_BonusArmor 		= armBonus
	MiLVLDB.DB_AttackPower 	    = ap 		 
	MiLVLDB.DB_Expertise 	    = expert 	 
	MiLVLDB.DB_FeralAtkPower    = feralAP
	MiLVLDB.DB_WeaponDPS 	    = wdps	
	MiLVLDB.DB_MainHandWeaponSpeed = mhs
	MiLVLDB.DB_OffHandWeaponSpeed	= ohs									 
	
	Stats.Strength				= str 		 
	Stats.Agility		    	= agi 		 
	Stats.Stamina		    	= sta 		 
	Stats.Intellect	    		= int 		 
	Stats.Spirit		    	= spi 		 
	Stats.SpellPower	    	= sp 		 
	Stats.Mp5 					= mp5 		 
	Stats.SpellPen 	    		= spellPen 	 
	Stats.HitRating 	    	= hit 		 
	Stats.CritRating 	    	= crit 		 
	Stats.HasteRating 			= haste
	Stats.MasteryRating 		= mastery	
	Stats.DefenseRating   		= def 		 
	Stats.DodgeRating 			= dod 		 
	Stats.ParryRating 			= par 		 
	Stats.BlockRating 			= blk 		 
	Stats.Resilience 	    	= res 		 
	Stats.Armor 		    	= arm
	Stats.BonusArmor			= armBonus
	Stats.AttackPower 			= ap 		 
	Stats.Expertise 	    	= expert 	 
	Stats.FeralAtkPower   		= feralAP
	Stats.WeaponDPS 	    	= wdps	
	Stats.MainHandWeaponSpeed = mhs
	Stats.OffHandWeaponSpeed	= ohs								
	
	--MiLVLDB.DB_Strength = val
	
 end

local function MiLVL_ResetClassBooleans()
	MiLVL_BuffIcons.b_HornofWinter 					= false
	MiLVL_BuffIcons.b_AbominationsMight 			= false
	MiLVL_BuffIcons.b_ImprovedIcyTalons 			= false
	MiLVL_BuffIcons.b_IcyTouch 						= false
	MiLVL_BuffIcons.b_ImprovedIcyTouch 				= false
	MiLVL_BuffIcons.b_EbonPlaguebringer 			= false
	MiLVL_BuffIcons.b_MarkoftheWild 				= false
	MiLVL_BuffIcons.b_ImprovedMarkoftheWild 		= false
	MiLVL_BuffIcons.b_MoonkinForm 					= false
	MiLVL_BuffIcons.b_ImprovedMoonkinForm 			= false
	MiLVL_BuffIcons.b_TreeofLife 					= false
	MiLVL_BuffIcons.b_LeaderofthePack				= false
	MiLVL_BuffIcons.b_FaerieFire 					= false
	MiLVL_BuffIcons.b_DemoralizingRoar 				= false
	MiLVL_BuffIcons.b_FeralAggression 				= false
	MiLVL_BuffIcons.b_InfectedWounds 				= false
	MiLVL_BuffIcons.b_Mangle 						= false
	MiLVL_BuffIcons.b_InsectSwarm 					= false
	MiLVL_BuffIcons.b_ImprovedFaerieFire 			= false
	MiLVL_BuffIcons.b_EarthandMoon 					= false
	MiLVL_BuffIcons.b_ImprovedLeaderofthePack 		= false
	MiLVL_BuffIcons.b_HuntingParty 					= false
	MiLVL_BuffIcons.b_TrueshotAura 					= false
	MiLVL_BuffIcons.b_FerociousInspiration 			= false
	MiLVL_BuffIcons.b_AcidSpit 						= false
	MiLVL_BuffIcons.b_Sting 						= false
	MiLVL_BuffIcons.b_Stampede 						= false
	MiLVL_BuffIcons.b_LavaBreath 					= false
	MiLVL_BuffIcons.b_AimedShot 					= false
	MiLVL_BuffIcons.b_ScorpidSting 					= false
	MiLVL_BuffIcons.b_EnduringWinter 				= false
	MiLVL_BuffIcons.b_ArcaneEmpowerment 			= false
	MiLVL_BuffIcons.b_ArcaneIntellect 				= false
	MiLVL_BuffIcons.b_Slow 							= false
	MiLVL_BuffIcons.b_ImprovedScorch	 			= false
	MiLVL_BuffIcons.b_WintersChill 					= false
	MiLVL_BuffIcons.b_BlessingofKings 				= false
	MiLVL_BuffIcons.b_BlessingofSanctuary 			= false
	MiLVL_BuffIcons.b_JudgementsoftheWise 			= false
	MiLVL_BuffIcons.b_ImprovedBlessingofMight 		= false
	MiLVL_BuffIcons.b_BlessingofMight 				= false
	MiLVL_BuffIcons.b_SanctifiedRetribution 		= false
	MiLVL_BuffIcons.b_SwiftRetribution 				= false
	MiLVL_BuffIcons.b_ImprovedDevotionAura 			= false
	MiLVL_BuffIcons.b_BlessingofWisdom 				= false
	MiLVL_BuffIcons.b_ImprovedBlessingofWisdom 		= false
	MiLVL_BuffIcons.b_Vindication 					= false
	MiLVL_BuffIcons.b_JudgementsoftheJust 			= false
	MiLVL_BuffIcons.b_HeartoftheCrusader 			= false
	MiLVL_BuffIcons.b_JudgementofLight 				= false
	MiLVL_BuffIcons.b_JudgementofWisdom 			= false
	MiLVL_BuffIcons.b_PowerWordFortitude 			= false
	MiLVL_BuffIcons.b_ImprovedPowerWordFortitude 	= false
	MiLVL_BuffIcons.b_DivineSpirit 					= false
	MiLVL_BuffIcons.b_VampiricTouch 				= false
	MiLVL_BuffIcons.b_Inspiration 					= false
	MiLVL_BuffIcons.b_RenewedHope 					= false
	MiLVL_BuffIcons.b_Misery 						= false
	MiLVL_BuffIcons.b_ExposeArmor 					= false
	MiLVL_BuffIcons.b_WoundPoison	 				= false
	MiLVL_BuffIcons.b_MindnumbingPoison 			= false
	MiLVL_BuffIcons.b_MasterPoisoner 				= false
	MiLVL_BuffIcons.b_SavageCombat 					= false
	MiLVL_BuffIcons.b_ImprovedExposeArmor 			= false
	MiLVL_BuffIcons.b_StrengthofEarthTotem 			= false
	MiLVL_BuffIcons.b_EnhancingTotems 				= false
	MiLVL_BuffIcons.b_ElementalOath 				= false
	MiLVL_BuffIcons.b_TotemofWrath 					= false
	MiLVL_BuffIcons.b_FlametongueTotem 				= false
	MiLVL_BuffIcons.b_WrathofAirTotem  				= false
	MiLVL_BuffIcons.b_AncestralHealing 				= false
	MiLVL_BuffIcons.b_UnleashedRage 				= false
	MiLVL_BuffIcons.b_ManaSpringTotem 				= false
	MiLVL_BuffIcons.b_RestorativeTotems	 			= false
	MiLVL_BuffIcons.b_WindfuryTotem 				= false
	MiLVL_BuffIcons.b_ImprovedWindfuryTotem 		= false
	MiLVL_BuffIcons.b_CommandingPresence 			= false
	MiLVL_BuffIcons.b_BattleShout 					= false
	MiLVL_BuffIcons.b_CommandingShout 				= false
	MiLVL_BuffIcons.b_Rampage 						= false
	MiLVL_BuffIcons.b_SunderArmor 					= false
	MiLVL_BuffIcons.b_DemoralizingShout 			= false
	MiLVL_BuffIcons.b_ImprovedDemoralizingShout		= false
	MiLVL_BuffIcons.b_ThunderClap 					= false
	MiLVL_BuffIcons.b_ImprovedThunderClap 			= false
	MiLVL_BuffIcons.b_Trauma	 					= false
	MiLVL_BuffIcons.b_FuriousAttacks 				= false
	MiLVL_BuffIcons.b_MortalStrike 					= false
	MiLVL_BuffIcons.b_BloodFrenzy		 			= false
	MiLVL_BuffIcons.b_FelIntelligence 				= false
	MiLVL_BuffIcons.b_DemonicPact 					= false
	MiLVL_BuffIcons.b_ImprovedSoulLeech 			= false
	MiLVL_BuffIcons.b_ImprovedImp 					= false
	MiLVL_BuffIcons.b_CurseofWeakness 				= false
	MiLVL_BuffIcons.b_ImprovedCurseofWeakness 		= false
	MiLVL_BuffIcons.b_CurseofTongues 				= false
	MiLVL_BuffIcons.b_ImprovedShadowBolt 			= false
	MiLVL_BuffIcons.b_CurseoftheElements 			= false	
	--MiLVL_BuffIcons.HornofWinter 					:SetDisabled(true)
	--MiLVL_BuffIcons.AbominationsMight 		        :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedIcyTalons 		        :SetDisabled(true)
	--MiLVL_BuffIcons.IcyTouch 					    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedIcyTouch 			    :SetDisabled(true)
	--MiLVL_BuffIcons.EbonPlaguebringer 		        :SetDisabled(true)
	--MiLVL_BuffIcons.MarkoftheWild 			        :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedMarkoftheWild 	        :SetDisabled(true)
	--MiLVL_BuffIcons.MoonkinForm 				    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedMoonkinForm 		    :SetDisabled(true)
	--MiLVL_BuffIcons.TreeofLife 				        :SetDisabled(true)
	--MiLVL_BuffIcons.LeaderofthePack			        :SetDisabled(true)
	--MiLVL_BuffIcons.FaerieFire 				        :SetDisabled(true)
	--MiLVL_BuffIcons.DemoralizingRoar 			    :SetDisabled(true)
	--MiLVL_BuffIcons.FeralAggression 			    :SetDisabled(true)
	--MiLVL_BuffIcons.InfectedWounds 			        :SetDisabled(true)
	--MiLVL_BuffIcons.Mangle 					        :SetDisabled(true)
	--MiLVL_BuffIcons.InsectSwarm 				    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedFaerieFire 		        :SetDisabled(true)
	--MiLVL_BuffIcons.EarthandMoon 				    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedLeaderofthePack 	    :SetDisabled(true)
	--MiLVL_BuffIcons.HuntingParty 				    :SetDisabled(true)
	--MiLVL_BuffIcons.TrueshotAura 				    :SetDisabled(true)
	--MiLVL_BuffIcons.FerociousInspiration 		    :SetDisabled(true)
	--MiLVL_BuffIcons.AcidSpit 					    :SetDisabled(true)
	--MiLVL_BuffIcons.Sting 					        :SetDisabled(true)
	--MiLVL_BuffIcons.Stampede 					    :SetDisabled(true)
	--MiLVL_BuffIcons.LavaBreath 				        :SetDisabled(true)
	--MiLVL_BuffIcons.AimedShot 				        :SetDisabled(true)
	--MiLVL_BuffIcons.ScorpidSting 				    :SetDisabled(true)
	--MiLVL_BuffIcons.EnduringWinter 			        :SetDisabled(true)
	--MiLVL_BuffIcons.ArcaneEmpowerment 		        :SetDisabled(true)
	--MiLVL_BuffIcons.ArcaneIntellect 			    :SetDisabled(true)
	--MiLVL_BuffIcons.Slow 						    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedScorch	 		        :SetDisabled(true)
	--MiLVL_BuffIcons.WintersChill 				    :SetDisabled(true)
	--MiLVL_BuffIcons.BlessingofKings 			    :SetDisabled(true)
	--MiLVL_BuffIcons.BlessingofSanctuary 		    :SetDisabled(true)
	--MiLVL_BuffIcons.JudgementsoftheWise 		    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedBlessingofMight 	    :SetDisabled(true)
	--MiLVL_BuffIcons.BlessingofMight 			    :SetDisabled(true)
	--MiLVL_BuffIcons.SanctifiedRetribution 	        :SetDisabled(true)
	--MiLVL_BuffIcons.SwiftRetribution 			    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedDevotionAura 		    :SetDisabled(true)
	--MiLVL_BuffIcons.BlessingofWisdom 			    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedBlessingofWisdom 	    :SetDisabled(true)
	--MiLVL_BuffIcons.Vindication 				    :SetDisabled(true)
	--MiLVL_BuffIcons.JudgementsoftheJust 		    :SetDisabled(true)
	--MiLVL_BuffIcons.HeartoftheCrusader 		        :SetDisabled(true)
	--MiLVL_BuffIcons.JudgementofLight 			    :SetDisabled(true)
	--MiLVL_BuffIcons.JudgementofWisdom 		        :SetDisabled(true)
	--MiLVL_BuffIcons.PowerWordFortitude 		        :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedPowerWordFortitude      :SetDisabled(true)
	--MiLVL_BuffIcons.DivineSpirit 				    :SetDisabled(true)
	--MiLVL_BuffIcons.VampiricTouch 			        :SetDisabled(true)
	--MiLVL_BuffIcons.Inspiration 				    :SetDisabled(true)
	--MiLVL_BuffIcons.RenewedHope 				    :SetDisabled(true)
	--MiLVL_BuffIcons.Misery 					        :SetDisabled(true)
	--MiLVL_BuffIcons.ExposeArmor 				    :SetDisabled(true)
	--MiLVL_BuffIcons.WoundPoison	 			        :SetDisabled(true)
	--MiLVL_BuffIcons.MindnumbingPoison 		        :SetDisabled(true)
	--MiLVL_BuffIcons.MasterPoisoner 			        :SetDisabled(true)
	--MiLVL_BuffIcons.SavageCombat 				    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedExposeArmor 		    :SetDisabled(true)
	--MiLVL_BuffIcons.StrengthofEarthTotem 		    :SetDisabled(true)
	--MiLVL_BuffIcons.EnhancingTotems 			    :SetDisabled(true)
	--MiLVL_BuffIcons.ElementalOath 			        :SetDisabled(true)
	--MiLVL_BuffIcons.TotemofWrath 				    :SetDisabled(true)
	--MiLVL_BuffIcons.FlametongueTotem 			    :SetDisabled(true)
	--MiLVL_BuffIcons.WrathofAirTotem  			    :SetDisabled(true)
	--MiLVL_BuffIcons.AncestralHealing 			    :SetDisabled(true)
	--MiLVL_BuffIcons.UnleashedRage 			        :SetDisabled(true)
	--MiLVL_BuffIcons.ManaSpringTotem 			    :SetDisabled(true)
	--MiLVL_BuffIcons.RestorativeTotems	 		    :SetDisabled(true)
	--MiLVL_BuffIcons.WindfuryTotem 			        :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedWindfuryTotem 	        :SetDisabled(true)
	--MiLVL_BuffIcons.CommandingPresence 		        :SetDisabled(true)
	--MiLVL_BuffIcons.BattleShout 				    :SetDisabled(true)
	--MiLVL_BuffIcons.CommandingShout 			    :SetDisabled(true)
	--MiLVL_BuffIcons.Rampage 					    :SetDisabled(true)
	--MiLVL_BuffIcons.SunderArmor 				    :SetDisabled(true)
	--MiLVL_BuffIcons.DemoralizingShout 		        :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedDemoralizingShout	    :SetDisabled(true)
	--MiLVL_BuffIcons.ThunderClap 				    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedThunderClap 		    :SetDisabled(true)
	--MiLVL_BuffIcons.Trauma	 				        :SetDisabled(true)
	--MiLVL_BuffIcons.FuriousAttacks 			        :SetDisabled(true)
	--MiLVL_BuffIcons.MortalStrike 				    :SetDisabled(true)
	--MiLVL_BuffIcons.BloodFrenzy		 		        :SetDisabled(true)
	--MiLVL_BuffIcons.FelIntelligence 			    :SetDisabled(true)
	--MiLVL_BuffIcons.DemonicPact 				    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedSoulLeech 		        :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedImp 				    :SetDisabled(true)
	--MiLVL_BuffIcons.CurseofWeakness 			    :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedCurseofWeakness 	    :SetDisabled(true)
	--MiLVL_BuffIcons.CurseofTongues 			        :SetDisabled(true)
	--MiLVL_BuffIcons.ImprovedShadowBolt 		        :SetDisabled(true)
	--MiLVL_BuffIcons.CurseoftheElements 		        :SetDisabled(true)
	
end

local function CheckHeroicPresence()
	--Loop through all potential buffs and debuffs on the player, and see if any of them are "Heroic Presence"
	for i=1,40 do
		local name, _ = UnitAura("player",i, "INCLUDE_NAME_PLATE_ONLY")
		if name == "Heroic Presence" then
			return true
		else
			return false
		end
	end
end

local function GetExpertiseRacial()
	--Expertise soft cap (6.5%) > Hit cap (8%) > Expertise hard cap (14%) >> Critical strike >> Haste
	
	--691 Dodge cap vs. 88 with  Sword Specialization or  Mace Specialization or  Axe Specialization or  Shortblade Specialization
	--781 Dodge cap vs. 88
	--1592 Parry cap vs. 88 with  Sword Specialization or  Mace Specialization or  Axe Specialization or  Shortblade Specialization
	--1682 Parry cap vs. 88
	
	--EXPERTISE
	local expertiseRacial = false
	local twohandweapon = IsEquippedItemType("INVTYPE_2HWEAPON")
	local expertiseFromRacial = 0
	if playerRace == "Human" then
		if twohandweapon == true then
			--Are they using a sword or mace in their main hand?
			local mel = GetInventoryItemLink("player", 16);
			local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(mel)
			if sSubType == "Two-Handed Swords" or  sSubType == "Two-Handed Maces" then
				expertiseFromRacial = expertiseFromRacial + (3 * 30.0272)
			end		
		else
			--Are they using an axe in their main hand?				
			local mel = GetInventoryItemLink("player", 16);
			if mel ~= nil then
				local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(mel)
				if sSubType == "One-Handed Swords" or sSubType == "One-Handed Maces" then
					expertiseRacial = true
				end	
			end

			--Are they using an axe in their off hand?	
			local oel = GetInventoryItemLink("player", 17);
			local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(oel)
			if sSubType == "One-Handed Swords" or sSubType == "One-Handed Maces" then
				expertiseRacial = true
			end
			
			if expertiseRacial == true then
				expertiseFromRacial = expertiseFromRacial + (3 * 30.0272)
			end					
		end	
	elseif playerRace == "Dwarf" then
			--Are they using a mace?
			if twohandweapon == true then
				--Are they using an axe in their main hand?	
				local mel = GetInventoryItemLink("player", 16);
				local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(mel)
				if sSubType == "Two-Handed Maces" then
					expertiseFromRacial = expertiseFromRacial + (5 * 30.0272)
				end		
			else
				--Are they using an axe in their main hand?				
				local mel = GetInventoryItemLink("player", 16);
				if mel ~= nil then
					local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(mel)
					if sSubType == "One-Handed Maces" then
						expertiseRacial = true
					end	
				end

				--Are they using an axe in their off hand?	
				local oel = GetInventoryItemLink("player", 17);
				local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(oel)
				if sSubType == "One-Handed Maces" then
					expertiseRacial = true
				end
				
				if expertiseRacial == true then
					expertiseFromRacial = expertiseFromRacial + (5 * 30.0272)
				end					
			end	
	elseif playerRace == "Orc" then
			if twohandweapon == true then
				--Are they using an axe in their main hand?	
				local mel = GetInventoryItemLink("player", 16);
				local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(mel)
				if sSubType == "Two-Handed Axes" then
					expertiseFromRacial = expertiseFromRacial + (5 * 30.0272)
				end		
			else
				--Are they using an axe in their main hand?				
				local mel = GetInventoryItemLink("player", 16);
				if mel ~= nil then
					local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(mel)
					if sSubType == "One-Handed Axes" then
						expertiseRacial = true
					end	
				end

				--Are they using an axe in their off hand?	
				local oel = GetInventoryItemLink("player", 17);
				if oel ~= nil then
					local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(oel)
					if sSubType == "One-Handed Axes" then
						expertiseRacial = true
					end
				end

				
				if expertiseRacial == true then
					expertiseFromRacial = expertiseFromRacial + (5 * 30.0272)
				end					
			end		
	end
	return expertiseFromRacial
end

local function CheckHardHitCap(ratingtotal)
	local tt = ""
	local hit = (StatWeightsUI.HitRating or 0)
	if HitSoftCapped then
		--Partially devalue +hit here
		hit = hit * 0.7
		if poisonHitCapped then
			--further devalue +hit here
			hit = hit * 0.33
			if HitCapped then
				hit = 0.001
				tt = "You are "..ratingtotal - autoAttackHitRatingCap .." over hit cap"
				--print(autoAttackHitRatingCap)
			else
				--Over the poison cap but under hard hit cap
				tt = ratingtotal-poisonHitRatingCap.."over poison cap, "..autoAttackHitRatingCap - ratingtotal.."under Auto-Attack cap"
			end	
		else
			--poisonHitRatingCap = 1742
			--autoAttackHitRatingCap = 3243
			--Over the soft cap but under poison hit cap
			tt = ratingtotal-HitRatingCap.." over Softcap, "..poisonHitRatingCap - ratingtotal.." under Poison cap"						
		end						
	else
		hit = (StatWeightsUI.HitRating or 0)		
		tt = "Additional Hit Rating Required  "..HitRatingCap - ratingtotal
	end
	return hit, tt
end

local function CheckDefenseCap()
			--540 Defense
			--Should also be checking resilience, getting total value of reduction, adding to reduction from defense and ensuring it is over 5.6%	
			--local resilPercent = GetCombatRatingBonus(CR_RESILIENCE_CRIT_TAKEN)
			local resilPercent = GetCombatRatingBonus(COMBAT_RATING_RESILIENCE_PLAYER_DAMAGE_TAKEN)
			local defensePercent = 5
			
			--/run ChatFrame1:AddMessage(format("Unhittable at 102.4%% - you have %.2f%%", GetDodgeChance() + GetBlockChance() + GetParryChance() + 5 + 1/(0.0625 + 0.956/(GetCombatRating(CR_DEFENSE_SKILL)/4.91850*0.04))))
			
			local dodgePercent = GetDodgeChance();
			local blockPercent = GetBlockChance();
			local parryPercent = GetParryChance();
			
			defensePercent = dodgePercent + blockPercent + parryPercent + defensePercent + 1/(0.0625 + 0.956/(GetCombatRating(CR_DEFENSE_SKILL)/4.91850*0.04))
			
			--local baseDefense, armorDefense = UnitDefense("player");
			--if baseDefense + armorDefense >= 540 or defensePercent+resilPercent >= 5.6 then
			--	DefenseCapped = true
			--else
			--	DefenseCapped = false
			--end
			
			if defensePercent+resilPercent >= 102.4 then
				DefenseCapped = true
			else
				DefenseCapped = false
			end
			
			return DefenseCapped
end

local function GetSpec(isinspect)
		if isinspect == nil then
			isinspect = false
		end
        local highest_tab, highest = 0, 0;
		local highest_name = ""
        for i=1, 3 do 
			--This is for Dual-Talent specialization
			local activeSpec = GetActiveTalentGroup(isinspect);

			--If user hold down ALT key, this will inspect the players other Talent Specialization (Non-Active Dual Spec)
			if IsAltKeyDown() then 
				if activeSpec == 1 then
					activeSpec = 2
				else
					activeSpec = 1
				end
			end
			

			--local name, _, points, _, _ = GetTalentTabInfo(i,isinspect,false,activeSpec);
			local id, name, description, iconTexture, points, background, previewPointsSpent, isUnlocked  = GetTalentTabInfo(i,isinspect,false,activeSpec);
			--local name, texture, pointsSpent, fileName = GetTalentTabInfo(i,isinspect,false,activeSpec)

			if points > highest then
				highest = points;
				highest_tab = i;
				highest_name = name
			end
        end
		if highest_name == nil then
			highest_name = ""
		end
		
        return highest_name;
end

local function GetRace()
	--Different races have different racials that effect player caps...

	--"Human"	--Sword Specialization, Mace Specialization
	--"NightElf" --Quickness	
	--"Dwarf"	--Gun Specialization, Mace Specialization
	--"Gnome"
	--"Draenei" --Heroic Presence	
	--""Orc" 	--Axe Specialization	
	--"Troll"
	--"Scourge"
	--"Tauren"
	--"BloodElf" --Magic Resistance
	
	local _, playerRace = UnitRace("player");
	return playerRace
end

local function CheckIfGlyphEquipped(glyphToCheck)

	local atg = GetActiveTalentGroup(false);
	local hasGlyph = false
	for i = 1, GetNumGlyphSockets() do
		local enabled, glyphType, glyphTooltipIndex, glyphSpellID, icon = GetGlyphSocketInfo(i, atg) --Returns info on a specific Glyph Socket.
		if glyphTooltipIndex ~= nil then 
			if glyphTooltipIndex == glyphToCheck then 
				hasGlyph = true
			end
		end
	end
	
	return hasGlyph
	
end


--Sets Players localizedClass, race, spec
--Performs math based on stat values and modifications from talents.
local function SetupClass()
	localizedClass, class, classIndex = UnitClass("player");
	spec = GetSpec(false)
	playerLevel = UnitLevel("player")
	playerRace = GetRace() --"Human", "NightElf", "Dwarf", "Gnome", "Draenei", "Orc", "Troll", "Scourge", "Tauren", "BloodElf"
	if localizedClass == "Druid" then
		--In the options menu, click the button that represents this class.
		--Then find matching spec, and click that button.
		milvl_options.args.tab1.args.DruidDefault.func()
		
		if spec == "Restoration" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = false
			ClassUsesHasteCap = false 
			HasteRatingCap = 1422
			ClassUsesCritCap = false 
			ClassUsesExpertiseCap = false
			HitCapped = true --Healers should be marked true here so +hit is not overvalued.
			
			milvl_options.args.tab1.args.SpecButton2.func()
			--By executing the function of the spec button above, after it has been assigned Druid specs, we are performing the same function as loadDefaultStatWeights below.
			-- This means we can edit defauls in one location, the milvl_options.
			--loadDefaultStatWeights(0, 0, 0.2, 0.3, 0.4, 0, 0.2, 1,0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.5, 0)
							--str, agi, sta, int, spi,hit, crit, haste,def, dod, par, blk, res,arm, ap, expert,sp, mp5, spellPen
		
			--HIT RATING is Ignored
			--*****************************************************************************
			--HASTE RATING
			local spellHasteRating = GetCombatRating(CR_HASTE_SPELL) -- for spell haste value shown in character sheet.
			
			--local spellHastePercentage = GetCombatRatingBonus(CR_HASTE_SPELL) -- for spellpower( number )
			
			-- The key values to chase are 65 and 735 Haste rating for fitting 4 and 5 Rejuvenations 
			-- in between Wild Growths with Celestial Focus talented,
			-- and 165 and 856 to do so without Celestial Focus. --Icy Veins
			 
			--Gift of the Earthmother
			-- if GOTEM = true
			-- and Celestial Focus = false 
			--HasteRatingCap = 856 Haste
			--else
			-- if GOTEM = true
			-- AND Celestial Focus = true
			--HasteRatingCap = 735 Haste
			
			--local GOTEM = false
			--local CF = false
			--
			----Check Gift of the Earthmother for haste rating
			--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(3, 22, "player");
			--if currentRank > 0 then
			--	--32.79 spell haste rating per 1%, each rank is worth 2% - validate these numbers
			--	HasteRatingFromTalents = HasteRatingFromTalents + (currentRank * (32.79*2))
			--	if currentRank == 5 then
			--		GOTEM = true
			--	end
			--end
			--
			----Check Celestial Focus for haste rating (Balance Tree)
			--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(1, 6, "player");
			--if currentRank > 0 then
			--	--32.79 spell haste rating per 1%, each rank is worth 1% - validate these numbers
			--	HasteRatingFromTalents = HasteRatingFromTalents + (currentRank * (32.79))
			--	if currentRank == 3 then
			--		CF = true
			--	end
			--end
			--
			--if GOTEM == true then
			--	if CF == true then
			--		HasteRatingCap = 735
			--	end
			--end
			
			--Check for Wrath of Air Totem...
			-- local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId  = UnitBuff("player", 3738)
			-- if name ~= nil then
				-- --HasteRatingCap =  401 --Calculating backwards here... so 5% haste is...
				-- HasteRatingCap = HasteRatingCap - (128.05 * 5)
				-- --tooltip:AddLine("Wrath of Air is present. Haste soft cap = "..HasteRatingCap)
			-- else
				-- --tooltip:AddLine("Wrath of Air is NOT present. Haste soft cap = "..HasteRatingCap)
			-- end
			
			--if MiLVL_BuffIcons.b_WrathofAirTotem then
			--	HasteRatingCap = HasteRatingCap - (128.05 * 5)
			--end

			
			if spellHasteRating > HasteRatingCap then 
				HasteCapped = true
			end
			
			
			--tooltip:AddLine("Haste Soft Capped?  "..tostring(HasteCapped))
			--if HasteCapped then
			--	HasteRating = 0.3
			--else
			--	HasteRating = 0.78
			--end
			
			--*****************************************************************************
			--CRIT RATING nothing special for Resto Druids...

		elseif spec == "Balance" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = true
			ClassUsesExpertiseCap = false
			HitRatingCap = 1742
			milvl_options.args.tab1.args.SpecButton1.func()

			--*****************************************************************************
			--HIT RATING
			--This information is also being detected elsewhere, Not sure which should supercede the other... 
			--This was the OG and was thoroughly tested, so leaving for now.
			
			HitRatingFromTalents = 0
			--Check Balance of Power for hit rating
			local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(1, 7, "player");
			--print(name)
			if currentRank > 0 then
				--27 spell hit rating per 1%, each rank is worth 2%
				--HitRatingFromTalents = HitRatingFromTalents + (currentRank * (102.45*2))
				--Balance of Power is now a 50% of Spirit per talent point to Hit conversion.
				local base, stat, posBuff, negBuff = UnitStat("player", 5);
				HitRatingFromTalents = HitRatingFromTalents + (stat * (currentRank*0.5))
				ClassConvertsSpiritToHit = true
				--print(HitRatingFromTalents)
			end
					
			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 102.45
			end	
			
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents

			if GetCombatRating(CR_HIT_SPELL) >= HitRatingCap then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))
			
			--*****************************************************************************
			--HASTE RATING
			local spellHasteRating = GetCombatRating(CR_HASTE_SPELL) -- for spell haste value shown in character sheet.
			--tooltip:AddLine("spellHasteRating  ".. spellHasteRating)
			
			--local spellHastePercentage = GetCombatRatingBonus(CR_HASTE_SPELL) -- for spellpower( number )
			--tooltip:AddLine("spellHastePercentage  ".. spellHastePercentage)
			
			-- local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId  = UnitBuff("player", 3738)
			-- if name ~= nil then
				-- --HasteRatingCap =  401 --Calculating backwards here... so 5% haste is...
				-- HasteRatingCap = HasteRatingCap - (32.79 * 5)
				-- --tooltip:AddLine("Wrath of Air is present. Haste soft cap = "..HasteRatingCap)
			-- else
				-- --tooltip:AddLine("Wrath of Air is NOT present. Haste soft cap = "..HasteRatingCap)
			-- end
			
			--if MiLVL_BuffIcons.b_WrathofAirTotem then
			--	HasteRatingCap = HasteRatingCap - (128.05 * 5)
			--end
			
			--if spellHasteRating > HasteRatingCap then 
			--	HasteCapped = true
			--end
			--MiLVL.Print("HasteCapped: "..tostring(HasteCapped))
			
			--tooltip:AddLine("Haste Soft Capped?  "..tostring(HasteCapped))
			--if HasteCapped then
			--	HasteRating = 0.3
			--else
			--	HasteRating = 0.78
			--end
			
			--*****************************************************************************
			--CRIT RATING
			local ArcaneCRIT = 0 + GetSpellCritChance(7)
			--tooltip:AddLine("Arcane Crit: ".. ArcaneCRIT .."%")
			
			local NatureCRIT = 0 + GetSpellCritChance(4)
			--tooltip:AddLine("Nature Crit: ".. NatureCRIT .."%")
			
			if ArcaneCRIT > 45 then
				CritCapped = true
			end
			--MiLVL.Print("CritCapped: "..tostring(CritCapped))
			
		elseif spec == "Feral Combat" then
			MiLVL_ClassSupport = true	
			HitRatingCap = 961
			ClassUsesExpertiseCap = true
			ExpertiseRatingCap = 780.8
			ExpertiseFromTalents = 0
			local Tank = false
			--Check Thick Hide to Determine Bear or Kitty
			local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 1, "player");			
			if currentRank > 0 then
				Tank = true
				if currentRank == 3 then
					DefenseCapped = true
				end
			end
						
			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 120.11
			end	

			PlayerHitRequired = HitRatingCap

			--local meleeHitPercentage =  GetCombatRatingBonus(CR_HIT_MELEE) + GetHitModifier()
			--if meleeHitPercentage > HitRatingCap/32.8 then
			if GetCombatRating(CR_HIT_MELEE) >= HitRatingCap then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))

			--780.8 for soft cap and 14% or 1682 for hard cap
			if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
				ExpertiseSoftCapped = true
				if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseHardRatingCap then
					ExpertiseCapped = true
				end
			else
				ExpertiseCapped = false
			end
			
			if ExpertiseCapped then
				MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))
			else
				MiLVL.Print("Expertise Soft-Capped: "..tostring(ExpertiseSoftCapped))
			end
			
			if Tank then
				ClassUsesHitCap = true
				ClassUsesHasteCap = false 
				ClassUsesCritCap = false 
				ClassUsesDefCap = true
				
				milvl_options.args.tab1.args.SpecButton4.func()
				--Bear
				
				--###TODO: Get percentage of reduction for both Defense and Resilience, add them together to determine uncrittable. Just checkings DefenseCapped is not enough.			
				MiLVL.Print("Uncrittable: "..tostring(DefenseCapped))
				
				--Block Chance Percentage
				local block1 = GetCombatRatingBonus(CR_BLOCK) + GetBlockChance()
				--MiLVL.Print("Block: "..block1)
				
				--Dodge Chance Percentage
				local dodge1 = GetDodgeChance()
				--MiLVL.Print("Dodge: "..dodge1)
				
				--+GetParryChance()+
				--27% of our Strength is converted into parry rating.
				local parry1 = GetParryChance()
				--MiLVL.Print("Parry: "..parry1)
				
				--The amount of dodge/block/parry received from defense
				local def1 = (GetCombatRating(CR_DEFENSE_SKILL)/4.91850*0.04)
				
				--Add the base chance to the players ratings...
				local totalAvoidance = def1 + parry1 + dodge1 + block1 + 5
				MiLVL.Print(" Total Avoidance: "..totalAvoidance.."%")
				
			else
				ClassUsesHitCap = true
				ClassUsesHasteCap = false 
				ClassUsesCritCap = false 
				ClassUsesExpertiseCap = true
				ExpertiseRatingCap = 780.8
				ClassUsesDefCap = false
				milvl_options.args.tab1.args.SpecButton3.func()
				--Kitty

			end			
		end
	elseif localizedClass == "Shaman" then
		milvl_options.args.tab1.args.ShamanDefault.func()
		if spec == "Elemental" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			ClassUsesExpertiseCap = false
			HitRatingCap = 1742
			PlayerHitRequired = 1742
			DualWieldClass = false
			milvl_options.args.tab1.args.SpecButton1.func()
			
			HitRatingFromTalents = 0
			--Check Elemental Precision for hit rating
			local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(1, 9, "player");
			if currentRank > 0 then
				--27 spell hit rating per 1%, each rank is worth 2%
				--HitRatingFromTalents = HitRatingFromTalents + (currentRank * 102.45)
				local base, stat, posBuff, negBuff = UnitStat("player", 5);
				if currentRank < 3 then
					HitRatingFromTalents = HitRatingFromTalents + (stat * (currentRank*0.33))
				elseif currentRank == 3 then
					HitRatingFromTalents = HitRatingFromTalents + (stat)
					ClassConvertsSpiritToHit = true
				end				
			end
					
			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 102.45
			end	
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents
			if GetCombatRating(CR_HIT_SPELL) >= HitRatingCap then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))			
			
		elseif spec == "Enhancement" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false 
			ClassUsesCritCap = false 
			ClassUsesExpertiseCap = true
			ExpertiseRatingCap = 780.8
			HitRatingCap = 1742
			DualWieldClass = true
			milvl_options.args.tab1.args.SpecButton2.func()

			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 102.45
			end	
			
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents
			if GetCombatRating(CR_HIT_MELEE) >= 242 then
				MiLVL.Print("DW Hit Soft Capped: true")
			end
			if GetCombatRating(CR_HIT_SPELL) >= HitRatingCap then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))
			
			if GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
				ExpertiseCapped = true
			else
				ExpertiseCapped = false
			end
			MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))
			
	
		elseif spec == "Restoration" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = false
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			ClassUsesExpertiseCap = false
			HitCapped = true
			DualWieldClass = false

			milvl_options.args.tab1.args.SpecButton3.func()

		end
	elseif localizedClass == "Paladin" then
		milvl_options.args.tab1.args.PaladinDefault.func()
		if spec == "Retribution" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			ClassUsesExpertiseCap = true
			ClassUsesHardExpertiseCap = false						
			ExpertiseRatingCap = 780.8
			ExpertiseFromTalents = 0
			HitRatingCap = 961 
			DualWieldClass = false
			milvl_options.args.tab1.args.SpecButton3.func()
			--loadDefaultStatWeights(2.53, 1.12, 0, 0.15, 0, 1.96, 1.16, 1.44, 0, 0, 0, 0, 0, 0, 1, 1.8, 0.76, 0.33, 0, 0, 0, 7.33) --Retribution
			
			--Figure out whether or not this ret pally is hit capped...
			--263 hit rating for melee soft cap or 8%

			
			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 120.11
			end	
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents	

			if ExpertiseFromTalents + GetCombatRating(CR_HIT_MELEE) >= PlayerHitRequired then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))
			
			--Check for Glyph of Seal of Truth			
			if CheckIfGlyphEquipped(43869) then
				ExpertiseFromTalents = ExpertiseFromTalents + (10*30.0272)
			end
			
			if GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
				ExpertiseCapped = true
			else
				ExpertiseCapped = false
			end
			MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))
			
			
		elseif spec == "Holy" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = false
			ClassUsesHasteCap = false
			HasteRatingCap = 3493 
			ClassUsesHardExpertiseCap = false						
			ClassUsesCritCap = false
			ClassUsesExpertiseCap = false
			DualWieldClass = false
			
			HitCapped = true --Healers should be marked true here so +hit is not overvalued.
			milvl_options.args.tab1.args.SpecButton1.func()
			
			--HASTE RATING
			local spellHasteRating = GetCombatRating(CR_HASTE_SPELL) -- for spell haste value shown in character sheet.
			
			local spellHastePercentage = GetCombatRatingBonus(CR_HASTE_SPELL) -- for spellpower( number )
			--local hasteValue = 676/32.79
			
			--32.79 rating per 1%
			--
			--with JotP, the haste cap is 997.
			--Each rank is worth 3%, up to 15%
			--32.79 * 15 = 491.85
			--1640 - 491.85 = 1,148.15
			--With IMF or SR
			--Each rank is worth 1%
			--1,049.78
			--With WOA = 676
			--Without WOA = 840
			--Without IMF/SR = 939
			--This buffs presence is worth 5%
			
			local JotP = 1.0
			local WoA = 1.0
			local SwiftRet = 1.0
			local ImpMoonkinForm = 1.0
			local ThreePercentBuff = 1.0
			--Check Judegements of the Pure for haste rating
			local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(1, 26, "player");
			if currentRank > 0 then
				JotP = JotP + (currentRank*0.03);
			end

			--Check for Wrath of Air Totem 3738
			if MiLVL_BuffIcons.b_WrathofAirTotem then
				WoA = 1.05
			end
			--Check for Swift Retribution 53648
			if MiLVL_BuffIcons.b_SwiftRetribution then			
				SwiftRet = 1.03
			end
			--Check for Improved Moonkin Form 48396 
			if MiLVL_BuffIcons.b_ImprovedMoonkinForm then
				ImpMoonkinForm = 1.03
			end
			
			if MiLVL_BuffIcons.b_SwiftRetribution or MiLVL_BuffIcons.b_ImprovedMoonkinForm then
				ThreePercentBuff = 1.03
			end
			
			--1.2061*1.15*1.03*1.05=1.50
			--676 haste should be 20.61% haste.(1.2061 in the calc above)
			if ((spellHastePercentage+100)/100) * JotP * ThreePercentBuff * WoA >= 1.5 then
				HasteCapped = true
			end		
			MiLVL.Print("HasteCapped: "..tostring(HasteCapped))
			--MiLVL.Print(((((spellHastePercentage+100)/100)* JotP * ThreePercentBuff * WoA)-1)*100 .."% Haste")
		elseif spec == "Protection" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false 
			ClassUsesExpertiseCap = true
			ExpertiseRatingCap = 780.8
			ClassUsesDefCap = true
			HitRatingCap = 1742
			ExpertiseFromTalents = 0
			ClassUsesHardExpertiseCap = true
			DualWieldClass = false
			milvl_options.args.tab1.args.SpecButton3.func()
			--DefCapped @540 Defense
			--Stamina
			--Armor
			--BlockRating until 102.4% avoidance
			--Expertise Soft Cap @213.096
			--HitCapped @8%
			--Dodge
			--Parry
			
			-- Stat,Value
			-- stamina,1
			-- dodgeRating,1
			-- blockRating,0.33
			-- defenseRating,1
			-- expertiseRating,1
			-- parryRating,0.9
			-- blockValue,0.33
			-- blockValueBonus,0.33
			-- agility,0.4
			-- strength,1
			-- armor,0.06
			-- armorBonus,0.06
			-- attackPower,0.4
			-- spellDamage,0.2
			-- critRating,0.33
			-- hasteRating,0.3
			-- hitRating,0.8
			-- dps,3
			--loadDefaultStatWeights(1, 0.4, 1, 0, 0, 0.8, 0.33, 0.3, 1, 1, 0.9, 0.33, 0.9, 0.06, 0.4, 1, 0, 0.2, 0, 0, 0, 0.99) --Protection Needs Review
								--1, 0.4, 1, 0, 0, 0.8, 0.33, 0.3, 1, 1, 0.9, 0.33, 0.9, 0.06, 0.4, 1, 0, 0.2, 0, 0, 0, 0.99
			
			--263 hit rating for melee soft cap or 8%		
			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 120.11
			end	
			
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents	

			if GetCombatRating(CR_HIT_MELEE) >= PlayerHitRequired then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))
			
			--Check for Glyph of Seal of Truth			
			if CheckIfGlyphEquipped(43869) then
				ExpertiseFromTalents = ExpertiseFromTalents + (10*30.0272)
			end
			
			if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
				ExpertiseSoftCapped = true
				if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseHardRatingCap then
					ExpertiseCapped = true
				end
			else
				ExpertiseCapped = false
			end
			if ExpertiseCapped then
				MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))
			else
				MiLVL.Print("Expertise Soft-Capped: "..tostring(ExpertiseSoftCapped))
			end
		
			--local defcap = CheckDefenseCap()
			--MiLVL.Print("DefenseCapped: "..tostring(defcap))
			--Block Chance Percentage
			local block1 = GetCombatRatingBonus(CR_BLOCK) + GetBlockChance()
			--MiLVL.Print("Block: "..block1)
			
			--Dodge Chance Percentage
			local dodge1 = GetDodgeChance()
			--MiLVL.Print("Dodge: "..dodge1)
			
			--+GetParryChance()+
			--27% of our Strength is converted into parry rating.
			local parry1 = GetParryChance()
			--MiLVL.Print("Parry: "..parry1)
			
			--The amount of dodge/block/parry received from defense
			local def1 = (GetCombatRating(CR_DEFENSE_SKILL)/4.91850*0.04)
			
			--Add the base chance to the players ratings...
			local totalAvoidance = def1 + parry1 + dodge1 + block1 + 5
			MiLVL.Print("Total Avoidance: "..totalAvoidance.."%")
			
		end
	elseif localizedClass == "Priest" then
		milvl_options.args.tab1.args.PriestDefault.func()
		if spec == "Holy" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = false
			ClassUsesHasteCap = true
			HasteRatingCap = 4821 
			ClassUsesCritCap = false
			DualWieldClass = false
			HitCapped = true --Healers should be marked true here so +hit is not overvalued.
			milvl_options.args.tab1.args.SpecButton2.func()
			

		elseif spec == "Discipline" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = false
			ClassUsesHasteCap = true
			HasteRatingCap = 4821 
			ClassUsesCritCap = false
			DualWieldClass = false
			HitCapped = true --Healers should be marked true here so +hit is not overvalued.
			
			milvl_options.args.tab1.args.SpecButton1.func()
			
			local spellHasteRating = GetCombatRating(CR_HASTE_SPELL) -- for spell haste value shown in character sheet.
			--local spellHastePercentage = GetCombatRatingBonus(CR_HASTE_SPELL) -- for spellpower( number )
			
			
			--if MiLVL_BuffIcons.b_WrathofAirTotem then
			--	HasteRatingCap = HasteRatingCap - (128.05 * 5)
			--end
			--
			--if (MiLVL_BuffIcons.b_SwiftRetribution or MiLVL_BuffIcons.b_ImprovedMoonkinForm) then
			--	HasteRatingCap = HasteRatingCap - (128.05 * 3)
			--end
			
			if spellHasteRating > HasteRatingCap then 
				HasteCapped = true
			end

		elseif spec == "Shadow" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false 
			--HasteRatingCap = 1640
			ClassUsesCritCap = false
			DualWieldClass = false
			HitRatingCap = 1742
			PlayerHitRequired = 1742
			milvl_options.args.tab1.args.SpecButton3.func()
			
			HitRatingFromTalents = 0
			--Check Twisted Faith for hit rating
			local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(3, 20, "player");
			--print(name)
			if currentRank > 0 then
				MiLVL_BuffIcons.i_TwistedFaith = currentRank
				--Twisted Faith is now a 50% of Spirit per talent point to Hit conversion.
				local base, stat, posBuff, negBuff = UnitStat("player", 5);
				HitRatingFromTalents = HitRatingFromTalents + (stat * (currentRank*0.5))
				ClassConvertsSpiritToHit = true
			end
			
			
			
			--MiLVL_BuffIcons.b_GlyphofShadow = CheckIfGlyphEquipped(55689) 
			
			--*****************************************************************************
			--HIT RATING
			HitRatingFromTalents = 0
			
			--Check Misery for hit rating
			--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(3, 20, "player");
			--if currentRank > 0 then
			--	--27 spell hit rating per 1%, each rank is worth 1%
			--	HitRatingFromTalents = HitRatingFromTalents + (currentRank * 102.45)
			--end
			
			--Check Shadow Focus for hit rating
			--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(3, 3, "player");
			--if currentRank > 0 then
			--	--27 spell hit rating per 1%
			--	HitRatingFromTalents = HitRatingFromTalents + (currentRank * 102.45)
			--end
					
			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 102.45
			end	
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents
			if HitRatingFromTalents + GetCombatRating(CR_HIT_SPELL) >= HitRatingCap  then
				HitCapped = true
			else 
				HitCapped = false
				--tooltip:AddLine("Additional Hit Rating Required  "..PlayerHitRequired - GetCombatRating(CR_HIT_SPELL) )
			end
			--*****************************************************************************

		end
	elseif localizedClass == "Warrior" then
		milvl_options.args.tab1.args.WarriorDefault.func()
		if spec == "Arms" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			DualWieldClass = false
			ClassUsesExpertiseCap = true
			ClassUsesHardExpertiseCap = false						
			ClassUsesDefCap = false
			HitRatingCap = 961
			PlayerHitRequired = 961
			HitRatingFromTalents = 0
			ExpertiseRatingCap = 780.8
			ExpertiseFromTalents = 0
			milvl_options.args.tab1.args.SpecButton1.func()		
	

			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 102.45
			end	
			
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents
			
			--MiLVL.Print("PlayerHitRequired "..PlayerHitRequired)
			
			--if GetCombatRating(CR_HIT_SPELL) >= PlayerHitRequired then
			if GetCombatRating(CR_HIT_MELEE) >= HitRatingCap then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))

			ExpertiseFromTalents = GetExpertiseRacial()

			if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
				ExpertiseSoftCapped = true
				ExpertiseCapped = true
			else
				ExpertiseCapped = false
			end
			MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))

		elseif spec == "Fury" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			ClassUsesHardExpertiseCap = false
			ClassUsesExpertiseCap = true
			ClassUsesDefCap = false
			HitRatingCap = 961
			PlayerHitRequired = 961
			HitRatingFromTalents = 0
			ExpertiseRatingCap = 780.8
			DualWieldClass = true
			milvl_options.args.tab1.args.SpecButton2.func()
				
			--263 hit rating for melee soft cap or 8%
			
			local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 18, "player");
			if currentRank > 0 then
				HitRatingFromTalents = HitRatingFromTalents + (currentRank * 120.11)
			end
			
			--local meleeHitPercentage =  GetCombatRatingBonus(CR_HIT_MELEE) + GetHitModifier()
			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 120.11
			end	
			
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents
			
			--if meleeHitPercentage > 8 then
			if GetCombatRating(CR_HIT_MELEE) >= HitRatingCap then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))
			
			--Expertise Cap
			if GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
				ExpertiseSoftCapped = true
				ExpertiseCapped = true
			else
				ExpertiseCapped = false
			end
			MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))
			
			
		elseif spec == "Protection" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			ClassUsesExpertiseCap = true
			ExpertiseRatingCap = 780.8
			ClassUsesDefCap = true
			HitRatingCap = 961
			PlayerHitRequired = 961
			HitRatingFromTalents = 0
			ClassUsesHardExpertiseCap = true
			DualWieldClass = false
			milvl_options.args.tab1.args.SpecButton3.func()

			--/run DEFAULT_CHAT_FRAME:AddMessage("Need 102.4 combat table coverage. Currently at: "..string.format("%.2f", GetDodgeChance()+GetBlockChance()+GetParryChance() +5))
			
			
			--961 hit rating for melee soft cap or 8%
			--local meleeHitPercentage =  GetCombatRatingBonus(CR_HIT_MELEE) + GetHitModifier()
			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 120.109
			end	
			
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents
		
			
			--if meleeHitPercentage > 8 then
			if GetCombatRating(CR_HIT_MELEE) >= HitRatingCap then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))
			
			ExpertiseFromTalents = GetExpertiseRacial()		
			

			--Weapon Expertise Talent --Each rank increases Expertise by 5 (8.2*5 = 41)
			--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 17, "player");
			--if currentRank > 0 then
			--	ExpertiseFromTalents = ExpertiseFromTalents + (currentRank * (8.2 * 5))
			--end
			
			if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
				ExpertiseSoftCapped = true
				if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseHardRatingCap then
					ExpertiseCapped = true
				end
			else
				ExpertiseCapped = false
			end
			if ExpertiseCapped then
				MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))
			else
				MiLVL.Print("Expertise Soft-Capped: "..tostring(ExpertiseSoftCapped))
			end
			
			local defcap = CheckDefenseCap()
			MiLVL.Print("DefenseCapped: "..tostring(defcap))
			
			--Block Chance Percentage
			local block1 = GetCombatRatingBonus(CR_BLOCK) + GetBlockChance()
			--MiLVL.Print("Block: "..block1)
			
			--Dodge Chance Percentage
			local dodge1 = GetDodgeChance()
			--MiLVL.Print("Dodge: "..dodge1)
			
			--+GetParryChance()+
			--27% of our Strength is converted into parry rating.
			local parry1 = GetParryChance()
			--MiLVL.Print("Parry: "..parry1)
			
			--The amount of dodge/block/parry received from defense
			local def1 = (GetCombatRating(CR_DEFENSE_SKILL)/4.91850*0.04)
			
			--Add the base chance to the players ratings...
			local totalAvoidance = def1 + parry1 + dodge1 + block1 + 5
			MiLVL.Print(" Total Avoidance: "..totalAvoidance.."%")

		end
	elseif localizedClass == "Warlock" then
		milvl_options.args.tab1.args.WarlockDefault.func()
		MiLVL_ClassSupport = true
		ClassUsesHitCap = true
		ClassUsesHasteCap = false
		ClassUsesCritCap = false
		DualWieldClass = false
		HitRatingCap = 1742
		PlayerHitRequired = 1742
		--DemonicAegis used in stat conversion display
		--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 17, "player");
		--if currentRank > 0 then
		--	MiLVL_BuffIcons.i_DemonicAegis = currentRank
		--end
				
		--b_GlyphofLifeTap used in stat conversion display
		--MiLVL_BuffIcons.b_GlyphofLifeTap = CheckIfGlyphEquipped(63320)

		
		--Warlock Hit Talent Suppression is used in all three specs
		HitRatingFromTalents = 0
		
		--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(1, 5, "player");
		--if currentRank > 0 then
		--	HitRatingFromTalents = HitRatingFromTalents + (currentRank * (102.45))
		--end
		
		if CheckHeroicPresence() then
			HitRatingCap = HitRatingCap - 102.45
		end	
			
		--Check external +spell hit, if true, add 3%
		--if assumeThreePercentHitDebuff or (MiLVL_BuffIcons.b_Misery or MiLVL_BuffIcons.b_ImprovedFaerieFire) then
		--	HitRatingCap = HitRatingCap - (3 * 102.45)
		--end
		
		PlayerHitRequired = HitRatingCap - HitRatingFromTalents
		
		if HitRatingFromTalents + GetCombatRating(CR_HIT_SPELL) >= HitRatingCap then
			HitCapped = true
		else 
			HitCapped = false
		end
		MiLVL.Print("HitCapped: "..tostring(HitCapped))		
		
		if spec == "Affliction" then

			milvl_options.args.tab1.args.SpecButton1.func()
		
		elseif spec == "Demonology" then

			milvl_options.args.tab1.args.SpecButton2.func()
		
		elseif spec == "Destruction" then
			
			milvl_options.args.tab1.args.SpecButton3.func()
		
		end
	elseif localizedClass == "Mage" then
		milvl_options.args.tab1.args.MageDefault.func()
		
		--56382 b_GlyphofMoltenArmor used in stat conversion
		--MiLVL_BuffIcons.b_GlyphofMoltenArmor = CheckIfGlyphEquipped(56382)

		if spec == "Arcane" then
			--Arcane Mage
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			DualWieldClass = false
			HitRatingCap = 1742
			PlayerHitRequired = 1742
			milvl_options.args.tab1.args.SpecButton1.func()
			
			--Mind Mastery 1, 20
			--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(1, 20, "player"); 
			--if currentRank > 0 then
			--	MiLVL_BuffIcons.i_MindMastery = currentRank
			--end
						
			--445.9 Hit Cap
			HitRatingFromTalents = 0
			
			--3/3  Precision Hit Talent Each Rank gives 1% (102.45 Hit Rating for each percent)
			--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(3, 17, "player"); 
			--if currentRank > 0 then
			--	HitRatingFromTalents = HitRatingFromTalents + (currentRank * 102.45)
			--end
			
			-- 3/3  Arcane Focus Hit Talent Each Rank gives 1% (102.45 Hit Rating for each percent)
			--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(1, 3, "player"); 
			--if currentRank > 0 then
			--	HitRatingFromTalents = HitRatingFromTalents + (currentRank * 102.45)
			--end

			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 102.45
			end	
			
			--Check external +spell hit, if true, add 3%
			--if assumeThreePercentHitDebuff or (MiLVL_BuffIcons.b_Misery or MiLVL_BuffIcons.b_ImprovedFaerieFire) then
			--	HitRatingCap = HitRatingCap - (3 * 102.45)
			--end
			
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents
			
			if HitRatingFromTalents + GetCombatRating(CR_HIT_SPELL) >= HitRatingCap then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))

		elseif spec == "Fire" then
			--Fire Mage
			MiLVL_ClassSupport = true			
			ClassUsesCritCap = false
			DualWieldClass = false
			ClassUsesHitCap = true
			HitRatingCap = 1742
			PlayerHitRequired = 1742
			
			ClassUsesHasteCap = true
			HasteRatingCap = 2745
			HasteRatingSoftCap = 1494 
			
			milvl_options.args.tab1.args.SpecButton2.func()
			--445.9 Hit Cap
			HitRatingFromTalents = 0
			
			-- PlayerHitRequired = HitRatingCap - HitRatingFromTalents
			-- local spellHitPercentage =  GetCombatRatingBonus(CR_HIT_SPELL) +  GetSpellHitModifier()
			-- if GetCombatRating(CR_HIT_SPELL) > PlayerHitRequired then
				-- HitCapped = true
			-- else 
				-- HitCapped = false
			-- end
			
			--3/3  Netherwind Presence Talent Each Rank gives 1% (128.05 Haste Rating for each percent)
			local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(1, 15, "player"); 
			--if currentRank > 0 then
			--	HitRatingFromTalents = HitRatingFromTalents + (currentRank * 128.05)
			--end	

			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 102.45
			end	
			
			--Check external +spell hit, if true, add 3%
			--if assumeThreePercentHitDebuff or (MiLVL_BuffIcons.b_Misery or MiLVL_BuffIcons.b_ImprovedFaerieFire) then
			--	HitRatingCap = HitRatingCap - (3 * 102.45)
			--end
			
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents
			
			if HitRatingFromTalents + GetCombatRating(CR_HIT_SPELL) >= HitRatingCap then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))
			
		elseif spec == "Frost" then
			--Frost Mage
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			HitRatingCap = 1742
			PlayerHitRequired = 1742
			DualWieldClass = false
			milvl_options.args.tab1.args.SpecButton3.func()
			--445.9 Hit Cap
			HitRatingFromTalents = 0
			
			--3/3  Precision Hit Talent Each Rank gives 1% (102.45 Hit Rating for each percent)
			--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(3, 17, "player"); 
			--if currentRank > 0 then
			--	HitRatingFromTalents = HitRatingFromTalents + (currentRank * (102.45))
			--end
			
			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 102.45
			end	
			
			--Check external +spell hit, if true, add 3%
			--if assumeThreePercentHitDebuff or (MiLVL_BuffIcons.b_Misery or MiLVL_BuffIcons.b_ImprovedFaerieFire) then
			--	HitRatingCap = HitRatingCap - (3 * 102.45)
			--end
			
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents
			
			if HitRatingFromTalents + GetCombatRating(CR_HIT_SPELL) >= HitRatingCap then
				HitCapped = true
			else 
				HitCapped = false
			end
			MiLVL.Print("HitCapped: "..tostring(HitCapped))
			
		end
	elseif localizedClass == "Hunter" then
		milvl_options.args.tab1.args.HunterDefault.func()
		--Hit Rating
		HitRatingCap = 961
		PlayerHitRequired = 961
		HitRatingFromTalents = 0
		DualWieldClass = true
		-- Focused Aim Hit Talent
		--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 27, "player");
		--if currentRank > 0 then
		--	HitRatingFromTalents = HitRatingFromTalents + (currentRank * 120.11)
		--end
		
		
		if CheckHeroicPresence() then
			HitRatingCap = HitRatingCap - 120.11
		end			
	
		PlayerHitRequired = HitRatingCap - HitRatingFromTalents		


		--local meleeHitPercentage =  GetCombatRatingBonus(CR_HIT_MELEE) + GetHitModifier()
		--if meleeHitPercentage + HitRatingFromTalents/32.8 > 17 then
		if HitRatingFromTalents + GetCombatRating(CR_HIT_RANGED) >= HitRatingCap then
			HitCapped = true
		else 
			HitCapped = false
		end
		MiLVL.Print("HitCapped: "..tostring(HitCapped))
	
		
		if spec == "Beast Mastery" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true


			milvl_options.args.tab1.args.SpecButton1.func()

		
		elseif spec == "Marksmanship" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true


			milvl_options.args.tab1.args.SpecButton2.func()

		
		elseif spec == "Survival" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true

			milvl_options.args.tab1.args.SpecButton3.func()

		
		end
	elseif localizedClass == "Rogue" then

		MiLVL_ClassSupport = true
		ClassUsesHitCap = true
		ClassUsesHardHitCap = true
		ClassUsesHasteCap = false
		ClassUsesCritCap = true --Max 64%
		ClassUsesExpertiseCap = true
		ExpertiseRatingCap = 780.8
		HitSoftCapped = false
		poisonHitCapped = false
		HitRatingCap = 961
		local poisonHitRatingFromTalents = 0
		HitRatingFromTalents = 0
		PlayerHitRequired = 3243
		poisonHitRatingCap = 1742
		autoAttackHitRatingCap = 3243
		DualWieldClass = true
		milvl_options.args.tab1.args.RogueDefault.func()
		if spec == "Assassination" then

			milvl_options.args.tab1.args.SpecButton1.func()

		elseif spec == "Combat" then

			milvl_options.args.tab1.args.SpecButton2.func()
		
		elseif spec == "Subtlety" then		

			milvl_options.args.tab1.args.SpecButton3.func()
			
		end
		
		local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 1, "player");
		if currentRank > 0 then
			HitRatingFromTalents = HitRatingFromTalents + (currentRank * 120.11)
			poisonHitRatingFromTalents = poisonHitRatingFromTalents + (currentRank * 102.45)
			poisonHitRatingCap = poisonHitRatingCap - (currentRank * 102.45)
			autoAttackHitRatingCap = autoAttackHitRatingCap - (currentRank * 120.11)
		end
			
		if CheckHeroicPresence() then
			HitRatingCap = HitRatingCap - 120.11
			poisonHitRatingFromTalents = poisonHitRatingFromTalents - 102.45
			poisonHitRatingCap = poisonHitRatingCap - 102.45
			autoAttackHitRatingCap = autoAttackHitRatingCap - 120.11
		end			
	
		PlayerHitRequired = PlayerHitRequired - HitRatingFromTalents	

		if HitRatingFromTalents + GetCombatRating(CR_HIT_MELEE) >= HitRatingCap then
			MiLVL.Print("Soft hitcapped -- Special Abilities will never miss.")
			HitSoftCapped = true
			if poisonHitRatingFromTalents + GetCombatRating(CR_HIT_SPELL) >= poisonHitRatingCap then
				MiLVL.Print("Poison hitcapped -- Poisons will never miss.")
				poisonHitCapped = true
				if HitRatingFromTalents + GetCombatRating(CR_HIT_MELEE) >= autoAttackHitRatingCap then
					MiLVL.Print("Player hitcapped -- Player will never miss.")
					HitCapped = true
				end
			end
		else 
			HitCapped = false
			MiLVL.Print("HitCapped: "..tostring(HitCapped))
		end	

		ExpertiseFromTalents = GetExpertiseRacial()	
		
		--Weapon Expertise Talent --Each rank increases Expertise by 5 (8.2*5 = 41)
		--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 17, "player");
		--if currentRank > 0 then
		--	ExpertiseFromTalents = ExpertiseFromTalents + (currentRank * (8.2 * 5))
		--end
		
		if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
			ExpertiseCapped = true
		else
			ExpertiseCapped = false
		end	
		MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))
		

	elseif localizedClass == "Death Knight" then
		milvl_options.args.tab1.args.DeathKnightDefault.func()
		if spec == "Blood" then		
			--Blood Tank
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			ClassUsesHardExpertiseCap = true
			ClassUsesExpertiseCap = true
			ExpertiseRatingCap = 780.8
			ClassUsesDefCap = true
			HitRatingCap = 961 
			PlayerHitRequired = 961
			HitRatingFromTalents = 0
			DualWieldClass = true
			milvl_options.args.tab1.args.SpecButton1.func()
						
			--HIT RATING
			--885 hit to never miss dual wield, no buffs

			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 120.11
			end	
			--Check if player has 2h weapon equipped		
			local twohandweapon = IsEquippedItemType("INVTYPE_2HWEAPON")
			if twohandweapon == true then
				
			else
				--If no, get Dual Wield +hit talent Nerves of Cold Steel to modify Hit Cap 
				--HitRating of 32.8 = 1% Hit
				local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 16, "player");
				if currentRank > 0 then
					HitRatingFromTalents = HitRatingFromTalents + (currentRank * 120.11)
				end
			end						
		
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents		



			--Two stages, but we dont want to devalue hit before the hard-cap
			local meleeHitPercentage =  GetCombatRatingBonus(CR_HIT_MELEE) + GetHitModifier()
			
			if HitRatingFromTalents + GetCombatRatingBonus(CR_HIT_MELEE) >= PlayerHitRequired then	
				MiLVL.Print("HitCapped: Melee Soft-Capped")
				if meleeHitPercentage + HitRatingFromTalents/120.11 > 17 then
					HitCapped = true
					MiLVL.Print("HitCapped: "..tostring(HitCapped))
				end
			else 
				HitCapped = false
				MiLVL.Print("HitCapped: "..tostring(HitCapped))
			end
			
			--Veteran of the Third War is no longer a talent, it is a part of Blood Specialization for DKs.
			--If spec == "Blood" then the player gets 6 expertise
			ExpertiseFromTalents = GetExpertiseRacial()	+ (ExpertiseFromTalents + (30.0272 * 6))
			
			if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
				ExpertiseSoftCapped = true
				if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseHardRatingCap then
					ExpertiseCapped = true
				end
			else
				ExpertiseCapped = false
			end
			if ExpertiseCapped then
				MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))
			else
				MiLVL.Print("Expertise Soft-Capped: "..tostring(ExpertiseSoftCapped))
			end
			
			local defcap = CheckDefenseCap()
			MiLVL.Print("DefenseCapped: "..tostring(defcap))
			
			--Block Chance Percentage
			local block1 = GetCombatRatingBonus(CR_BLOCK) + GetBlockChance()
			--MiLVL.Print("Block: "..block1)
			
			--Dodge Chance Percentage
			local dodge1 = GetDodgeChance()
			--MiLVL.Print("Dodge: "..dodge1)
			
			--+GetParryChance()+
			--27% of our Strength is converted into parry rating.
			local parry1 = GetParryChance()
			--MiLVL.Print("Parry: "..parry1)
			
			--The amount of dodge/block/parry received from defense
			local def1 = (GetCombatRating(CR_DEFENSE_SKILL)/4.91850*0.04)
			
			--Add the base chance to the players ratings...
			local totalAvoidance = def1 + parry1 + dodge1 + block1 + 5
			MiLVL.Print(" Total Avoidance: "..totalAvoidance.."%")		
				
		elseif spec == "Frost" then
						
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			ClassUsesExpertiseCap = true
			ClassUsesHardExpertiseCap = false
			ExpertiseRatingCap = 780.8
			ClassUsesDefCap = false	
			DualWieldClass = true
			milvl_options.args.tab1.args.SpecButton2.func()
			--specButton:Show() --Show the Spec Option Button because Frost can be Tank or DPS
			--if UseTankWeights == false then
			--	--Frost DPS 				
			--	ClassUsesDefCap = false	
			--
			--	milvl_options.args.tab1.args.SpecButton2.func()
			--	--loadDefaultStatWeights(2.9, 1.3, 0, 0, 0, 2, 1.5, 1.3, 0, 0, 0, 0, 0, 0, 1, 2, 1.7, 0, 0, 0, 0, 10)
			--	
			--	--else
			--	----Frost Tank				
			--	--ClassUsesDefCap = true	
			--	--milvl_options.args.tab1.args.SpecButton3.func()
			--	--
			--	----540 Defense
			--	--local defcap = CheckDefenseCap()
			--	--MiLVL.Print("DefenseCapped: "..tostring(defcap))
			--	--
			--end
			
			--Both Specs use the info below
			--HIT RATING
				--885 hit to never miss dual wield, no buffs
				HitRatingCap = 961
				PlayerHitRequired = 961
				HitRatingFromTalents = 0
				if CheckHeroicPresence() then
					HitRatingCap = HitRatingCap - 120.11
				end	
				--Check if player has 2h weapon equipped		
				local twohandweapon = IsEquippedItemType("INVTYPE_2HWEAPON")
				--if twohandweapon == true then
				--	
				--else
				--	--If no, get Dual Wield +hit talent Nerves of Cold Steel to modify Hit Cap 
				--	--HitRating of 32.8 = 1% Hit
				--	local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 16, "player");
				--	if currentRank > 0 then
				--		HitRatingFromTalents = HitRatingFromTalents + (currentRank * 120.11)
				--	end
				--end					
				PlayerHitRequired = HitRatingCap - HitRatingFromTalents

				--Two stages, but we dont want to devalue hit before the hard-cap
				local meleeHitPercentage =  GetCombatRatingBonus(CR_HIT_MELEE) + GetHitModifier()
				if meleeHitPercentage + HitRatingFromTalents/120.11 > 8 then	
					MiLVL.Print("HitCapped: Melee Soft-Capped")
					if meleeHitPercentage + HitRatingFromTalents/120.11 > 17 then
						HitCapped = true
						MiLVL.Print("HitCapped: "..tostring(HitCapped))
					end
				else 
					HitCapped = false
					MiLVL.Print("HitCapped: "..tostring(HitCapped))
				end
				
				ExpertiseFromTalents = GetExpertiseRacial()	
				
				-- 5/5  Tundra Stalker Expertise talent... Each Rank gives 1 Expertise (8.2 Expertise Rating)
				--Tundra Stalker
				--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 13, "player"); 
				--if currentRank > 0 then
				--	ExpertiseFromTalents = ExpertiseFromTalents + (currentRank * (8.2))
				--end
				
				if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
					ExpertiseCapped = true
				else
					ExpertiseCapped = false
				end	
				MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))


		elseif spec == "Unholy" then
			MiLVL_ClassSupport = true
			ClassUsesHitCap = true
			ClassUsesHasteCap = false
			ClassUsesCritCap = false
			ClassUsesExpertiseCap = true
			ExpertiseRatingCap = 780.8
			ClassUsesDefCap = false
			ClassUsesHardExpertiseCap = false
			DualWieldClass = true
			milvl_options.args.tab1.args.SpecButton4.func()
			--
			
			--263 hit rating for melee soft cap or 8%
			--289 if Misery on Target
			--368  no Misery
			--885 hit to never miss dual wield, no buffs
			--Nerves of Cold Steel hit talent --Dual Wield Hit Cap is 787 AFTER Nerves of Cold Steel
			--Virulence
			
			-- 10% (263 Rating) with Heroic Presence, Virulence and Misery or Improved Faerie Fire
			-- 11% (289 Rating) with Virulence and Misery or Improved Faerie Fire
			-- 13% (342 Rating) with Heroic Presence and Virulence
			-- 14% (368 Rating) with Virulence (Spell Hit)

			--885 hit to never miss dual wield, no buffs
			HitRatingCap = 961
			PlayerHitRequired = 961
			HitRatingFromTalents = 0
			if CheckHeroicPresence() then
				HitRatingCap = HitRatingCap - 120.11
			end	
			--Check if player has 2h weapon equipped		
			local twohandweapon = IsEquippedItemType("INVTYPE_2HWEAPON")
			--if twohandweapon == true then
			--	
			--else
			--	--If no, get Dual Wield +hit talent Nerves of Cold Steel to modify Hit Cap 
			--	--HitRating of 32.8 = 1% Hit
			--	local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, 16, "player");
			--	if currentRank > 0 then
			--		HitRatingFromTalents = HitRatingFromTalents + (currentRank * (120.11))
			--	end
			--end					
			PlayerHitRequired = HitRatingCap - HitRatingFromTalents

			--Two stages, but we dont want to devalue hit before the hard-cap
			local meleeHitPercentage =  GetCombatRatingBonus(CR_HIT_MELEE) + GetHitModifier()
			if meleeHitPercentage + HitRatingFromTalents/120.11 > 8 then	
				MiLVL.Print("HitCapped: Melee Soft-Capped")
				if meleeHitPercentage + HitRatingFromTalents/120.11 > 17 then
					HitCapped = true
					MiLVL.Print("HitCapped: "..tostring(HitCapped))
				end
			else 
				HitCapped = false
				MiLVL.Print("HitCapped: "..tostring(HitCapped))
			end
			
			
			ExpertiseFromTalents = GetExpertiseRacial()	
			
			-- 5/5  Rage of Rivendare... Each Rank gives 1 Expertise (8.2 Expertise Rating)
			--local name, iconPath, tier, column, currentRank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(3, 20, "player");
			--if currentRank > 0 then
			--	ExpertiseFromTalents = ExpertiseFromTalents + (currentRank * (8.2))
			--end
			if ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE) >= ExpertiseRatingCap then
				ExpertiseCapped = true
			else
				ExpertiseCapped = false
			end
			MiLVL.Print("ExpertiseCapped: "..tostring(ExpertiseCapped))
			
		end
	end
	
	HasteRatingFromTalents = 0
	HitRatingFromTalents = 0
	ExpertiseFromTalents = 0
	DefenseRatingFromTalents = 0
end


milvl_options = {
    name = "MiLVL",
    handler = MiLVL,
    type = "group",
	childGroups = "tab",
    args = {
		tab1 = {
            type = "group",
            name = "Stat Weight Config",
			width = "full",
			order = 1,
			args = {
				Class_spacer = {
					type = "description",
					name = "Class",
					width = "full",
					order = 0,
				},
				Spec_spacer = {
					type = "description",
					name = "Specialization",
					width = "full",
					order = 10,
				},
				DruidDefault = {
					type = "execute",
					name = "Druid",
					desc = "Set default stat weight for the Druid class.",
					confirm = false,
					confirmText = "You sure?",
					func = function() 
						milvl_options.args.tab1.args.SpecButton1.name = "Balance"
						milvl_options.args.tab1.args.SpecButton1.desc = "Set default stat weight for the Balance Druid."
						milvl_options.args.tab1.args.SpecButton1.func = function()															
																	--loadDefaultStatWeights(0, 0, 0.2, 0.69, 0.4, 2.2, 0.78, 0.66,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.1, 0, 0, 0) --Balance
																	loadDefaultStatWeights(0,   0,   0,   1, 1.2, 1.2,  0.65, 0.95,   0.85,   0,   0,   0,   0,   0,   0,        0,  0,      0,  1,   0,        0,       0,   0, 0, 0) --Balance 
																	--					 str, agi, sta, int, spi, hit, crit, haste, mastery, def, dod, par, blk, res, arm, armBonus, ap, expert, sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton1.hidden = false
						milvl_options.args.tab1.args.SpecButton2.name = "Restoration"
						milvl_options.args.tab1.args.SpecButton2.desc = "Set default stat weight for the Restoration Druid."
						milvl_options.args.tab1.args.SpecButton2.func = function()
																	--loadDefaultStatWeights(0, 0, 0.2, 0.3, 0.4, 0, 0.2, 1,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.5, 0, 0 ,0) --Resto
																	loadDefaultStatWeights(0,   0,   0,   1, 0.79,   0,  0.5,  0.95,     0.9,   0,   0,   0,   0,   0,   0,        0,  0,      0,  1, 0.79,        0,       0,   0, 0, 0) --Resto
																	--					 str, agi, sta, int,  spi, hit, crit, haste, mastery, def, dod, par, blk, res, arm, armBonus, ap, expert, sp,  mp5, spellPen, feralAP, wdps, mhs, ohs																	
																end
						milvl_options.args.tab1.args.SpecButton2.hidden = false
						milvl_options.args.tab1.args.SpecButton3.name = "Feral DPS"
						milvl_options.args.tab1.args.SpecButton3.desc = "Set default stat weight for the Feral Druid DPS (Kitty)."
						milvl_options.args.tab1.args.SpecButton3.func = function()
																	--loadDefaultStatWeights(2.379, 2.1, 0, 0, 0, 2.2, 1.8, 1.2, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1.4, 0, 0, 0, 1.2, 1) --Feral Kitty
																	loadDefaultStatWeights(0.39,1.048016497,   0,   0,   0,  0.93, 0.71,  0.62,       1,   0,   0,   0,   0,   0,   0,        0, 0.37,   1.02,  0,   0,        0,    0.37, 1.53, 0, 0) --Feral Kitty
																	--					    str,        agi, sta, int, spi,   hit, crit, haste, mastery, def, dod, par, blk, res, arm, armBonus,   ap, expert, sp, mp5, spellPen, feralAP, wdps, mhs, ohs																	
																end
						milvl_options.args.tab1.args.SpecButton3.hidden = false
						milvl_options.args.tab1.args.SpecButton4.name = "Feral Tank"
						milvl_options.args.tab1.args.SpecButton4.desc = "Set default stat weight for the Feral Druid Tank (Bear)."
						milvl_options.args.tab1.args.SpecButton4.func = function()
																--loadDefaultStatWeights(2.379, 4.5, 7.3, 0, 0, 2.9, 1.5, 2.1, 1.8, 2, 0, 0, 1.5, 3.6, 0.6, 1, 2.7, 1.6, 0, 0, 0, 1.2, 0) --Feral Tank
																loadDefaultStatWeights(0.13,   1,  1.73,   0,   0,  0.25, 0.24,  0.07,    0.37,   0, 0.54,   0,   0, 0.00563, 1.52,     0.35, 0.12,   0.48,  0,   0,        0,    0.12, 0.13, 0, 0) --Feral Tank
																--					    str, agi,   sta, int, spi,   hit, crit, haste, mastery, def,  dod, par, blk,     res,  arm, armBonus,   ap, expert, sp, mp5, spellPen, feralAP, wdps, mhs, ohs																	
																end
						milvl_options.args.tab1.args.SpecButton4.hidden = false
						milvl_options.args.tab1.args.SpecButton5.hidden = true
					end,
					width = 0.6,
					order = 1,
				},
				ShamanDefault = {
					type = "execute",
					name = "Shaman",
					desc = "Set default stat weight for the Shaman class.",
					confirm = false,
					confirmText = "You sure?",
					func = function() 
						milvl_options.args.tab1.args.SpecButton1.name = "Elemental"
						milvl_options.args.tab1.args.SpecButton1.desc = "Set default stat weight for the Elemental Shaman."
						milvl_options.args.tab1.args.SpecButton1.func = function()
												loadDefaultStatWeights( 0,   0,   0, 1.1,1.64,1.64, 0.65,  1.05,       1,   0,   0,   0,   0,   0,   0,        0,  0,      0,1.1,1.64,        0,       0,   0, 0, 0) --elemental
																	--str, agi, sta, int, spi, hit, crit, haste, mastery, def, dod, par, blk, res, arm, armBonus, ap, expert, sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton1.hidden = false
						milvl_options.args.tab1.args.SpecButton2.name = "Enhancement"
						milvl_options.args.tab1.args.SpecButton2.desc = "Set default stat weight for the Enhancement Shaman."
						milvl_options.args.tab1.args.SpecButton2.func = function()
																	loadDefaultStatWeights(  0, 1.5,     0, 0.2,   0,   1.6,  0.9,   0.8,       1,   0,    0,   0,   0,       0,    0,        0,    1,   1.55,  0,   0,        0,       0, 0.4, 1, 1) --Enhancement
																	--					   str, agi,   sta, int, spi,   hit, crit, haste, mastery, def,  dod, par, blk,     res,  arm, armBonus,   ap, expert, sp, mp5, spellPen, feralAP, wdps, mhs, ohs																		
																end
						milvl_options.args.tab1.args.SpecButton2.hidden = false
						milvl_options.args.tab1.args.SpecButton3.name = "Restoration"
						milvl_options.args.tab1.args.SpecButton3.desc = "Set default stat weight for the Restoration Shaman."
						milvl_options.args.tab1.args.SpecButton3.func = function()
																	loadDefaultStatWeights(0,   0,     0,   1,   1,     0,  0.8,  0.94,     0.9,   0,    0,   0,   0,       0,    0,        0,    0,      0,  0,   1,        1,       0,  0, 0, 0)--resto
																	--					 str, agi,   sta, int, spi,   hit, crit, haste, mastery, def,  dod, par, blk,     res,  arm, armBonus,   ap, expert, sp, mp5, spellPen, feralAP, wdps, mhs, ohs		
																end
						milvl_options.args.tab1.args.SpecButton3.hidden = false
						milvl_options.args.tab1.args.SpecButton4.hidden = true
						milvl_options.args.tab1.args.SpecButton5.hidden = true
					end,
					width = 0.6,
					order = 1,
				},
				PriestDefault = {
					type = "execute",
					name = "Priest",
					desc = "Set default stat weight for the Priest class.",
					confirm = false,
					confirmText = "You sure?",
					func = function() 
						milvl_options.args.tab1.args.SpecButton1.name = "Discipline"
						milvl_options.args.tab1.args.SpecButton1.desc = "Set default stat weight for the Discipline Priest."
						milvl_options.args.tab1.args.SpecButton1.func = function()
																	loadDefaultStatWeights(0,   0,     0,   1, 0.875,     0, 0.72,   0.8,    0.69,   0,    0,   0,   0,   0,    0,        0,    0,      0,  1,  0.875,        0,       0,   0, 0, 0) --Discipline
																	--					 str, agi,   sta, int,   spi,   hit, crit, haste, mastery, def,  dod, par, blk, res,  arm, armBonus,   ap, expert, sp,    mp5, spellPen, feralAP, wdps, mhs, ohs																	
																end
						milvl_options.args.tab1.args.SpecButton1.hidden = false
						milvl_options.args.tab1.args.SpecButton2.name = "Holy"
						milvl_options.args.tab1.args.SpecButton2.desc = "Set default stat weight for the Holy Priest."
						milvl_options.args.tab1.args.SpecButton2.func = function()
																	loadDefaultStatWeights(0,   0,     0,   1, 0.875,     0,  0.5,   0.8,    0.75,   0,    0,   0,   0,   0,    0,        0,    0,      0,  0,      1,    0.875,       0,   0, 0, 0) --Holy
																	--					 str, agi,   sta, int,   spi,   hit, crit, haste, mastery, def,  dod, par, blk, res,  arm, armBonus,   ap, expert, sp,    mp5, spellPen, feralAP, wdps, mhs, ohs															
																end
						milvl_options.args.tab1.args.SpecButton2.hidden = false
						milvl_options.args.tab1.args.SpecButton3.name = "Shadow"
						milvl_options.args.tab1.args.SpecButton3.desc = "Set default stat weight for the Shadow Priest."
						milvl_options.args.tab1.args.SpecButton3.func = function()
																	loadDefaultStatWeights(0,   0,     0,   1,   1.5,   1.5,  0.7,  0.95,    0.75,   0,    0,   0,   0,   0,    0,        0,    0,      0,  1,   0,        0,       0,   0, 0, 0) --Shadow
																	--					 str, agi,   sta, int,   spi,   hit, crit, haste, mastery, def,  dod, par, blk, res,  arm, armBonus,   ap, expert, sp, mp5, spellPen, feralAP, wdps, mhs, ohs																		
																end
						milvl_options.args.tab1.args.SpecButton3.hidden = false
						milvl_options.args.tab1.args.SpecButton4.hidden = true
						milvl_options.args.tab1.args.SpecButton5.hidden = true
					end,
					width = 0.6,
					order = 2,
				},
				PaladinDefault = {
					type = "execute",
					name = "Paladin",
					desc = "Set default stat weight for the Paladin class.",
					confirm = false,
					confirmText = "You sure?",
					func = function() 
						milvl_options.args.tab1.args.SpecButton1.name = "Holy"
						milvl_options.args.tab1.args.SpecButton1.desc = "Set default stat weight for the Holy Paladin."
						milvl_options.args.tab1.args.SpecButton1.func = function()
																	loadDefaultStatWeights(0,   0,     0,   1.1,     1,   0,  0.35,  0.55,    0.45,   0,    0,   0,   0,   0,    0,        0,    0,      0,     1,   0,        0,       0,   0, 0, 0) --Holy 4.55
																	--					 str, agi,   sta,   int,   spi, hit,  crit, haste, mastery, def,  dod, par, blk, res,  arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
--Int>Spirit>Haste>Mast>Crit for Hpal in cata																	
																end
						milvl_options.args.tab1.args.SpecButton1.hidden = false
						milvl_options.args.tab1.args.SpecButton2.name = "Protection"
						milvl_options.args.tab1.args.SpecButton2.desc = "Set default stat weight for the Protection Paladin."
						milvl_options.args.tab1.args.SpecButton2.func = function()
																	loadDefaultStatWeights(1, 0.1,     1,     0,     0, 0.8,  0.33,   0.3,     1.6,   0, 0.78,0.77,   0, 0.521152305, 0.06,     0.06,    0,      1,  0,   0,        0,       0,  0.4, 1, 0) --Protection
																	--					 str, agi,   sta,   int,   spi, hit,  crit, haste, mastery, def,  dod, par, blk,         res,  arm, armBonus,   ap, expert, sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton2.hidden = false
						milvl_options.args.tab1.args.SpecButton3.name = "Retribution"
						milvl_options.args.tab1.args.SpecButton3.desc = "Set default stat weight for the Retribution Paladin."
						milvl_options.args.tab1.args.SpecButton3.func = function()
																	loadDefaultStatWeights(1.28, 0.55,     0,     0,     0, 1.65,  0.65,  0.55,       1,   0,    0,   0,   0,   0,    0,        0,    1,    1.7,     0,   0,        0,       0,  0.4, 1, 0) --Retribution
																	--					    str,  agi,   sta,   int,   spi,  hit,  crit, haste, mastery, def,  dod, par, blk, res,  arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton3.hidden = false
						milvl_options.args.tab1.args.SpecButton4.hidden = true
						milvl_options.args.tab1.args.SpecButton5.hidden = true
					end,
					width = 0.6,
					order = 3,
				},
				WarriorDefault = {
					type = "execute",
					name = "Warrior",
					desc = "Set default stat weight for the Warrior class.",
					confirm = false,
					confirmText = "You sure?",
					func = function() 
						milvl_options.args.tab1.args.SpecButton1.name = "Arms"
						milvl_options.args.tab1.args.SpecButton1.desc = "Set default stat weight for the Arms Warrior."
						milvl_options.args.tab1.args.SpecButton1.func = function()
																	loadDefaultStatWeights(1.1, 0.49,     0,     0,     0, 1.13,  0.85,  0.5,     0.65,   0,    0,   0,   0,   0, 0.01,        0, 0.49,   1.12,     0,   0,        0,       0,  0.4, 1, 0) --ARMS
																	--					   str,  agi,   sta,   int,   spi,  hit,  crit, haste, mastery, def,  dod, par, blk, res,  arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton1.hidden = false
						milvl_options.args.tab1.args.SpecButton2.name = "Fury"
						milvl_options.args.tab1.args.SpecButton2.desc = "Set default stat weight for the Fury Warrior."
						milvl_options.args.tab1.args.SpecButton2.func = function()
																	loadDefaultStatWeights(1.25,  0.3,     0,     0,     0,    2,     1,   0.7,    0.92,   0,    0,   0,   0,   0,    0,        0,    1,    2.2,     0,   0,        0,       0,  0.3, 1, 1) --Fury
																	--					    str,  agi,   sta,   int,   spi,  hit,  crit, haste, mastery, def,  dod, par, blk, res,  arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs										
																end
						milvl_options.args.tab1.args.SpecButton2.hidden = false
						milvl_options.args.tab1.args.SpecButton3.name = "Protection"
						milvl_options.args.tab1.args.SpecButton3.desc = "Set default stat weight for the Protection Warrior."
						milvl_options.args.tab1.args.SpecButton3.func = function()
																	loadDefaultStatWeights(0.33, 0.15,     1,     0,     0,  0.67,   0.2,   0.2,     1.2,   0, 0.62,  0.7,   0, 0.5712280702,  0.05,     0.05,    0,   0.67,     0,   0,        0,       0, 0.4, 1, 0) --Prot
																	--					    str,  agi,   sta,   int,   spi,   hit,  crit, haste, mastery, def,  dod,  par, blk,          res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton3.hidden = false
						milvl_options.args.tab1.args.SpecButton4.hidden = true
						milvl_options.args.tab1.args.SpecButton5.hidden = true
					end,
					width = 0.6,
					order = 4,
					hidden = false
				},
				MageDefault = {
					type = "execute",
					name = "Mage",
					desc = "Set default stat weight for the Mage class.",
					confirm = false,
					confirmText = "You sure?",
					func = function() 
						milvl_options.args.tab1.args.SpecButton1.name = "Arcane"
						milvl_options.args.tab1.args.SpecButton1.desc = "Set default stat weight for the Arcane Mage."
						milvl_options.args.tab1.args.SpecButton1.func = function()
																	loadDefaultStatWeights(0,   0,     0,     1,     0,     2,  0.59,   0.9,    0.85,   0,    0,    0,   0,   0,     0,        0,    0,      0,     1,   0,        0,       0,  0, 0,0) --Arcane Mage
																	--					 str, agi,   sta,   int,   spi,   hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton1.hidden = false
						milvl_options.args.tab1.args.SpecButton2.name = "Fire"
						milvl_options.args.tab1.args.SpecButton2.desc = "Set default stat weight for the Fire Mage."
						milvl_options.args.tab1.args.SpecButton2.func = function()
																	loadDefaultStatWeights(0,   0,     0,     1,     0,   1.5,   0.9,  0.84,    0.46,   0,    0,    0,   0,   0,     0,        0,    0,      0,     1,   0,        0,       0,  0, 0,0) --Fire Mage
																	--					 str, agi,   sta,   int,   spi,   hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton2.hidden = false
						milvl_options.args.tab1.args.SpecButton3.name = "Frost"
						milvl_options.args.tab1.args.SpecButton3.desc = "Set default stat weight for the Frost Mage."
						milvl_options.args.tab1.args.SpecButton3.func = function()
																	loadDefaultStatWeights(0,   0,     0,     1,     0,  1.545, 0.941, 0.817,     0.7,   0,    0,    0,   0,   0,     0,        0,    0,      0,     1,   0,        0,       0,  0, 0,0) --Frost Mage
																	--					 str, agi,   sta,   int,   spi,    hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton3.hidden = false
						milvl_options.args.tab1.args.SpecButton4.hidden = true
						milvl_options.args.tab1.args.SpecButton5.hidden = true
					end,
					width = 0.6,
					order = 5,
					hidden = false
				},
				WarlockDefault = {
					type = "execute",
					name = "Warlock",
					desc = "Set default stat weight for the Warlock class.",
					confirm = false,
					confirmText = "You sure?",
					func = function() 
						milvl_options.args.tab1.args.SpecButton1.name = "Affliction"
						milvl_options.args.tab1.args.SpecButton1.desc = "Set default stat weight for the Affliction Warlock."
						milvl_options.args.tab1.args.SpecButton1.func = function()
																	loadDefaultStatWeights(0,   0,     0,     1,     0,    1.2,  0.75,     1,    0.55,   0,    0,    0,   0,   0,     0,        0,    0,      0,     1,   0,        0,       0,  0, 0, 0) --Affliction
																	--					 str, agi,   sta,   int,   spi,    hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																	
																end
						milvl_options.args.tab1.args.SpecButton1.hidden = false
						milvl_options.args.tab1.args.SpecButton2.name = "Demonology"
						milvl_options.args.tab1.args.SpecButton2.desc = "Set default stat weight for the Demonology Warlock."
						milvl_options.args.tab1.args.SpecButton2.func = function()
																	loadDefaultStatWeights(0,   0,     0,     1,     0,    1.7,   0.6,  0.95,    0.82,   0,    0,    0,   0,   0,     0,        0,    0,      0,     1,   0,        0,       0,  0, 0, 0)--Demonology
																	--					 str, agi,   sta,   int,   spi,    hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs

																end
						milvl_options.args.tab1.args.SpecButton2.hidden = false
						milvl_options.args.tab1.args.SpecButton3.name = "Destruction"
						milvl_options.args.tab1.args.SpecButton3.desc = "Set default stat weight for the Destruction Warlock."
						milvl_options.args.tab1.args.SpecButton3.func = function()
																	loadDefaultStatWeights(0,   0,     0,     1,     0,    1.7,  0.84,   0.9,    0.61,   0,    0,    0,   0,   0,     0,        0,    0,      0,     1,   0,        0,       0,   0, 0, 0) --Destruction		
																	--					 str, agi,   sta,   int,   spi,    hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton3.hidden = false
						milvl_options.args.tab1.args.SpecButton4.hidden = true
						milvl_options.args.tab1.args.SpecButton5.hidden = true
					end,
					width = 0.6,
					order = 6,
					hidden = false
				},
				HunterDefault = {
					type = "execute",
					name = "Hunter",
					desc = "Set default stat weight for the Hunter class.",
					confirm = false,
					confirmText = "You sure?",
					func = function() 
						milvl_options.args.tab1.args.SpecButton1.name = "Beast Mastery"
						milvl_options.args.tab1.args.SpecButton1.desc = "Set default stat weight for the Beast Mastery Hunter."
						milvl_options.args.tab1.args.SpecButton1.func = function()
																	loadDefaultStatWeights(0, 1.5,     0,     0,     0,    1.8,  1.05,  0.85,       1,   0,    0,    0,   0,   0,     0,        0,    1,      0,     0,   0,        0,       0,  0.4, 1, 1) --Beast Mastery
																	--					 str, agi,   sta,   int,   spi,    hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs																
																end
						milvl_options.args.tab1.args.SpecButton1.hidden = false
						milvl_options.args.tab1.args.SpecButton2.name = "Marksmanship"
						milvl_options.args.tab1.args.SpecButton2.desc = "Set default stat weight for the Marksmanship Hunter."
						milvl_options.args.tab1.args.SpecButton2.func = function()
																	loadDefaultStatWeights(0,1.31,     0,     0,     0,    1.8,  0.99,  0.92,    0.55,   0,    0,    0,   0,   0,     0,        0,    1,      0,     0,   0,        0,       0,  0.4, 1, 1)--Marksmanship
																	--					 str, agi,   sta,   int,   spi,    hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs												
																end
						milvl_options.args.tab1.args.SpecButton2.hidden = false
						milvl_options.args.tab1.args.SpecButton3.name = "Survival"
						milvl_options.args.tab1.args.SpecButton3.desc = "Set default stat weight for the Survival Hunter."
						milvl_options.args.tab1.args.SpecButton3.func = function()
																	--loadDefaultStatWeights(0, 2.7,     0,     0,     0,      3,   1.6,   1.7,       1,   0,    0,    0,   0,   0,     0,        0,    1,      0,     0,   0,        0,       0,  3, 1, 1)--Survival
																	loadDefaultStatWeights(0,1.62,     0,     0,     0,    1.8,  0.96,  1.02,    0.45,   0,    0,    0,   0,   0,     0,        0,    1,      0,     0,   0,        0,       0,  0.4, 1, 1)--Survival
																	--					 str, agi,   sta,   int,   spi,    hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																	
																	--Agility 					1.62
																	--Hit Rating				1.8
																	--Haste Rating Soft Cap		1.02
																	--Critical Strike Rating	0.96
													--Haste Rating				0.85
																	--Mastery					0.45
																	--Target 7					10.00
																end
						milvl_options.args.tab1.args.SpecButton3.hidden = false
						milvl_options.args.tab1.args.SpecButton4.hidden = true
						milvl_options.args.tab1.args.SpecButton5.hidden = true
					end,
					width = 0.6,
					order = 7,
					hidden = false
				},
				RogueDefault = {
					type = "execute",
					name = "Rogue",
					desc = "Set default stat weight for the Rogue class.",
					confirm = false,
					confirmText = "You sure?",
					func = function() 
						milvl_options.args.tab1.args.SpecButton1.name = "Assassination"
						milvl_options.args.tab1.args.SpecButton1.desc = "Set default stat weight for the Assassination Rogue."
						milvl_options.args.tab1.args.SpecButton1.func = function()
																	--MiLVL.Print(milvl_options.args.tab1.args.SpecButton1.name)
																	loadDefaultStatWeights(0.1,1.85,     0,     0,     0,      2,  0.73,   0.9,       1,   0,    0,    0,   0,   0,     0,        0,    1,    1.9,     0,   0,        0,       0,  0.21, 2.6, 1.3) --Assassination
																	--					   str, agi,   sta,   int,   spi,    hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs											
																end
						milvl_options.args.tab1.args.SpecButton1.hidden = false
						milvl_options.args.tab1.args.SpecButton2.name = "Combat"
						milvl_options.args.tab1.args.SpecButton2.desc = "Set default stat weight for the Combat Rogue."
						milvl_options.args.tab1.args.SpecButton2.func = function()
																	loadDefaultStatWeights(0.1,1.85,     0,     0,     0,      2,  0.65,   0.9,    0.76,   0,    0,    0,   0,   0,     0,        0,    1,      2,     0,   0,        0,       0,  0.21, 2.6, 2.6) --Combat
																	--					   str, agi,   sta,   int,   spi,    hit,  crit, haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs																
																end
						milvl_options.args.tab1.args.SpecButton2.hidden = false
						milvl_options.args.tab1.args.SpecButton3.name = "Subtlety"
						milvl_options.args.tab1.args.SpecButton3.desc = "Set default stat weight for the Subtlety Rogue."
						milvl_options.args.tab1.args.SpecButton3.func = function()
																	loadDefaultStatWeights(0.1, 1.5,     0,     0,     0, 1.26625, 0.3654035714, 	   0.95,    0.28,   0,    0,    0,   0,   0,     0,        0,    1,      2,     0,   0,        0,       0,  0.21, 2.6, 1.3) --Subtlety
																	--					   str, agi,   sta,   int,   spi,     hit,         crit,      haste, mastery, def,  dod,  par, blk, res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs	
																end
						milvl_options.args.tab1.args.SpecButton3.hidden = false
						milvl_options.args.tab1.args.SpecButton4.hidden = true
						milvl_options.args.tab1.args.SpecButton5.hidden = true
					end,
					width = 0.6,
					order = 8,
					hidden = false
				},
				DeathKnightDefault = {
					type = "execute",
					name = "DK",
					desc = "Set default stat weight for the Death Knight class.",
					confirm = false,
					confirmText = "You sure?",
					func = function() 
						milvl_options.args.tab1.args.SpecButton1.name = "Blood"
						milvl_options.args.tab1.args.SpecButton1.desc = "Set default stat weight for the Blood Death Knight."
						milvl_options.args.tab1.args.SpecButton1.func = function()
																	loadDefaultStatWeights(0.62, 0.1,     1,     0,     0,    0.77,          0.2,      0.4,    0.95,   0, 0.35,  0.3,   0, 0.6173666667,  0.05,     0.05,    0,   0.67,     0,   0,        0,       0,  3, 1, 0) --Blood Tank
																	--					    str, agi,   sta,   int,   spi,     hit,         crit,    haste, mastery, def,  dod,  par, blk,          res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton1.hidden = false
						milvl_options.args.tab1.args.SpecButton2.name = "Frost DPS"
						milvl_options.args.tab1.args.SpecButton2.desc = "Set default stat weight for DPS Frost Death Knight."
						milvl_options.args.tab1.args.SpecButton2.func = function()
																	loadDefaultStatWeights(2.1, 0.1,     0,     0,     0,       2,         0.95,      1.1,     0.9,   0,    0,    0,   0,            0,     0,        0,    1,    1.9,     0,   0,        0,       0,  3, 1, -1) --Frost DPS
																	--					   str, agi,   sta,   int,   spi,     hit,         crit,    haste, mastery, def,  dod,  par, blk,          res,   arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP, wdps, mhs, ohs													

																end
						milvl_options.args.tab1.args.SpecButton2.hidden = false
						milvl_options.args.tab1.args.SpecButton3.name = "Frost Tank"
						milvl_options.args.tab1.args.SpecButton3.desc = "Set default stat weight for Tank Frost Death Knight."
						milvl_options.args.tab1.args.SpecButton3.func = function()
																	loadDefaultStatWeights(0.2237883333,0.4366833333,0.7520833333,0,0,0.4918783333,0.5549583333,0.1212833333,0,0.5943833333,0.5155333333,0.4209133333,0,0.5155333333,0.003008333333,0.003008333333,0.01089333333,0.4918783333,0.1212833333,0,0,0,0,0.7441983333) --Frost Tank
																			--str0.33, agi 0.6, sta1, int0, spi0, hit0.67, crit0.75, haste0.2, def0.8, dod0.7, par0.58, blk0, res0.7, arm0.05, ap0.06, expert0.67, armorPen0.2, sp0, mp50, spellPen0, feralAP0, wdps0.99, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton3.hidden = true
						milvl_options.args.tab1.args.SpecButton4.name = "Unholy"
						milvl_options.args.tab1.args.SpecButton4.desc = "Set default stat weight for the Unholy Death Knight."
						milvl_options.args.tab1.args.SpecButton4.func = function()
																	loadDefaultStatWeights(1.6, 0.1,     0,     0,     0,    1.58,   0.9,   0.95,     0.6,   0,    0,    0,   0,   0,   0,        0,    1,   1.55,     0,   0,        0,       0, 0.4007514, 3, 1) --Unholy
																	--					   str, agi,   sta,   int,   spi,     hit,  crit,  haste, mastery, def,  dod,  par, blk, res, arm, armBonus,   ap, expert,    sp, mp5, spellPen, feralAP,  wdps, mhs, ohs
																end
						milvl_options.args.tab1.args.SpecButton4.hidden = false
						milvl_options.args.tab1.args.SpecButton5.hidden = true
					end,
					width = 0.6,
					order = 9,
					hidden = false
				},
				SpecButton1 = {
					type = "execute",
					name = "",
					desc = "Select a class above.",
					confirm = false,
					confirmText = "You sure?",
					func = function()
						--loadDefaultStatWeights(0, 0, 0.2, 0.3, 0.4, 0, 0.2, 1,0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.5, 0) --Resto
					end,
					width = 0.6,
					order = 11,
				},
				SpecButton2 = {
					type = "execute",
					name = "",
					desc = "Select a class above.",
					confirm = false,
					confirmText = "You sure?",
					func = function()
						--loadDefaultStatWeights(0, 0, 0.2, 0.3, 0.4, 0, 0.2, 1,0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.5, 0)
					end,
					width = 0.6,
					order = 12,
				},
				SpecButton3 = {
					type = "execute",
					name = "",
					desc = "Select a class above.",
					confirm = false,
					confirmText = "You sure?",
					func = function()
						--loadDefaultStatWeights(0, 0, 0.2, 0.3, 0.4, 0, 0.2, 1,0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.5, 0)
					end,
					width = 0.6,
					order = 13,
				},
				SpecButton4 = {
					type = "execute",
					name = "",
					desc = "Select a class above.",
					confirm = false,
					confirmText = "You sure?",
					func = function()
						--loadDefaultStatWeights(0, 0, 0.2, 0.3, 0.4, 0, 0.2, 1,0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.5, 0)
					end,
					width = 0.6,
					order = 14,
					hidden = true
				},
				SpecButton5 = {
					type = "execute",
					name = "",
					desc = "Select a class above.",
					confirm = false,
					confirmText = "You sure?",
					func = function()
						--loadDefaultStatWeights(0, 0, 0.2, 0.3, 0.4, 0, 0.2, 1,0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0.5, 0)
					end,
					width = 0.6,
					order = 14,
					hidden = true
				},
				spacer1 = {
					type = "description",
					name = "MiLVL Base Stat Weights      "..spec .." "..localizedClass,
					width = "full",
					order = 101,
				},
				StatWeightUI_Strength  = {
					type = "range",
					name = "Strength",
					desc = "",
					min = 0.000,
					max = 10.000,			
					softMin = 0.000, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10.000, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.001, --step value: "smaller than this will break the code" (default=no stepping limit)
					--bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.Strength end,
					set = function(info, val)
						Stats.Strength = val 
						StatWeightsUI.Strength = val
						MiLVLDB.DB_Strength = val 
						end,
					width = 2,
					order = 102,
				},
				StatWeightUI_Agility   = {
					type = "range",
					name = "Agility",
					desc = "",			
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.001, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.Agility end,
					set = function(info, val) 
						Stats.Agility = val 
						StatWeightsUI.Agility = val 
						MiLVLDB.DB_Agility = val
					end,
					width = 2,
					order = 103,
				},
				StatWeightUI_Stamina   = {
					type = "range",
					name = "Stamina",
					desc = "",
					min = 0.000,
					max = 10.000,			
					softMin = 0.000, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10.000, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.001, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.Stamina end,
					set = function(info, val) 
						Stats.Stamina = val 
						StatWeightsUI.Stamina = val
						MiLVLDB.DB_Stamina = val
						end,
					width = 2,
					order = 104,
				},
				StatWeightUI_Intellect = {
					type = "range",
					name = "Intellect",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.Intellect end,
					set = function(info, val) 
						Stats.Intellect = val 
						StatWeightsUI.Intellect = val
						MiLVLDB.DB_Intellect = val
						end,
					width = 2,
					order = 105,
				},
				StatWeightUI_Spirit    = {
					type = "range",
					name = "Spirit",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.Spirit end,
					set = function(info, val) 
						Stats.Spirit = val 
						StatWeightsUI.Spirit = val
						MiLVLDB.DB_Spirit = val
						end,
					width = 2,
					order = 106,
				},
				spacer2 = {
					type = "description",
					name = "MiLVL Common Stat Weights ",
					width = "full",
					order = 107,
				},
				StatWeightUI_HitRating 	  = {
					type = "range",
					name = "Hit Rating",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.HitRating end,
					set = function(info, val) 
						Stats.HitRating = val 
						StatWeightsUI.HitRating = val
						MiLVLDB.DB_HitRating = val
						end,
					width = 2,
					order = 108,
				},
				StatWeightUI_CritRating   = {
					type = "range",
					name = "Crit Rating",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.CritRating end,
					set = function(info, val) 
						Stats.CritRating = val 
						StatWeightsUI.CritRating = val 
						MiLVLDB.DB_CritRating = val 
						end,
					width = 2,
					order = 109,
				},
				StatWeightUI_HasteRating  = {
					type = "range",
					name = "Haste Rating",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.HasteRating end,
					set = function(info, val) 
						Stats.HasteRating = val
						StatWeightsUI.HasteRating = val
						MiLVLDB.DB_HasteRating = val
						end,
					width = 2,
					order = 110,
				},
				StatWeightUI_MasteryRating  = {
					type = "range",
					name = "Mastery Rating",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.MasteryRating end,
					set = function(info, val) 
						Stats.MasteryRating = val
						StatWeightsUI.MasteryRating = val
						MiLVLDB.DB_MasteryRating = val
						end,
					width = 2,
					order = 111,
				},
				spacer3 = {
					type = "description",
					name = "MiLVL Spell Stat Weights ",
					width = "double",
					order = 112,
				},
				StatWeightUI_SpellPower  = {
					type = "range",
					name = "Spell Power",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.SpellPower end,
					set = function(info, val) 
						Stats.SpellPower = val 
						StatWeightsUI.SpellPower = val 
						MiLVLDB.DB_SpellPower = val 
						end,
					width = 2,
					order = 113,
				},
				StatWeightUI_Mp5  = {
					type = "range",
					name = "Mp5 (Mana per 5)",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.Mp5 end,
					set = function(info, val) 
						Stats.Mp5 = val 
						StatWeightsUI.Mp5 = val 
						MiLVLDB.DB_Mp5 = val 
						end,
					width = 2,
					order = 114,
				},
				StatWeightUI_SpellPen  = {
					type = "range",
					name = "Spell Penetration",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.SpellPen end,
					set = function(info, val) 
						Stats.SpellPen = val 
						StatWeightsUI.SpellPen = val 
						MiLVLDB.DB_SpellPen = val 
						end,	
					width = 2,
					order = 115,
				},
				
				spacer4 = {
					type = "description",
					name = "MiLVL Melee Stat Weights ",
					width = "double",
					order = 116,
				},
				StatWeightUI_Armor  = {
					type = "range",
					name = "Armor",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.Armor end,
					set = function(info, val) 
						Stats.Armor = val 
						StatWeightsUI.Armor = val
						MiLVLDB.DB_Armor = val
						end,
					width = 2,
					order = 117,
				},
				StatWeightUI_BonusArmor  = {
					type = "range",
					name = "Bonus Armor",
					desc = "Armor on Jewelry, weapons...",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.BonusArmor end,
					set = function(info, val) 
						Stats.BonusArmor = val 
						StatWeightsUI.BonusArmor = val
						MiLVLDB.DB_BonusArmor = val
						end,
					width = 2,
					order = 118,
				},
				StatWeightUI_AttackPower  = {
					type = "range",
					name = "Attack Power",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.AttackPower end,
					set = function(info, val) 
						Stats.AttackPower = val 
						StatWeightsUI.AttackPower = val 
						MiLVLDB.DB_AttackPower = val 
						end,
					width = 2,
					order = 120,
				},
				StatWeightUI_Expertise  = {
					type = "range",
					name = "Expertise",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.Expertise end,
					set = function(info, val) 
						Stats.Expertise = val
						StatWeightsUI.Expertise = val
						MiLVLDB.DB_Expertise = val
						end,
					width = 2,
					order = 121,
				},
				--StatWeightUI_ArmorPen  = {
				--	type = "range",
				--	name = "Armor Penetration",
				--	desc = "",
				--	min = 0,
				--	max = 10,			
				--	softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
				--	softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
				--	step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
				--	bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
				--	get = function(info) return StatWeightsUI.ArmorPen end,
				--	set = function(info, val) 
				--		Stats.ArmorPen = val
				--		StatWeightsUI.ArmorPen = val
				--		MiLVLDB.DB_ArmorPen = val
				--		end,
				--	width = 2,
				--	order = 122,
				--},
				StatWeightUI_FeralAtkPower  = {
					type = "range",
					name = "Feral Attack Power",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step = 0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.FeralAtkPower end,
					set = function(info, val) 
						Stats.FeralAtkPower = val
						StatWeightsUI.FeralAtkPower = val
						MiLVLDB.DB_FeralAtkPower = val
						end,
					width = 2,
					order = 123,
				},
				StatWeightUI_WeaponDPS  = {
					type = "range",
					name = "Weapon Damage",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step = 0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.WeaponDPS end,
					set = function(info, val) 
						Stats.WeaponDPS = val
						StatWeightsUI.WeaponDPS = val
						MiLVLDB.DB_WeaponDPS = val
						end,
					width = 2,
					order = 124,
				},
				StatWeightUI_MainHandWeaponSpeed  = {
					type = "range",
					name = "Main Hand Weapon Speed",
					desc = "The weapon speed of the mainhand weapon.",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step = 0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.MainHandWeaponSpeed end,
					set = function(info, val) 
						Stats.MainHandWeaponSpeed = val
						StatWeightsUI.MainHandWeaponSpeed = val
						MiLVLDB.DB_MainHandWeaponSpeed = val
						end,
					width = 2,
					order = 125,
				},
				StatWeightUI_OffHandWeaponSpeed  = {
					type = "range",
					name = "Off Hand Weapon Speed",
					desc = "The weapon speed of the offhand weapon.",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step = 0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.OffHandWeaponSpeed end,
					set = function(info, val) 
						Stats.OffHandWeaponSpeed = val
						StatWeightsUI.OffHandWeaponSpeed = val
						MiLVLDB.DB_OffHandWeaponSpeed = val
						end,
					width = 2,
					order = 125,
				},										 
				spacer5 = {
					type = "description",
					name = "MiLVL Defensive Stat Weights ",
					width = "double",
					order = 140,
				},
				StatWeightUI_DefenseRating  = {
					type = "range",
					name = "Defense Rating",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.DefenseRating end,
					set = function(info, val) 
						Stats.DefenseRating = val 
						StatWeightsUI.DefenseRating = val
						MiLVLDB.DB_DefenseRating = val
						end,
					width = 2,
					order = 141,
				},
				StatWeightUI_DodgeRating  = {
					type = "range",
					name = "Dodge Rating",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.DodgeRating end,
					set = function(info, val) 
						Stats.DodgeRating = val 
						StatWeightsUI.DodgeRating = val 
						MiLVLDB.DB_DodgeRating = val 
						end,
					width = 2,
					order = 142,
				},
				StatWeightUI_ParryRating  = {
					type = "range",
					name = "Parry Rating",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.ParryRating end,
					set = function(info, val) 
						Stats.ParryRating = val 
						StatWeightsUI.ParryRating = val 
						MiLVLDB.DB_ParryRating = val 
						end,
					width = 2,
					order = 143,
				},
				StatWeightUI_BlockRating  = {
					type = "range",
					name = "Block Rating",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.BlockRating end,
					set = function(info, val) 
						Stats.BlockRating = val
						StatWeightsUI.BlockRating = val
						MiLVLDB.DB_BlockRating = val
						end,
					width = 2,
					order = 144,
				},
				StatWeightUI_Resilience  = {
					type = "range",
					name = "Resilience",
					desc = "",
					min = 0,
					max = 10,			
					softMin = 0, -- "soft" minimal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					softMax = 10, -- "soft" maximal value, used by the UI for a convenient limit while allowing manual input of values up to min/max
					step =0.01, --step value: "smaller than this will break the code" (default=no stepping limit)
					bigStep = 0.1, -- a more generally-useful step size. Support in UIs is optional.
					get = function(info) return StatWeightsUI.Resilience end,
					set = function(info, val) 
						Stats.Resilience = val 
						StatWeightsUI.Resilience = val
						MiLVLDB.DB_Resilience = val
						end,
					width = 2,
					order = 145,
				},
			},
		},
		tab2 = {
            type = "group",
            name = "Tooltip Config",
			width = "full",
			order = 2,
			args = {
				buff_spacer21 = {
					type = "description",
					name = "Primary Stat Conversions",
					width = "double",
					order = 99,
				},
				buff_spacer22 = {
					type = "description",
					name = "Added Tooltip Lines",
					width = "double",
					order = 102,
				},
				buff_spacer23 = {
					type = "description",
					name = "Calculation Accuracy Options",
					width = "double",
					order = 120,
				},
				UI_useRareGems = {
					type = "toggle",
					name = "Use Rare Gems",
					desc = "MiLVL defaults to epic gems. If checked, MiLVL will use rare gem values instead. Enabling this will make socket values slightly more accurate if you are using Rare Gems. I am unaware of a scenario where this would change a suggestion.",
					descStyle = "inline",
					get = function(info) return useRareGems end,
					set = function(info, val)
							UI_useRareGems = val
							MiLVLDB.DB_useRareGems = val
							useRareGems = val 
						end,
					width = "full",
					order = 121,
				},
				UI_displaySpellpowerConversion = {
					type = "toggle",
					name = "Display Spellpower Conversion",
					desc = "When enabled, this will display the spellpower conversion rate on primary stats, where listed.",
					descStyle = "inline",
					get = function(info) return displaySpellpowerConversion end,
					set = function(info, val)
							UI_displaySpellpowerConversion = val
							MiLVLDB.DB_displaySpellpowerConversion = val
							displaySpellpowerConversion = val 
						end,
					width = "full",
					order = 100,
				},
				UI_displayCritRatingConversion = {
					type = "toggle",
					disabled = false,
					name = "Display Critical Strike Rating Conversion",
					desc = "When enabled, this will display the Critical Strike Rating conversion rate on primary stats, where listed.",
					descStyle = "inline",
					get = function(info) return displayCritRatingConversion end,
					set = function(info, val)
							UI_displayCritRatingConversion = val
							MiLVLDB.DB_displayCritRatingConversion = val
							displayCritRatingConversion = val 
						end,
					width = "full",
					order = 101,
				},
				UI_displayItemLevel = {
					type = "toggle",
					name = "Tooltip: Display Item Level",
					desc = "When enabled, this will add a line to the tooltip that displays Item Level.",
					descStyle = "inline",
					get = function(info) return displayItemLevel end,
					set = function(info, val)
							UI_displayItemLevel = val
							MiLVLDB.DB_displayItemLevel = val
							displayItemLevel = val 
						end,
					width = "full",
					order = 107,
				},
				UI_displayItemLevelUpgrade = {
					type = "toggle",
					name = "Tooltip: Display Item Level Upgrade",
					desc = "When enabled, this will add a line to the tooltip that states whether it is Item Level upgrade over the item currently equipped in that slot.",
					descStyle = "inline",
					get = function(info) return displayItemLevelUpgrade end,
					set = function(info, val)
							UI_displayItemLevelUpgrade = val
							MiLVLDB.DB_displayItemLevelUpgrade = val
							displayItemLevelUpgrade = val 
						end,
					width = "full",
					order = 108,
				},
				UI_displayClassUpgrade = {
					type = "toggle",
					name = "Tooltip: Display Class Upgrade",
					desc = "When enabled, this will add a line to the tooltip that provides the class / spec upgrade suggestion.",
					descStyle = "inline",
					get = function(info) return displayClassUpgrade end,
					set = function(info, val)
							UI_displayClassUpgrade = val
							MiLVLDB.DB_displayClassUpgrade = val
							displayClassUpgrade = val 
						end,
					width = "full",
					order = 109,
				},
				UI_displayMiLVLScore = {
					type = "toggle",
					name = "Tooltip: Display MiLVL Score",
					desc = "When enabled, this will add a line to the tooltip that displays MiLVL Score",
					descStyle = "inline",
					get = function(info) return displayMiLVLScore end,
					set = function(info, val)
							UI_displayMiLVLScore = val
							MiLVLDB.DB_displayMiLVLScore = val
							displayMiLVLScore = val 
						end,
					width = "full",
					order = 110,
				},
				UI_displayMiLVLReforgeScore = {
					type = "toggle",
					name = "Tooltip: Display Reforged Score",
					desc = "When enabled, this will add a line to the tooltip that displays Reforged Score",
					descStyle = "inline",
					get = function(info) return displayMiLVLReforgeScore end,
					set = function(info, val)
							UI_displayMiLVLReforgeScore = val
							MiLVLDB.DB_displayMiLVLReforgeScore = val
							displayMiLVLReforgeScore = val 
						end,
					width = "full",
					order = 111,
				},
				UI_hideMiLVLReforgeInfoWhenCorrect = {
					type = "toggle",
					name = "Tooltip: Hide Reforged Score When Correct",
					desc = "When enabled, no line will be added to the tooltip, if the Reforge matches the Suggestion",
					descStyle = "inline",
					get = function(info) return hideMiLVLReforgeInfoWhenCorrect end,
					set = function(info, val)
							UI_hideMiLVLReforgeInfoWhenCorrect = val
							MiLVLDB.DB_hideMiLVLReforgeInfoWhenCorrect = val
							hideMiLVLReforgeInfoWhenCorrect = val 
						end,
					width = "full",
					order = 112,
				},
				UI_displayGemPreference = {
					type = "toggle",
					name = "Tooltip: Display Gem Preference",
					desc = "When enabled, this will add a line to the tooltip that displays Gem Preference ",
					descStyle = "inline",
					get = function(info) return displayGemPreference end,
					set = function(info, val)
							UI_displayGemPreference = val
							MiLVLDB.DB_displayGemPreference = val
							displayGemPreference = val 
						end,
					width = "full",
					order = 113,
				},
				UI_displayHitCapInfo = {
					type = "toggle",
					name = "Tooltip: Display Hit Cap Information",
					desc = "When enabled, this will add a line to the tooltip that displays Hit Cap Information.",
					descStyle = "inline",
					get = function(info) return displayHitCapInfo end,
					set = function(info, val)
							UI_displayHitCapInfo = val
							MiLVLDB.DB_displayHitCapInfo = val
							displayHitCapInfo = val 
						end,
					width = "full",
					order = 114,
				}
			}
		},
		tab3 = {
			type = "group",
            name = "Buff Scan Config",
			width = "full",
			order = 3,
			args = {
				buff_spacer1 = {
					type = "description",
					name = "Buff Scanning",
					width = "double",
					order = 99,
				},
				UI_groupScanningEnabled = {
					type = "toggle",
					name = "Enable Group Scanning for Raid Buffs",
					desc = "MiLVL attempts to scan group members talents when the roster changes. Uncheck to disable this.",
					descStyle = "inline",
					get = function(info) return groupScanningEnabled end,
					set = function(info, val)
							UI_groupScanningEnabled = val
							MiLVLDB.DB_groupScanningEnabled = val
							groupScanningEnabled = val 
						end,
					width = "full",
					order = 120,
				},
				UI_assumeThreePercentHitDebuff = {
					type = "toggle",
					name = "Assume Improved Faerie Fire",
					desc = "MiLVL, by default works off of the buffs and debuffs that you and your group is capable of providing. If checked, MiLVL will assume that your target is effected by a Druid's Improved Faerie Fire effect, or a Shadow Priest's Misery effect, even when not in a group.",
					descStyle = "inline",
					get = function(info) return assumeThreePercentHitDebuff end,
					set = function(info, val)
							UI_assumeThreePercentHitDebuff = val
							MiLVLDB.DB_assumeThreePercentHitDebuff = val
							assumeThreePercentHitDebuff = val 
							if AddonInitialized then
								--SetupClass()
							end
						end,
					width = "full",
					order = 121,
				}
			}
		}
	}
}

local function GetDualWieldComparison(itemLink, offhandComparison)

	local itemSpeed = GetWeaponSpeed(itemLink)
	local MhScore = 0
	local OhScore = 0
	if selfComparison then
		if offhandComparison then
			MhScore = ScoreWeaponSpeed(itemSpeed, false) + MiLVL_ItemScore
			OhScore = MiLVL_ItemScore
		else
			MhScore = MiLVL_ItemScore
			OhScore = ScoreWeaponSpeed(itemSpeed, true) + MiLVL_ItemScore			
		end
	else
		if offhandComparison then
			OhScore = MiLVL_ItemScore
			local ohV = ScoreWeaponSpeed(itemSpeed, true)
			MhScore = ScoreWeaponSpeed(itemSpeed, false) + (MiLVL_ItemScore - ohV)
		else
			MhScore = MiLVL_ItemScore
			local mhV = ScoreWeaponSpeed(itemSpeed, false)			
			OhScore = ScoreWeaponSpeed(itemSpeed, true) + (MiLVL_ItemScore - mhV)
		end	
	end


	local mhCheck = GetClassUpgradeAnswer(MhScore, equipScores.MiLVL_Score_MainhandEquip)
	local ohCheck = GetClassUpgradeAnswer(OhScore, equipScores.MiLVL_Score_OffhandEquip)

	return mhCheck, MhScore, ohCheck, OhScore
end

local function ResetGlobalsValues()
	-- MiLVL_ItemScore = 0
	-- MiLVL_GemPreference = ""
	-- MiLVL_MetaGemPreference = ""				   
	-- MiLVL_ReforgeSuggestion = ""
	-- MiLVL_Reforge = false
	--HitCapped = false
	lineAdded = true
	itemLink = nil
	--selfComparison = false	
	equippedItemLinks = nil
end

-------------------------------------------------------------------------
-- EVENT: Addon is Initialized
-------------------------------------------------------------------------
local function DelayedRefresh()
	--MiLVL.Print("DelayedRefresh")
	AddonInitialized = true;
	milvllocal_frame = AceGUI:Create("Frame", "MiLVL_MainFrame")
	MiLVL_MainFrame = milvllocal_frame;
	MiLVL_Hidden_Tooltip:SetOwner(milvllocal_frame.frame, "ANCHOR_CURSOR")
	
	SetupClass();
	--GetClassTalents("player");

	MiLVL_Refresh() ;
	--EquipItemByName(equipLinks.legsEquipLink)
	if spec ~= "" and localizedClass ~= "" then
		MiLVL.Print("Loaded "..spec.." "..localizedClass.. " defaults".." - New Score: "..MiLVL_GearScore)
		--MiLVL.Print("Specialization Loaded - New Score: "..MiLVL_GearScore)
	else
		MiLVL.Print("Specialization not detected. Defaults failed to load for ".. localizedClass)
	end
	milvllocal_frame.frame:Hide()
end

function MiLVL:OnInitialize()
	LibStub("AceConfig-3.0"):RegisterOptionsTable("MiLVL", milvl_options, nil)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("MiLVL"):SetParent(InterfaceOptionsFramePanelContainer)
	loadSavedVariables()
	C_Timer.After(0.2,DelayedRefresh);
end

local f = CreateFrame("Frame", "MiLVL")--, UIParent);
-------------------------------------------------------------------------
-- EVENT: Addon is enabled
-------------------------------------------------------------------------
function MiLVL:OnEnable(...)
	self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED");
	self:RegisterEvent("PLAYER_TALENT_UPDATE");
	--MiLVL:RegisterEvent("TALENT_GROUP_ROLE_CHANGED");
	self:RegisterEvent("FORGE_MASTER_ITEM_CHANGED");
	--self:RegisterEvent("INSPECT_READY");
	--self:RegisterEvent("GROUP_ROSTER_UPDATE");
	--self:RegisterEvent("PLAYER_LOGIN");
	
	--C_Timer.After(1.5,DelayedRefresh);
end

function MiLVL:OnEvent(self, MiLVL_EventName, ...)
	MiLVL.Print(self.." "..MiLVL_EventName)
	self:SetScript("OnEvent", function(self, event, ...)
		print(MiLVL_EventName)
		return self[event](self, event, ...)
	end)
end

-------------------------------------------------------------------------
-- EVENT: Addon is disabled
-------------------------------------------------------------------------
function MiLVL:OnDisable(self, event, ...)
end

local function Rescore()
	SetupClass()
	MiLVL_Refresh()
	MiLVL.Print("Gear Changed - New Score: "..MiLVL_GearScore)
	--myTimer:Cancel()
end

local myTimer = nil 
function MiLVL:PLAYER_EQUIPMENT_CHANGED(event, equipmentSlotChanged)
	--HitRatingCap = 1742
	--PlayerHitRequired = 1742
	if myTimer == nil then 
		myTimer = C_Timer.NewTimer(0.1, Rescore)
	end
	
	
	if myTimer:IsCancelled() then
		Rescore()
	else
		myTimer:Cancel()
		myTimer = C_Timer.NewTimer(0.1, Rescore)
	end
end

function MiLVL:PLAYER_TALENT_UPDATE(event)
	--HitRatingCap = 1742
	--PlayerHitRequired = 1742
	--MiLVL_ResetClassBooleans()
	SetupClass()
	--GetClassTalents("player");
	MiLVL_Refresh()
	MiLVL.Print("Talents Changed - New Score: "..MiLVL_GearScore)
end

function MiLVL:FORGE_MASTER_ITEM_CHANGED(event)
	--HitRatingCap = 1742
	--PlayerHitRequired = 1742
	Rescore()
	MiLVL.Print("Gear Changed - New Score: "..MiLVL_GearScore)
end

function MiLVL:PLAYER_LOGIN(event)
	--SetupClass()			
	--MiLVL_Refresh()
	--GetClassTalents("player")
	MiLVL.Print("PLAYER_LOGIN: "..MiLVL_GearScore)
	MiLVL.Print("HitCap: "..HitRatingCap)
end

function MiLVL.Print(msg)
	if msg then
		DEFAULT_CHAT_FRAME:AddMessage("|cffFF0000MiLVL: |cFFFFFFFF"..msg)
	end
end

local NotifyInspectHook = function(unitid, ...)
	local a = (...)
	if a ~= nil then
		if a == "MiLVL" then 
			MiLVL_InspectPending = true
		end
	else
		return
	end
end

--Everything below this line is showing up in the tooltip
local lineAdded = false

local function OnTooltipSetItem(tooltip, ...)
	if tooltip:IsForbidden() then
		MiLVL.Print("Tooltip was marked as Forbidden.")
		return 
	end
	MiLVL_ReforgeSuggestion = ""
	reforgedCorrectly = false
	--MiLVL_numSockets = 0
	MiLVL_GemPreference = ""
	local itemName, itemLink = nil
	local comparingTrinket = false
	local comparingRing = false
	itemIsReforged = IsItemReforged()
	selfComparison = false
	
	if not lineAdded then
	
		--If its enabled in options
		--if displaySpellpowerConversion then
		
			----If Class uses Stat to Spellpower conversion, mod lines here.
			--if localizedClass == "Paladin" then
			--	if spec == "Holy" then
			--		for i=1,GameTooltip:NumLines() do 
			--			local ttline = getglobal("GameTooltipTextLeft" .. i) 	
			--			local text = ttline:GetText()
			--			if not string.match(text, " Intellect, ") then
			--				if string.match(text, "+%d+ Intellect") then
			--					text = ConvertStat(text, "Intellect", 0.2, "sp")
			--					ttline:SetText(text)
			--				end	
			--			end
			--		end
			--	end
			--end
			--
			--if localizedClass == "Druid" then
			--	if spec == "Balance" then
			--		-- Improved Moonkin Form
			--		-- 30% of your Spirit as additional spell damage.
			--		
			--		-- Lunar Guidance
			--		-- Increases your spell power by 12% of your total Intellect.
			--	
			--		
			--		for i=1,GameTooltip:NumLines() do 
			--			local ttline = getglobal("GameTooltipTextLeft" .. i) 	
			--			local text = ttline:GetText()
			--			if not string.match(text, " Intellect, ") and not string.match(text, " Spirit, ") then
			--				if string.match(text, "+%d+ Intellect") then
			--					text = ConvertStat(text, "Intellect", 1, "sp")
			--					ttline:SetText(text)
			--				elseif string.match(text, "+%d+ Spirit") then
			--					text = ConvertStat(text, "Spirit", 1, "hit")
			--					ttline:SetText(text)
			--				end	
			--			end
			--		end
			--	end
			--end
			--
			--if localizedClass == "Warlock" then
			--	-- Fel Armor
			--	-- additional spell power equal to 30% of your Spirit.
			--	local conRate = 0.3
			--	
			--	--Glyph of Life Tap
			--	--When you use Life Tap or Dark Pact, you gain 20% of your Spirit as spell power for 40 sec.
			--	if MiLVL_BuffIcons.b_GlyphofLifeTap then
			--		conRate = conRate + 0.2
			--	end
			--		
			--	--DemonicAegis Talent 30145
			--	--Increases the effectiveness of your Demon Armor and Fel Armor spells by 30%. (+3% spirit conversion per rank)
			--	if MiLVL_BuffIcons.i_DemonicAegis > 0 then
			--		conRate = conRate + (MiLVL_BuffIcons.i_DemonicAegis * 0.03)
			--	end
			--	
			--	for i=1,GameTooltip:NumLines() do 
			--		local ttline = getglobal("GameTooltipTextLeft" .. i) 	
			--		local text = ttline:GetText()
			--		if string.match(text, "+%d+ Spirit") then
			--			text = ConvertStat(text, "Spirit", conRate, "sp")
			--			ttline:SetText(text)
			--		end	
			--	end
			--end
			--
			--if localizedClass == "Priest" then
			--	if spec == "Shadow" then
			--		
			--		--Nothing Baseline
			--		local conRate = 0
			--		
			--		--Twisted Faith
			--		--Increases your spell power by 20% of your total Spirit, each rank is worth 4% Spirit Conversion
			--		if MiLVL_BuffIcons.i_TwistedFaith > 0 then
			--			conRate = conRate + (MiLVL_BuffIcons.i_TwistedFaith * 0.04)
			--		end
			--		
			--		--b_GlyphofShadow 42407 56174?
			--		--While in Shadowform, your non-periodic spell critical strikes increase your spell power by 30% of your Spirit for 10 sec.
			--		if MiLVL_BuffIcons.b_GlyphofShadow then
			--			conRate = conRate + (0.3 * 0.7)
			--		end
			--		
			--		for i=1,GameTooltip:NumLines() do 
			--			local ttline = getglobal("GameTooltipTextLeft" .. i) 	
			--			local text = ttline:GetText()
			--			if not string.match(text, " Spirit, ") then
			--				if string.match(text, "+%d+ Spirit") then
			--					text = ConvertStat(text, "Spirit", conRate, "sp")
			--					ttline:SetText(text)
			--				end	
			--			end
			--		end
			--	end
			--end
			--
			--if localizedClass == "Mage" then				
			--	if spec == "Arcane" then
			--	
			--		--Nothing Baseline
			--		local conRate = 0
			--		
			--		--Mind Mastery 1, 20
			--		--Increases your Spellpower by an amount equal to 15% of your Intellect. 3% per rank
			--		if MiLVL_BuffIcons.i_MindMastery > 0 then
			--			conRate = conRate + (MiLVL_BuffIcons.i_MindMastery * 0.03)
			--		end
			--
			--		for i=1,GameTooltip:NumLines() do 
			--			local ttline = getglobal("GameTooltipTextLeft" .. i) 	
			--			local text = ttline:GetText()
			--			if not string.match(text, " Intellect, ") then
			--				if string.match(text, "+%d+ Intellect") then
			--					text = ConvertStat(text, "Intellect", conRate, "sp")
			--					ttline:SetText(text)
			--				end	
			--			end
			--		end
			--
			--	end
			--end
			--
			--if localizedClass == "Shaman" then
			--	if spec == "Restoration" then
			--		--Nature's Blessing
			--		--Increases your healing by an amount equal to 15% of your Intellect.
			--	
			--		for i=1,GameTooltip:NumLines() do 
			--			local ttline = getglobal("GameTooltipTextLeft" .. i) 	
			--			local text = ttline:GetText()
			--			if not string.match(text, " Intellect, ") then
			--				if string.match(text, "+%d+ Intellect") then
			--					text = ConvertStat(text, "Intellect", 1, "sp")
			--					ttline:SetText(text)
			--				end	
			--			end
			--		end
			--	end
			--	if spec == "Elemental" then
			--		--Nature's Blessing
			--		--Increases your healing by an amount equal to 15% of your Intellect.
			--	
			--		for i=1,GameTooltip:NumLines() do 
			--			local ttline = getglobal("GameTooltipTextLeft" .. i) 	
			--			local text = ttline:GetText()
			--			if not string.match(text, " Intellect, ") then
			--				if string.match(text, "+%d+ Intellect") then
			--					text = ConvertStat(text, "Spirit", 1, "hit")
			--					ttline:SetText(text)
			--				end	
			--			end
			--		end
			--	end
			--end
		--end

		--if displayCritRatingConversion then
			--if localizedClass == "Mage" then
			--
			--	--Nothing Baseline	
			--	--35% from molten armor 
			--	local conRate = 0.35
			--	
			--	--20% from glyph --56382
			--	--b_GlyphofMoltenArmor = CheckIfGlyphEquipped(56382)
			--	if MiLVL_BuffIcons.b_GlyphofMoltenArmor then
			--		conRate = conRate + 0.2
			--	end
			--	
			--	
			--	for i=1,GameTooltip:NumLines() do 
			--		local ttline = getglobal("GameTooltipTextLeft" .. i) 	
			--		local text = ttline:GetText()
			--		if not string.match(text, " Spirit, ") then
			--			if string.match(text, "+%d+ Spirit") then
			--				text = ConvertStat(text, "Spirit", conRate, "crit")
			--				ttline:SetText(text)
			--			end	
			--		end
			--	end
			--end		
		--end

	
		--prevItem = nil
		if prevItem ~= GameTooltip:GetItem() then
			itemName, itemLink = GameTooltip:GetItem()
			local sName, sLink, iRarity, iLevel, iMinLevel, sType, sSubType, iStackCount, iEquipLoc = GetItemInfo(itemLink)
			MiLVL_ItemBeingCompared = iLevel
			MiLVL_iEquipLoc = iEquipLoc
			MiLVL_IsEquippable = IsEquippableItem(itemLink)
			--print(sType.." "..sSubType)
			if iEquipLoc == "INVTYPE_TABARD" or iEquipLoc == "INVTYPE_BODY" then
				return
			end
			--local itemString = select(3, strfind(equippedItemLink, "|H(.+)|h"))
			--print(itemString)
			--	item:itemId:enchantId:gemId1:gemId2:gemId3:gemId4:suffixId:uniqueId:linkLevel:specializationID:upgradeId:instanceDifficultyId:numBonusIds:bonusId1:bonusId2:upgradeValue
			--local x, y, Color, Ltype, Id, Enchant, Gem1, Gem2, Gem3, Gem4, Suffix, Unique, LinkLvl, Name = string.find(itemLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*):?(%-?%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")

			if sType == "Armor" then
				if sSubType == "Plate" then
					if	localizedClass ~= "Death Knight" and localizedClass ~= "Paladin" and localizedClass ~= "Warrior" then
						return
					end	
				elseif sSubType == "Mail" then
					if	localizedClass ~= "Hunter" and localizedClass ~= "Shaman" then
						return 
					end	
				elseif sSubType == "Leather" then
					if	localizedClass ~= "Druid" and localizedClass ~= "Rogue" then
						return
					end	
				elseif sSubType == "Cloth" and MiLVL_iEquipLoc ~= "INVTYPE_CLOAK" then
					if	localizedClass ~= "Priest" and localizedClass ~= "Mage" and localizedClass ~= "Warlock" then
						return
					end	
				elseif sSubType == "Shields" then
					if localizedClass ~= "Shaman" and localizedClass ~= "Paladin" and localizedClass ~= "Warrior" then
						return
					end	
				end				
				if sSubType == "Relic" and (localizedClass ~= "Druid" and localizedClass ~= "Paladin" and localizedClass ~= "Shaman" and localizedClass ~= "Death Knight") then
					return
				end
			elseif sType == "Weapon" then
				--Melee
				if sSubType == "Two-Handed Swords" then --Two-Handed Swords --Death Knights, Hunters, Paladins, and Warriors
					if	localizedClass ~= "Death Knight" and localizedClass ~= "Hunter" and localizedClass ~= "Paladin" and localizedClass ~= "Warrior" then
						return
					end
				elseif sSubType == "One-Handed Swords" then --One-Handed Swords --Death Knights, Hunters, Paladins, Warriors, Rogues, Mages, and Warlock
					if	localizedClass ~= "Death Knight" and localizedClass ~= "Hunter" and localizedClass ~= "Paladin" and localizedClass ~= "Warrior" and localizedClass ~= "Rogue" and localizedClass ~= "Mage" and localizedClass ~= "Warlock" then
						return
					end
				elseif sSubType == "Two-Handed Maces" then --Two-Handed Maces --Death Knights, Paladins, Shamans, Druids, and Warriors.
					if	localizedClass ~= "Death Knight" and localizedClass ~= "Shaman" and localizedClass ~= "Paladin" and localizedClass ~= "Druid" and localizedClass ~= "Warrior" then
						return
					end				
				elseif sSubType == "One-Handed Maces" then --One-Handed Maces --Death Knights, Paladins, Shamans, Druids, Warriors, Rogues and Priests 
					if	localizedClass ~= "Death Knight" and localizedClass ~= "Shaman" and localizedClass ~= "Paladin" and localizedClass ~= "Druid" and localizedClass ~= "Warrior" and localizedClass ~= "Rogue" and localizedClass ~= "Priest" then
						return
					end					
				elseif sSubType == "Two-Handed Axes" then --Two-Handed Axes --Death Knights, Hunters, Paladins, Shamans, and Warriors.
					if	localizedClass ~= "Death Knight" and localizedClass ~= "Shaman" and localizedClass ~= "Paladin" and localizedClass ~= "Warrior" and localizedClass ~= "Hunter" then
						return
					end					
				elseif sSubType == "One-Handed Axes" then --One-Handed Axes --Death Knights, Hunters, Paladins, Shamans, Warriors and Rogue
					if	localizedClass ~= "Death Knight" and localizedClass ~= "Shaman" and localizedClass ~= "Paladin" and localizedClass ~= "Warrior" and localizedClass ~= "Hunter" and localizedClass ~= "Rogue" then
						return
					end					
				elseif sSubType == "Staves" then --Staves --The only classes not able to wield staves are paladins, death knights, demon hunters, and rogues.
					--Inverse
					if	localizedClass == "Death Knight" or localizedClass == "Rogue" or localizedClass == "Paladin" then
						return
					end						
				elseif sSubType == "Daggers" then --Daggers --Daggers are trainable by all classes except Paladins, Monks, and Death Knights.
					--Inverse
					if	localizedClass == "Death Knight" or localizedClass == "Paladin" then
						return
					end	
				elseif sSubType == "Fist Weapons" then --Fist Weapons --Druid, Hunter, Rogue, Shaman, and Warrior.
					if	localizedClass ~= "Druid" and localizedClass ~= "Shaman" and localizedClass ~= "Warrior" and localizedClass ~= "Hunter" and localizedClass ~= "Rogue" then
						return
					end					
				elseif sSubType == "Polearms" then --Polearms --Druids, Hunters, Rogue, Shamans, and Warriors.
					if	localizedClass ~= "Druid" and localizedClass ~= "Shaman" and localizedClass ~= "Warrior" and localizedClass ~= "Hunter" and localizedClass ~= "Death Knight" then
						return
					end					
				--Ranged
				elseif sSubType == "Wands" then
					if	localizedClass ~= "Priest" and localizedClass ~= "Mage" and localizedClass ~= "Warlock" then
						return
					end
				elseif sSubType == "Bows" then
					if	localizedClass ~= "Hunter" and localizedClass ~= "Rogue" and localizedClass ~= "Warrior" then
						return
					end
				elseif sSubType == "Guns" then
					if	localizedClass ~= "Hunter" and localizedClass ~= "Rogue" and localizedClass ~= "Warrior" then
						return
					end
				elseif sSubType == "Thrown" then
					if	localizedClass ~= "Hunter" and localizedClass ~= "Rogue" and localizedClass ~= "Warrior" then
						return
					end
				elseif sSubType == "Crossbows" then
					if	localizedClass ~= "Hunter" and localizedClass ~= "Rogue" and localizedClass ~= "Warrior" then
						return
					end
				end
			end
		else 
			return
		end
		--Armor
		--Druids = Idols
		--Paladin = Librams
		--Shaman = Totems
		--DK = Sigils
		--Mage = Wands
		
		--Weapons
		--Warrior = Bows, Guns, Thrown

		--Plate
		--Warrior, DK, Paladin
		
		--Mail
		--Hunter, Shaman
		
		--Leather
		--Druid, Rogue
		
		--Cloth
		--Priest, Mage, Warlock


		--Check if the item is an equippable item type
		if MiLVL_IsEquippable == true then
			local currentClassValue = 0
			local equippedIlvl = 0
			local compareOffhand = false
			
			--Maybe set an index instead of passing around the link
			equippedItemLink, currentClassValue, equippedIlvl, comparingRing, comparingTrinket, compareOffhand = SetEquippedItemLink(MiLVL_iEquipLoc)

			local ComparingTwoHandWeaponToMainHand = false
			--If compared item is a 2h weapon, and the player does not have a 2h weapon equipped, score both MH and OH and set the currentClassValue
			if MiLVL_iEquipLoc == "INVTYPE_2HWEAPON" and not IsEquippedItemType("INVTYPE_2HWEAPON") then 
				if equipLinks.offhandEquipLink ~= nil then
					--currentClassValue = ScoreItem(equipLinks.offhandEquipLink) + currentClassValue
					--currentClassValue = ScoreItem(equipLinks.offhandEquipLink) + ScoreItem(equipLinks.mainhandEquipLink)
					ComparingTwoHandWeaponToMainHand = true
					--currentClassValue =  MiLVL_Score_MainhandEquip + MiLVL_Score_OffhandEquip
					--print("currentClassValue: "..currentClassValue)
				end
			end
			
			--Cannot perform the inverse of this, because we are only aware of the item hovered, So only MH or OH, and with only part of the info, we cant make a comparison.
			--Well... maybe we can, is there a way to check for Offhand Items in inventory?
			
			--If compared item is a MainHand weapon, and the player has a 2h weapon equipped, search their inventory for the highest scored Off-hand to correctly value the comparison
			local hypotheticalHigh = 0;
			local highestItemLink = nil;
			if (MiLVL_iEquipLoc == "INVTYPE_WEAPON" or MiLVL_iEquipLoc == "INVTYPE_WEAPONMAINHAND") and not (IsEquippedItemType("INVTYPE_WEAPON") or IsEquippedItemType("INVTYPE_WEAPONMAINHAND")) then
				for i=0,NUM_BAG_SLOTS do		
					for j=1,C_Container.GetContainerNumSlots(i) do
						--Search Inventory for Off-Hand equips...
						local ilink = C_Container.GetContainerItemLink(i,j)
						local _, iL, _, _, _, itemType, itemSubType, _, itemEquipLoc = GetItemInfo(tostring(ilink))
						if itemEquipLoc == "INVTYPE_WEAPONOFFHAND" or itemEquipLoc == "INVTYPE_HOLDABLE" or itemEquipLoc == "INVTYPE_SHIELD" then
							--If an Off-Hand equip is found, score the item.
							local ohFoundScore = ScoreItem(iL)
							if ohFoundScore > hypotheticalHigh then
								highestItemLink = iL
								hypotheticalHigh = ohFoundScore
							end
						end
					end
				end
			elseif (MiLVL_iEquipLoc == "INVTYPE_WEAPONOFFHAND" or MiLVL_iEquipLoc == "INVTYPE_HOLDABLE" or MiLVL_iEquipLoc == "INVTYPE_SHIELD") and IsEquippedItemType("INVTYPE_2HWEAPON") then
				for i=0,NUM_BAG_SLOTS do		
					for j=1,C_Container.GetContainerNumSlots(i) do
						--Search Inventory for Main-Hand equips...
						local ilink = C_Container.GetContainerItemLink(i,j)
						local _, iL, _, _, _, itemType, itemSubType, _, itemEquipLoc = GetItemInfo(tostring(ilink))
						if itemEquipLoc == "INVTYPE_WEAPON" or itemEquipLoc == "INVTYPE_WEAPONMAINHAND" then
							--If an Main-Hand equip is found, score the item.
							local ohFoundScore = ScoreItem(iL)
							if ohFoundScore > hypotheticalHigh then
								highestItemLink = iL
								hypotheticalHigh = ohFoundScore
							end
						end
					end
				end
			end

			
			if MiLVL_ClassSupport then	
			
				--Ignoring stats, is this item an upgrade?				
				if displayItemLevel then
					tooltip:AddLine("Item Level:  "..(MiLVL_ItemBeingCompared))
				end
				if displayItemLevelUpgrade then
					if equippedIlvl >= MiLVL_ItemBeingCompared then
						MiLVL_UpgradeAnswer = "No"
					elseif equippedIlvl < MiLVL_ItemBeingCompared then
						MiLVL_UpgradeAnswer = "Yes"
					end
					tooltip:AddLine("Raw iLvl Upgrade?  "..(MiLVL_UpgradeAnswer))
				end
				
				local hit = (StatWeightsUI.HitRating or 0)
				local spi = (StatWeightsUI.Spirit or 0)
				local crit
				local haste
				--local def
				--local armorPen
				local expertise
				
				local ratingtotal = 0
				if MiLVL_PlayerRole == "CASTER" then
					ratingtotal = GetCombatRating(CR_HIT_SPELL)
				else
					ratingtotal = GetCombatRating(CR_HIT_MELEE)
				end
				if ClassUsesHitCap then
					if ClassUsesHardHitCap then
						local h, tt = CheckHardHitCap(ratingtotal)
						hit = h
						if displayHitCapInfo then
							tooltip:AddLine(tt)
						end
						Stats.HitRating = hit
					else
						if HitCapped then
							hit = 0.001
							--spi = 0.0
							--If we dont drop value of hit here, the gem preference will likely be wrong.
							if ratingtotal - HitRatingCap ~= 0 then
								if displayHitCapInfo then
									tooltip:AddLine("You are "..ratingtotal - HitRatingCap .." over hit cap")							
								end
							end
						else
							hit = (StatWeightsUI.HitRating or 0)
							spi = (StatWeightsUI.Spirit or 0)
							if displayHitCapInfo then
								tooltip:AddLine("Additional Hit Rating Required  "..HitRatingCap - ratingtotal )
							end
						end
						Stats.HitRating = hit
						if ClassConvertsSpiritToHit then
							Stats.Spirit = hit
						end					
					end
				end

				if ClassUsesHasteCap then
					if HasteCapped then
						haste = StatWeightsUI.HasteRating/2
					else
						haste = (StatWeightsUI.HasteRating or 0)
					end
					Stats.HasteRating = haste	
				end
				
				if ClassUsesCritCap then
					if CritCapped then
						crit = StatWeightsUI.CritRating/2
					else
						crit = (StatWeightsUI.CritRating or 0)
					end
					Stats.CritRating = crit
				end
				
				if ClassUsesExpertiseCap then
					if ExpertiseCapped then
						expertise = StatWeightsUI.Expertise/2
					else
						expertise = (StatWeightsUI.Expertise or 0)
						tooltip:AddLine("Additional Expertise Rating Required  "..ExpertiseRatingCap - GetCombatRating(CR_EXPERTISE) )
					end
					--Stats.Expertise = expertise
					
					if ExpertiseSoftCapped and not ExpertiseCapped then
						expertise = StatWeightsUI.Expertise/2
					elseif ExpertiseCapped and ExpertiseSoftCapped then
						expertise = 0.001
						--TODO add option to display this value -- displayExpertiseCapInfo
						if ClassUsesHardExpertiseCap then
							tooltip:AddLine("You are "..GetCombatRating(CR_EXPERTISE) - ExpertiseHardRatingCap .." over expertise cap")	
						else
							tooltip:AddLine("You are "..GetCombatRating(CR_EXPERTISE) - ExpertiseRatingCap .." over expertise cap")	
						end
						
						--print(ExpertiseFromTalents + GetCombatRating(CR_EXPERTISE))
					end
					Stats.Expertise = expertise
				end

				if ClassUsesDefCap then
					if DefenseCapped then
						def = StatWeightsUI.DefenseRating/3
					else
						def = (StatWeightsUI.DefenseRating or 0)
					end
					Stats.Defense = def
				end
				
				--tempScore, speedScore, offhand
				local WeaponSpeedItemScore = 0
				MiLVL_ItemScore, WeaponSpeedItemScore, compareOffhand = ScoreItem(itemLink)
				--print(WeaponSpeedItemScore)
				if WeaponSpeedItemScore > 0 then
					MiLVL_ItemScore = WeaponSpeedItemScore
				end
				--I moved this to try and resolve  issues with detecting selfCompare in lower methods.
				if equippedItemLink == itemLink then
					--MiLVL.Print("Comparing an item to itself, correcting the score")
					--currentClassValue = MiLVL_ItemScore
					selfComparison = true
				else
					selfComparison = false
				end		
				--print(MiLVL_ItemScore)
				MiLVL_ReforgeScore, reforgedCorrectly = GetReforgeValue(itemLink, MiLVL_ItemScore)

				if itemIsReforged and MiLVL_ReforgeScore ~= 0 then
					MiLVL_ItemScore = MiLVL_ReforgeScore
					if selfComparison then
						UpdateItemScore(itemLink, MiLVL_ReforgeScore, equippedItemLink)
					end
				else
					if selfComparison then
						UpdateItemScore(itemLink, MiLVL_ItemScore, nil)
					end
				end
				
				if reforgedCorrectly then
					MiLVL_Reforge = false
				end
				
				
				
				if not ComparingTwoHandWeaponToMainHand then
					--currentClassValue = ScoreItem(equippedItemLink)
					--print(equipScores.MiLVL_Score_MainhandEquip)
					--print("Second item Scored")
					if compareOffhand then
						currentClassValue = equipScores.MiLVL_Score_OffhandEquip
					elseif MiLVL_iEquipLoc == "INVTYPE_WEAPON" and IsEquippedItemType("INVTYPE_2HWEAPON") then
						currentClassValue = equipScores.MiLVL_Score_MainhandEquip
					end
				else
					currentClassValue =  (equipScores.MiLVL_Score_MainhandEquip or 0) + (equipScores.MiLVL_Score_OffhandEquip or 0)
					--currentClassValue = (ScoreItem(equipLinks.mainhandEquipLink) or 0) + (ScoreItem(equipLinks.offhandEquipLink) or 0)
				end
				--print(currentClassValue)

				if hypotheticalHigh > 0 then
					--if hypotheticalHigh + MiLVL_ItemScore > currentClassValue then
						tooltip:AddLine( "Paired with:  "..highestItemLink)
						MiLVL_ItemScore = MiLVL_ItemScore + hypotheticalHigh
					--end
				end
				
				if MiLVL_numMeta > 0 and displayGemPreference then
					if MiLVL_iEquipLoc == "INVTYPE_HEAD" and MiLVL_MetaGemPreference ~= "" then
						tooltip:AddLine(MiLVL_MetaGemPreference)
					end
				end
				if MiLVL_GemPreference ~= "" and displayGemPreference then
					tooltip:AddLine(MiLVL_GemPreference)
				end

				--MiLVL.Print("MiLVL_ItemScore "..MiLVL_ItemScore)
				--MiLVL.Print("currentClassValue "..currentClassValue)
				if selfComparison then
					currentClassValue = MiLVL_ItemScore
				end
	
				if currentClassValue ~= nil then
					MiLVL_ClassUpgradeAnswer = GetClassUpgradeAnswer(MiLVL_ItemScore, currentClassValue)
					--if MiLVL_ItemScore == currentClassValue then
					--	--MiLVL.Print("MiLVL_ItemScore: "..MiLVL_ItemScore.." | ".."currentClassValue: "..currentClassValue )
					--	MiLVL_ClassUpgradeAnswer = "|cFFFFFFFFSide-Grade|r"
					--elseif MiLVL_ItemScore < currentClassValue then 
					--	--MiLVL.Print("MiLVL_ItemScore: "..MiLVL_ItemScore.." | ".."currentClassValue: "..currentClassValue )
					--	MiLVL_ClassUpgradeAnswer = "|cffFF0000No|r"
					--else
					--	--MiLVL.Print("MiLVL_ItemScore: "..MiLVL_ItemScore.." | ".."currentClassValue: "..currentClassValue )
					--	MiLVL_ClassUpgradeAnswer = "|cff00FF00Yes|r"
					--end
					--if MiLVL_ReforgeScore > 0 then
					--	if MiLVL_ItemScore < currentClassValue and MiLVL_ReforgeScore > currentClassValue then 
					--		--MiLVL.Print("ReforgeScore "..MiLVL_ReforgeScore)
					--
					--		MiLVL_ClassUpgradeAnswer = "|cffFF7E40Requires Reforge|r"
					--	end
					--end		
					--if comparingDualWield and MiLVL_iEquipLoc == "INVTYPE_WEAPON" then
					--	MiLVL_ClassUpgradeAnswer = GetDualWieldAnswer(itemLink)
					--end
				else
					tooltip:AddLine("No Item Equipped")
				end

				if ComparingTwoHandWeaponToMainHand then
					tooltip:AddLine("Comparing to Main-Hand & Offhand")
				end
				local dualWieldModifiedString = ""
				if DualWieldClass and MiLVL_iEquipLoc == "INVTYPE_WEAPON" then
					if compareOffhand then
						--tooltip:AddLine("Scored for Off-Hand")
						dualWieldModifiedString = "Scored as Off-Hand "
					else
						--tooltip:AddLine("Scored for Main-Hand")
						dualWieldModifiedString = "Scored as Main-Hand "
					end
				end
				if displayClassUpgrade then
					if comparingTrinket or comparingRing or (DualWieldClass and (MiLVL_iEquipLoc == "INVTYPE_WEAPON" or MiLVL_iEquipLoc == "INVTYPE_WEAPONMAINHAND" or MiLVL_iEquipLoc == "INVTYPE_WEAPONOFFHAND"))then
						if equippedItemLink == nil then
							equippedItemLink = "Empty Slot"
						end
						if dualWieldModifiedString ~= "" then
							
							if compareOffhand then
								tooltip:AddLine( dualWieldModifiedString.."Replacing:  "..(equipLinks.offhandEquipLink or "No Equip"))
							else
								tooltip:AddLine( dualWieldModifiedString.."Replacing:  "..(equipLinks.mainhandEquipLink or "No Equip"))
							end
						else
							tooltip:AddLine("Replacing:  "..equippedItemLink)
						end
						
					end	
					if DualWieldClass and MiLVL_iEquipLoc == "INVTYPE_WEAPON" then
					
						--local itemSpeed = GetWeaponSpeed(itemLink)
						
						--local MhScore = ScoreWeaponSpeed(itemSpeed, false) 
						--local OhScore = ScoreWeaponSpeed(itemSpeed, true) 
						--WeaponSpeedItemScore
						
						
						--local mhCheck = GetClassUpgradeAnswer(MiLVL_ItemScore, equipScores.MiLVL_Score_MainhandEquip)
						--local ohCheck = GetClassUpgradeAnswer(MiLVL_ItemScore, equipScores.MiLVL_Score_OffhandEquip)
						local mhCheck, MhScore, ohCheck, OhScore = GetDualWieldComparison(itemLink, compareOffhand)
						tooltip:AddLine("Upgrade for Main-Hand? ".. mhCheck..":  "..MhScore)
						tooltip:AddLine("Upgrade for Off-Hand? ".. ohCheck..":  "..OhScore)
					else
						tooltip:AddLine("Upgrade for "..spec .." "..localizedClass.."? ".. MiLVL_ClassUpgradeAnswer)
					end				
					
				end
				if displayMiLVLScore and not (DualWieldClass and MiLVL_iEquipLoc == "INVTYPE_WEAPON") then
					tooltip:AddLine("MiLVL Item Score ".. MiLVL_ItemScore)
				end	
				
				if displayMiLVLReforgeScore then
					if hideMiLVLReforgeInfoWhenCorrect then
						if not reforgedCorrectly then
							tooltip:AddLine("Reforge: ".. MiLVL_ReforgeSuggestion)
							tooltip:AddLine("Reforged Score: ".. MiLVL_ReforgeScore)
						end					
					else
						tooltip:AddLine("Reforge: ".. MiLVL_ReforgeSuggestion)
						tooltip:AddLine("Reforged Score: ".. MiLVL_ReforgeScore)
					end
				end
				--tooltip:AddLine("Reforge: ".. MiLVL_ReforgeSuggestion)
			end
			
			--for k, v in pairs(MiLVL_ItemStats) do
			--:AddLine(k.."   "..v)
				-- if MiLVL_ItemStats[k] ~= nil then -- avoids resetting any false values
					
				-- end
			--end
--ResetGlobalsValues()
			--MiLVL_ItemScore = 0
			--MiLVL_GemPreference = ""
			--MiLVL_MetaGemPreference = ""				   
			--MiLVL_ReforgeSuggestion = ""
			--MiLVL_Reforge = false
			----HitCapped = false
			--lineAdded = true
			--itemLink = nil
			----selfComparison = false	
			--equippedItemLinks = nil
		end
	end

end

local function OnTooltipCleared(tooltip, ...)
	
   lineAdded = false
   prevItem = GameTooltip:GetItem()
   
end

GameTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)
GameTooltip:HookScript("OnTooltipCleared", OnTooltipCleared)

local inspectTainted, inpectvalid
local unitinspect 

hooksecurefunc ("NotifyInspect", NotifyInspectHook)

--PaperDollFrame:HookScript("OnShow", MyPaperDoll)
PaperDollFrame:CreateFontString("CharacterSheet_MiLVL")
CharacterSheet_MiLVL:SetFont("Fonts\\FRIZQT__.TTF", 9)
CharacterSheet_MiLVL:SetPoint("BOTTOMLEFT",PaperDollFrame,"BOTTOMLEFT",8,24)