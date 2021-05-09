function check_headphone_connectivity()
    local val = hs.execute("/usr/local/bin/blueutil --is-connected bluetooth_headphone_ssid")
    if string.sub(val,1,1) == "1"
    then
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    else
        hs.audiodevice.defaultOutputDevice():setVolume(0)
    end
end

hs.audiodevice.watcher.setCallback(check_headphone_connectivity)
hs.audiodevice.watcher.start()
