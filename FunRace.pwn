/*
	Ime Kreatora: Andrija "V01D" Terzic
	Datum: 17.04.2020
	Ime Kreacije: FunRace 
	Opis: Video sam negde kako lik pominje neki ovakav event, da kreces kod mora, plivas, vozis trcis itd
		  pa sam resio da ga napravim. Stvarate se na plazi, pokrenete FunRace preko /frcount i zatim se 
		  ograda ukloni. Na odredjenim CP-ovima dobijate vozilo, oduzima skripta vozilo, dobijate bajs itd.
		  Takodje je sve ovo smesteno u posebnom VirtualWorld-u tako da problem sa drugim igracima necete imati
		  Uglavnom, mislim da je jako zanimljivo, pritom je event dugacak i nagrade mogu biti vece (pogotovo zbog tog prokletog trcanja)
	
	P.S. Testiranje me je ubilo u pojam :D
	Share love by V01D <3
*/

//==================================[ Varijable FunRace by V01D ]=======================================

new FunRacePokrenut;
new bool:FunRacePocinje;
new bool:FunRace[MAX_PLAYERS];
new FunRaceCP[MAX_PLAYERS];
new FunRaceVoziloOff[MAX_PLAYERS];
new ZauzetoMesto1;
new ZauzetoMesto2;
new ZauzetoMesto3;
new Kapija;

//==================================[ ZANEMARI OVAJ DEFINE, OLAKSAVAM SEBI ]====================

#define FunRaceMessage(%0,%1)        SendClientMessage(%0, 0xF81414FF, "[FunRace] | {FFFFFF}"%1)

//==================================[ HOOKS ]====================================================

