local frame = CreateFrame("Frame", "PanellerFrame", UIParent, "SecureHandlerStateTemplate")
frame:SetSize(300, 300)
frame:SetPoint("CENTER")
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetClampedToScreen(false)

local draggableArea = CreateFrame("Frame", nil, frame)
draggableArea:SetSize(60, 300)
draggableArea:SetPoint("TOPLEFT", frame, "TOPRIGHT")
draggableArea:EnableMouse(true)
draggableArea:RegisterForDrag("LeftButton")
draggableArea:SetScript(
    "OnDragStart",
    function(self)
        if IsShiftKeyDown() then
            frame:StartMoving()
            if frame.flashTexture and frame.dragText then
                frame.flashTexture:Hide()
                frame.dragText:Hide()
            end
        end
    end
)

draggableArea:SetScript(
    "OnDragStop",
    function(self)
        frame:StopMovingOrSizing()
    end
)

local startActionID = 150

local bindings = {}

local currentBindings = {}

local tooltipToggle

-- Defaults TO BE FIXED (or not?)

local defaultConfig = {
    scale = 1,
    opacity = 1,
    rows = 3,
    columns = 2,
    spacing = 2,
    clickThrough = false,
    tooltips = false
}

local scaleConfig = {
    scale = 1
}

local opacityConfig = {
    opacity = 1
}

local rowsConfig = {
    rows = 5
}

local columnsConfig = {
    columns = 6
}

local spacingConfig = {
    spacing = 2 -- in pixels
}

local function SetScale(scale)
    frame:SetScale(scale)
    PanellerAddonScale = scale
end

local function SetOpacity(opacity)
    frame:SetAlpha(opacity)
    PanellerAddonOpacity = opacity
end

local function FlashDraggableArea()
    local flashTexture = draggableArea:CreateTexture(nil, "OVERLAY")
    flashTexture:SetAllPoints()
    flashTexture:SetColorTexture(0, 1, 0, 0.5)

    local dragText = draggableArea:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    dragText:SetPoint("TOP", draggableArea, "TOP", 0, 20)
    dragText:SetText("Drag by pressing shift")
    dragText:SetTextColor(1, 1, 1, 1)

    local function Flash()
        flashTexture:SetShown(not flashTexture:IsShown())
    end

    local flashTimer = C_Timer.NewTicker(0.5, Flash, 10)

    local function StopFlashing()
        flashTimer:Cancel()
        flashTexture:Show()
        dragText:Show()
    end

    C_Timer.After(
        5,
        function()
            StopFlashing()
        end
    )

    frame.flashTexture = flashTexture
    frame.dragText = dragText
end

local function UpdateButton(button)
    local action = button:GetAttribute("action")
    if HasAction(action) then
        local texture = GetActionTexture(action)
        button.icon:SetTexture(texture)
        button.icon:Show()
    else
        button.icon:Hide()
    end

    -- Cooldown part
    local start, duration, enabled = GetActionCooldown(action)
    if enabled and duration > 0 then
        button.cooldown:SetCooldown(start, duration)
    else
        button.cooldown:Hide()
    end

    -- Drag and drop actions
    button:SetScript(
        "OnReceiveDrag",
        function(self)
            if CursorHasItem() or CursorHasSpell() or CursorHasMacro() then
                PlaceAction(action)
                ClearCursor()
            end
        end
    )

    button:SetScript(
        "OnDragStop",
        function(self)
            if CursorHasItem() or CursorHasSpell() or CursorHasMacro() then
                PlaceAction(action)
                ClearCursor()
            end
        end
    )

    -- Dragging off an action
    button:SetScript(
        "OnDragStart",
        function(self)
            if IsShiftKeyDown() then
                PickupAction(action)
            end
        end
    )

    button:RegisterForDrag("LeftButton")
    button:SetScript(
        "OnDragStart",
        function(self)
            if IsShiftKeyDown() then
                PickupAction(self:GetAttribute("action"))
            end
        end
    )

    button:SetScript(
        "OnDragStop",
        function(self)
            PlaceAction()
            ClearCursor()
        end
    )

    -- Tooltip part
    button:SetScript(
        "OnEnter",
        function(self)
            if PanellerShowTooltips then
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetAction(action)
                GameTooltip:Show()
            end
        end
    )
    button:SetScript(
        "OnLeave",
        function(self)
            GameTooltip:Hide()
        end
    )
