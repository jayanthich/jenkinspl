stage 'build'
node ('slave'){
     git 'git@github.com:jayanthich/jenkinspl.git'
     withEnv(["PATH+MAVEN=${tool 'Maven'}/bin"]) {
          sh "mvn -B clean package"
     }
     stash excludes: 'target/', includes: '**', name: 'source'
}
stage 'test'
parallel 'integration': {
node ('slave') {
          unstash 'source'
          withEnv(["PATH+MAVEN=${tool 'Maven'}/bin"]) {
               sh "mvn clean verify"
          }
     }
}, 'quality': {
     node ('slave') {
          unstash 'source'
          withEnv(["PATH+MAVEN=${tool 'Maven'}/bin"]) {
               sh "mvn clean verify" //sonar:sonar
          }
     }
}