hook OnPlayerEnterCheckpoint(playerid)
{
	switch(FunRaceCP[playerid])
	{
		case 1:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2744.9854,-2660.4126,1.3695, 5.0);
			FunRaceCP[playerid] = 2;
			return 1;
		}
		case 2:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2794.4099,-2651.1284,-0.7726, 5.0);
			FunRaceCP[playerid] = 3;
			return 1;
		}
		case 3:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2818.2715,-2616.4814,-0.6087, 5.0);
			FunRaceCP[playerid] = 4;
			return 1;
		}
		case 4:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2812.1260,-2593.3750,0.0181, 5.0);
			FunRaceCP[playerid] = 5;
			return 1;
		}
		case 5:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2798.3804,-2563.9736,0.0866, 5.0);
			FunRaceCP[playerid] = 6;
			return 1;
		}
		case 6:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2784.9409,-2541.8838,2.0217, 5.0);
			FunRaceCP[playerid] = 7;
			return 1;
		}
		case 7:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2765.2380,-2511.2881,3.0000, 5.0);
			FunRaceCP[playerid] = 8;
			return 1;
		}
		case 8: //Dosao do vozila BANDITO
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2746.8425,-2487.0415,4.1294, 5.0);
			FunRaceCP[playerid] = 9;
			new Float:X, Float:Y, Float:Z;
	        GetPlayerPos(playerid, X,Y,Z);
	        FunRaceVoziloOff[playerid] = CreateVehicle(568, X,Y,Z, 0, 0, 0, -1);
	        SetVehicleVirtualWorld(FunRaceVoziloOff[playerid], 1);
	        PutPlayerInVehicle(playerid, FunRaceVoziloOff[playerid], 0);
	        FunRaceMessage(playerid, "Nastavi vozilom!");
        	return 1;
		}
		case 9:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2698.6975,-2426.1646,3.0599, 5.0);
			FunRaceCP[playerid] = 10;
			return 1;
		}
		case 10:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2607.1270,-2324.4353,10.8985, 5.0);
			FunRaceCP[playerid] = 11;
			return 1;
		}
		case 11:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2495.2493,-2303.5281,14.6828, 5.0);
			FunRaceCP[playerid] = 12;
			return 1;
		}
		case 12:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2406.1509,-2278.8816,14.4627, 5.0);
			FunRaceCP[playerid] = 13;
			return 1;
		}
		case 13:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2365.2751,-2259.4065,15.2796, 5.0);
			FunRaceCP[playerid] = 14;
			return 1;
		}
		case 14:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2349.5454,-2200.7407,31.5717, 5.0);
			FunRaceCP[playerid] = 15;
			return 1;
		}
		case 15:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2352.6147,-2181.7415,33.6156, 5.0);
			FunRaceCP[playerid] = 16;
			return 1;
		}
		case 16: //Unisti vozilo i laganim trcecim hodom peske
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2336.4021,-2178.6335,35.1399, 5.0);
			FunRaceCP[playerid] = 17;
			DestroyVehicle(FunRaceVoziloOff[playerid]);
			FunRaceMessage(playerid, "Nastavi peske!");
			return 1;
		}
		case 17:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2278.2373,-2149.9592,51.9605, 5.0);
			FunRaceCP[playerid] = 18;
			return 1;
		}
		case 18:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2221.6235,-2103.1147,73.2726, 5.0);
			FunRaceCP[playerid] = 19;
			return 1;
		}
		case 19:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2152.5010,-2021.7343,93.8139, 5.0);
			FunRaceCP[playerid] = 20;
			return 1;
		}
		case 20:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2129.9226,-1912.9207,115.8177, 5.0);
			FunRaceCP[playerid] = 21;
			return 1;
		}
		case 21:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2180.5410,-2002.1958,119.2122, 5.0);
			FunRaceCP[playerid] = 22;
			return 1;
		}
		case 22:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2253.9236,-2071.4985,120.2568, 5.0);
			FunRaceCP[playerid] = 23;
			return 1;
		}
		case 23:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2377.6692,-2096.3733,116.7631, 5.0);
			FunRaceCP[playerid] = 24;
			return 1;
		}
		case 24: //Daje mu biciklu
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2428.0967,-2091.2195,122.4258, 5.0);
			FunRaceCP[playerid] = 25;
			new Float:X, Float:Y, Float:Z;
	        GetPlayerPos(playerid, X,Y,Z);
	        FunRaceVoziloOff[playerid] = CreateVehicle(510, X,Y,Z, 0, 0, 0, -1);
	        SetVehicleVirtualWorld(FunRaceVoziloOff[playerid], 1);
	        PutPlayerInVehicle(playerid, FunRaceVoziloOff[playerid], 0);
	        FunRaceMessage(playerid, "Nastavi biciklom!");
	        return 1;
		}
		case 25:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2465.2703,-2070.2559,132.0284, 5.0);
			FunRaceCP[playerid] = 26;
			return 1;
		}
		case 26:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2529.5015,-1961.2897,177.1022, 5.0);
			FunRaceCP[playerid] = 27;
			return 1;
		}
		case 27:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2575.8992,-1896.1923,197.8214, 5.0);
			FunRaceCP[playerid] = 28;
			return 1;
		}
		case 28:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2645.4360,-1796.4830,232.2549, 5.0);
			FunRaceCP[playerid] = 29;
			return 1;
		}
		case 29:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2636.9971,-1734.3691,259.4918, 5.0);
			FunRaceCP[playerid] = 30;
			return 1;
		}
		case 30:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2568.0867,-1847.5986,278.6762, 5.0);
			FunRaceCP[playerid] = 31;
			return 1;
		}
		case 31:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2515.0537,-1884.3982,297.6578, 5.0);
			FunRaceCP[playerid] = 32;
			return 1;
		}
		case 32:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2593.4692,-1778.3636,318.6802, 5.0);
			FunRaceCP[playerid] = 33;
			return 1;
		}
		case 33:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2598.6377,-1645.6298,340.9853, 5.0);
			FunRaceCP[playerid] = 34;
			return 1;
		}
		case 34:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2583.1313,-1647.4979,349.1535, 5.0);
			FunRaceCP[playerid] = 35;
			return 1;
		}
		case 35:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2565.1030,-1777.4431,360.7546, 5.0);
			FunRaceCP[playerid] = 36;
			return 1;
		}
		case 36:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2528.2832,-1787.8938,378.0620, 5.0);
			FunRaceCP[playerid] = 37;
			return 1;
		}
		case 37:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2558.3801,-1685.8071,395.1360, 5.0);
			FunRaceCP[playerid] = 38;
			return 1;
		}
		case 38:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2528.6748,-1709.8164,401.6781, 5.0);
			FunRaceCP[playerid] = 39;
			return 1;
		}
		case 39:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2481.9875,-1789.0522,404.2460, 5.0);
			FunRaceCP[playerid] = 40;
			return 1;
		}
		case 40:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2439.3296,-1788.2076,413.1150, 5.0);
			FunRaceCP[playerid] = 41;
			return 1;
		}
		case 41:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2442.7166,-1721.4694,432.2596, 5.0);
			FunRaceCP[playerid] = 42;
			return 1;
		}
		case 42:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2326.1667,-1811.7697,436.2458, 5.0);
			FunRaceCP[playerid] = 43;
			return 1;
		}
		case 43:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2282.5212,-1742.6521,463.0277, 5.0);
			FunRaceCP[playerid] = 44;
			return 1;
		}
		case 44:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2288.9507,-1699.7200,478.6917, 5.0);
			FunRaceCP[playerid] = 45;
			return 1;
		}
		case 45:
		{
			DisablePlayerCheckpoint(playerid);
			SetPlayerCheckpoint(playerid, -2308.3101,-1649.5490,483.3065, 5.0);
			FunRaceCP[playerid] = 46;
			return 1;
		}
		case 46:
		{
			DisablePlayerCheckpoint(playerid);
			DestroyVehicle(FunRaceVoziloOff[playerid]);
			if(ZauzetoMesto1 == 0)
			{
				va_SendClientMessageToAll(-1, "[FunRace]Igrac %s je zauzeo prvo mesto!", ImeIgraca(playerid));
				GivePlayerMoney(playerid, 100000);
				ZauzetoMesto1 = 1;
				return 1;
			}
			else if(ZauzetoMesto2 == 0)
			{
				va_SendClientMessageToAll(-1, "[FunRace]Igrac %s je zauzeo drugo mesto!", ImeIgraca(playerid));
				GivePlayerMoney(playerid, 70000);
				ZauzetoMesto2 = 1;
				return 1;
			}
			else if(ZauzetoMesto3 == 0)
			{
				va_SendClientMessageToAll(-1, "[FunRace]Igrac %s je zauzeo trece mesto!", ImeIgraca(playerid));
				GivePlayerMoney(playerid, 50000);
				ZauzetoMesto2 = 0;
				ZauzetoMesto1 = 0;
				foreach(new i : Player)
				{
					if(FunRace[i] == true)
					{
						FunRaceMessage(i, "FunRace se zavrsio, cestitke pobednicima!");
						FunRacePokrenut = 0;
						FunRacePocinje = false;
						FunRaceCP[i] = 0;
						SetPlayerVirtualWorld(i, 0);
						SpawnPlayer(i);
					}
				}
			}
		}
	}
	return 1;
}

