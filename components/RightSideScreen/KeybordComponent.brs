sub init()
    m.keybord = m.top.findNode("searchKeyboard")
    m.keybord.textEditBox.voiceEnabled = true
    print "voice "m.keybord.textEditBox.voiceEnabled

    m.keybord.ObserveField("text", "changeText")
end sub

sub setFocusKeybord()
    m.keybord.visible = true
    m.global.SearchComponent.findNode("searchTextBox").visible = false
    m.global.RightSideScreen.visible = false
    m.keybord.setFocus(true)
    m.global.leftSideScreen.findNode("backgroundPoster").uri = "pkg:/images/rsgde_bg_hd.jpg"

    if m.keybord.isInFocusChain() then print "keybord is in focus"
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if (key = "back" or key = "left") and press then
        m.keybord.visible = false      
        m.global.SearchComponent.findNode("searchTextBox").visible = true
        m.global.RightSideScreen.visible = true
        m.global.leftSideScreen.findNode("markupGridContent").SetFocus(true)
        m.global.SearchComponent.callFunc("resetSearchbarText")
    end if
    return true  
end function

sub changeText()
    if m.keybord.text <> invalid then
        print "changeText ############## "m.keybord.text
        getScreenContent(m.keybord.text)
    end if
end sub