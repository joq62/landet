%%%-------------------------------------------------------------------
%% @doc landet public API
%% @end
%%%-------------------------------------------------------------------

-module(landet_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    landet_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
