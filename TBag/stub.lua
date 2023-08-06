TBag = CreateFrame("Frame","TBag",UIParent)
TBag:RegisterEvent("VARIABLES_LOADED")

local getmetatable = getmetatable
local setmetatable = setmetatable

function TBag:CopyTable(tab_obj, seen)
  if type(tab_obj) ~= 'table' then return tab_obj end
  if seen and seen[tab_obj] then return seen[tab_obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(tab_obj))
  s[tab_obj] = res

  local k, v
  for k, v in pairs(tab_obj) do
    res[TBag:CopyTable(k, s)] = TBag:CopyTable(v, s)
  end

  return res
end

TBag.BankHaveNil = 0
TBag.BagHaveNil = 0

TBag.LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")
