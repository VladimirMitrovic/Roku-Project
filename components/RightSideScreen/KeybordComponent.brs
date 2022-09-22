sub init()
    m.keybord = m.top.findNode("searchKeyboard")
    m.keybord.textEditBox.voiceEnabled = true
    
end sub

sub setFocusKeybord()
    if m.keybord.hasFocus() print "keybord is in focus"

    m.keybord.visible = "true"        
    m.global.RightSideScreen.visible="false"
    m.keybord.setFocus(true)

end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "back" and press then
        m.keybord.visible = "false"        
        m.global.RightSideScreen.visible="true"
        m.global.leftSideScreen.findNode("markupGridContent").SetFocus(true)
        m.global.SearchComponent.callFunc("resetSearchbarText")
    end if
    return true  
end function