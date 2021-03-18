#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GUIConstants.au3>
#Include <WinAPIEx.au3>
#include <ProgressConstants.au3>
HotKeySet("{f1}", "autoinvite_enable")
HotKeySet("{f2}", "autoinvite_disable")
HotKeySet("{f3}", "blacklist_enable")
HotKeySet("{f4}", "blacklist_disable")
HotKeySet("+{f1}", "ignor_enable")
HotKeySet("+{f2}", "ignor_disable")
HotKeySet("+{f3}", "spam_for_recrut_chat_enable")
HotKeySet("+{f4}", "spam_for_recrut_chat_disable")
HotKeySet("{f5}", "clan")
HotKeySet("+{f5}", "povishenie")
HotKeySet("{f6}", "chertegi")
HotKeySet("{f7}", "jelaushie_povisitsia")
HotKeySet("{f8}", "Privetstvie")
HotKeySet("{f9}", "kik1")
HotKeySet("{f10}", "kik4")
HotKeySet("{f11}", "kik7")
HotKeySet("+{d}", "delayplus")
HotKeySet("+^{d}", "delayminus")
HotKeySet("+{i}", "invplus")
HotKeySet("+^{i}", "invminus")
HotKeySet("{end}", "panic")
Global $autoinv_enabled = False
Global $x, $y
Global $oji_enabled = False
Global $ignor_enabled = False
Global $spam_enabled = False
Global $delay=1
Global $inv_limit_reg=150
Global $inv_limit_qa=350
Global $z=0
Global $skript_enabled =False
Global $x1=1920/1920;левое значение(это->1920/1920<-НЕ это!)-это левое значение вашего разрешения  (это->x1 x x2) пример: мое разрешение 1920 x 1080
Global $x2=1080/1080;левое значение(это->1080/1080<-НЕ это!)-это правое значение вашего разрешения  (x1 x x2<-это) пример: мое разрешение 1920 x 1080
GUICreate("inv", 150, 75,(1920*$x1)-150,0*$x2,0,$WS_EX_TOPMOST)
Global $id_label=GUICtrlCreateLabel($inv_limit_reg&"/"&$delay*100&"%/Rus/Region", 5*$x1, 5*$x2)
GUISetState(@SW_SHOW)
Global $idProgressbar1
Global $coord1
Global $nextignor=False
While $skript_enabled =False
   if ($autoinv_enabled = False) And ($ignor_enabled = False) and ($oji_enabled=False) and($spam_enabled= False) Then
	 sleep(1000*$delay)
	 If _WinAPI_GetKeyboardLayout(WinGetHandle("[ACTIVE]")) = 68748313 Then
		 if $z=0 then
			GUICtrlSetData($id_label,($inv_limit_reg&"/"&$delay*100&"%/Rus/Region"))
		 elseif $z=1 then
			GUICtrlSetData($id_label,($inv_limit_qa&"/"&$delay*100&"%/Rus/q&a"))
	     endif
	  ElseIf _WinAPI_GetKeyboardLayout(WinGetHandle("[ACTIVE]")) = 67699721 Then
		 if $z=0 then
			GUICtrlSetData($id_label,($inv_limit_reg&"/"&$delay*100&"%/Eng/Region"))
		 elseif $z=1 then
			GUICtrlSetData($id_label,($inv_limit_qa&"/"&$delay*100&"%/Eng/q&a"))
	     endif
      EndIf
   EndIf
   Sleep(20*$delay)
   local $a=0
   While (($autoinv_enabled = True) And ($skript_enabled = False))

		autoinvite()

		$a = $a + 1
		if( $z=0) Then
		   GUICtrlSetData($idProgressbar1,$a/$inv_limit_reg*100)
		ElseIf( $z=1) Then
		   GUICtrlSetData($idProgressbar1,$a/$inv_limit_qa*100)
		   EndIf
		If ($a >= $inv_limit_reg) And ($z = 0) Then
			   Sleep(100*$delay)
			   Send("{tab}")
			   Sleep(100*$delay)
			   $z = 1
			   MouseMove($x, $y, 0)
			   Sleep(1000*$delay)
			   MouseWheel("down",25)
			   Sleep(300*$delay)
			   $a = 0
			   GUICtrlSetData($id_label,$inv_limit_qa&"/"&$delay*100&"%/Eng/q&a")
		 EndIf
		 If ($a >= ($inv_limit_qa)) And ($z = 1) Then
			   Sleep(100*$delay)
			   Send("{shiftdown}")
			   Send("{tab}")
			   Send("{shiftup}")
			   Sleep(100*$delay)
			   $z = 0
			   MouseMove($x, $y, 0)
			   Sleep(1000*$delay)
			   MouseWheel("down",25)
			   Sleep(300*$delay)
			   $a = 0
			   GUICtrlSetData($id_label,$inv_limit_reg&"/"&$delay*100&"%/Eng/Region")
		 EndIf
	WEnd
   if $ignor_enabled = True Then
   ignor()
   Sleep(100*$delay)
   EndIf
   if $oji_enabled = True Then
   blist()
   Sleep(40*$delay)
   EndIf
   if $spam_enabled = True Then
   spam()
   sleep(50*$delay)
   EndIf
