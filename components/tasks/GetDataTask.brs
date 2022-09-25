sub init()    
    m.top.functionname = "urlRequest"
End sub

function urlRequest()
    url = m.top.url
    urlTransfer = CreateObject("roUrlTransfer")
    urlTransfer.setUrl(url)
    port = CreateObject("roMessagePort")
    urlTransfer.setPort(port)
    urlTransfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    urlTransfer.InitClientCertificates()
    if urlTransfer.asyncGetToString() then
        msg = wait(5000, port)
        if msg.getResponseCode() = 200 then
            if (type(msg) = "roUrlEvent") then
                m.top.response = prepareNode(msg)
            end if
        else
            print "Error"    
        end if
    end if
end function

function prepareNode(obj)
    data = parseJSON(obj.getString())
    m.node = CreateObject("roSGNode", "ContentNode")
    filterTitle = m.top.filterTitle
    if data.doesExist("channels") and data.doesExist("categories") then
        for each channel in data.channels
            if filterTitle <> "" then
                if channel.title.instr(filterTitle) > -1 then content = createContent(channel)
            else
                content = createContent(channel)
            end if
        end for
    end if
    return m.node
end function

function createContent(channel as object)
    content = m.node.createChild("DataForEachItem")
    content.posterUrl = channel.posterurl
    content.url = channel.url
    content.length = channel.length
    content.hDBackgroundImageUrl = channel.backgroundimageurl
    content.actors = channel.cast
    content.description = channel.description
    content.directors = channel.director
    content.categories = channel.genres
    content.parentalRating = channel.parentalrating
    content.streamFormat = channel.streamformat
    content.title = channel.title
    content.releaseDate = channel.year

    return content
end function