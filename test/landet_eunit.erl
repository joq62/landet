%%% -------------------------------------------------------------------
%%% @author  : Joq Erlang
%%% @doc: : 
%%% Created :
%%% Node end point  
%%% Creates and deletes Pods
%%% 
%%% API-kube: Interface 
%%% Pod consits beams from all services, app and app and sup erl.
%%% The setup of envs is
%%% -------------------------------------------------------------------
-module(landet_eunit).    
 
-export([start/0]).
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------


%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
start()->
    ok=all_info_test(),
%    ok=brytar_test("brytare_1"),
%    ok=brytar_test("brytare_2"),
    
    timer:sleep(2000),
    ok=lampa_test("vrum_bordslampa"),
    ok=hall_lampa_test(),
    ok=lampa_test("vrum_dim_golv_soffa"),    



 %   ok=test1(),

 %   ok=test_lumi_sensor_motion_aq2(),
  %  ok=test_tradfri_bulb_E14_ws_candleopal_470lm(),

%    ok=test_tradfri_control_outlet(),
%    ok=test_tradfri_motion(),  
  %  ok=test_lumi_weather(),
  %  ok=test_lumi_switch(),
  %  ok=test2(),
  % 

    init:stop(),
    ok.


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
lampa_test(Id)->
    
    R10=tradfri_bulb_e27_ww_806lm:turn_off(Id),
    io:format("R10  ~p~n",[R10]),

 
    R10=tradfri_bulb_e27_ww_806lm:turn_on(Id,100),
    io:format("R10  ~p~n",[R10]),
    
    timer:sleep(4000),

    tradfri_bulb_e27_ww_806lm:turn_off(Id),

   ok.
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
hall_lampa_test()->
    true=tradfri_bulb_E14_ws_candleopal_470lm:reachable("hallen_byran_lampa"),
    R2=tradfri_bulb_E14_ws_candleopal_470lm:turn_off("hallen_byran_lampa"),
    io:format("R2  ~p~n",[R2]),
    R3=tradfri_bulb_E14_ws_candleopal_470lm:turn_on("hallen_byran_lampa",78,443),
    io:format("R3  ~p~n",[R3]),
    timer:sleep(5000),
    tradfri_bulb_E14_ws_candleopal_470lm:turn_off("hallen_byran_lampa"),


     ok.
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------


lampa_test_1(Id)->
    
    R10=tradfri_bulb_e27_ww_806lm:set(Id,"on"),
    io:format("R10  ~p~n",[R10]),
  %  timer:sleep(5000),
    R120=tradfri_bulb_e27_ww_806lm:set_bri(Id,0),
    io:format("R120  ~p~n",[R120]),
    timer:sleep(5000),

    R09=tradfri_bulb_e27_ww_806lm:set(Id,"off"),
    io:format("R09  ~p~n",[R09]),
    timer:sleep(2000),

    R11=tradfri_bulb_e27_ww_806lm:get_bri(Id),
    io:format("R11  ~p~n",[R11]), 
%    timer:sleep(5000),
 
    R100=tradfri_bulb_e27_ww_806lm:set(Id,"on"),
    io:format("R100  ~p~n",[R100]),
 
    R12=tradfri_bulb_e27_ww_806lm:set_bri(Id,78),
    io:format("R12  ~p~n",[R12]),
    timer:sleep(5000),

    tradfri_bulb_e27_ww_806lm:set_bri(Id,0),
    timer:sleep(5000),
    tradfri_bulb_e27_ww_806lm:set(Id,"off"),
    timer:sleep(2000),
   ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
