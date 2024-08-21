if not ActionBarSimplifierDB then
    ActionBarSimplifierDB = {}
end

local MainMenuExpBarWidth = nil
local repStatusBarWidth = nil

local function HideActionBarArts()
    if MainMenuBarLeftEndCap and MainMenuBarRightEndCap then
        MainMenuBarLeftEndCap:Hide();
        MainMenuBarRightEndCap:Hide();
    end

    if MainMenuBarTexture0 then
        MainMenuBarTexture0:Hide();
        MainMenuBarTexture1:Hide();
        MainMenuBarTexture2:Hide();
        MainMenuBarTexture3:Hide();
    end

    if MainMenuBarTextureExtender then
        MainMenuBarTextureExtender:Hide();
    end

    if MainMenuMaxLevelBar0 then
        MainMenuMaxLevelBar0:Hide();
        MainMenuMaxLevelBar1:Hide();
        MainMenuMaxLevelBar2:Hide();
        MainMenuMaxLevelBar3:Hide();
    end
end


local function MoveExpBar()
    MainMenuExpBar:ClearAllPoints()
    MainMenuExpBar:SetPoint("TOP", UIParent, "TOP", 0, -5)
    MainMenuExpBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8X8")
    MainMenuExpBar:SetAlpha(0.8)
    MainMenuExpBar:SetScale(0.5)

    -- Create a new frame to set the parent of the text
    local textFrame = CreateFrame("Frame", nil, UIParent)
    textFrame:SetPoint("CENTER", MainMenuExpBar, "CENTER", 0, 0)
    textFrame:SetAlpha(1)
    textFrame:SetSize(MainMenuExpBar:GetWidth(), MainMenuExpBar:GetHeight())
    textFrame:SetScale(0.5)
    textFrame:SetFrameLevel(MainMenuExpBar:GetFrameLevel() + 1)

    -- Change the parent of the text to the new frame
    MainMenuBarExpText:SetParent(textFrame)
    MainMenuBarExpText:ClearAllPoints()
    MainMenuBarExpText:SetPoint("CENTER", textFrame, "CENTER", 0, 0)
    MainMenuBarExpText:SetAlpha(1)
    MainMenuBarExpText:SetTextColor(1, 1, 1, 1)

    local borderFrame = CreateFrame("Frame", nil, MainMenuExpBar)
    borderFrame:SetFrameLevel(MainMenuExpBar:GetFrameLevel() - 1)
    borderFrame:SetSize(MainMenuExpBar:GetWidth() + 2, MainMenuExpBar:GetHeight() + 2)
    borderFrame:SetPoint("CENTER", MainMenuExpBar, "CENTER", 0, 0)

    local borderTexture = borderFrame:CreateTexture(nil, "OVERLAY")
    borderTexture:SetColorTexture(0, 0, 0, 0.3)
    borderTexture:SetAllPoints(borderFrame)

    for i, region in pairs({MainMenuExpBar:GetRegions()}) do
        if region:GetObjectType() == "Texture" then
            local name = region:GetName()
            if name == "MainMenuXPBarTexture0" or name == "MainMenuXPBarTexture1" or name == "MainMenuXPBarTexture2" or name == "MainMenuXPBarTexture3" then
                region:Hide()
            end
        end
    end
end

local function MoveRepBar()
    -- Access the StatusBar child of ReputationWatchBar
    local repStatusBar = ReputationWatchBar.StatusBar

    -- Check if the reputation bar should be shown
    local shouldShowRepBar = GetWatchedFactionInfo() ~= nil

    -- Set up the Reputation Bar
    if shouldShowRepBar then
	ReputationWatchBar:ClearAllPoints()
	ReputationWatchBar:SetPoint("TOP", MainMenuExpBar, "BOTTOM", 0, -5)
	repStatusBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8X8")
	repStatusBar:SetAlpha(0.8)
	repStatusBar:SetScale(0.5)

	ReputationWatchBar.OverlayFrame.Text:ClearAllPoints()
	ReputationWatchBar.OverlayFrame.Text:SetPoint("CENTER", repStatusBar, "CENTER", 0, 0)
	ReputationWatchBar.OverlayFrame.Text:SetScale(0.5)

	ReputationWatchBar:Show()
    else
        ReputationWatchBar:Hide()
    end

    local repBorderFrame = CreateFrame("Frame", nil, repStatusBar)
    repBorderFrame:SetFrameLevel(repStatusBar:GetFrameLevel() - 1)
    repBorderFrame:SetSize(repStatusBar:GetWidth() + 2, repStatusBar:GetHeight() + 2)
    repBorderFrame:SetPoint("CENTER", repStatusBar, "CENTER", 0, 0)

    local repBorderTexture = repBorderFrame:CreateTexture(nil, "OVERLAY")
    repBorderTexture:SetColorTexture(0, 0, 0, 0.3)
    repBorderTexture:SetAllPoints(repBorderFrame)

    for i, region in pairs({repStatusBar:GetRegions()}) do
        if region:GetObjectType() == "Texture" then
            region:Hide()
        end
    end
