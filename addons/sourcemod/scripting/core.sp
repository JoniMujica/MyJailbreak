//includes
#include <sourcemod>
#include <cstrike>
#include <myjailbreak>

//Compiler Options
#pragma semicolon 1
#pragma newdecls required

//Strings
char IsEventDay[128] = "none";

public Plugin myinfo = {
	name = "MyJailbreak - core",
	author = "shanapu",
	description = "Jailbreak",
	version = PLUGIN_VERSION,
	url = ""
};

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	CreateNative("SetEventDay", Native_SetEventDay);
	CreateNative("GetEventDay", Native_GetEventDay);
	
//	RegPluginLibrary("MyJB");
 
//	return APLRes_Success;
}

public int Native_SetEventDay(Handle plugin,int argc)
{
	char buffer[64];
	GetNativeString(1, buffer, 64);
	
	Format(IsEventDay, sizeof(IsEventDay), buffer);
}

public int Native_GetEventDay(Handle plugin,int argc)
{
	SetNativeString(1, IsEventDay, sizeof(IsEventDay));
}
