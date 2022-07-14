%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : 
%%% Hw server to control specific hw using conbee II and protocol zigbee
%%% Contains all supported devices   
%%% conbee daemon is running in a docker container called "deconz"
%%% 
%%% Created : 
%%% -------------------------------------------------------------------
-module(landet_device).  

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------


%% --------------------------------------------------------------------
-define(DeviceInfo,[{"hallen_byran_lampa","lampa on cupboard at entrance  "},
		  {"vrum_dim_golv_soffa","Floor lamp by the sofa livingroom"},
		  {"vrum_bordslampa","Lamp on the table in livingroom "}, 
		  {"landet_outlet_1","Outlet for the TV set"},
		  {"brytare_1","On/off switch for all lamps"},
		  {"brytare_2","On/Off switch TV set"},
		  {"motion_kitchen","Motion detector near kitchen"},
		  {"motion_entrance","Motion detector outdoor entrance door"},
		  {"huset_innertemp","Tempsensor inside house"}]).
%% External exports
-export([
	 all_info/0
	 
	]).




%% ====================================================================
%% External functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Func: code_change/3
%% Purpose: Convert process state when code is changed
%% Returns: {ok, NewState}
%% --------------------------------------------------------------------
all_info()->
    ?DeviceInfo.

%% --------------------------------------------------------------------
%% Func: code_change/3
%% Purpose: Convert process state when code is changed
%% Returns: {ok, NewState}
%% --------------------------------------------------------------------


%% --------------------------------------------------------------------
%%% Internal functions
%% --------------------------------------------------------------------

		  
