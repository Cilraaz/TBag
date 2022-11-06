local _G = getfenv(0)
local TBag = _G.TBag
local L = TBag.LOCALE
TBag.Tokens = {}
local Tokens = TBag.Tokens

function Tokens.GetItemStringFromCurrencyIndex(index)
  local tt = TBag_tt

  if (not tt) then
    tt = CreateFrame("GameTooltip","TBag_tt")
    -- Allow tooltip set methods to dynamically add new lines based on these
    tt:AddFontStrings(
      tt:CreateFontString("$parentTextLeft1", nil, "GameTooltipText"),
      tt:CreateFontString("$parentTextRight1", nil, "GameTooltipText")
    )
  end
  tt:SetOwner(UIParent, "ANCHOR_NONE")  -- this makes sure that tooltip.valid = true
  tt:ClearLines()

  tt:SetCurrencyToken(index)
  local _,itemlink = tt:GetItem()
  local _,itemstring = TBag:GetItemID(itemlink)
  return itemstring
end

function Tokens.SetItmFromCurrencyIndex(index,itm)
  local cI = C_CurrencyInfo.GetCurrencyListInfo(index)
  local name, isHeader, isExpand, isUnused, isWatched, count, icon =
	cI.name, cI.isHeader, cI.isHeaderExpanded, cI.isTypeUnused, cI.isShowInBackpack, cI.quantity, cI.iconFileID

  if not name then
    return false
  end

  itm[TBag.I_NAME] = name
  itm[TBag.I_HEADER] = isHeader
  itm[TBag.I_EXPAND] = isExpand
  itm[TBag.I_UNUSED] = isUnused
  itm[TBag.I_WATCH] = isWatched
  itm[TBag.I_COUNT] = count
  itm[TBag.I_ICON] = icon
  return true
end

local scanning = false
function Tokens.Scan()
  if scanning then return end
  scanning = true

  local n = 0
  if not TTknItm[TBag.PLAYERID] then
    TTknItm[TBag.PLAYERID] = {}
  end
  if not TTknItm[TBag.PLAYERID][TBag.D_BAG] then
    TTknItm[TBag.PLAYERID][TBag.D_BAG] = {}
  end
  local dbag = TTknItm[TBag.PLAYERID][TBag.D_BAG]
  table.wipe(dbag)

  for i = 1, C_CurrencyInfo.GetCurrencyListSize() do
    n = n + 1
    dbag[n] = {}
    if not Tokens.SetItmFromCurrencyIndex(i,dbag[n]) then
      scanning = false
      return
    end
    if dbag[n][TBag.I_HEADER] and not dbag[n][TBag.I_EXPAND] then
      local size = C_CurrencyInfo.GetCurrencyListSize()
      C_CurrencyInfo.ExpandCurrencyList(i, true)
      size = C_CurrencyInfo.GetCurrencyListSize() - size
      for j = i+1, i+size do
        n = n + 1
        dbag[n] = {}
        if not Tokens.SetItmFromCurrencyIndex(j,dbag[n]) then
          scanning = false
          return
        end
      end
      C_CurrencyInfo.ExpandCurrencyList(i, false)
    end
  end
  scanning = false
end

function Tokens.UpdateTokenButtonFromItm(button, itm, playerid)
  -- Update watched tokens
  if itm[TBag.I_NAME] then
    button.extraCurrencyType = itm[TBag.I_TYPE]
    button.itemstring = itm[TBag.I_ITEMLINK]
    button.count_val = itm[TBag.I_COUNT]
    button.name = itm[TBag.I_NAME]
    if itm[TBag.I_TYPE]  == 1 then --Arena points
      button.icon:SetTexture("Interface\\PVPFrame\\PVP-ArenaPoints-Icon")
      button.icon:SetTexCoord(0, 1, 0, 1)
    elseif itm[TBag.I_TYPE]  == 2 then -- Honor Points
      local factionGroup = TBagInfo[playerid][TBag.G_BASIC][TBag.S_FACTION] or 'FFA'
      if factionGroup then
        button.icon:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factionGroup)
        button.icon:SetTexCoord( 0.03125, 0.59375, 0.03125, 0.59375)
      else
        button.icon:SetTexCoord(0, 1, 0, 1)
      end
    else
      local itemlink = itm[TBag.I_ITEMLINK]
      local icon = itemlink and GetItemIcon(itemlink) or itm[TBag.I_ICON]
      button.icon:SetTexture(icon)
      button.icon:SetTexCoord(0, 1, 0, 1)
    end
    if not itm[TBag.I_COUNT] then
      itm[TBag.I_COUNT] = 0
    end
    if itm[TBag.I_COUNT] <= 99999 then
      button.count:SetText(itm[TBag.I_COUNT])
    else
      button.count:SetText("*")
    end
    button:Show()
  end
end

function Tokens.Update(frame)
  local framename = frame:GetName()
  local mainFrame = frame:GetParent()
  if mainFrame.cfg.show_tokens ~= 1 then return end
  if not (TTknItm and TTknItm[mainFrame.playerid] and
          TTknItm[mainFrame.playerid][TBag.D_BAG]) then
    frame:Hide()
    return
  end
  TBag.Tokens.Watched = 0
  local i = 1
  for _,itm in pairs(TTknItm[mainFrame.playerid][TBag.D_BAG]) do
    if itm[TBag.I_WATCH] then
      local watchButton = _G[framename.."Token"..i]
      Tokens.UpdateTokenButtonFromItm(watchButton,itm, mainFrame.playerid)
      frame:Show()
      TBag.Tokens.Watched = TBag.Tokens.Watched + 1
      i = i + 1
    end
    --if i > MAX_WATCHED_TOKENS then return end
    if i > 18 then return end
  end
  --for n = i, MAX_WATCHED_TOKENS do
  for n = i, 18 do
    if _G[framename.."Token"..n] then
      _G[framename.."Token"..n]:Hide()
    end
    if n == 1 then
      frame:Hide()
    end
  end
  if framename == "TBnkFrame_TokenFrame" then
    TBnkFrame:UpdateWindow()
  else
    TInvFrame:UpdateWindow()
  end
end

function Tokens.Button_OnEnter(self)
  GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
  GameTooltip:SetText(self.name, 1, 1, 1, 1)
end

-- I really hate having to hook to do this but it would be a real mess
-- to do it otherwise since the TokenUI doesn't generate an event when
-- the tracked tokens change.
function Tokens.Hook()
  Tokens.Scan()
  Tokens.Update(TInvFrame_TokenFrame)
  Tokens.Update(TBnkFrame_TokenFrame)
end

-- Turn on the hook, we have to delay doing this until variables
-- are loaded to avoid problems.
function Tokens.Enable()
  hooksecurefunc('TokenFrame_Update', Tokens.Hook)
end

TokenFramePopup.BackpackCheckBox.Text:SetText(L["Show on TBag"])
TOKEN_SHOW_ON_BACKPACK = L["Checking this option will allow you to track this currency type in TBag for this character.\n\nYou can also Shift-click a currency to add or remove it from being tracked in TBag."]