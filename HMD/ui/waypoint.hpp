class RscTitles
{
	class APD_HUD
	{
		idd = -1;
		duration = 10^10;
		onLoad = "uiNamespace setVariable ['APD_HUD_Display', _this select 0];";
		onUnload = "uiNamespace setVariable ['APD_HUD_Display', displayNull];";
	};
};
