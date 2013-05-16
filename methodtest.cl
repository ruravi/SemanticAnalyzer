class C inherits Main {
	a : Int;
	b : Bool;
	init(x : Int, y : Bool) : C {
           {
		a <- x;
		b <- y;
		self;
           }
	};
	init(x : Int, x : Bool, x : Somethingelse) : C { xpression };
};

Class Main {
	main():Bool {
	{
	  (new C).init(1,true);
	  let obj1 : C, obj1 : C in true;
	}
	};
};