end

for i = 1, rowsConfig.rows * columnsConfig.columns do
    local button =
        CreateFrame("Button", "PanellerButton" .. i, frame, "SecureActionButtonTemplate, ActionButtonTemplate")
    button:SetSize(40, 40)
    local row = math.floor((i - 1) / columnsConfig.columns)
    local col = (i - 1) % columnsConfig.columns
    button:SetPoint(
        "TOPLEFT",
        frame,
        "TOPLEFT",
        col * (40 + spacingConfig.spacing),
        -row * (40 + spacingConfig.spacing)
    )
    button:RegisterForClicks("AnyUp")
    button:SetAttribute("type", "action")
    button:SetAttribute("action", startActionID + i - 1)
    button.icon = button:CreateTexture(nil, "BACKGROUND")
    button.icon:SetAllPoints(true)

    button.cooldown = CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
    button.cooldown:SetAllPoints(button)

    button:SetScript(
        "OnEvent",
        function(self, event, ...)
            if
                event == "ACTIONBAR_UPDATE_STATE" or event == "ACTIONBAR_UPDATE_USABLE" or
                    event == "ACTIONBAR_UPDATE_COOLDOWN"
             then
                UpdateButton(self)
            end
        end
    )
    button:RegisterEvent("ACTIONBAR_UPDATE_STATE")
    button:RegisterEvent("ACTIONBAR_UPDATE_USABLE")
    button:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
    UpdateButton(button)
end

local function UpdatePanelClickThrough()
    if PanellerIsClickThrough then
        -- print("Frame is now click-through.")
        frame:EnableMouse(false)
        for _, child in ipairs({frame:GetChildren()}) do
            child:EnableMouse(false)
        end
    else
        -- print("Frame is now interactive.")
        frame:EnableMouse(true)
        for _, child in ipairs({frame:GetChildren()}) do
            child:EnableMouse(true)
        end
    end
end

local function EnsureClickThrough()
    if PanellerIsClickThrough then
        frame:EnableMouse(false)
        for _, child in ipairs({frame:GetChildren()}) do
            child:EnableMouse(false)
        end
    end
end

local function UpdateLayout()
    local numButtons = PanellerRows * PanellerColumns

    frame:SetSize(
        PanellerColumns * (40 + spacingConfig.spacing) - spacingConfig.spacing,
        PanellerRows * (40 + spacingConfig.spacing) - spacingConfig.spacing
    )
    draggableArea:SetHeight(PanellerRows * (40 + spacingConfig.spacing) - spacingConfig.spacing)

    for i = 1, numButtons do
        local button =
            _G["PanellerButton" .. i] or
            CreateFrame("Button", "PanellerButton" .. i, frame, "SecureActionButtonTemplate, ActionButtonTemplate")
        button:SetSize(40, 40)
        local row = math.floor((i - 1) / PanellerColumns)
        local col = (i - 1) % PanellerColumns
        button:SetPoint(
            "TOPLEFT",
            frame,
            "TOPLEFT",
            col * (40 + spacingConfig.spacing),
            -row * (40 + spacingConfig.spacing)
        )

        button:SetAttribute("action", startActionID + i - 1)
        UpdateButton(button)

        button:Show()
    end

    for i = numButtons + 1, rowsConfig.rows * columnsConfig.columns do
        local button = _G["PanellerButton" .. i]
        if button then
            button:Hide()
        end
    end

    rowsConfig.rows = PanellerRows
    columnsConfig.columns = PanellerColumns

    UpdatePanelClickThrough()
end