WEnd

Func blacklist_enable()
	Local $aPos = MouseGetPos()
    $x = $aPos[0]
    $y = $aPos[1]
	$oji_enabled = True;
EndFunc

Func blacklist_disable()
	$oji_enabled = False;
 EndFunc

 Func panic()
	$skript_enabled = True;
EndFunc

Func autoinvite_enable()
   $idProgressbar1 = GUICtrlCreateProgress(0, 30, 150, 25)
GUISetState(@SW_SHOW)
   Local $aPos = MouseGetPos()
   $x = $aPos[0]
   $y = $aPos[1]
   $autoinv_enabled = True;
EndFunc

Func autoinvite_disable()
   GUICtrlDelete($idProgressbar1)
   $autoinv_enabled = False;
EndFunc

Func ignor_enable()
   Local $aPos = MouseGetPos()
   $x = $aPos[0]
   $y = $aPos[1]
   $ignor_enabled = True;
EndFunc

Func ignor_disable()
   $ignor_enabled = False;
EndFunc

Func spam_for_recrut_chat_enable()
   $spam_enabled = True;
EndFunc

Func spam_for_recrut_chat_disable()
   $spam_enabled = False;
EndFunc

Func spam()
   Sleep(40*$delay)
   Send("Приглaшaем вcтупить в ивентoвый клaн SWB, у нac cтaбильный oнлaйн, oтcтрoенное дoдзё, нет мату, тoргoвли и ocкoрбениям в клaн чaте. Нaш вк - vk.com/warframesw")
   Sleep(40*$delay)
   Send("{enter}")
   Sleep(121000)
EndFunc

Func ignor()
   sleep(20*$delay)
   send("{enter}")
   sleep(20*$delay)
   send("{enter}")
   sleep(20*$delay)
   send("{enter}")
   sleep(30*$delay)
EndFunc

Func autoinvite()
   local $ignor=$nextignor
   MouseMove($x, $y, 0)
   sleep(30*$delay)
   $coord1 = PixelSearch($x, $y+20, $x+20, $y+30, 0xCCCCCC,6)
   if (not @error)then
     $nextignor=False
  Else
	 $nextignor=true
  EndIf
  sleep(30*$delay)
   if $ignor=False Then
	  MouseClick ("right")
	  sleep(100*$delay)
	  $coord1 = PixelSearch($x-10, $y+115, $x+70, $y+135, 0x0c0c0c, 6)
	  if (not @error)then
		 sleep(30*$delay)
		 MouseMove($x + (25*$x1), $y + (80*$x2), 0)
		 sleep(100*$delay)
		 MouseDown ( "left" )
		 sleep(20*$delay)
		 MouseUp ( "left" )
		 sleep(40*$delay)
	  Else
		 $coord1 = PixelSearch($x-10, $y+70, $x+70, $y+90, 0x0c0c0c, 6)
		 if (not @error)then
		 sleep(30*$delay)
		 Send("{esc}")
		 sleep(30*$delay)
		 EndIf
		 EndIf
	  EndIf
	  MouseWheel("down")
	  sleep(30*$delay)
EndFunc

Func Recrut_enable()
   $ised_enablede= True;
EndFunc

Func Recrut_disable()
   $ised_enabled = False;
EndFunc

Func blist()
   sleep(300*$delay)
   MouseMove($x, $y, 0)
   sleep(100*$delay)
   MouseDown ( "left" )
   sleep(20*$delay)
   MouseUp ( "left" )
   sleep(70*$delay)
   MouseMove($x + (50*$x1) , $y + (275*$x2), 0)
   sleep(90*$delay)
   Send("{up}")
   sleep(80*$delay)
   Send("{up}")
   sleep(80*$delay)
   Send("{up}")
   sleep(70*$delay)
   MouseDown ( "left" )
   sleep(20*$delay)
   MouseUp ( "left" )
   sleep(300*$delay)
   Send("{space}")
   sleep(70*$delay)
EndFunc

Func clan()
   Sleep(40*$delay)
   Send("Привeт вceм нoвичкaм, вы пoпaли к Блэкaм. Oзнaкoмитьcя c прaвилaми чaтa вы мoжeтe в esc -> cвязь -> клaн, свeрxу. Haш Discord(пo жeлaнию) - https://discord.gg/aUWWccF | вк - vk.com/warframesw")
   Sleep(40*$delay)
   Send("{enter}")
   Sleep(40*$delay)

EndFunc

