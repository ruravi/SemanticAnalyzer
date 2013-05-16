class D inherits Main {
        a: Int;
};

class C {
	a : Int;
	b : Bool;
	init(x : Int, y : Bool) : C {
           {
		a <- x;
		b <- y;
		self;
           }
	};
	--init1(x : Int, x : Bool) : C { xpression };
};

Class Main {
	a : Int;
	main():C {
	  (new C).init(1,true)
	};
};