//========================= [ KOMANDE ZA FUNRACE BY V01D ] ================================//

CMD:frcount(playerid, params[]) //Pokretanje igre tacnije skidanje te "kapije" i pojavljivanje cp-a
{
	if(PlayerInfo[playerid][pAdmin] < 1) return FunRaceMessage(playerid, "Samo admin!");
	if(FunRacePokrenut == 0) return FunRaceMessage(playerid, "Fun Race nije pokrenut!");
	//if(FunRacePokrenut < 4) return FunRaceMessage(playerid, "Nema dovoljno igraca!");
	FunRacePocinje = true;
	foreach(new i : Player)
	{
		if(FunRace[i] == true)
		{
			FunRaceMessage(i, "Igra pocinje za 5 sekundi!");
			SetTimer("frcount4",1000,0);
   			SetTimer("frcount3",2000,0);
   			SetTimer("frcount2",3000,0);
   			SetTimer("frcount1",4000,0);
   			SetTimer("frcountgo",5000,0);
		}
	}
	return 1;
}

CMD:pokrenifunrace(playerid, params[]) //Pokretanje igre 
{
	if(PlayerInfo[playerid][pAdmin] < 1) return FunRaceMessage(playerid, "Samo admini!");
	if(FunRacePokrenut >= 1) return FunRaceMessage(playerid, "Fun Race je vec pokrenut!");
	va_SendClientMessageToAll(-1, "[FunRace]Admin %s je pokrenuo Fun Race! /joinfunrace", ImeIgraca(playerid));
	CreateObject(2990, -2689.89380, -2648.99634, 10.16452,   0.00000, 0.00000, 0.00000);
	CreateObject(2990, -2679.90576, -2648.94019, 11.08273,   0.00000, 0.00000, 0.00000);
	Kapija = CreateObject(2990, -2694.95361, -2643.88721, 10.16450,   0.00000, 0.00000, 90.00000);
	CreateObject(2990, -2689.90918, -2638.93018, 10.16452,   0.00000, 0.00000, 0.00000);
	CreateObject(2990, -2679.85205, -2638.98828, 10.16659,   0.00000, 0.00000, 0.00000);
	CreateObject(2990, -2674.84595, -2644.08447, 10.76230,   0.00000, 0.00000, 90.00000);
	FunRacePokrenut = 1;
	FunRacePocinje = false;
	return 1;
}

