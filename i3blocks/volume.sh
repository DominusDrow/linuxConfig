_BLOCK_39_(){
local Vol=$(pactl list sinks | awk '/Volumen: front/{print $5-"%"}')
local Mute=$(pactl list sinks | awk '/Silencio: /')

if [ "$Mute" = "	Silencio: sí" ];then
    echo -e " --"
else
    if [ "$Vol" -gt "60" ];then
        echo -e " $Vol%"
    elif [ "$Vol" -gt "30" ];then
        echo -e " $Vol%"
    elif [ "$Vol" -lt "30" ];then
        echo -e " $Vol%"
    fi
fi
}

_BLOCK_39_
