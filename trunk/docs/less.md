#Less Documentation

##Classes

###.block(@margins)
Displays the element as a block element. If the parameter `@margins` is passed in, the value is used for `margin-top` and `margin-bottom`. If no `@margins` is passed in, `.block` will default to zero top and bottom margins.

###.block-margins
Displays the element as a block element, with 1em for `margin-top` and `margin-bottom`. It is a shorthand for `.block("1em")`.

###.hide
Results in `display:none` rule.

###.label(@content)
Takes a string, `@content`, and displays this as a label before the element that contains that has the class.

Thus, the following snippet:
    
    availability{
        .label("Availability: ");
        font-weight: bold;
    }

will produce the following CSS rules:
	
	availability {
  		font-weight: bold;
	}
	availability:before {
  		content: "Availability: ";
	}

###.mono
Effects a monospaced font. For use with code snippets, etc.

###.surround(@before, @after)
Places the text in `@before` before the element and the text in `@after` after the element. It relies on `.label`.

Thus, the following snippet:

	p{
		.surround("[","]");
	}
	
will produce the following CSS rules:

	p:before{
		content: "["
	}
	p:after{
		content: "]"
	}
	
Though, why anyone would want to surround a paragraph with brackets is beyond me.