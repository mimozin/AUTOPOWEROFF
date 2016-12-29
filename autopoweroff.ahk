;--------------
;-AUTOPOWEROFF-
;--------------
!F5::
Gui, New
Gui, Show,W300 H160,APAGADO AUTOMÁTICO 
Gui, Add, Text, x10, TIEMPO HASTA APAGADO:
Gui, Add, Text, x20 y24, Horas
Gui, Add, Edit, vpohoras w80 x20 y39, 0
Gui, Add, Text, x150 y24, Minutos
Gui, Add, Edit, vpominutos w80 x150 y39, 0

Gui, Add, Text, x10 y63, HORA APAGADO:
Gui, Add, Text, x20 y87, Horas
Gui, Add, Edit, vpohoras2 w80 x20 y102, 0
Gui, Add, Text, x150 y87, Minutos
Gui, Add, Edit, vpominutos2 w80 x150 y102, 0

Gui, Add, Button, x13 y132, OK
Gui, Add, Button, x44 y132, Cancel
Gui, Add, Button, x93 y132, Exit
Gui, Show
return

ButtonOK:
Gui, Submit


if ((pohoras > 0 and pohoras2 > 0) or (pominutos > 0 and pominutos2 > 0))
{
	Msgbox !Error en campos¡: Entrada duplicada
	return
}

if (((pohoras is number or pohoras=0) and (pominutos is number or pominutos=0) ) and ((pohoras + pominutos) > 0) or ((pohoras2 is number or pohoras2=0) and (pominutos2 is number or pominutos2=0) ) and ((pohoras2 + pominutos2) > 0))
{

}
else
{
  Msgbox !Error en campos¡: Datos incorrectos
  return
}

varhora:= phoras+pminutos

If varhora
{
	powerofftime:=(pohoras*60+pominutos)*60

}
else 
{
	powerofftime:= ((pohoras2 * 60+ pominutos2 )*60 - (A_Hour * 60 + A_Min)*60 )  
}

Run %comspec% /c shutdown -s -t %powerofftime%, , hide 

ButtonCancel:
Run %comspec% /c shutdown -a, , hide 
 Return

 ButtonExit:
 GuiClose:
 GuiEscape:
   Gui, Hide
 Return