CMD:joinfunrace(playerid, params[]) //Join u utrku HAHAHAHAHAHHAHA UBICU SE
{
	if(FunRacePokrenut == 0) return FunRaceMessage(playerid, "Fun Race nije pokrenut!");
	if(FunRace[playerid] == true) return FunRaceMessage(playerid, "Vec si u Fun Race-u!");
	if(FunRacePocinje == true) return FunRaceMessage(playerid, "Zakasnio si!");
	if(FunRacePokrenut == 11) return FunRaceMessage(playerid, "Slotovi su puni!");
	switch(FunRacePokrenut)
	{
		case 1: { SetPlayerVirtualWorld(playerid, 1); SetPlayerPos(playerid, -2677.8455,-2646.6814,8.5866); FunRaceMessage(playerid, "Usao si u Fun Race!Igra uskoro pocinje, srecno!"); FunRace[playerid] = true; FunRacePokrenut++; }
		case 2: { SetPlayerVirtualWorld(playerid, 1); SetPlayerPos(playerid, -2678.4250,-2643.7983,8.1130); FunRaceMessage(playerid, "Usao si u Fun Race!Igra uskoro pocinje, srecno!"); FunRace[playerid] = true; FunRacePokrenut++; }
		case 3: { SetPlayerVirtualWorld(playerid, 1); SetPlayerPos(playerid, -2680.8767,-2641.5916,7.5605); FunRaceMessage(playerid, "Usao si u Fun Race!Igra uskoro pocinje, srecno!"); FunRace[playerid] = true; FunRacePokrenut++; }
		case 4: { SetPlayerVirtualWorld(playerid, 1); SetPlayerPos(playerid, -2683.9041,-2641.6577,7.2835); FunRaceMessage(playerid, "Usao si u Fun Race!Igra uskoro pocinje, srecno!"); FunRace[playerid] = true; FunRacePokrenut++; }
		case 5: { SetPlayerVirtualWorld(playerid, 1); SetPlayerPos(playerid, -2684.1782,-2644.1833,7.6243); FunRaceMessage(playerid, "Usao si u Fun Race!Igra uskoro pocinje, srecno!"); FunRace[playerid] = true; FunRacePokrenut++; }
		case 6: { SetPlayerVirtualWorld(playerid, 1); SetPlayerPos(playerid, -2684.2847,-2646.4609,7.9450); FunRaceMessage(playerid, "Usao si u Fun Race!Igra uskoro pocinje, srecno!"); FunRace[playerid] = true; FunRacePokrenut++; }
		case 7: { SetPlayerVirtualWorld(playerid, 1); SetPlayerPos(playerid, -2686.9932,-2646.7605,7.7321); FunRaceMessage(playerid, "Usao si u Fun Race!Igra uskoro pocinje, srecno!"); FunRace[playerid] = true; FunRacePokrenut++; }
		case 8: { SetPlayerVirtualWorld(playerid, 1); SetPlayerPos(playerid, -2689.6938,-2644.4905,7.1467); FunRaceMessage(playerid, "Usao si u Fun Race!Igra uskoro pocinje, srecno!"); FunRace[playerid] = true; FunRacePokrenut++; }
		case 9: { SetPlayerVirtualWorld(playerid, 1); SetPlayerPos(playerid, -2690.0769,-2641.4307,6.6661); FunRaceMessage(playerid, "Usao si u Fun Race!Igra uskoro pocinje, srecno!"); FunRace[playerid] = true; FunRacePokrenut++; }
		case 10: { SetPlayerVirtualWorld(playerid, 1); SetPlayerPos(playerid, -2691.7625,-2647.8364,7.4368); FunRaceMessage(playerid, "Usao si u Fun Race!Igra uskoro pocinje, srecno!"); FunRace[playerid] = true; FunRacePokrenut++; }
	}
	return 1;
}

