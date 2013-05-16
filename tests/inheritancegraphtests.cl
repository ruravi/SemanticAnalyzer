(* Inherit from undefined class *)
class C inherits E {
	a : Int;
	b : Bool;
	init(x : Int, y : Bool) : C {
           {
		a <- x;
		b <- y;
		self;
           }
	};
};

(* Invalid Inherit from Int class *)
Class A inherits Int {};

(* Invalid Inherit from String class *)
Class B inherits String {};

(* Invalid Inherit from Bool class *)
Class F inherits Bool {};

(* Valid Inherit from IO class *)
Class G inherits IO {};

(* Redifining already defined class *)
Class G {};
