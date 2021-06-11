#SingleInstance Force
#Persistent

GenHotstrings(FileToCheck)
{
    if FileExist(FileToCheck) 
    {
        
    Loop
    {
        FileReadLine, line, include_hotstrings.txt, %A_Index%
        if ErrorLevel
            break

        FirstLetter         := SubStr(line, 1, 1) 
        CommentIdentifier   := "#"
        
        if (FirstLetter = CommentIdentifier)
        {
            continue
        }

        TextArray 	:= StrSplit(line, ";")       ; Split string into two substrings
        callsign 	:= Trim(TextArray[1])
        replacement	:= Trim(TextArray[2])
        
        Hotstring(callsign, replacement)
    }

    }
    else
        MsgBox, 16, , File does not exist!
}

; Uncomment if running standalone to use this file. Else use #Include [path]\Hotstringer.ahk
GenHotstrings("Include_Hotstrings.txt")
