Locales = {}
Locale = {}

local function debugPrint(message)
    if Config and Config.Debug then
        print(message)
    end
end

local function countTableElements(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

function Locale.Exists(lang)
    return Locales[lang] ~= nil
end

function Locale.Get(lang)
    return Locales[lang] or Locales['en']
end

function Locale.Add(lang, data)
    if type(data) ~= 'table' then
        debugPrint('^1Error^7: Invalid translation data for language: ' .. lang)
        return
    end
    Locales[lang] = data
    debugPrint(string.format('^2Added %d translations for language^7: %s', countTableElements(data), lang))
end

function Locale.Translate(lang, str, ...)
    if not Locales[lang] then 
        debugPrint(string.format('^3Warning^7: Language %s not found, falling back to English', lang))
        lang = 'en'
    end
    
    if not Locales[lang] then
        debugPrint('^1Error^7: English translations not loaded')
        return 'Translation error: ' .. str
    end
    
    if not Locales[lang][str] then
        debugPrint(string.format('^3Warning^7: Missing translation for key "%s" in language "%s"', str, lang))
        return 'Missing translation: ' .. str
    end

    local args = {...}
    if #args == 0 then
        return Locales[lang][str]
    end

    local success, result = pcall(string.format, Locales[lang][str], ...)
    if success then
        return result
    else
        debugPrint(string.format('^1Translation format error for key^7: %s', str))
        debugPrint(string.format('^1Error^7: %s', result))
        return Locales[lang][str]
    end
end

function _L(str, ...)
    local lang = Config.Locale or 'en'
    return Locale.Translate(lang, str, ...)
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    if not Config.Debug then return end

    debugPrint('^2=== Available Translations ===^7')

    if next(Locales) == nil then
        debugPrint('^1No translations loaded^7')
        return
    end

    for lang, translations in pairs(Locales) do
        debugPrint(string.format('^3Language^7: %s, ^3Translations^7: %d', 
            lang, 
            countTableElements(translations)
        ))
    end
    
    debugPrint('^2============================^7')
end)