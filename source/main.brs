<<<<<<< HEAD
' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

sub Main()
    showChannelSGScreen()
end sub

sub showChannelSGScreen()

    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("MainScene")
    screen.show()

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub
=======
' ********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

sub Main()
    showChannelSGScreen()
end sub

sub showChannelSGScreen()
    ' canvas koji prikazuje conetent instance Scene noda
    screen = CreateObject("roSGScreen")

    ' roMessagePort osluskuje event-e iz app, osluskje sve nodove
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    
    scene = screen.CreateScene("MainScene")
    screen.show()

    while(true)
        msg = wait(0, m.port)
        ' msg = port.WaitMessage(timeout)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub
>>>>>>> e0e32bfe957f4d9995fe9ae0e0240c66b4aba951
