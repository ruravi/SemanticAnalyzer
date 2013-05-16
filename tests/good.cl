class C {
	a : Int;
	b : Bool;
	c : String;
	init(x : Int, y : Bool) : C {
           {
		a <- x;
		b <- y;
		self;
           }
	};
	
	(* Test Int/Bool/String constants, new in assignment *)
	prettyprint(a : Bool, b : Int, c: String) : Bool {
		{
			b <- 35;
			a <- false;
			c <- "A string constant"; 
			c <- new String;
			a <- true;
		}
	};

	(* Test valid if statements, let statements with/without init, cases,
	loops, isvoid, not, arithmetic, compare, neg and equals *)
	allchecks() : Int {
		{
			-- if b then "True" else prettyprint(b, a, "False") fi;
			let a : String, b : String, c : D in {
				let a : Bool <- true in isvoid a;
				case a of 
					b : Bool => true;
					b : Int  => (b + 1 ) * 5 / b - 1;
					b : String => b;
				esac;
			};
			while true loop
				{
					a <- ~9274947;
					b <- (5 < 7);
					b <- (5 <= 7);
					b <- not 5 = 7;
				}
			pool;

			let c : Int <- 24809 in  (a + 1 ) * 5 / c - 1;
		}
	};
};

class D {

};

Class Main {
	main():C {
		-- Test valid dispatch
	  	(new C).init(1,true)
	  	-- TODO: test a static dispatch
	};
};
