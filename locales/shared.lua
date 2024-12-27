Locales = {}
Locale = {}

function Locale.Exists(lang)
    return Locales[lang] ~= nil
end

function Locale.Get(lang)
    return Locales[lang] or Locales['en']
end

function Locale.Add(lang, data)
    Locales[lang] = data
end

function Locale.Translate(lang, str, ...)
    if not Locales[lang] then 
        lang = 'en'
    end
    
    if not Locales[lang] then
        return 'Translation error: ' .. str
    end
    
    if not Locales[lang][str] then
        return 'Missing translation: ' .. str
    end

    return string.format(Locales[lang][str], ...)
end

_L = function(str, ...)
    local lang = Config.Locale or 'en'
    return Locale.Translate(lang, str, ...)
end