Func povishenie()
   Sleep(40*$delay)
   Send("Пpивeт, хoчeшь ли пoвыcить cвoe звaниe, пpoчитaв пpaвилa клaнa? Hoвoe звaниe пpeдпoлoгaeт дo 10-ти днeй oффлaйнa и дocтуп к лaбopaтopиям. Пpaвилa тут(https://vk.com/warframesw) в oбcуждeнияx- уcтaв cooбщecтвa")
   Sleep(40*$delay)
   Send("{enter}")
   Sleep(40*$delay)

EndFunc

Func chertegi()

   Sleep(40*$delay)
   Send("Для копирования чертежей в лабораториях клана нужно иметь звание Энлайт. Способы повышения до данного звания расписаны в вк клана(https://vk.com/warframesw).")
   Sleep(40*$delay)
   Send("{enter}")
   Sleep(40*$delay)
EndFunc

Func jelaushie_povisitsia()

   Sleep(40*$delay)
   Send("Еcть ли жeлaющиe пoвыcить cвoe звaниe в клaнe? Caмый прocтoй cпocoб: прoчтитe пpaвилa cooбщecтвa и cдeлaйтe любoй вклaд в клaн. Пpaвилa в oбcyждeнияx-ycтaв cooбщecтвa https://vk.com/warframesw ")
   Sleep(40*$delay)
   Send("{enter}")
   Sleep(40*$delay)

EndFunc

Func Privetstvie()

  local $ran = Random(1,5,1)
  if $ran==1 then
	  Sleep(40*$delay)
	 Send("Приветствую Блэки, приятной игры.")
	 Sleep(40*$delay)
   Send("{enter}")
ElseIf $ran==2 then
    Sleep(40*$delay)
	 Send("Здоровьеца желаю, Блэки. Приятной игры, удачного фарма и всего наилучшего.")
	 Sleep(40*$delay)
   Send("{enter}")
ElseIf $ran==3 then
    Sleep(40*$delay)
	 Send("Всех кусь, просто кусь.")
	 Sleep(40*$delay)
   Send("{enter}")
ElseIf $ran==4 then
    Sleep(40*$delay)
	 Send("Всех кусь, хорошего дня.")
	 Sleep(40*$delay)
   Send("{enter}")
   ElseIf $ran==5 then
    Sleep(40*$delay)
	 Send("Приветствую дамы и господа, приятного времяприпровождения в рамке")
	 Sleep(40*$delay)
   Send("{enter}")
	 EndIf
EndFunc

Func kik1()
   Sleep(40*$delay)
   Send("Кик с клан чата за 7.1-мат,завуал,нецензурщина, на час. Прошу в дальнейшем не нарушать устав и вести себя культурно.")
   Sleep(40*$delay)
   Send("{enter}")
   Sleep(40*$delay)
EndFunc

Func kik4()
   Sleep(40*$delay)
   Send("Кик с клан чата за 7.4- капс, на пять минут. Прошу в дальнейшем не нарушать устав и вести себя культурно.")
   Sleep(40*$delay)
   Send("{enter}")
   Sleep(40*$delay)
EndFunc

Func kik7()
   Sleep(40*$delay)
   Send("Кик с клан чата за 7.7-торговля, обмен, попрошайничество, на час. Для этих целей есть торг чат.")
   Sleep(40*$delay)
   Send("{enter}")
   Sleep(40*$delay)
EndFunc

Func delayplus()
   $delay=$delay+0.05
   if $z=0 then
      GUICtrlSetData($id_label,($inv_limit_reg&"/"&$delay*100&"%/Eng/Region"))
   elseif $z=1 then
	  GUICtrlSetData($id_label,($inv_limit_qa&"/"&$delay*100&"%/Eng/q&a"))
   endif
EndFunc

Func delayminus()
   $delay=$delay-0.05
   if $z=0 then
	  GUICtrlSetData($id_label,($inv_limit_reg&"/"&$delay*100&"%/Eng/Region"))
   elseif $z=1 then
	  GUICtrlSetData($id_label,($inv_limit_qa&"/"&$delay*100&"%/Eng/q&a"))
   endif
EndFunc

Func invplus()
   if $z=0 then
	  $inv_limit_reg = $inv_limit_reg+10
      GUICtrlSetData($id_label,($inv_limit_reg&"/"&$delay*100&"%/Eng/Region"))
   elseif $z=1 then
	  $inv_limit_qa = $inv_limit_qa+10
	  GUICtrlSetData($id_label,($inv_limit_qa&"/"&$delay*100&"%/Eng/q&a"))
   endif
EndFunc

Func invminus()
   if $z=0 then
	  $inv_limit_reg = $inv_limit_reg-10
	  GUICtrlSetData($id_label,($inv_limit_reg&"/"&$delay*100&"%/Eng/Region"))
   elseif $z=1 then
	  $inv_limit_qa = $inv_limit_qa-10
	  GUICtrlSetData($id_label,($inv_limit_qa&"/"&$delay*100&"%/Eng/q&a"))
   endif
EndFunc

