
def ciUrl =  'https://github.com/tungstenfabric/tf-openlab-ci.git'
def vrouterUrl = 'https://github.com/Juniper/contrail-vrouter.git'

pipelineJob('weekly_intel_testbed') {
    scm {
      git {
        remote {
          url(vrouterUrl)
          name("origin")
        }
        branch("*/R5.0")
      }
    }

    triggers {
        scm('H 0 * * 5')
    }
    
    definition {
        cpsScm {
            scm {
                git(vrouterUrl)
            }
            scriptPath("./pipeline/intel_testbed.jenkinsfile")
            extensions { }
        }
    }
}

listView('weekly_jobs') {
    columns {
        weather()
        status()
        name()
        lastFailure()
        lastSuccess()
        lastDuration()
        progressBar()
        nextPossibleLaunch()
    }

    jobs {
        name('weekly_intel_testbed')
    }
}
