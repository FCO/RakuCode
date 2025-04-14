[![Actions Status](https://github.com/FCO/RakuCode/actions/workflows/test.yml/badge.svg)](https://github.com/FCO/RakuCode/actions)

NAME
====

RakuCode - A [Cromponent](https://github.com/FCO/Cromponent) for raku code (WiP)

SYNOPSIS
========

```crotmp
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
```

![](/code-example.png)

DESCRIPTION
===========

RakuCode is a [Cromponent](https://github.com/FCO/Cromponent) for raku code (WiP)

AUTHOR
======

Fernando Corrêa de Oliveira <fco@cpan.org>

COPYRIGHT AND LICENSE
=====================

Copyright 2025 Fernando Corrêa de Oliveira

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

