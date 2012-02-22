#Less Documentation

##Classes/functions

###.block(@margins)
Displays the element as a block element. If the parameter `@margins` is passed in, the value is used for `margin-top` and `margin-bottom`. If no `@margins` is passed in, `.block` will default to zero top and bottom margins.

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
