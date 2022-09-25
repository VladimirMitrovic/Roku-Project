sub init()
    m.keybord = m.top.findNode("searchKeyboard")
    m.keybord.ObserveField("text", "changeText")
end sub

sub setFocusKeybord()
    m.keybord.visible = true
    m.global.SearchComponent.findNode("searchTextBox").visible = false
    m.global.RightSideScreen.visible = false
    m.keybord.setFocus(true)
    m.global.leftSideScreen.findNode("backgroundPoster").uri = "pkg:/images/rsgde_bg_hd.jpg"

    if m.keybord.hasFocus() then print "keybord is in focus"
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if (key = "back" or key = "left") and press then
        m.keybord.visible = false      
        m.global.SearchComponent.findNode("searchTextBox").visible = true
        m.global.RightSideScreen.visible = true
        m.global.leftSideScreen.findNode("markupGridContent").SetFocus(true)
        m.global.SearchComponent.callFunc("resetSearchbarText")
    ' else if m.keybord.text <> invalid 
    '     print "keybord "m.keybord
    '     print "keybord text "m.keybord.text
    '     m.searchText = m.keybord.text
    end if
    return true  
end function

sub changeText()
    if m.keybord.text <> invalid then
        m.searchText = m.keybord.text
        print "keybord text "m.keybord.text
        
    end if
end sub