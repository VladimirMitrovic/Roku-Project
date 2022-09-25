sub getScreenContent(filterTitle = "" as string)
    m.getDataTask = CreateObject("roSGNode", "GetDataTask")
    m.getDataTask.url = "https://api.npoint.io/b096a65d709fbe682348"
    m.getDataTask.filterTitle = filterTitle
    m.getDataTask.observeField("response", "dataTaskResponse")
    print "getScreenContent ############## "m.getDataTask.filterTitle
    m.getDataTask.control = "RUN"
end sub

sub dataTaskResponse(obj)
    m.global.leftSideScreen.content = obj.getData()
    if m.global.leftSideScreen.content.getChildCount() = 0 then 
        m.global.leftSideScreen.findNode("noContentMsg").visible = true
    else
        m.global.leftSideScreen.findNode("noContentMsg").visible = false
    end if
end sub