-- Localization Support
local L = TBag.LOCALE

-- lua locals
local strformat = string.format

TBag.S_RARITY  = "R_"

TBag.DefaultItemOverrides = {
}

-- Category, Keywords, Tooltip Search, ItemType, ItemSubType, EquipLoc
TBag.DefaultSearchList = {
  { "GRAY_ITEMS", TBag.S_RARITY.."0",  "", "", "", "" },

-- Universal settings for English and localized categories
  { "TOYS", "", "Use: Adds this toy to your Toy Box", "", "", "" },
  { "ARCHAEOLOGY", "", "[Aa]rchaeology", "7", "", "" },
  { "ARCHAEOLOGY", "", "[Aa]rchaeology", "15", "", "" },
  { "ARCHAEOLOGY", "", "digsite", "7", "", "" },
  { "ACT_OPEN", "", " Lockbox", "15", "", "" },
  { "HEARTH", "", "Hearthstone%s", "15", "", "" },
  { "COMBATPETS", "", "Use:.*pet", "0", "", ""},
  { "FOLLOWERS", "", "Use: Equip.*Champion", "0", "", ""},
  { "FOLLOWERS_LVL", "", "Use: Increases.*Champion", "0", "", ""},

  { "ACT_ON", "", "This Item Begins a Quest", "", "", "" },
  { "ACT_OPEN", "", "<Right Click to Open>", "", "", "" },

-- Localized categories
  { "TOYS", "", L["Use: Adds this toy to your Toy Box"], "", "", "" },
  { "ARCHAEOLOGY", "", L["[Aa]rchaeology"], "7", "", "" },
  { "ARCHAEOLOGY", "", L["[Aa]rchaeology"], "15", "", "" },
  { "ARCHAEOLOGY", "", L["digsite"], "7", "", "" },
  { "ACT_OPEN", "", L[" Lockbox"], "15", "", "" },
  { "HEARTH", "", L["Hearthstone%s"], "15", "", "" },
  { "COMBATPETS", "", L["Use:.*pet"], "0", "", ""},
  { "FOLLOWERS", "", L["Use: Equip.*Champion"], "0", "", ""},
  { "FOLLOWERS_LVL", "", L["Use: Increases.*Champion"], "0", "", ""},

  { "ACT_ON", "", L["This Item Begins a Quest"], "", "", "" },
  { "ACT_OPEN", "", L["<Right Click to Open>"], "", "", "" },

  { "EXPLOSIVES", "", "", "0", "0", "" },
  { "POTION", "", "", "0", "1", "" },
  { "ELIXIR", "", "", "0", "2", "" },
  { "FLASK", "", "", "0", "3", "" },
  { "FOOD", "", "", "0", "5", "" },
  { "BANDAGE", "", "", "0", "7", "" },
  { "VANTUS_RUNES", "", "", "0", "9", "" },
  { "CONSUMABLE", "", "", "0", "", "" },

  { "BAG", "", "", "1", "", "" },

  { "FISHING", "", "", "2", "20", ""},

  { "ARTIFACTRELIC", "", "", "3", "11", ""},
  { "GEM", "", "", "3", "", ""},

  { "COSTUMES", "", "", "4", "5", "" },

  { "ENGINEERING", "", "", "7", "1", "" },
  { "JEWELCRAFTING", "", "", "7", "4", "" },
  { "TAILORING", "", "", "7", "5", "" },
  { "LEATHERWORKING", "", "", "7", "6", "" },
  { "BLACKSMITHING", "", "", "7", "7", "" },
  { "COOKING", "", "", "7", "8", "" },
  { "ALCHEMY", "", "", "7", "9", "" },
  { "REAGENT", "", "", "7", "10", "" },
  { "ENCHANTING", "", "", "7", "12", "" },
  { "INSCRIPTION", "", "", "7", "16", "" },
  { "TRADE_GOODS", "", "", "7", "", "" },

  { "ENHANCEMENTS", "", "", "8", "", "" },

  { "BOOK", "", "", "9", "0", "" },
  { "PATTERN", "", "", "9", "1", "" },
  { "PATTERN", "", "", "9", "2", "" },
  { "SCHEMATIC", "", "", "9", "3", "" },
  { "PLANS", "", "", "9", "4", "" },
  { "RECIPE", "", "", "9", "6", "" },
  { "FORMULA", "", "", "9", "8", "" },
  { "DESIGN", "", "", "9", "10", "" },
  { "RECIPE_OTHER", "", "", "9", "", "" },

  { "QUEST", "", "", "12", "", "" },

  { "KEY_QUEST", "", "", "13", "", "" },

  { "REAGENT", "", "", "15", "1", ""},
  { "MINIPET", "", "", "15", "2", ""},
  { "HOLIDAY", "", "", "15", "3", "" },
  { "MOUNT", "", "", "15", "5", "" },
  { "MISC", "", "", "15", "", "" },

  { "GLYPHS", "", "", "16", "", "" },

  { "LEGENDARIES", TBag.S_RARITY.."5",  "", "", "", "" },

  { strformat("EQUIPPED_%s","TRINKET"), "EQUIPPED", "", "4", "", "INVTYPE_TRINKET" },

  { strformat("EQUIPPED_%s","RING"), "EQUIPPED", "", "4", "", "INVTYPE_FINGER" },
  { strformat("EQUIPPED_%s","01_HEAD"), "EQUIPPED", "", "4", "", "INVTYPE_HEAD" },
  { strformat("EQUIPPED_%s","02_NECK"), "EQUIPPED", "", "4", "", "INVTYPE_NECK" },
  { strformat("EQUIPPED_%s","03_SHOULDER"), "EQUIPPED", "", "4", "", "INVTYPE_SHOULDER" },
  { strformat("EQUIPPED_%s","04_BACK"), "EQUIPPED", "", "4", "", "INVTYPE_CLOAK" },

  { strformat("EQUIPPED_%s","05_CHEST"), "EQUIPPED", "", "4", "", "INVTYPE_CHEST" },
  { strformat("EQUIPPED_%s","05_CHEST"), "EQUIPPED", "", "4", "", "INVTYPE_ROBE" },

  { strformat("EQUIPPED_%s","06_SHIRT"), "EQUIPPED", "", "4", "", "INVTYPE_BODY" },
  { strformat("EQUIPPED_%s","07_TABARD"), "EQUIPPED", "", "4", "", "INVTYPE_TABARD" },
  { strformat("EQUIPPED_%s","08_WRIST"), "EQUIPPED", "", "4", "", "INVTYPE_WRIST" },
  { strformat("EQUIPPED_%s","09_HANDS"), "EQUIPPED", "", "4", "", "INVTYPE_HAND" },
  { strformat("EQUIPPED_%s","10_WAIST"), "EQUIPPED", "", "4", "", "INVTYPE_WAIST" },
  { strformat("EQUIPPED_%s","11_LEGS"), "EQUIPPED", "", "4", "", "INVTYPE_LEGS" },
  { strformat("EQUIPPED_%s","12_FEET"), "EQUIPPED", "", "4", "", "INVTYPE_FEET" },
  { strformat("EQUIPPED_%s","13_OFFHAND"), "EQUIPPED", "", "4", "", "INVTYPE_HOLDABLE" },
  { strformat("EQUIPPED_%s","ARMOR"), "EQUIPPED", "", "4", "", "" },
  { strformat("EQUIPPED_%s","WEAPON"), "EQUIPPED", "", "2", "", "" },
  { strformat("EQUIPPED_%s","OTHER"), "EQUIPPED", "", "", "", "" },

  { strformat("SOULBOUND_%s","TRINKET"), "SOULBOUND", "", "4", "", "INVTYPE_TRINKET" },

  { strformat("SOULBOUND_%s","RING"), "SOULBOUND", "", "4", "", "INVTYPE_FINGER" },
  { strformat("SOULBOUND_%s","01_HEAD"), "SOULBOUND", "", "4", "", "INVTYPE_HEAD" },
  { strformat("SOULBOUND_%s","02_NECK"), "SOULBOUND", "", "4", "", "INVTYPE_NECK" },
  { strformat("SOULBOUND_%s","03_SHOULDER"), "SOULBOUND", "", "4", "", "INVTYPE_SHOULDER" },
  { strformat("SOULBOUND_%s","04_BACK"), "SOULBOUND", "", "4", "", "INVTYPE_CLOAK" },

  { strformat("SOULBOUND_%s","05_CHEST"), "SOULBOUND", "", "4", "", "INVTYPE_CHEST" },
  { strformat("SOULBOUND_%s","05_CHEST"), "SOULBOUND", "", "4", "", "INVTYPE_ROBE" },

  { strformat("SOULBOUND_%s","06_SHIRT"), "SOULBOUND", "", "4", "", "INVTYPE_BODY" },
  { strformat("SOULBOUND_%s","07_TABARD"), "SOULBOUND", "", "4", "", "INVTYPE_TABARD" },
  { strformat("SOULBOUND_%s","08_WRIST"), "SOULBOUND", "", "4", "", "INVTYPE_WRIST" },
  { strformat("SOULBOUND_%s","09_HANDS"), "SOULBOUND", "", "4", "", "INVTYPE_HAND" },
  { strformat("SOULBOUND_%s","10_WAIST"), "SOULBOUND", "", "4", "", "INVTYPE_WAIST" },
  { strformat("SOULBOUND_%s","11_LEGS"), "SOULBOUND", "", "4", "", "INVTYPE_LEGS" },
  { strformat("SOULBOUND_%s","12_FEET"), "SOULBOUND", "", "4", "", "INVTYPE_FEET" },
  { strformat("SOULBOUND_%s","13_OFFHAND"), "SOULBOUND", "", "4", "", "INVTYPE_HOLDABLE" },
  { strformat("SOULBOUND_%s","ARMOR"), "SOULBOUND", "", "4", "", "" },
  { strformat("SOULBOUND_%s","WEAPON"), "SOULBOUND", "", "2", "", "" },

  { strformat("ACCOUNTBOUND_%s","TRINKET"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_TRINKET" },

  { strformat("ACCOUNTBOUND_%s","RING"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_FINGER" },
  { strformat("ACCOUNTBOUND_%s","01_HEAD"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_HEAD" },
  { strformat("ACCOUNTBOUND_%s","02_NECK"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_NECK" },
  { strformat("ACCOUNTBOUND_%s","03_SHOULDER"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_SHOULDER" },
  { strformat("ACCOUNTBOUND_%s","04_BACK"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_CLOAK" },

  { strformat("ACCOUNTBOUND_%s","05_CHEST"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_CHEST" },
  { strformat("ACCOUNTBOUND_%s","05_CHEST"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_ROBE" },

  { strformat("ACCOUNTBOUND_%s","06_SHIRT"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_BODY" },
  { strformat("ACCOUNTBOUND_%s","07_TABARD"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_TABARD" },
  { strformat("ACCOUNTBOUND_%s","08_WRIST"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_WRIST" },
  { strformat("ACCOUNTBOUND_%s","09_HANDS"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_HAND" },
  { strformat("ACCOUNTBOUND_%s","10_WAIST"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_WAIST" },
  { strformat("ACCOUNTBOUND_%s","11_LEGS"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_LEGS" },
  { strformat("ACCOUNTBOUND_%s","12_FEET"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_FEET" },
  { strformat("ACCOUNTBOUND_%s","13_OFFHAND"), "ACCOUNTBOUND", "", "4", "", "INVTYPE_HOLDABLE" },
  { strformat("ACCOUNTBOUND_%s","ARMOR"), "ACCOUNTBOUND", "", "4", "", "" },
  { strformat("ACCOUNTBOUND_%s","WEAPON"), "ACCOUNTBOUND", "", "2", "", "" },

  { "TRINKET", "", "", "4", "", "INVTYPE_TRINKET" },

  { "RING", "", "", "4", "", "INVTYPE_FINGER" },
  { "01_HEAD", "", "", "4", "", "INVTYPE_HEAD" },
  { "02_NECK", "", "", "4", "", "INVTYPE_NECK" },
  { "03_SHOULDER", "", "", "4", "", "INVTYPE_SHOULDER" },
  { "04_BACK", "", "", "4", "", "INVTYPE_CLOAK" },

  { "05_CHEST", "", "", "4", "", "INVTYPE_CHEST" },
  { "05_CHEST", "", "", "4", "", "INVTYPE_ROBE" },

  { "06_SHIRT", "", "", "4", "", "INVTYPE_BODY" },
  { "07_TABARD", "", "", "4", "", "INVTYPE_TABARD" },
  { "08_WRIST", "", "", "4", "", "INVTYPE_WRIST" },
  { "09_HANDS", "", "", "4", "", "INVTYPE_HAND" },
  { "10_WAIST", "", "", "4", "", "INVTYPE_WAIST" },
  { "11_LEGS", "", "", "4", "", "INVTYPE_LEGS" },
  { "12_FEET", "", "", "4", "", "INVTYPE_FEET" },
  { "13_OFFHAND", "", "", "4", "", "INVTYPE_HOLDABLE" },
  { "ARMOR", "", "", "4", "", "" },
  { "WEAPON", "", "", "2", "", "" },

  { strformat("SOULBOUND_%s","OTHER"), "SOULBOUND", "", "", "", "" },
  { "UNKNOWN", "", "", "", "", "" }
}
