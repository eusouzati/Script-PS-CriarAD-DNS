<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Active Directory Domain Controller Setup Script</title>
</head>
<body>

<h1>Active Directory Domain Controller Setup Script</h1>

<p>Este repositório contém um script PowerShell para a instalação e promoção de um servidor Windows como controlador de domínio com as funções de <strong>Active Directory Domain Services (AD DS)</strong> e <strong>DNS</strong>. O script também define a senha para o <strong>Directory Services Restore Mode (DSRM)</strong>, necessária para recuperação do Active Directory.</p>

<h2>Funcionalidades</h2>
<ul>
    <li>Instalação das funções AD DS e DNS no servidor.</li>
    <li>Promoção automática do servidor a controlador de domínio.</li>
    <li>Configuração da senha do DSRM.</li>
    <li>Reinicialização automática após a promoção do controlador de domínio.</li>
</ul>

<h2>Requisitos</h2>
<ul>
    <li>Sistema Operacional: Windows Server 2012 ou superior.</li>
    <li>Permissões de administrador no servidor.</li>
    <li>PowerShell 5.0 ou superior.</li>
    <li>Módulos de <strong>Active Directory</strong> e <strong>WindowsFeature</strong> instalados.</li>
</ul>

<h2>Uso</h2>

<h3>Passo 1: Clone o Repositório</h3>

<p>Clone este repositório para o seu servidor Windows:</p>

<pre>
<code>git clone https://github.com/seuusuario/seu-repositorio.git
cd seu-repositorio
</code>
</pre>

<h3>Passo 2: Ajuste o Script</h3>

<p>Abra o arquivo de script <strong>Setup-ADDS.ps1</strong> e altere as seguintes variáveis conforme o seu ambiente:</p>

<ul>
    <li><strong>Nome do Domínio</strong>: Atualize o nome do domínio para o nome que você deseja usar.</li>
</ul>

<pre>
<code>$domainName = "SeuDominio.local"  # Substituir pelo nome do domínio desejado. </code>
</pre>

<ul>
    <li><strong>Senha do Modo de Recuperação do Active Directory (DSRM)</strong>: Defina uma senha segura para o modo de recuperação do AD DS.</li>
</ul>

<pre>
<code>$dsrmPassword = (ConvertTo-SecureString "SuaSenhaDSRM*" -AsPlainText -Force)  # Substituir pela senha do DSRM.
</code>
</pre>

<h3>Passo 3: Execute o Script</h3>

<p>Após ajustar as variáveis, execute o script com permissões de administrador:</p>

<pre>
<code>.\Setup-ADDS.ps1</code>
</pre>

<h3>Passo 4: Monitoramento</h3>

<ul>
    <li>O script exibirá mensagens de progresso para a instalação das funções e promoção do controlador de domínio.</li>
    <li>O servidor será reiniciado automaticamente após a conclusão da promoção.</li>
</ul>

<h2>Parâmetros do Script</h2>

<ul>
    <li><strong>Nome do Domínio</strong>: O nome do domínio para o qual o servidor será promovido.</li>
    <li><strong>Senha do DSRM</strong>: A senha que será usada para o modo de recuperação do Active Directory.</li>
</ul>

<h2>Exemplo de Execução</h2>

<pre>
<code>$domainName = "Exemplo.local"
$dsrmPassword = (ConvertTo-SecureString "ExemploSenhaSegura*" -AsPlainText -Force)

.\Setup-ADDS.ps1
</code>
</pre>

<h2>Notas Importantes</h2>

<ul>
    <li>O script força uma reinicialização do servidor após a promoção a controlador de domínio.</li>
    <li>Certifique-se de fornecer uma senha forte para o DSRM, pois ela será necessária em situações de recuperação do Active Directory.</li>
</ul>

<h2>Contribuição</h2>

<p>Contribuições são bem-vindas! Se você tiver sugestões ou melhorias, sinta-se à vontade para abrir uma issue ou um pull request.</p>

</body>
</html>
