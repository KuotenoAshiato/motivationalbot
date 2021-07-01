	Gui, One: Add, Picture, vMyPic w1000 h1000
	Gui, One: Font, s32
	Gui, One: Add, Text, vCountdown, w100
	Gui, One: +AlwaysOnTop
	TempVar := A_ScreenWidth 
	Gui, One: Show, h%TempVar% w%A_ScreenHeight%
	Sleep 500
	globalnumber :=
	WinMove, inspiro.ahk,, 0, 0
	Gui, Two: Add, Picture, vMyPic2 w500 h500
	return

F10::
    toggle := !toggle
    
    While toggle{
		globalnumber = 1
    	RunCode(%globalnumber%)
		min := 4
		cnt := 60
		zero:=
		Loop, 300
		{
			if(cnt = 0)
			{
				min--
				cnt = 60
			}
			
			cnt--
			if(cnt<10)
				zero = 0
			else
				zero = 
			time := min ":" zero cnt
			GuiControl, One:, Countdown, % time
			Sleep 1000
		}
    }
	return
	
F8::
	globalnumber = 3
	RunCode(%globalnumber%)
	return


F7::
	Gui, Two: Show, h500 w500
	return

RunCode(x) {
	endurl := NextQuote()
	F2=https://generated.inspirobot.me/a/
	F0=%F2%%endurl%
	F1=%A_ScriptDir%\inspiro%x%.jpg
	SplitPath,f1,,,,nne,
	urldownloadtofile,%f0%,%f1%
	GuiControl, One:, MyPic, %f1%
	GuiControl, Two:, MyPic2, %f1%
	return
}


unnused(){
	Gui, Add, Picture,  w1100 h-1 ,%f1%
	Gui, Show,x1 y1 ,%nne%
}

NextQuote() {
   QuotesFile = %A_ScriptDir%\quotes.txt
   FileRead,  Quotes, %QuotesFile%
   Quotes := StrSplit(Quotes, "`n", "`r")
   Random lineno, 1, % Quotes.MaxIndex()
   nextquote := Quotes[lineno]  
   return %nextquote%
 }


Guiclose:
exitapp

2GuiClose:
Gui,2:destroy
return