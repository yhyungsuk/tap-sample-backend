tests:
	@/usr/bin/time mvn clean test -Dskip.unit.tests=false

local:
	@/usr/bin/time mvn clean && mvn spring-boot:run
