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
	method(x : Int) : Bool { b <- new SELF_TYPE };
};

Class Main {
	main():Bool {
	{
	  (new C).init(1,true);
	  if 35 then 35 else 45 fi;
	  let obj1 : C <- 35, obj1 : C in new C;
	}
	};
};