end


local function SimplifyExpBar()
    MainMenuExpBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8X8")
    MainMenuExpBar:SetAlpha(0.5)
    MainMenuExpBar:SetSize(MainMenuExpBarWidth, 8)

    ExhaustionLevelFillBar:Hide()

    -- Create a new frame to set the parent of the text
    local textFrame = CreateFrame("Frame", nil, UIParent)
    textFrame:SetPoint("CENTER", MainMenuExpBar, "CENTER", 0, 0)
    textFrame:SetAlpha(1)
    textFrame:SetSize(MainMenuExpBar:GetWidth(), MainMenuExpBar:GetHeight())
    textFrame:SetScale(1)
    textFrame:SetFrameLevel(MainMenuExpBar:GetFrameLevel() + 1)

    -- Change the parent of the text to the new frame
    MainMenuBarExpText:SetParent(textFrame)
    MainMenuBarExpText:ClearAllPoints()
    MainMenuBarExpText:SetPoint("CENTER", textFrame, "CENTER", 0, 0)
    MainMenuBarExpText:SetAlpha(0.8)
    MainMenuBarExpText:SetTextColor(1, 1, 1, 1)
    MainMenuBarExpText:SetScale(0.8)

    for i, region in pairs({MainMenuExpBar:GetRegions()}) do
        if region:GetObjectType() == "Texture" then
            local name = region:GetName()
            if name == "MainMenuXPBarTexture0" or name == "MainMenuXPBarTexture1" or name == "MainMenuXPBarTexture2" or name == "MainMenuXPBarTexture3" then
                region:Hide()
            end
        end
    end
end

local function SimplifyRepBar()
    -- Access the StatusBar child of ReputationWatchBar
    local repStatusBar = ReputationWatchBar.StatusBar

    -- Check if the reputation bar should be shown
    local shouldShowRepBar = GetWatchedFactionInfo() ~= nil

    -- Set up the Reputation Bar
    if shouldShowRepBar then
	repStatusBar:SetStatusBarTexture("Interface\\Buttons\\WHITE8X8")
	repStatusBar:SetAlpha(0.5)
	repStatusBar:SetSize(repStatusBarWidth, 6)

	ReputationWatchBar.OverlayFrame.Text:ClearAllPoints()
	ReputationWatchBar.OverlayFrame.Text:SetPoint("CENTER", repStatusBar, "CENTER", 0, 0)
	ReputationWatchBar.OverlayFrame.Text:SetAlpha(0.8)
	ReputationWatchBar.OverlayFrame.Text:SetTextColor(1, 1, 1, 1)
	ReputationWatchBar.OverlayFrame.Text:SetScale(0.8)

	ReputationWatchBar:Show()
    else
        ReputationWatchBar:Hide()
    end


    for i, region in pairs({repStatusBar:GetRegions()}) do
        if region:GetObjectType() == "Texture" then
            region:Hide()
        end
    end
end


local function HandleCheckBox()
    local isChecked = ReputationDetailMainScreenCheckBox:GetChecked()
    local absSetting = ActionBarSimplifierDB.absSetting
    if absSetting == "top" then
	MoveRepBar()
    else
        SimplifyRepBar()
    end
    if not isChecked then
        ReputationWatchBar:Hide()
    end
end


local frame = CreateFrame("Frame")

frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("UPDATE_FACTION")
frame:RegisterEvent("PLAYER_XP_UPDATE")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

frame:SetScript("OnEvent", function(self, event, ...)
    HideActionBarArts()

    if not MainMenuExpBarWidth then
	MainMenuExpBarWidth = MainMenuExpBar:GetWidth() - 16
    end
    if not repStatusBarWidth then
	repStatusBarWidth = ReputationWatchBar.StatusBar:GetWidth() - 16
    end
    
    local absSetting = ActionBarSimplifierDB.absSetting
    if absSetting == "top" then
        MoveExpBar()
        MoveRepBar()
    else
        SimplifyExpBar()
        SimplifyRepBar()
    end
end)


-- Set the event handler for the checkbox
ReputationDetailMainScreenCheckBox:HookScript("OnClick", HandleCheckBox)

SLASH_ABS1 = "/abs"
SlashCmdList["ABS"] = function(msg)
    if msg == "top" then
        ActionBarSimplifierDB.absSetting = "top"

        MoveExpBar()
        MoveRepBar()
        print("Experience and Reputation bars moved to the top.")
    else
        ActionBarSimplifierDB.absSetting = "default"
        SimplifyExpBar()
        SimplifyRepBar()
        print("Experience and Reputation bars set to default position.")
        print("You need to reload the UI to see the changes.")
    end
end
