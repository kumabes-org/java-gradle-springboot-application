  count_maven=$(find . -type f -name pom.xml 2>/dev/null | wc -l)
  count_gradle_groovy=$(find . -type f -name build.gradle 2>/dev/null | wc -l)
  count_gradle_kotlin=$(find . -type f -name build.gradle.kts 2>/dev/null | wc -l)
  
  if [ "${count_maven}" -ge "1" ]; then
    echo "Maven Project"
    mvn -version
    ./mvnw -version
    ./mvnw -B clean verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -f pom.xml -s settings.xml
  elif [ "${count_gradle_groovy}" -ge "1" ]; then
    echo "Gradle Project Groovy"
    gradle -version
    ./gradlew -version
    ./gradlew clean build sonar --parallel
    ls -lRth --color build
  elif [ "${count_gradle_kotlin}" -ge "1" ]; then
    echo "Gradle Project Kotlin"
    gradle -version
    ./gradlew -version
    ./gradlew clean build sonar --parallel
    ls -lRth --color build
  else
    echo "Projeto não mapeado!"
    exit 1
  fi