hall_lampa_test_1()->
    true=tradfri_bulb_E14_ws_candleopal_470lm:reachable("hallen_byran_lampa"),
    R2=tradfri_bulb_E14_ws_candleopal_470lm:set("hallen_byran_lampa","on"),
    io:format("R2  ~p~n",[R2]),
    R3=tradfri_bulb_E14_ws_candleopal_470lm:set_bri("hallen_byran_lampa",0),
    io:format("R3  ~p~n",[R3]),
    timer:sleep(5000),
    R1= tradfri_bulb_E14_ws_candleopal_470lm:set("hallen_byran_lampa","off"),
    io:format("R1  ~p~n",[R1]),
    timer:sleep(2000),
    R20=tradfri_bulb_E14_ws_candleopal_470lm:set("hallen_byran_lampa","on"),
    io:format("R20  ~p~n",[R20]),
    
    R30=tradfri_bulb_E14_ws_candleopal_470lm:set_bri("hallen_byran_lampa",78),
    io:format("R30  ~p~n",[R30]),
    R4=tradfri_bulb_E14_ws_candleopal_470lm:set_ct("hallen_byran_lampa",443),
    io:format("R4  ~p~n",[R4]),
    timer:sleep(5000),
    tradfri_bulb_E14_ws_candleopal_470lm:set_bri("hallen_byran_lampa",0),
    timer:sleep(5000),
    tradfri_bulb_E14_ws_candleopal_470lm:set("hallen_byran_lampa","off"),
    timer:sleep(2000),


     ok.


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
brytar_test(Id)->
    io:format("push button on  ~p~n",[Id]),
    true=pushed_on(Id,false),
    io:format("push button off  ~p~n",[Id]),
    true=pushed_off(Id,true),
   
    ok.

pushed_on(_Id,true)->
    true;
pushed_on(Id,false) ->
    ButtonPushedOn=tradfri_on_off_switch:is_on(Id),
    timer:sleep(500),
    pushed_on(Id,ButtonPushedOn).
	     
    
pushed_off(_Id,false)->
    true;
pushed_off(Id,true) ->
    ButtonPushedOff=tradfri_on_off_switch:is_on(Id),
    timer:sleep(500),
    pushed_off(Id,ButtonPushedOff).
	     
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
all_info_test()->
    [{"brytare_1","On/off switch for all lamps"},
     {"brytare_2","On/Off switch TV set"},
     {"hallen_byran_lampa","lampa on cupboard at entrance  "},
     {"huset_innertemp","Tempsensor inside house"},
     {"landet_outlet_1","Outlet for the TV set"},
     {"motion_entrance","Motion detector outdoor entrance door"},
     {"motion_kitchen","Motion detector near kitchen"},
     {"vrum_bordslampa","Lamp on the table in livingroom "},
     {"vrum_dim_golv_soffa","Floor lamp by the sofa livingroom"}] =lists:sort(landet_device:all_info()),
    ok.


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
test_lumi_sensor_motion_aq2()->
    not_implemented=conbee:cmd_devices(lumi_sensor_motion_aq2,reachable,["landet_motion_xiomi_1"]),
    Presence=conbee:cmd_devices(lumi_sensor_motion_aq2,is_presence,["landet_motion_xiomi_1"]),
    Dark=conbee:cmd_devices(lumi_sensor_motion_aq2,is_dark,["landet_motion_xiomi_1"]),
    DayLight=conbee:cmd_devices(lumi_sensor_motion_aq2,is_daylight,["landet_motion_xiomi_1"]),
    LightLevel=conbee:cmd_devices(lumi_sensor_motion_aq2,lightlevel,["landet_motion_xiomi_1"]),
    Lux=conbee:cmd_devices(lumi_sensor_motion_aq2,lux,["landet_motion_xiomi_1"]),
    io:format("landet_motion_xiomi_1 ~p~n",[{Presence,Dark,DayLight,LightLevel,Lux}]),
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
test_tradfri_bulb_E14_ws_candleopal_470lm()->
    conbee:cmd_devices(lumi_switch_n0agl1,set,["lumi_1_switch","on"]),
    timer:sleep(1000),
    conbee:cmd_devices(tradfri_bulb_E14_ws_candleopal_470lm,set,["tradfri_lamp_2_lights","off"]),
    timer:sleep(1000),
    true=conbee:cmd_devices(tradfri_bulb_E14_ws_candleopal_470lm,reachable,["tradfri_lamp_2_lights"]),

    conbee:cmd_devices(tradfri_bulb_E14_ws_candleopal_470lm, set_bri,["tradfri_lamp_2_lights",10]),
    conbee:cmd_devices(tradfri_bulb_E14_ws_candleopal_470lm,set,["tradfri_lamp_2_lights","on"]),
    

    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