local function SettingsReset()
    PanellerAddonScale = defaultConfig.scale
    PanellerAddonOpacity = defaultConfig.opacity
    PanellerRows = defaultConfig.rows
    PanellerColumns = defaultConfig.columns
    PanellerPanelSpacing = defaultConfig.spacing
    PanellerIsClickThrough = defaultConfig.clickThrough
    PanellerShowTooltips = defaultConfig.tooltips
    spacingConfig.spacing = defaultConfig.spacing

    frame:ClearAllPoints()
    frame:SetPoint("CENTER")

    for i = 1, PanellerRows * PanellerColumns do
        local button = _G["PanellerButton" .. i]
        if button then
            ClearOverrideBindings(button)
            PickupAction(startActionID + i - 1)
            ClearCursor()
        end
    end

    frame:SetScale(PanellerAddonScale)
    frame:SetAlpha(PanellerAddonOpacity)
    UpdateLayout()
    UpdatePanelClickThrough()

    -- Update sliders and their text
    if opacitySlider then
        opacitySlider:SetValue(PanellerAddonOpacity)
        if opacityValue then
            opacityValue:SetText(string.format("%.1f", PanellerAddonOpacity))
        end
    end
    if scaleSlider then
        scaleSlider:SetValue(PanellerAddonScale)
        if scaleValue then
            scaleValue:SetText(string.format("%.1f", PanellerAddonScale))
        end
    end
    if rowsSlider then
        rowsSlider:SetValue(PanellerRows)
        if rowsValue then
            rowsValue:SetText(tostring(PanellerRows))
        end
    end
    if columnsSlider then
        columnsSlider:SetValue(PanellerColumns)
        if columnsValue then
            columnsValue:SetText(tostring(PanellerColumns))
        end
    end
    if spacingSlider then
        spacingSlider:SetValue(PanellerPanelSpacing)
        if spacingValue then
            spacingValue:SetText(tostring(PanellerPanelSpacing))
        end
    end

    -- Update checkboxes
    if clickThroughCheckbox then
        clickThroughCheckbox:SetChecked(PanellerIsClickThrough)
    end
    if tooltipToggle then
        tooltipToggle:SetChecked(PanellerShowTooltips)
    end

    print("Paneller: Settings have been reset.")
end


local function UpdateKeyBindingButtonText(button, cellId, bindText)
    bindText = bindText or "None"
    if not button then
        print("Paneller: Button not found for cell ID " .. cellId)
    else
        button:SetText("Button " .. cellId .. ": " .. bindText)
    end
end

local function WaitForKeypress(cellId, callback)
    local frame = CreateFrame("Frame")
    frame:EnableKeyboard(true)
    frame:SetPropagateKeyboardInput(true)

    local button = _G["PanellerKeyBindingButton" .. cellId]
    if button then
        button:SetText("Enter Key...")
    end

    frame:SetScript(
        "OnKeyDown",
        function(self, key)
            if key == "ESCAPE" then
                frame:EnableKeyboard(false)
                frame:SetPropagateKeyboardInput(false)
                frame:Hide()
                if button then
                    button:SetText("Button " .. cellId .. ": None")
                end
                return
            end

            if GetBindingAction(key) and GetBindingAction(key) ~= "" and not currentBindings[cellId] == key then
                print("Paneller: Key " .. key .. " is already bound to " .. GetBindingAction(key))
                if button then
                    button:SetText("Button " .. cellId .. ": None")
                end
            else
                callback(key)
                frame:EnableKeyboard(false)
                frame:SetPropagateKeyboardInput(false)
                frame:Hide()
                if button then
                    button:SetText("Button " .. cellId .. ": " .. key)
                end
            end
        end
    )
end

local function RemoveBindingFromCell(cellId)
    if currentBindings[cellId] then
        -- Clear the existing binding
        SetOverrideBinding(PanellerFrame, false, currentBindings[cellId], nil)
        currentBindings[cellId] = nil
        local button = _G["PanellerKeyBindingButton" .. cellId]
        if button then
            button:SetText("Button " .. cellId .. ": None")
        end
    end
end

