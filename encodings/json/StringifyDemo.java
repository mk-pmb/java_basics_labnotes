// -*- coding: utf-8, tab-width: 4 -*-

import org.json.JSONObject;

public class StringifyDemo {
    public static void main(String[] args) {
        final String hello = "Hello" + (char)9 + "World!" + (char)10;
        System.out.println(JSONObject.quote(hello));
    }
}
