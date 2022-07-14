all:
	rm -rf  *~ */*~ apps/landet/src/*.beam test/*.beam erl_cra*;
	rm -rf  rebar.lock;
	rm -rf _build test_ebin ebin ;
	mkdir ebin;		
	rebar3 compile;	
	cp _build/default/lib/*/ebin/* ebin;
	cp /home/joq62/erlang/applications/hw/conbee/ebin/* ebin;
	rm -rf _build;
	echo complile succeded and do git;
	git add -f *;
	git commit -m  $(m);
	git push; 
	echo OK there you go
check:
	rebar3 check

eunit:
	rm -rf  *~ */*~ apps/landet/src/*.beam test/*.beam test_ebin erl_cra*;
	rm -rf _build;
	rm -rf rebar.lock;
	rm -rf ebin;
	mkdir test_ebin;
	mkdir ebin;
	rebar3 compile;
	cp _build/default/lib/*/ebin/* ebin;
	cp /home/joq62/erlang/applications/hw/conbee/ebin/* ebin;
	erlc -o test_ebin test/*.erl;
	erl -pa ~ -pa ebin -pa test_ebin -sname landet -run basic_eunit start -setcookie cookie_test
