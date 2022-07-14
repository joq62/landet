{application,conbee,
             [{description,"An OTP application"},
              {vsn,"0.1.0"},
              {registered,[]},
              {mod,{conbee_app,[]}},
              {applications,[kernel,stdlib]},
              {env,[]},
              {modules,[conbee,conbee_app,conbee_sup,devices_conbee,
                        lib_conbee,lights,lumi_sensor_magnet_aq2,
                        lumi_sensor_motion_aq2,lumi_switch_n0agl1,
                        lumi_weather,sensors,switch,
                        tradfri_bulb_E14_ws_candleopal_470lm,
                        tradfri_bulb_e27_cws_806lm,tradfri_bulb_e27_ww_806lm,
                        tradfri_control_outlet,tradfri_motion_sensor,
                        tradfri_on_off_switch]},
              {licenses,["Apache 2.0"]},
              {links,[]}]}.