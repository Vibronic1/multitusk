HotKeySet("{f1}", "autoinvite_enable")
HotKeySet("{f2}", "autoinvite_disable")
HotKeySet("{f3}", "ignor_enable")
HotKeySet("{f4}", "ignor_disable")
HotKeySet("{f5}", "clan")
HotKeySet("{f6}", "chertegi")
HotKeySet("{f7}", "jelaushie_povisitsia")
HotKeySet("{f8}", "prinud-povishenie")
HotKeySet("{f9}", "kik1")
HotKeySet("{f10}", "kik4")
HotKeySet("{f11}", "kik7")
Global $is_enabled = False
Global $x, $y
Global $ised_enabled = False
Global $ise_enabled = False
While 1
   Sleep(20)
   if $is_enabled = True Then
   autoinvite()
   Sleep(30)
   EndIf
   if $ise_enabled = True Then
   ignor()
   Sleep(100)
   EndIf
   if $ised_enabled = True Then
   blist()
   Sleep(600)
   EndIf
WEnd

Func autoinvite_enable()
   Local $aPos = MouseGetPos()
   $x = $aPos[0]
   $y = $aPos[1]
   $is_enabled = True;
EndFunc

Func autoinvite_disable()
   $is_enabled = False;
EndFunc

Func ignor_enable()
   Local $aPos = MouseGetPos()
   $x = $aPos[0]
   $y = $aPos[1]
   $ise_enabled = True;
EndFunc

Func ignor_disable()
   $ise_enabled = False;
EndFunc

Func ignor()
   MouseMove($x, $y, 0)
   sleep(100)
   MouseDown ( "left" )
   sleep(20)
   MouseUp ( "left" )
   sleep(100)
   MouseDown ( "left" )
   sleep(20)
   MouseUp ( "left" )
   sleep(30)
EndFunc

Func autoinvite()
   MouseMove($x, $y, 0)
   sleep(30)
   MouseClick ("right")
   sleep(30)
   MouseMove($x + 20, $y + 70, 0)
   sleep(100)
   MouseDown ( "left" )
   sleep(20)
   MouseUp ( "left" )
   sleep(30)
   MouseWheel ("down")
   sleep(30)

EndFunc

Func Recrut_enable()

   $ised_enablede= True;
EndFunc

Func Recrut_disable()

   $ised_enabled = False;
EndFunc

Func clan()
   Sleep(40)
   Send("Привет всем новичкам, вы попали к Блэкам. Ознакомиться с правилами чата вы можете в esc -> связь -> клан, сверху. Наш Discord(по желанию) - https://discord.gg/aUWWccF | вк - vk.com/warframesw")
   Sleep(40)
   Send("{enter}")
   Sleep(40)

EndFunc

Func chertegi()

   Sleep(40)
   Send("Для копирования чертежей в лабораториях клана нужно иметь звание Энлайт. Способы повышения до данного звания расписаны в вк клана(https://vk.com/warframesw).")
   Sleep(40)
   Send("{enter}")
   Sleep(40)
EndFunc

Func jelaushie_povisitsia()

   Sleep(40)
   Send("Есть желающие повысится до звания Enlight, с которого можно копировать чертежи? Все способы можно посмотреть в вк(https://vk.com/warframesw) в обсуждении повышения в кланах.")
   Sleep(40)
   Send("{enter}")
   Sleep(40)

EndFunc

Func prinud-povishenie()


EndFunc

Func kik1()


   Sleep(40)
   Send("Кик с клан чата за 7.1-мат,завуал,нецензурщина, на час. Прошу в дальнейшем не нарушать устав и вести себя культурно.")
   Sleep(40)
   Send("{enter}")
   Sleep(40)
EndFunc

Func kik4()


   Sleep(40)
   Send("Кик с клан чата за 7.4- капс, на пять минут. Прошу в дальнейшем не нарушать устав и вести себя культурно.")
   Sleep(40)
   Send("{enter}")
   Sleep(40)
EndFunc

Func kik7()


   Sleep(40)
   Send("Кик с клан чата за 7.7-торговля, обмен, попрошайничество, на час. Для этих целей есть торг чат.")
   Sleep(40)
   Send("{enter}")
   Sleep(40)
EndFunc