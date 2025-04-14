use HTML::Escape;
unit role RakuCode::HighLight;

method hsyn($type, $content) {
	qq|<span class="{
		$.type-to-list($type).join: " "
	}">{ escape-html $content }</span>|
}

method type-to-list($type) {
	[
		"raku-code",
		|$type.split("-")>>.subst: /\W/, *.uniname.lc.subst: /\W+/, "-"
	].produce: ->$agg, $i? {
		return $agg unless $i;
		"$agg-$i"
	}
}