//========================= [ TIMERI ZA FUNRACE BY V01D ] ================================//

forward frcount4();
forward frcount3();
forward frcount2();
forward frcount1();
forward frcountgo();

public frcount4()
{
	foreach(new i : Player)
	{
		if(FunRace[i] == true)
		{
			GameTextForPlayer(i, "4", 1000, 3);
		}
	}
}

public frcount3()
{
	foreach(new i : Player)
	{
		if(FunRace[i] == true)
		{
			GameTextForPlayer(i, "3", 1000, 3);
		}
	}
}

public frcount2()
{
	foreach(new i : Player)
	{
		if(FunRace[i] == true)
		{
			GameTextForPlayer(i, "2", 1000, 3);
		}
	}
}

public frcount1()
{
	foreach(new i : Player)
	{
		if(FunRace[i] == true)
		{
			GameTextForPlayer(i, "1", 1000, 3);
		}
	}
}

public frcountgo()
{
	foreach(new i : Player)
	{
		if(FunRace[i] == true)
		{
			GameTextForPlayer(i, "IGRA POCELA!", 1000, 3);
			DestroyObject(Kapija);
			SetPlayerCheckpoint(i, -2729.7944,-2653.7527,2.4482, 5.0);
			FunRaceCP[i] = 1;
		}
	}
}
/*
	Hvala sto si procitao do kraja, mnogo mi znaci, pogotovo zato sto niko ne ceni nista sto radim i nikada nece
	Pored svog truda da napravim nesto novo, da pomazem ljudima koliko mogu, opet su ljudi nezahvalni i bukvalno
	me hejtaju. Ja ne mislim nista lose nikome, sve sto kazem, kazem iskreno, ako je nesto lose, lose je, i nikada mi
	jebeno nece biti jasno kako ne umete da prihvatite kritiku. Pored svih sranja, idem dalje, cutim, trpim i radim..
	Nazalost nisam ovo imao sa kim da testam, svi su "zauzeti" i niko nema vremena. Ja cu nastaviti da radim i da se
	trudim da postignem nesto u zivotu, i da pravim sajtove, python i C# i zaradjujem. 
	Hvala sto si me saslusao, nemam sa kim da pricam i nemam kome da se poverim, prolazim kroz tezak period, razumi me <3
*/
