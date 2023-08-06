// -*- coding: utf-8, tab-width: 4 -*-
/*

No import required because the Java launcher (`java` command) will
automatically accept `$CLASS_NAME.class` files from the same directory.

    !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !!
    !!
    !!  A `$CLASS_NAME.java` file in the same directory does not suffice.
    !!
    !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !! !!

However, the Java __compiler__ (`javac` command) will automatically compile
`$CLASS_NAME.java` to fix the lack of `$CLASS_NAME.class`.

That's why we need two commands (compile + run) and thus a utility shell
script is warranted for convenience.

*/

public class FromSameDirDemo {
    public static void main(String[] args) {
        System.out.println(SameDirHello.text);
    }
}