local function RegisterSettingsPanel()
    local panel = CreateFrame("Frame", "PanellerSettingsPanel", InterfaceOptionsFramePanelContainer)
    panel.name = "Paneller"
    panel:Hide()

    local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("Paneller Settings")

    local description = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    description:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
    description:SetText("Settings for Paneller addon.")

    -- Slider for adjusting panel opacity
    local opacitySliderText = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    opacitySliderText:SetPoint("TOPLEFT", description, "BOTTOMLEFT", 0, -20)
    opacitySliderText:SetText("Panel Opacity")

    opacitySlider = CreateFrame("Slider", "PanellerOpacitySlider", panel, "OptionsSliderTemplate")
    opacitySlider:SetPoint("TOPLEFT", opacitySliderText, "BOTTOMLEFT", 0, -6)
    opacitySlider:SetWidth(200)
    opacitySlider:SetMinMaxValues(0, 1)
    opacitySlider:SetValueStep(0.1)
    opacitySlider:SetObeyStepOnDrag(true)
    opacitySlider:SetOrientation("HORIZONTAL")
    opacitySlider:SetValue(PanellerAddonOpacity or opacityConfig.opacity) -- Set initial value

    opacityValue = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    opacityValue:SetPoint("TOP", opacitySlider, "BOTTOM", 0, -2) -- Position centrally below the slider
    opacityValue:SetText(string.format("%.1f", PanellerAddonOpacity or opacityConfig.opacity))

    opacitySlider:SetScript(
        "OnValueChanged",
        function(self, value)
            local roundedValue = math.floor((value * 10) + 0.5) / 10 -- Round to one decimal place
            PanellerAddonOpacity = roundedValue
            SetOpacity(PanellerAddonOpacity)
            opacityValue:SetText(string.format("%.1f", roundedValue))
        end
    )

    -- Slider for adjusting panel scale
    local scaleSliderText = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    scaleSliderText:SetPoint("TOPLEFT", opacitySlider, "BOTTOMLEFT", 0, -30)
    scaleSliderText:SetText("Panel Scale")

    scaleSlider = CreateFrame("Slider", "PanellerScaleSlider", panel, "OptionsSliderTemplate")
    scaleSlider:SetPoint("TOPLEFT", scaleSliderText, "BOTTOMLEFT", 0, -6)
    scaleSlider:SetWidth(200)
    scaleSlider:SetMinMaxValues(0.5, 2)
    scaleSlider:SetValueStep(0.1)
    scaleSlider:SetObeyStepOnDrag(true)
    scaleSlider:SetOrientation("HORIZONTAL")
    scaleSlider:SetValue(PanellerAddonScale or scaleConfig.scale) -- Set initial value

    scaleValue = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    scaleValue:SetPoint("TOP", scaleSlider, "BOTTOM", 0, -2)
    scaleValue:SetText(string.format("%.1f", PanellerAddonScale or scaleConfig.scale))

    scaleSlider:SetScript(
        "OnValueChanged",
        function(self, value)
            local roundedValue = math.floor((value * 10) + 0.5) / 10 -- Round to one decimal place
            PanellerAddonScale = roundedValue
            SetScale(PanellerAddonScale)
            scaleValue:SetText(string.format("%.1f", roundedValue))
        end
    )

    -- Slider for adjusting number of rows
    local rowsSliderText = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    rowsSliderText:SetPoint("TOPLEFT", scaleSlider, "BOTTOMLEFT", 0, -30)
    rowsSliderText:SetText("Number of Rows")

    rowsSlider = CreateFrame("Slider", "PanellerRowsSlider", panel, "OptionsSliderTemplate")
    rowsSlider:SetPoint("TOPLEFT", rowsSliderText, "BOTTOMLEFT", 0, -6)
    rowsSlider:SetWidth(200)
    rowsSlider:SetMinMaxValues(1, 5)
    rowsSlider:SetValueStep(1)
    rowsSlider:SetObeyStepOnDrag(true)
    rowsSlider:SetOrientation("HORIZONTAL")
    rowsSlider:SetValue(PanellerRows or 3)

    rowsValue = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    rowsValue:SetPoint("TOP", rowsSlider, "BOTTOM", 0, -2)
    rowsValue:SetText(tostring(PanellerRows or rowsConfig.rows))

    rowsSlider:SetScript(
        "OnValueChanged",
        function(self, value)
            PanellerRows = math.floor(value)
            UpdateLayout()
            rowsValue:SetText(tostring(PanellerRows))
        end
    )

    -- Slider for adjusting number of columns
    local columnsSliderText = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    columnsSliderText:SetPoint("TOPLEFT", rowsSlider, "BOTTOMLEFT", 0, -30)
    columnsSliderText:SetText("Number of Columns")

    columnsSlider = CreateFrame("Slider", "PanellerColumnsSlider", panel, "OptionsSliderTemplate")
    columnsSlider:SetPoint("TOPLEFT", columnsSliderText, "BOTTOMLEFT", 0, -6)
    columnsSlider:SetWidth(200)
    columnsSlider:SetMinMaxValues(1, 6)
    columnsSlider:SetValueStep(1)
    columnsSlider:SetObeyStepOnDrag(true)
    columnsSlider:SetOrientation("HORIZONTAL")
    columnsSlider:SetValue(PanellerColumns or 2)

    columnsValue = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    columnsValue:SetPoint("TOP", columnsSlider, "BOTTOM", 0, -2)
    columnsValue:SetText(tostring(PanellerColumns or columnsConfig.columns))

    columnsSlider:SetScript(
        "OnValueChanged",
        function(self, value)
            PanellerColumns = math.floor(value)
            UpdateLayout()
            columnsValue:SetText(tostring(PanellerColumns))
        end
    )

    -- Slider for adjusting cell spacing
    local spacingSliderText = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    spacingSliderText:SetPoint("TOPLEFT", columnsSlider, "BOTTOMLEFT", 0, -30)
    spacingSliderText:SetText("Cell Spacing")

    spacingSlider = CreateFrame("Slider", "PanellerSpacingSlider", panel, "OptionsSliderTemplate")
    spacingSlider:SetPoint("TOPLEFT", spacingSliderText, "BOTTOMLEFT", 0, -6)
    spacingSlider:SetWidth(200)
    spacingSlider:SetMinMaxValues(0, 20)
    spacingSlider:SetValueStep(1)
    spacingSlider:SetObeyStepOnDrag(true)
    spacingSlider:SetOrientation("HORIZONTAL")
    spacingSlider:SetValue(spacingConfig.spacing)

    spacingValue = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    spacingValue:SetPoint("TOP", spacingSlider, "BOTTOM", 0, -2)
    spacingValue:SetText(tostring(spacingConfig.spacing))

    spacingSlider:SetScript(
        "OnValueChanged",
        function(self, value)
            local newSpacing = math.floor(value)
            if newSpacing ~= spacingConfig.spacing then
                spacingConfig.spacing = newSpacing
                PanellerPanelSpacing = newSpacing
                UpdateLayout()
                spacingValue:SetText(tostring(newSpacing))
            end
        end
    )

    -- Tooltip checkbox
    tooltipToggle = CreateFrame("CheckButton", "PanellerTooltipToggle", panel, "UICheckButtonTemplate")
    tooltipToggle:SetPoint("TOPLEFT", columnsSlider, "BOTTOMLEFT", 0, -100)
    tooltipToggle:SetSize(24, 24)

    local tooltipToggleText = tooltipToggle:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    tooltipToggleText:SetPoint("LEFT", tooltipToggle, "RIGHT", 8, 0)
    tooltipToggleText:SetText("Show Tooltips on Hover")
    tooltipToggle:SetScript(
        "OnClick",
        function(self)
            PanellerShowTooltips = self:GetChecked()
        end
    )

    -- Set the initial state
    tooltipToggle:SetChecked(PanellerShowTooltips)

    -- ClickThrough checkbox
    clickThroughCheckbox = CreateFrame("CheckButton", "PanellerClickThroughCheckbox", panel, "UICheckButtonTemplate")
    clickThroughCheckbox:SetPoint("TOPLEFT", columnsSlider, "BOTTOMLEFT", 0, -140)
    clickThroughCheckbox:SetSize(24, 24)

    local clickThroughCheckboxText = tooltipToggle:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    clickThroughCheckboxText:SetPoint("LEFT", clickThroughCheckbox, "RIGHT", 8, 0)
    clickThroughCheckboxText:SetText("Make panels Click-Through (and lock them)")
    clickThroughCheckbox:SetScript(
        "OnClick",
        function(self)
            PanellerIsClickThrough = self:GetChecked()
            UpdatePanelClickThrough()
        end
    )

    local clearButton = CreateFrame("Button", "PanellerClearButton", panel, "UIPanelButtonTemplate")
    clearButton:SetText("Clear Panel")
    clearButton:SetWidth(100)
    clearButton:SetHeight(25)
    clearButton:SetPoint("BOTTOMLEFT", 16, 16)

    clearButton:SetScript(
        "OnClick",
        function(self, button, down)
            for i = 1, rowsConfig.rows * columnsConfig.columns do
                ClearOverrideBindings(_G["PanellerButton" .. i])
                PickupAction(startActionID + i - 1)
                ClearCursor()
            end
            print("Paneller cleared.")
        end
    )

    -- Reset button
    local resetButton = CreateFrame("Button", "PanellerResetButton", panel, "UIPanelButtonTemplate")
    resetButton:SetText("Reset Settings")
    resetButton:SetWidth(100)
    resetButton:SetHeight(25)
    resetButton:SetPoint("LEFT", clearButton, "RIGHT", 10, 0)

    resetButton:SetScript(
        "OnClick",
        function()
            SettingsReset()
        end
    )

    local dragAreaButton = CreateFrame("Button", "PanellerDragAreaButton", panel, "UIPanelButtonTemplate")
    dragAreaButton:SetText("Show Drag Area")
    dragAreaButton:SetWidth(110)
    dragAreaButton:SetHeight(25)
    dragAreaButton:SetPoint("LEFT", resetButton, "RIGHT", 10, 0)

    dragAreaButton:SetScript(
        "OnClick",
        function()
            FlashDraggableArea()
        end
    )

    -- Key Bindings section
    local keyBindingsPanel = CreateFrame("Frame", "PanellerKeyBindingsPanel", panel, "BackdropTemplate")
    keyBindingsPanel:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -10, -10)
    keyBindingsPanel:SetSize(300, 380)
    keyBindingsPanel:SetBackdrop(
        {
            bgFile = "Interface/FrameGeneral/UI-Background-Rock",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border", -- edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
            insets = {left = 4, right = 4, top = 4, bottom = 4}
        }
    )
    keyBindingsPanel:SetBackdropColor(1, 1, 1, 0)

    local bindingSectionTitle = keyBindingsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    bindingSectionTitle:SetPoint("TOPLEFT", 10, -10)
    bindingSectionTitle:SetText("Keybinds")

    -- Scroll frame for binding buttons
    local bindingScrollFrame =
        CreateFrame(
        "ScrollFrame",
        "PanellerBindingScrollFrame",
        keyBindingsPanel,
        "UIPanelScrollFrameTemplate, BackdropTemplate"
    )
    bindingScrollFrame:SetPoint("TOPLEFT", bindingSectionTitle, "BOTTOMLEFT", 0, -10)
    bindingScrollFrame:SetSize(250, 320)
    bindingScrollFrame:SetBackdrop(
        {
            bgFile = "Interface/Tooltips/UI-Tooltip-Background",
            edgeFile = "Interface/DialogFrame/UI-DialogBox-Border", -- Interface/DialogFrame/UI-DialogBox-Border
            tile = true,
            tileSize = 16,
            edgeSize = 16,
            insets = {left = 4, right = 4, top = 4, bottom = 4}
        }
    )
    bindingScrollFrame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)

    local bindingScrollChild = CreateFrame("Frame", nil, bindingScrollFrame)
    bindingScrollChild:SetSize(230, 300)
    bindingScrollFrame:SetScrollChild(bindingScrollChild)

    -- Binding buttons within the scroll child frame
    local yOffset = -10
    for i = 1, rowsConfig.rows * columnsConfig.columns do
        local bindButton =
            CreateFrame("Button", "PanellerKeyBindingButton" .. i, bindingScrollChild, "UIPanelButtonTemplate")
        bindButton:SetPoint("TOPLEFT", 10, yOffset)
        bindButton:SetSize(140, 22)
        bindButton:SetText("Set Key")
        bindButton:SetScript(
            "OnClick",
            function()
                PanellerSetKeyBinding(i)
            end
        )

        local removeButton =
            CreateFrame("Button", "PanellerRemoveKeyBindingButton" .. i, bindingScrollChild, "UIPanelButtonTemplate")
        removeButton:SetPoint("TOPLEFT", bindButton, "TOPRIGHT", 10, 0)
        removeButton:SetSize(80, 22)
        removeButton:SetText("Remove")
        removeButton:SetScript(
            "OnClick",
            function()
                RemoveBindingFromCell(i)
            end
        )

        UpdateKeyBindingButtonText(bindButton, i) -- Update text on creation

        yOffset = yOffset - 26
    end

    InterfaceOptions_AddCategory(panel)
