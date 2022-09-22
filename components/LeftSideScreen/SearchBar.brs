sub init()
    m.searchRect = m.top.findNode("searchRect")
    m.searchLabel = m.top.findNode("searchLabel")
end sub

sub setFocusSearch()
    m.searchRect.setFocus(true)
    if m.searchRect.hasFocus()  print "Search bar is in focus"

    m.searchLabel.font.size = "25"
    m.searchLabel.text = "Click OK to start typing..."
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "OK" and press then
        m.global.KeybordComponent.callFunc("setFocusKeybord")
    end if
    return true  
end function

sub resetSearchbarText()
    m.searchLabel.font.size = "30"
    m.searchLabel.text = "Search..."
end sub