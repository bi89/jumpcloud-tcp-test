#TCP check for JumpCloud white list
#version 0.1
#Boon boon.suchathit@techdirect.net
#15/11/23
#Note: pmw.jumpcloud.com is using private DNS record.
$domain = @("a1hrq03pdcca60-ats.iot.us-east-1.amazonaws.com","agent.jumpcloud.com","assist.jumpcloud.com","cdn02.jumpcloud.com","chocolatey.org","kickstart.jumpcloud.com","private-kickstart.jumpcloud.com","s3.amazonaws.com","cdn.pwm.jumpcloud.com")
for ($i=0;$i -lt$domain.Length;$i++){
    $test = Test-Netconnection -Port 443 $domain[$i] | Select-Object -Property TcpTestSucceeded -ExpandProperty TcpTestSucceeded
    if ($test -eq $true){
        Write-Host $domain.GetValue($i) "is OK"
    }else{
        Write-Host "TCP Test is Fail"
        Write-Host "Start Test Net Connection"
        Test-Netconnection -Port 443 $domain[$i]
    }
}