end

local function ClearBindingFromCell(cellId)
    if currentBindings[cellId] then
        -- Clear the existing binding
        SetOverrideBinding(PanellerFrame, false, currentBindings[cellId], nil)
        currentBindings[cellId] = nil
        local button = _G["PanellerKeyBindingButton" .. cellId]
        if button then
            button:SetText("Button  " .. cellId .. ": None") -- Reset button text
        end
    end
end

local function SavePanellerBindings()
    if not PanellerSavedBindings then
        PanellerSavedBindings = {}
    end

    PanellerSavedBindings = currentBindings
    -- print("Bindings saved.")
end

local function SetBindingForCell(cellId, key)
    for id, boundKey in pairs(currentBindings) do
        if boundKey == key then
            ClearBindingFromCell(id)
            break
        end
    end

    ClearBindingFromCell(cellId)

    -- Set the new binding
    SetOverrideBindingClick(PanellerFrame, true, key, "PanellerButton" .. cellId, "LeftButton")
    currentBindings[cellId] = key
    local button = _G["PanellerKeyBindingButton" .. cellId]
    if button then
        button:SetText("Button " .. cellId .. ": " .. key)
    end
    SavePanellerBindings()
end

local function LoadBindings()
    if PanellerSavedBindings then
        for cellId, key in pairs(PanellerSavedBindings) do
            SetBindingForCell(cellId, key)
        end
    -- print("Bindings loaded.")
    end