test_tradfri_control_outlet()->
    true=conbee:cmd_devices(tradfri_control_outlet,reachable,["landet_outlet_1"]),
    conbee:cmd_devices(tradfri_control_outlet,set,["landet_outlet_1","off"]),
    timer:sleep(1000),
    false=conbee:cmd_devices(tradfri_control_outlet,is_on,["landet_outlet_1"]),
    conbee:cmd_devices(tradfri_control_outlet,set,["landet_outlet_1","on"]),
    true=conbee:cmd_devices(tradfri_control_outlet,is_on,["landet_outlet_1"]),
    conbee:cmd_devices(tradfri_control_outlet,set,["landet_outlet_1","off"]),
    false=conbee:cmd_devices(tradfri_control_outlet,is_on,["landet_outlet_1"]),
    ok.
    
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
test_tradfri_motion()->
    not_implemented=conbee:cmd_devices(tradfri_motion_sensor,reachable,["landet_ikea_motion_sensor_1"]),
    Presence=conbee:cmd_devices(tradfri_motion_sensor,is_presence,["landet_ikea_motion_sensor_1"]),
    io:format("landet_ikea_motion_sensor_1 ~p~n",[Presence]),
    
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
test_lumi_weather()->
    not_implemented=conbee:cmd_devices(lumi_weather,reachable,["lumi_weather_1_sensor"]),
    Temp=conbee:cmd_devices(lumi_weather,temp,["lumi_weather_1_sensor"]),
    Humidity=conbee:cmd_devices(lumi_weather,humidity,["lumi_weather_1_sensor"]),
    Pressure=conbee:cmd_devices(lumi_weather,pressure,["lumi_weather_1_sensor"]),
    io:format("lumi_weather_1_sensor ~p~n",[{Temp,Humidity,Pressure}]),
    
    ok.
    
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
test_lumi_switch()->
    true=conbee:cmd_devices(lumi_switch_n0agl1,reachable,["lumi_1_switch"]),
    conbee:cmd_devices(lumi_switch_n0agl1,set,["lumi_1_switch","off"]),
    false=conbee:cmd_devices(lumi_switch_n0agl1,is_on,["lumi_1_switch"]),
    conbee:cmd_devices(lumi_switch_n0agl1,set,["lumi_1_switch","on"]),
    timer:sleep(2000),
    true=conbee:cmd_devices(lumi_switch_n0agl1,is_on,["lumi_1_switch"]),
    conbee:cmd_devices(lumi_switch_n0agl1,set,["lumi_1_switch","off"]),
    timer:sleep(2000),
    false=conbee:cmd_devices(lumi_switch_n0agl1,is_on,["lumi_1_switch"]),
    ok.
    
 
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
test2()->
    true=conbee:cmd_devices(lumi_switch_n0agl1,reachable,["lumi_1_switch"]),
    not_implemented=conbee:cmd_devices(lumi_weather,reachable,["lumi_weather_1_sensor"]),
    not_implemented=conbee:cmd_devices(tradfri_motion_sensor,reachable,["tradfri_motion_1_sensor"]),
    
 
    
    
    ok.


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
test1()->
    [
     "tradfri_bulb_E14_ws_candleopal_470lm",
     "tradfri_bulb_e27_cws_806lmw",
     "tradfri_bulb_e27_ww_806lm",
     "tradfri_control_outlet",
     "tradfri_on_off_switch",
     "lumi_sensor_magnet_aq2",
     "lumi_sensor_motion_aq2",
     "lumi_weather",
     "lumi_switch_n0agl1"]=conbee:all_devices(),

    io:format("conbee:all_devices() ~p~n",[conbee:all_devices()]),
    
    ok.
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------

setup()->

   ok.
