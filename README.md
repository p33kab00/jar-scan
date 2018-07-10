# jar-scan

jar-scan is a tiny open source scripts that automates the process of finding Java classes and artifacts in JAR archives.

**The jar-scan project is sponsored by [CGI](https://www.cgi.com/en).**

Installation
----

You can download jar-scan by cloning the [Git](https://github.com/p33kab00/jar-scan) repository:

    git clone https://github.com/p33kab00/jar-scan.git

jar-scan works out of the box with any system shell.

Usage
----

Look for JARs containing org.apache.xerces.jaxp.DocumentBuilderFactoryImpl:

    $ ./jar-scan.sh /usr/share/maltego/ide/modules org.apache.xerces.jaxp.DocumentBuilderFactoryImpl
    [*] jar-scan 0.1
    [*] by p33kab00 (mudnorb@gmail.com)
    [*] # of JARs: 50

    [+] /usr/share/maltego/ide/modules/ext/xerces-2.8.0.jar contains:
        org/apache/xerces/jaxp/DocumentBuilderFactoryImpl.class

    Done!

Look for JARs containing a service folder that points out a parser:

    $ ./jar-scan.sh /usr/share/maltego/ide/modules META-INF/services/.*Parser
    [*] jar-scan 0.1
    [*] by p33kab00 (mudnorb@gmail.com)
    [*] # of JARs: 50

    [+] /usr/share/maltego/ide/modules/ext/xerces-2.8.0.jar contains:
        META-INF/services/javax.xml.parsers.DocumentBuilderFactory
        META-INF/services/javax.xml.parsers.SAXParserFactory

    Done!
