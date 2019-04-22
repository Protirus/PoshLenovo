# https://raw.githubusercontent.com/SimonWahlin/posh-ftp/dev/posh-ftp/Private/DisableCertificateValidation.ps1
function Disable-CertificateValidation
{
    Write-Warning -Message 'All certificate errors will be ignored!'
    add-type -TypeDefinition  @"
        using System.Net;
        using System.Security.Cryptography.X509Certificates;
        public class TrustAllCertsPolicy : ICertificatePolicy {
            public bool CheckValidationResult(
                ServicePoint srvPoint, X509Certificate certificate,
                WebRequest request, int certificateProblem) {
                return true;
            }
        }
"@
    [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
}