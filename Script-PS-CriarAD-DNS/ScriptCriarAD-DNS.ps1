# Variáveis
$ADFeature = "AD-Domain-Services"
$DNSFeature = "DNS"
$domainName = "SeuDominio.local" # **→ Ajustar nome do domínio conforme necessário**
$dsrmPassword = (ConvertTo-SecureString "SuaSenhaDSRM*" -AsPlainText -Force) # **→ Definir a senha do DSRM**

# Função para instalar uma função
function Install-Feature {
    param (
        [string]$featureName
    )
    Write-Host "Instalando $($featureName)..."
    Install-WindowsFeature -Name $featureName -IncludeManagementTools -Restart:$false
    Write-Host "$($featureName) instalado com sucesso."
}

# Etapa 1: Instalar AD DS e DNS
Write-Host "Instalando funções AD DS e DNS..."
Install-Feature -featureName $ADFeature
Install-Feature -featureName $DNSFeature

# Etapa 2: Promover o servidor a controlador de domínio com senha DSRM configurada
Write-Host "Promovendo o servidor como controlador de domínio para o domínio $($domainName)..."

Install-ADDSForest `
    -DomainName $domainName `
    -SafeModeAdministratorPassword $dsrmPassword `
    -Force

Write-Host "Controlador de domínio configurado com sucesso para o domínio $($domainName)."

# Reiniciar o servidor após a promoção
Restart-Computer -Force
