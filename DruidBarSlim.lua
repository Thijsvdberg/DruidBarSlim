local POWER_MANA = 0
local FORM_BEAR = 1
local FORM_CAT = 3

function DruidBarSlim_OnLoad()
    DruidBarSlim_Frame:RegisterEvent("UNIT_DISPLAYPOWER");
    ShowOrHide();
    DruidBarSlim_OnRefresh();
end

function DruidBarSlim_OnEvent(self, event, ...)
    if event == "UNIT_DISPLAYPOWER" then
        ShowOrHide();
    end
end

function DruidBarSlim_OnRefresh()
    DruidBarSlim_Frame_Mana:SetMinMaxValues(0, UnitPowerMax("player", POWER_MANA));
    DruidBarSlim_Frame_Mana:SetValue(UnitPower("player", POWER_MANA));
    DruidBarSlim_Frame_Mana:SetStatusBarColor(0, 0, 1, 1);
    local str = UnitPower("player", POWER_MANA) .. " / " .. UnitPowerMax("player", POWER_MANA);
    DruidBarSlim_Frame_Text:SetText(str);
end

function ShowOrHide()
    local form = GetShapeshiftForm();
    if form == FORM_BEAR or form == FORM_CAT then
        DruidBarSlim_Frame:Show();
    else
        DruidBarSlim_Frame:Hide();
    end
end