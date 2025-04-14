use v6.e.PREVIEW;
use Cromponent;
use RakuCode::HighLight;

class RakuCode does Cromponent is macro {
	has      &.body     = -> { "" };
	has Str  $.code     = &!body.();
	has      $.ast      = $!code.AST;
	has Str  $.hl-code  = self!high-light: $!ast;
	has Str  $.id       = (("a" .. "z"), ("A" .. "Z")).flat.roll(10).join;
	has Str  $.name     = "code";

	method !high-light($ast) {
		$!ast.DEPARSE: RakuCode::HighLight
	}

	method RENDER {
		Q:to/HTML/
		<div class="raku-code-component">
			<pre
				id='<.id>'
				class='raku-code'
			><&HTML(.hl-code)></pre>
		</div>
		HTML
	}
}

sub EXPORT() {
	BEGIN RakuCode.^exports;
}

=begin pod

=head1 NAME

RakuCode - A L<Cromponent|https://github.com/FCO/Cromponent> for raku code (WiP)

=head1 SYNOPSIS

=begin code :lang<crotmp>

<:use Boilerplate>
<:use RakuCode>
<|Boilerplate(:htmx, :title('Testing Raku Code Component'), :style-sheets('/css'))>
	<|RakuCode>
		class :: {
			has UInt $!id;
			has Str  $.key;
			has      $.value;
		}
	</|>
</|>

=end code

![](/code-example.png)

=head1 DESCRIPTION

RakuCode is a L<Cromponent|https://github.com/FCO/Cromponent> for raku code (WiP)

=head1 AUTHOR

Fernando Corrêa de Oliveira <fco@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2025 Fernando Corrêa de Oliveira

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
