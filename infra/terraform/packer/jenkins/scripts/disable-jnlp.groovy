#!groovy
 
import jenkins.model.Jenkins
import jenkins.security.s2m.*
 
Jenkins jenkins = Jenkins.getInstance()
jenkins.setSlaveAgentPort(-1)                                               ❶
HashSet<String> newProtocols = new HashSet<>(jenkins.getAgentProtocols());  ❷
newProtocols.removeAll(Arrays.asList(                                       ❷
        "JNLP3-connect", "JNLP2-connect", "JNLP-connect", "CLI-connect"     ❷
));                                                                         ❷
jenkins.setAgentProtocols(newProtocols);                                    ❷
jenkins.save()