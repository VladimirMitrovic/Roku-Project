sub init()
    m.searchTextBox = m.top.findNode("searchTextBox")
end sub

sub setFocusSearch()
    m.searchTextBox.setFocus(true)
    if m.searchTextBox.hasFocus()  print "Search bar is in focus"
    m.searchTextBox.hintText = "Click OK to start typing..."
    m.searchTextBox.active = true
    activeSearchBarText()
    ' print "searchTextBox: "m.searchTextBox
    ' m.global.KeybordComponent.callFunc("setFocusKeybord") ' if you uncomment this line and comment all code above, keybord will be shown immediately, without need to press ok button

end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    if key = "OK" and press then
        m.global.KeybordComponent.callFunc("setFocusKeybord")
    else if (key = "left" or key = "back") and press then
        m.global.leftSideScreen.findNode("markupGridContent").SetFocus(true)
        m.searchTextBox.active = false
        resetSearchbarText()
    end if
    return true  
end function

sub resetSearchbarText()
    m.searchTextBox.hintText = "Search..."
    m.searchTextBox.textColor = "0xDDDDDDDD"
    m.searchTextBox.active = false
end sub

sub activeSearchBarText()
    m.searchTextBox.textColor = "0xFFFFFFFF"
end sub