end

function PanellerSetKeyBinding(cellId)
    local function KeyPressHandler(key)
        if key then
            SetBindingForCell(cellId, key)
        end
    end
    WaitForKeypress(cellId, KeyPressHandler)
end

RegisterSettingsPanel()

local function OnEvent(self, event, ...)
    if event == "ADDON_LOADED" and ... == "Paneller" then
        PanellerFirstLaunchCompleted = PanellerFirstLaunchCompleted or false

        if
            PanellerAddonScale == nil or PanellerAddonOpacity == nil or PanellerRows == nil or PanellerColumns == nil or
                PanellerPanelSpacing == nil or
                PanellerIsClickThrough == nil or
                PanellerShowTooltips == nil
         then
            SettingsReset()
            self:RegisterEvent("PLAYER_ENTERING_WORLD")
            print("No settings found, probably initial addon launch, resetting.")
        else
            PanellerAddonScale = PanellerAddonScale or scaleConfig.scale
            PanellerAddonOpacity = PanellerAddonOpacity or opacityConfig.opacity
            PanellerRows = PanellerRows or rowsConfig.rows
            PanellerColumns = PanellerColumns or columnsConfig.columns
            PanellerPanelSpacing = PanellerPanelSpacing or spacingConfig.spacing
            PanellerIsClickThrough = PanellerIsClickThrough or false
            PanellerShowTooltips = PanellerShowTooltips or false

            frame:SetScale(PanellerAddonScale)
            frame:SetAlpha(PanellerAddonOpacity)

            if opacitySlider then
                opacitySlider:SetValue(PanellerAddonOpacity)
                if opacityValue then
                    opacityValue:SetText(string.format("%.1f", PanellerAddonOpacity))
                end
            end
            if scaleSlider then
                scaleSlider:SetValue(PanellerAddonScale)
                if scaleValue then
                    scaleValue:SetText(string.format("%.1f", PanellerAddonScale))
                end
            end
            if rowsSlider then
                rowsSlider:SetValue(PanellerRows)
                if rowsValue then
                    rowsValue:SetText(tostring(PanellerRows))
                end
            end
            if columnsSlider then
                columnsSlider:SetValue(PanellerColumns)
                if columnsValue then
                    columnsValue:SetText(tostring(PanellerColumns))
                end
            end
            if spacingSlider then
                spacingSlider:SetValue(PanellerPanelSpacing)
                if spacingValue then
                    spacingValue:SetText(tostring(PanellerPanelSpacing))
                end
            end

            if clickThroughCheckbox then
                clickThroughCheckbox:SetChecked(PanellerIsClickThrough)
            end
            if tooltipToggle then
                tooltipToggle:SetChecked(PanellerShowTooltips)
            end

            LoadBindings()
            UpdateLayout()

            C_Timer.After(
                3,
                function()
                    UpdatePanelClickThrough()
                    print("Paneller fully loaded.")
                end
            )
        end

        self:UnregisterEvent("ADDON_LOADED")
    elseif event == "PLAYER_ENTERING_WORLD" then
        if not PanellerFirstLaunchCompleted then
            FlashDraggableArea()
            PanellerFirstLaunchCompleted = true
        end
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    elseif event == "ACTIONBAR_UPDATE_STATE" then
        EnsureClickThrough()
    end
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("ACTIONBAR_UPDATE_STATE")
frame:SetScript("OnEvent", OnEvent)