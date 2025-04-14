#!/usr/bin/env raku

use Cro::HTTP::Router;
use Cro::HTTP::Server;
use Cro::WebApp::Template;
use RakuCode;

my $routes = route {
	template-location "resources/";

	RakuCode.^add-cromponent-routes;

	get -> {
	    template "raku-code.crotmp", %()
	}

	get -> "css" {
	    static 'resources/raku-code.css'
	}
}
my Cro::Service $http = Cro::HTTP::Server.new(
    http => <1.1>,
    host => "0.0.0.0",
    port => 20000,
    application => $routes,
);
$http.start;
say "Listening at http://0.0.0.0:20000";
react {
    whenever signal(SIGINT) {
        say "Shutting down...";
        $http.stop;
        done;
    }
}
