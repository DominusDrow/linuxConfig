_BLOCK_6_(){ #{{{
    Bat=$(acpi | awk '{gsub(",|%","",$4); print $4}');
    adapt=$(acpi -a | awk '{print $3}');

    if [ "$adapt" = "on-line" -a -n "$Bat" ];then
        icon0=""
        icon1=""
        icon2=""
        icon3=""
        icon4=""
    elif [ "$adapt" = "on-line" ];then
        icon0=""
        icon1=""
        icon2=""
        icon3=""
        icon4=""
    else
        icon0=""
        icon1=""
        icon2=""
        icon3=""
        icon4=""
    fi

    [ -z "$Bat" ] && echo "$icon0 $adapt" && return
    [ "$Bat" -gt "90" ] && echo "$icon4 $Bat%"
    [ "$Bat" -gt "60" ] && echo "$icon2 $Bat%"
    [ "$Bat" -gt "30" ] && echo "$icon1 $Bat%"
    [ "$Bat" -lt "30" ] && echo "$icon0 $Bat%"
} #}}}

_BLOCK_6_
