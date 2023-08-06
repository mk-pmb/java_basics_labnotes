
Using JSON in Java
==================

```java
import org.json.JSONObject;
```

… which is part of
[this maven artifact](https://mvnrepository.com/artifact/org.json/json).


### Obtaining the JAR

Since maven seems to just ban the entire TOR network (too afraid for even
mere read access), I had to refer to an
[archived version](https://web.archive.org/web/20221028060016/https://mvnrepository.com/artifact/org.json/json)
of the page, which had 20220924 as the latest version. However, on the
[version details page](https://web.archive.org/web/20221109203016/https://mvnrepository.com/artifact/org.json/json/20220924)
I couldn't find any download link for the JAR, so I optimistically constructed
it from some log files I found and
[it seems to work](https://repo1.maven.org/maven2/org/json/json/20220924/json-20220924.jar).
Their download server even accepted the TOR exit node that my wget was using.



### Making the JAR available

In old versions of OpenJDK for Ubuntu, it seems you could create a
system-wide directory for locally installed libraries
`/usr/lib/jvm/java-${OPENJDK_VERSION}-openjdk-amd64/lib/ext`
and all JAR files in there would be found automatically.

OpenJDK 17 no longer has that. When I tried, it explicitly told me that it
refuses to import from there, that it's deprecated, and that instead
I have to use `-classpath` nowadays.

Seems like we really need to run `java` with the `-classpath` option and
pass the path to either the JAR or a directory with its unpacked files.


